<?php
require_once("../models/baggage.php");

$baggage = new baggage();

// 1. Create baggage
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createbaggage']) && $_POST['createbaggage'] == 'true') {
    if (isset($_POST['passengerid'], $_POST['flightid'], $_POST['baggageweight'], $_POST['baggagestatus'], $_POST['tagnumber'])) {
        $response = $baggage->createbaggage($_POST['passengerid'], $_POST['flightid'], $_POST['baggageweight'], $_POST['baggagestatus'], $_POST['tagnumber']);
    } else {
        $response = ["status"=>"error","message"=>"Missing parameters for creating baggage"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update baggage
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updatebaggage']) && $_POST['updatebaggage'] == 'true') {
    if (isset($_POST['baggageid'], $_POST['passengerid'], $_POST['flightid'], $_POST['baggageweight'], $_POST['baggagestatus'], $_POST['tagnumber'])) {
        $response = $baggage->updatebaggage($_POST['baggageid'], $_POST['passengerid'], $_POST['flightid'], $_POST['baggageweight'], $_POST['baggagestatus'], $_POST['tagnumber']);
    } else {
        $response = ["status"=>"error","message"=>"Missing parameters for updating baggage"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete baggage
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deletebaggage']) && $_POST['deletebaggage'] == 'true') {
    if (isset($_POST['baggageid'])) {
        $response = $baggage->deletebaggage($_POST['baggageid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing baggageid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all baggage
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getallbaggage']) && $_GET['getallbaggage'] == 'true') {
    echo $baggage->getallbaggage();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
