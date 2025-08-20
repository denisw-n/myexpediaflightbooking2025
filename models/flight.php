<?php
require_once("db.php");

class flight extends db {

    function createflight($flightno, $airlineid, $departureairport, $destinationairport, $duration) {
        try {
            $sql = "CALL sp_createFlight($flightno, $airlineid, '$departureairport', '$destinationairport', '$duration')";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Flight created successfully"];
        } catch (Exception $e) {
            return ["status"=>"error", "message"=>$e->getMessage()];
        }
    }

    function getallflights() {
        $sql = "CALL sp_getAllFlights()";
        return $this->getJSON($sql);
    }

    function updateflight($flightid, $flightno, $airlineid, $departureairport, $destinationairport, $duration) {
        try {
            $sql = "CALL sp_updateFlight($flightid, $flightno, $airlineid, '$departureairport', '$destinationairport', '$duration')";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Flight updated successfully"];
        } catch (Exception $e) {
            return ["status"=>"error", "message"=>$e->getMessage()];
        }
    }

    function deleteflight($flightid) {
        try {
            $sql = "CALL sp_deleteFlight($flightid)";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Flight deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error", "message"=>$e->getMessage()];
        }
    }
}
?>
