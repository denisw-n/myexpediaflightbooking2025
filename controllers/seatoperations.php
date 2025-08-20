<?php
require_once("../models/seat.php");

$seat = new seat();

// 1. Create seat
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createSeat']) && $_POST['createSeat'] == 'true') {
    if (isset($_POST['flightid'], $_POST['seatname'], $_POST['bookingclassid'], $_POST['availabilitystatus'])) {
        $response = $seat->createseat($_POST['flightid'], $_POST['seatname'], $_POST['bookingclassid'], $_POST['availabilitystatus']);
    } else {
        $response = ["status"=>"error","message"=>"Missing flightid, seatname, bookingclassid or availabilitystatus"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update seat
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateSeat']) && $_POST['updateSeat'] == 'true') {
    if (isset($_POST['seatid'], $_POST['flightid'], $_POST['seatname'], $_POST['bookingclassid'], $_POST['availabilitystatus'])) {
        $response = $seat->updateseat($_POST['seatid'], $_POST['flightid'], $_POST['seatname'], $_POST['bookingclassid'], $_POST['availabilitystatus']);
    } else {
        $response = ["status"=>"error","message"=>"Missing seatid, flightid, seatname, bookingclassid or availabilitystatus"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete seat
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteSeat']) && $_POST['deleteSeat'] == 'true') {
    if (isset($_POST['seatid'])) {
        $response = $seat->deleteseat($_POST['seatid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing seatid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all seats
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getAllSeats']) && $_GET['getAllSeats'] == 'true') {
    echo $seat->getallseats();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
