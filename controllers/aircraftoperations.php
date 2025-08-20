<?php
require_once("../models/aircraft.php");

$aircraft = new aircraft();

// 1. Create aircraft
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createAircraft']) && $_POST['createAircraft'] == 'true') {
    if (isset($_POST['airlineid'], $_POST['aircraftname'], $_POST['aircrafttype'], $_POST['capacity'])) {
        $response = $aircraft->createaircraft($_POST['airlineid'], $_POST['aircraftname'], $_POST['aircrafttype'], $_POST['capacity']);
    } else {
        $response = ["status"=>"error","message"=>"Missing airlineid, aircraftname, aircrafttype or capacity"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update aircraft
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateAircraft']) && $_POST['updateAircraft'] == 'true') {
    if (isset($_POST['aircraftid'], $_POST['airlineid'], $_POST['aircraftname'], $_POST['aircrafttype'], $_POST['capacity'])) {
        $response = $aircraft->updateaircraft($_POST['aircraftid'], $_POST['airlineid'], $_POST['aircraftname'], $_POST['aircrafttype'], $_POST['capacity']);
    } else {
        $response = ["status"=>"error","message"=>"Missing aircraftid, airlineid, aircraftname, aircrafttype or capacity"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete aircraft
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteAircraft']) && $_POST['deleteAircraft'] == 'true') {
    if (isset($_POST['aircraftid'])) {
        $response = $aircraft->deleteaircraft($_POST['aircraftid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing aircraftid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all aircraft
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getAllAircraft']) && $_GET['getAllAircraft'] == 'true') {
    echo $aircraft->getallaircraft();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
