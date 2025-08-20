<?php
require_once("../models/airport.php");

$airport = new airport();

// 1. Create airport
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createairport']) && $_POST['createairport'] == 'true') {
    if (isset($_POST['cityid'], $_POST['airportcode'], $_POST['airportname'], $_POST['location'])) {
        $response = $airport->createairport($_POST['cityid'], $_POST['airportcode'], $_POST['airportname'], $_POST['location']);
    } else {
        $response = ["status"=>"error","message"=>"Missing parameters for creating airport"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update airport
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateairport']) && $_POST['updateairport'] == 'true') {
    if (isset($_POST['airportid'], $_POST['cityid'], $_POST['airportcode'], $_POST['airportname'], $_POST['location'])) {
        $response = $airport->updateairport($_POST['airportid'], $_POST['cityid'], $_POST['airportcode'], $_POST['airportname'], $_POST['location']);
    } else {
        $response = ["status"=>"error","message"=>"Missing parameters for updating airport"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete airport
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteairport']) && $_POST['deleteairport'] == 'true') {
    if (isset($_POST['airportid'])) {
        $response = $airport->deleteairport($_POST['airportid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing airportid for deletion"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all airports
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getallairports']) && $_GET['getallairports'] == 'true') {
    echo $airport->getallairports();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
