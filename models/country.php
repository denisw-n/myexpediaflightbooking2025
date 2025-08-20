<?php
require_once("db.php");

class country extends db {

    // Create a new country
    function createcountry($countryname) {
        try {
            $sql = "CALL sp_createCountry('$countryname')";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Country created successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Get all countries
    function getallcountries() {
        $sql = "CALL sp_getAllCountries()";
        return $this->getJSON($sql);
    }

    // Update a country
    function updatecountry($countryid, $countryname) {
        try {
            $sql = "CALL sp_updateCountry($countryid, '$countryname')";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "Country updated successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Delete a country
    function deletecountry($countryid) {
        try {
            $sql = "CALL sp_deleteCountry($countryid)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "The country was deleted successfully"
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
