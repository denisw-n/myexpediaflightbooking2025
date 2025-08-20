<?php
require_once("db.php");

class route extends db {

    // Create a new route
    function createroute($airportid, $airlineid, $sourceairportcode, $destinationairportcode, $distance, $duration) {
        try {
            $sql = "CALL sp_createRoute($airportid, $airlineid, '$sourceairportcode', '$destinationairportcode', $distance, '$duration')";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Route created successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Get all routes
    function getallroutes() {
        $sql = "CALL sp_getAllRoutes()";
        return $this->getJSON($sql);
    }

    // Update a route
    function updateroute($routeid, $airportid, $airlineid, $sourceairportcode, $destinationairportcode, $distance, $duration) {
        try {
            $sql = "CALL sp_updateRoute($routeid, $airportid, $airlineid, '$sourceairportcode', '$destinationairportcode', $distance, '$duration')";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Route updated successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Delete a route
    function deleteroute($routeid) {
        try {
            $sql = "CALL sp_deleteRoute($routeid)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Route deleted successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }
}
?>
