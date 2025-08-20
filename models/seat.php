<?php
require_once("db.php");

class seat extends db {

    // Create a new seat
    function createseat($flightid, $seatname, $bookingclassid, $availabilitystatus) {
        try {
            $sql = "CALL sp_CreateSeat($flightid, '$seatname', $bookingclassid, '$availabilitystatus', @newseatid)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Seat created successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Get all seats
    function getallseats() {
        $sql = "CALL sp_GetAllSeats()";
        return $this->getJSON($sql);
    }

    // Update a seat
    function updateseat($seatid, $flightid, $seatname, $bookingclassid, $availabilitystatus) {
        try {
            $sql = "CALL sp_UpdateSeat($seatid, $flightid, '$seatname', $bookingclassid, '$availabilitystatus')";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Seat updated successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Delete a seat
    function deleteseat($seatid) {
        try {
            $sql = "CALL sp_DeleteSeat($seatid)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Seat deleted successfully"
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
