<?php
require_once("../models/country.php");

$country = new country();

// 1. Create country
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createCountry']) && $_POST['createCountry'] == 'true') {
    if (isset($_POST['countryname'])) {
        $response = $country->createcountry($_POST['countryname']);
    } else {
        $response = ["status"=>"error","message"=>"Missing countryname"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update country
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateCountry']) && $_POST['updateCountry'] == 'true') {
    if (isset($_POST['countryid']) && isset($_POST['countryname'])) {
        $response = $country->updatecountry($_POST['countryid'], $_POST['countryname']);
    } else {
        $response = ["status"=>"error","message"=>"Missing countryid or countryname"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete country
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteCountry']) && $_POST['deleteCountry'] == 'true') {
    if (isset($_POST['countryid'])) {
        $response = $country->deletecountry($_POST['countryid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing countryid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all countries
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getAllCountries']) && $_GET['getAllCountries'] == 'true') {
    echo $country->getallcountries();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
