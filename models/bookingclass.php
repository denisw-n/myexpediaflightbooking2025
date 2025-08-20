<?php
require_once("db.php");

class bookingclass extends db {

    // Create booking class
    function createbookingclass($bookingclassname) {
        try {
            $sql = "CALL sp_createBookingclass('$bookingclassname')";
            $this->getData($sql);
            return ["status" => "success", "message" => "Booking class created successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    // Get all booking classes
    function getallbookingclasses() {
        $sql = "CALL sp_GetAllBookingclasses()";
        return $this->getJSON($sql);
    }

    // Update booking class
    function updatebookingclass($bookingclassid, $bookingclassname) {
        try {
            $sql = "CALL sp_UpdateBookingclass($bookingclassid, '$bookingclassname')";
            $this->getData($sql);
            return ["status" => "success", "message" => "Booking class updated successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    // Delete booking class
    function deletebookingclass($bookingclassid) {
        try {
            $sql = "CALL sp_DeleteBookingclass($bookingclassid)";
            $this->getData($sql);
            return ["status" => "success", "message" => "Booking class deleted successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }
}
?>
