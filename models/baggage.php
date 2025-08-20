<?php
require_once("db.php");

class baggage extends db {

    // Create baggage
    function createbaggage($passengerid, $flightid, $baggageweight, $baggagestatus, $tagnumber) {
        try {
            $sql = "CALL sp_CreateBaggage($passengerid, $flightid, $baggageweight, '$baggagestatus', '$tagnumber', @newid)";
            $this->getData($sql);
            return ["status" => "success", "message" => "Baggage created successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    // Update baggage
    function updatebaggage($baggageid, $passengerid, $flightid, $baggageweight, $baggagestatus, $tagnumber) {
        try {
            $sql = "CALL sp_UpdateBaggage($baggageid, $passengerid, $flightid, $baggageweight, '$baggagestatus', '$tagnumber')";
            $this->getData($sql);
            return ["status" => "success", "message" => "Baggage updated successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    // Delete baggage
    function deletebaggage($baggageid) {
        try {
            $sql = "CALL sp_DeleteBaggage($baggageid)";
            $this->getData($sql);
            return ["status" => "success", "message" => "Baggage deleted successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    // Get all baggage
    function getallbaggage() {
        $sql = "CALL sp_GetAllBaggage()";
        return $this->getJSON($sql);
    }
}
?>
