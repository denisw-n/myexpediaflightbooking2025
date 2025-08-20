<?php
require_once("../models/payment.php");

$payment = new payment();

// 1. Create payment
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createpayment']) && $_POST['createpayment'] == 'true') {
    if (isset($_POST['bookingid'], $_POST['paymentdate'], $_POST['paymentmethod'], $_POST['amountpaid'])) {
        $response = $payment->createpayment($_POST['bookingid'], $_POST['paymentdate'], $_POST['paymentmethod'], $_POST['amountpaid']);
    } else {
        $response = ["status"=>"error", "message"=>"Missing required fields"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update payment
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updatepayment']) && $_POST['updatepayment'] == 'true') {
    if (isset($_POST['paymentid'], $_POST['bookingid'], $_POST['paymentdate'], $_POST['paymentmethod'], $_POST['amountpaid'])) {
        $response = $payment->updatepayment($_POST['paymentid'], $_POST['bookingid'], $_POST['paymentdate'], $_POST['paymentmethod'], $_POST['amountpaid']);
    } else {
        $response = ["status"=>"error", "message"=>"Missing required fields"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete payment
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deletepayment']) && $_POST['deletepayment'] == 'true') {
    if (isset($_POST['paymentid'])) {
        $response = $payment->deletepayment($_POST['paymentid']);
    } else {
        $response = ["status"=>"error", "message"=>"Missing paymentid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all payments
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getallpayments']) && $_GET['getallpayments'] == 'true') {
    echo $payment->getallpayments();
    exit;
}

// Default error
echo json_encode(["status"=>"error", "message"=>"Invalid request"]);
?>
