<?php
require_once("db.php");

class airline extends db {

    // Create a new airline
    function createairline($countryid, $airlinename, $airlinelogo, $airlinecode) {
        try {
            $sql = "CALL sp_createAirline($countryid, '$airlinename', '$airlinelogo', '$airlinecode')";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Airline created successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Get all airlines
    function getallairlines() {
        $sql = "CALL sp_getAllAirlines()";
        return $this->getJSON($sql);
    }

    // Update an airline
    function updateairline($airlineid, $countryid, $airlinename, $airlinelogo, $airlinecode) {
        try {
            $sql = "CALL sp_updateAirline($airlineid, $countryid, '$airlinename', '$airlinelogo', '$airlinecode')";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Airline updated successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Delete an airline
    function deleteairline($airlineid) {
        try {
            $sql = "CALL sp_deleteAirline($airlineid)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Airline deleted successfully"
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
