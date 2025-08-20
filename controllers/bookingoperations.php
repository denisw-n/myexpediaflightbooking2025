<?php
require_once("../models/booking.php");
$booking = new booking();

// 1. Create booking
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createbooking']) && $_POST['createbooking']=='true') {
    if (isset($_POST['seatid'], $_POST['passengerid'], $_POST['flightid'], $_POST['aircraftid'], $_POST['routeid'], $_POST['documentid'], $_POST['bookingclassid'], $_POST['paymentstatus'])) {
        $response = $booking->createbooking($_POST['seatid'], $_POST['passengerid'], $_POST['flightid'], $_POST['aircraftid'], $_POST['routeid'], $_POST['documentid'], $_POST['bookingclassid'], $_POST['paymentstatus']);
    } else {
        $response = ["status"=>"error","message"=>"Missing parameters for creating booking"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update booking
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updatebooking']) && $_POST['updatebooking']=='true') {
    if (isset($_POST['bookingid'], $_POST['seatid'], $_POST['passengerid'], $_POST['flightid'], $_POST['aircraftid'], $_POST['routeid'], $_POST['documentid'], $_POST['bookingclassid'], $_POST['paymentstatus'])) {
        $response = $booking->updatebooking($_POST['bookingid'], $_POST['seatid'], $_POST['passengerid'], $_POST['flightid'], $_POST['aircraftid'], $_POST['routeid'], $_POST['documentid'], $_POST['bookingclassid'], $_POST['paymentstatus']);
    } else {
        $response = ["status"=>"error","message"=>"Missing parameters for updating booking"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete booking
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deletebooking']) && $_POST['deletebooking']=='true') {
    if (isset($_POST['bookingid'])) {
        $response = $booking->deletebooking($_POST['bookingid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing bookingid for deletion"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all bookings
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getallbookings']) && $_GET['getallbookings']=='true') {
    echo $booking->getallbookings();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
