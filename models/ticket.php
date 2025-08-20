<?php
require_once("db.php");

class ticket extends db {

    // Create a new ticket
    function createticket($bookingid, $seatid, $passengerid, $tickettype, $issuedate, $price) {
        try {
            $sql = "CALL sp_createTicket($bookingid, $seatid, $passengerid, '$tickettype', '$issuedate', $price)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Ticket created successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Get all tickets
    function getalltickets() {
        $sql = "CALL sp_getAllTickets()";
        return $this->getJSON($sql);
    }

    // Update a ticket
    function updateticket($ticketid, $bookingid, $seatid, $passengerid, $tickettype, $issuedate, $price) {
        try {
            $sql = "CALL sp_updateTicket($ticketid, $bookingid, $seatid, $passengerid, '$tickettype', '$issuedate', $price)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Ticket updated successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Delete a ticket
    function deleteticket($ticketid) {
        try {
            $sql = "CALL sp_deleteTicket($ticketid)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Ticket deleted successfully"
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
