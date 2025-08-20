<?php
require_once("db.php");

class passenger extends db {

    function createpassenger($passengername, $dateofbirth, $nationality) {
        try {
            $sql = "CALL sp_createPassenger('$passengername', '$dateofbirth', '$nationality')";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Passenger created successfully"];
        } catch (Exception $e) {
            return ["status"=>"error", "message"=>$e->getMessage()];
        }
    }

    function getallpassengers() {
        $sql = "CALL sp_getAllPassengers()";
        return $this->getJSON($sql);
    }

    function updatepassenger($passengerid, $passengername, $dateofbirth, $nationality) {
        try {
            $sql = "CALL sp_updatePassenger($passengerid, '$passengername', '$dateofbirth', '$nationality')";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Passenger updated successfully"];
        } catch (Exception $e) {
            return ["status"=>"error", "message"=>$e->getMessage()];
        }
    }

    function deletepassenger($passengerid) {
        try {
            $sql = "CALL sp_deletePassenger($passengerid)";
            $this->getData($sql);
            return ["status"=>"success", "message"=>"Passenger deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error", "message"=>$e->getMessage()];
        }
    }
}
?>
