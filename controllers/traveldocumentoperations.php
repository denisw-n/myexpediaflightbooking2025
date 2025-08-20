<?php
require_once("../models/travelDocument.php");

$traveldocument = new travelDocument();

// 1. Create travel document
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createTravelDocument']) && $_POST['createTravelDocument'] == 'true') {
    if (isset($_POST['documenttype']) && isset($_POST['passengerid']) && isset($_POST['documentvalidity'])) {
        $response = $traveldocument->createtraveldocument($_POST['documenttype'], $_POST['passengerid'], $_POST['documentvalidity']);
    } else {
        $response = ["status"=>"error","message"=>"Missing documenttype, passengerid, or documentvalidity"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update travel document
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateTravelDocument']) && $_POST['updateTravelDocument'] == 'true') {
    if (isset($_POST['documentid']) && isset($_POST['documenttype']) && isset($_POST['passengerid']) && isset($_POST['documentvalidity'])) {
        $response = $traveldocument->updatetraveldocument($_POST['documentid'], $_POST['documenttype'], $_POST['passengerid'], $_POST['documentvalidity']);
    } else {
        $response = ["status"=>"error","message"=>"Missing documentid, documenttype, passengerid, or documentvalidity"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete travel document
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteTravelDocument']) && $_POST['deleteTravelDocument'] == 'true') {
    if (isset($_POST['documentid'])) {
        $response = $traveldocument->deletetraveldocument($_POST['documentid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing documentid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all travel documents
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getAllTravelDocuments']) && $_GET['getAllTravelDocuments'] == 'true') {
    echo $traveldocument->getalltraveldocuments();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
