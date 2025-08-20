<?php
require_once("db.php");

class airport extends db {

    // Create airport
    function createairport($cityid, $airportcode, $airportname, $location) {
        try {
            $sql = "CALL sp_createAirport($cityid, '$airportcode', '$airportname', '$location')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Airport created successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>$e->getMessage()];
        }
    }

    // Get all airports
    function getallairports() {
        $sql = "CALL sp_getAllAirports()";
        return $this->getJSON($sql);
    }

    // Update airport
    function updateairport($airportid, $cityid, $airportcode, $airportname, $location) {
        try {
            $sql = "CALL sp_updateAirport($airportid, $cityid, '$airportcode', '$airportname', '$location')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Airport updated successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>$e->getMessage()];
        }
    }

    // Delete airport
    function deleteairport($airportid) {
        try {
            $sql = "CALL sp_deleteAirport($airportid)";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Airport deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>$e->getMessage()];
        }
    }
}
?>
