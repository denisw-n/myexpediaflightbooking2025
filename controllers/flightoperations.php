<?php
require_once("../models/flight.php");

$flight = new flight();

// 1. Create flight
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createflight']) && $_POST['createflight'] === 'true') {
    if (isset($_POST['flightno'], $_POST['airlineid'], $_POST['departureairport'], $_POST['destinationairport'], $_POST['duration'])) {
        $response = $flight->createflight($_POST['flightno'], $_POST['airlineid'], $_POST['departureairport'], $_POST['destinationairport'], $_POST['duration']);
    } else {
        $response = ["status"=>"error","message"=>"Missing flightno, airlineid, departureairport, destinationairport or duration"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update flight
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateflight']) && $_POST['updateflight'] === 'true') {
    if (isset($_POST['flightid'], $_POST['flightno'], $_POST['airlineid'], $_POST['departureairport'], $_POST['destinationairport'], $_POST['duration'])) {
        $response = $flight->updateflight($_POST['flightid'], $_POST['flightno'], $_POST['airlineid'], $_POST['departureairport'], $_POST['destinationairport'], $_POST['duration']);
    } else {
        $response = ["status"=>"error","message"=>"Missing flightid, flightno, airlineid, departureairport, destinationairport or duration"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete flight
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteflight']) && $_POST['deleteflight'] === 'true') {
    if (isset($_POST['flightid'])) {
        $response = $flight->deleteflight($_POST['flightid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing flightid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all flights
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getallflights']) && $_GET['getallflights'] === 'true') {
    echo $flight->getallflights();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
