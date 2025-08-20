<?php
require_once("../models/airline.php");

$airline = new airline();

// 1. Create airline
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createairline']) && $_POST['createairline'] == 'true') {
    if (isset($_POST['countryid'], $_POST['airlinename'], $_POST['airlinelogo'], $_POST['airlinecode'])) {
        $response = $airline->createairline($_POST['countryid'], $_POST['airlinename'], $_POST['airlinelogo'], $_POST['airlinecode']);
    } else {
        $response = ["status"=>"error","message"=>"Missing required fields"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update airline
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateairline']) && $_POST['updateairline'] == 'true') {
    if (isset($_POST['airlineid'], $_POST['countryid'], $_POST['airlinename'], $_POST['airlinelogo'], $_POST['airlinecode'])) {
        $response = $airline->updateairline($_POST['airlineid'], $_POST['countryid'], $_POST['airlinename'], $_POST['airlinelogo'], $_POST['airlinecode']);
    } else {
        $response = ["status"=>"error","message"=>"Missing required fields"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete airline
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteairline']) && $_POST['deleteairline'] == 'true') {
    if (isset($_POST['airlineid'])) {
        $response = $airline->deleteairline($_POST['airlineid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing airlineid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all airlines
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getallairlines']) && $_GET['getallairlines'] == 'true') {
    echo $airline->getallairlines();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
