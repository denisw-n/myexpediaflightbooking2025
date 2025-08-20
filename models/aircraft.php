<?php
require_once("db.php");

class aircraft extends db {

    // Create a new aircraft
    function createaircraft($airlineid, $aircraftname, $aircrafttype, $capacity) {
        try {
            $sql = "CALL sp_createAircraft($airlineid, '$aircraftname', '$aircrafttype', $capacity)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Aircraft created successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Get all aircraft
    function getallaircraft() {
        $sql = "CALL sp_getAllAircraft()";
        return $this->getJSON($sql);
    }

    // Update an aircraft
    function updateaircraft($aircraftid, $airlineid, $aircraftname, $aircrafttype, $capacity) {
        try {
            $sql = "CALL sp_updateAircraft($aircraftid, $airlineid, '$aircraftname', '$aircrafttype', $capacity)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Aircraft updated successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Delete an aircraft
    function deleteaircraft($aircraftid) {
        try {
            $sql = "CALL sp_deleteAircraft($aircraftid)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Aircraft deleted successfully"
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
