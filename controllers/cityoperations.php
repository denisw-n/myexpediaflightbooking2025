<?php
require_once("../models/city.php");

$city = new city();

// 1. Create city
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createCity']) && $_POST['createCity'] == 'true') {
    if (isset($_POST['cityname']) && isset($_POST['countryid'])) {
        $response = $city->createcity($_POST['cityname'], $_POST['countryid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing cityname or countryid"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update city
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateCity']) && $_POST['updateCity'] == 'true') {
    if (isset($_POST['cityid']) && isset($_POST['cityname']) && isset($_POST['countryid'])) {
        $response = $city->updatecity($_POST['cityid'], $_POST['cityname'], $_POST['countryid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing cityid, cityname or countryid"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete city
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteCity']) && $_POST['deleteCity'] == 'true') {
    if (isset($_POST['cityid'])) {
        $response = $city->deletecity($_POST['cityid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing cityid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all cities
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getAllCities']) && $_GET['getAllCities'] == 'true') {
    echo $city->getallcities();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
