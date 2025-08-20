<?php
require_once("../models/route.php");

$route = new route();

// 1. Create route
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['createRoute']) && $_POST['createRoute'] == 'true') {
    if (isset($_POST['airportid'], $_POST['airlineid'], $_POST['sourceairportcode'], $_POST['destinationairportcode'], $_POST['distance'], $_POST['duration'])) {
        $response = $route->createroute($_POST['airportid'], $_POST['airlineid'], $_POST['sourceairportcode'], $_POST['destinationairportcode'], $_POST['distance'], $_POST['duration']);
    } else {
        $response = ["status"=>"error","message"=>"Missing required parameters"];
    }
    echo json_encode($response);
    exit;
}

// 2. Update route
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updateRoute']) && $_POST['updateRoute'] == 'true') {
    if (isset($_POST['routeid'], $_POST['airportid'], $_POST['airlineid'], $_POST['sourceairportcode'], $_POST['destinationairportcode'], $_POST['distance'], $_POST['duration'])) {
        $response = $route->updateroute($_POST['routeid'], $_POST['airportid'], $_POST['airlineid'], $_POST['sourceairportcode'], $_POST['destinationairportcode'], $_POST['distance'], $_POST['duration']);
    } else {
        $response = ["status"=>"error","message"=>"Missing required parameters"];
    }
    echo json_encode($response);
    exit;
}

// 3. Delete route
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deleteRoute']) && $_POST['deleteRoute'] == 'true') {
    if (isset($_POST['routeid'])) {
        $response = $route->deleteroute($_POST['routeid']);
    } else {
        $response = ["status"=>"error","message"=>"Missing routeid"];
    }
    echo json_encode($response);
    exit;
}

// 4. Get all routes
if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['getAllRoutes']) && $_GET['getAllRoutes'] == 'true') {
    echo $route->getallroutes();
    exit;
}

// Default error
echo json_encode(["status"=>"error","message"=>"Invalid request"]);
?>
