<?php
require_once("db.php");

class booking extends db {

    function createbooking($seatid, $passengerid, $flightid, $aircraftid, $routeid, $documentid, $bookingclassid, $paymentstatus) {
        try {
            $sql = "CALL sp_createBooking($seatid, $passengerid, $flightid, $aircraftid, $routeid, $documentid, $bookingclassid, '$paymentstatus')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Booking created successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>$e->getMessage()];
        }
    }

    function updatebooking($bookingid, $seatid, $passengerid, $flightid, $aircraftid, $routeid, $documentid, $bookingclassid, $paymentstatus) {
        try {
            $sql = "CALL sp_updateBooking($bookingid, $seatid, $passengerid, $flightid, $aircraftid, $routeid, $documentid, $bookingclassid, '$paymentstatus')";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Booking updated successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>$e->getMessage()];
        }
    }

    function deletebooking($bookingid) {
        try {
            $sql = "CALL sp_deleteBooking($bookingid)";
            $this->getData($sql);
            return ["status"=>"success","message"=>"Booking deleted successfully"];
        } catch (Exception $e) {
            return ["status"=>"error","message"=>$e->getMessage()];
        }
    }

    function getallbookings() {
        $sql = "CALL sp_getAllBookings()";
        return $this->getJSON($sql);
    }
}
?>
