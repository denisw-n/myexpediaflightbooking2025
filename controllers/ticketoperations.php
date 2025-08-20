<?php
require_once("../models/ticket.php");

$ticket = new ticket();

// 1. Create ticket
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createTicket']) && $_POST['createTicket'] == 'true') {
    if (isset($_POST['bookingid'], $_POST['seatid'], $_POST['passengerid'], $_POST['tickettype'], $_POST['issuedate'], $_POST['price'])) {
        $response = $ticket->createticket($_POST['bookingid'], $_POST['seatid'], $_POST['passengerid'], $_POST['tickettype'], $_POST['issuedate'], $_POST['price']);
    } else {
        $response = ["status"=>"error","message"=>"Missing required ticket fields"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update ticket
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateTicket']) && $_POST['updateTicket'] == 'true') {
    if (isset($_POST['ticketid'], $_POST['bookingid'], $_POST['seatid'], $_POST['passengerid'], $_POST['tickettype'], $_POST['issuedate'], $_POST['price'])) {
        $response = $ticket->updateticket($_POST['ticketid'], $_POST['bookingid'], $_POST['seatid'], $_POST['passengerid'], $_POST['tickettype'], $_POST['issuedate'], $_POST['price']);
    } else {
        $response = ["status"=>"error","message"=>"Missing required ticket fields"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete ticket
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteTicket']) && $_POST['deleteTicket'] == 'true') {
    if (isset($_POST['ticketid'])) {
        $response = $ticket->deleteticket($_POST['ticketid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing ticketid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all tickets
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getAllTickets']) && $_GET['getAllTickets'] == 'true') {
    echo $ticket->getalltickets();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
