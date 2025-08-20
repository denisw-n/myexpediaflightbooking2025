<?php
require_once("db.php");

class travelDocument extends db {

    // Create a new travel document
    function createtraveldocument($documenttype, $passengerid, $documentvalidity) {
        try {
            $sql = "CALL sp_CreateTravelDocument('$documenttype', $passengerid, '$documentvalidity', @newdocumentid)";
            $this->getData($sql);
            $result = $this->getJSON("SELECT @newdocumentid AS DocumentId");
            return [
                "status" => "success",
                "message" => "Travel document created successfully",
                "data" => json_decode($result)
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Get all travel documents
    function getalltraveldocuments() {
        $sql = "CALL sp_GetAllTravelDocuments()";
        return $this->getJSON($sql);
    }

    // Update a travel document
    function updatetraveldocument($documentid, $documenttype, $passengerid, $documentvalidity) {
        try {
            $sql = "CALL sp_UpdateTravelDocument($documentid, '$documenttype', $passengerid, '$documentvalidity')";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Travel document updated successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Delete a travel document
    function deletetraveldocument($documentid) {
        try {
            $sql = "CALL sp_DeleteTravelDocument($documentid)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Travel document deleted successfully"
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
