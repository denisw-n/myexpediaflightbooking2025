<?php
require_once("../models/passenger.php");

$passenger = new passenger();

// 1. Create passenger
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createpassenger']) && $_POST['createpassenger'] == 'true') {
    if (isset($_POST['passengername'], $_POST['dateofbirth'], $_POST['nationality'])) {
        $response = $passenger->createpassenger($_POST['passengername'], $_POST['dateofbirth'], $_POST['nationality']);
    } else {
        $response = ["status"=>"error", "message"=>"Missing passengername, dateofbirth or nationality"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update passenger
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updatepassenger']) && $_POST['updatepassenger'] == 'true') {
    if (isset($_POST['passengerid'], $_POST['passengername'], $_POST['dateofbirth'], $_POST['nationality'])) {
        $response = $passenger->updatepassenger($_POST['passengerid'], $_POST['passengername'], $_POST['dateofbirth'], $_POST['nationality']);
    } else {
        $response = ["status"=>"error", "message"=>"Missing passengerid, passengername, dateofbirth or nationality"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete passenger
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deletepassenger']) && $_POST['deletepassenger'] == 'true') {
    if (isset($_POST['passengerid'])) {
        $response = $passenger->deletepassenger($_POST['passengerid']);
    } else {
        $response = ["status"=>"error", "message"=>"Missing passengerid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all passengers
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getallpassengers']) && $_GET['getallpassengers'] == 'true') {
    echo $passenger->getallpassengers();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
