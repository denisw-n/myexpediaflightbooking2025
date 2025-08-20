<?php
require_once("../models/bookingclass.php");

$bookingclass = new bookingclass();

// 1. Handle POST requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Create booking class
    if (isset($_POST['createbookingclass']) && $_POST['createbookingclass'] === 'true') {
        if (isset($_POST['bookingclassname'])) {
            $response = $bookingclass->createbookingclass($_POST['bookingclassname']);
        } else {
            $response = ["status"=>"error","message"=>"Missing bookingclassname"];
        }
        echo json_encode($response);
        exit;
    }

    // Update booking class
    if (isset($_POST['updatebookingclass']) && $_POST['updatebookingclass'] === 'true') {
        if (isset($_POST['bookingclassid']) && isset($_POST['bookingclassname'])) {
            $response = $bookingclass->updatebookingclass($_POST['bookingclassid'], $_POST['bookingclassname']);
        } else {
            $response = ["status"=>"error","message"=>"Missing bookingclassid or bookingclassname"];
        }
        echo json_encode($response);
        exit;
    }

    // Delete booking class
    if (isset($_POST['deletebookingclass']) && $_POST['deletebookingclass'] === 'true') {
        if (isset($_POST['bookingclassid'])) {
            $response = $bookingclass->deletebookingclass($_POST['bookingclassid']);
        } else {
            $response = ["status"=>"error","message"=>"Missing bookingclassid"];
        }
        echo json_encode($response);
        exit;
    }

}

// 2. Handle GET requests
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['getallbookingclasses']) && $_GET['getallbookingclasses'] === 'true') {
        echo $bookingclass->getallbookingclasses();
        exit;
    }
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
