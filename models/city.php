<?php
require_once("db.php");

class city extends db {

    // Create a new city
    function createcity($CityName, $CountryId) {
        try {
            $sql = "CALL sp_createCity('$CityName', $CountryId)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "City created successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Get all cities
    function getallcities() {
        $sql = "CALL sp_getAllCities()";
        return $this->getJSON($sql);
    }

    // Update a city
    function updatecity($CityId, $CityName, $CountryId) {
        try {
            $sql = "CALL sp_updateCity($CityId, '$CityName', $CountryId)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "City updated successfully"
            ];
        } catch (Exception $e) {
            return [
                "status" => "error",
                "message" => $e->getMessage()
            ];
        }
    }

    // Delete a city
    function deletecity($CityId) {
        try {
            $sql = "CALL sp_deleteCity($CityId)";
            $this->getData($sql);
            return [
                "status" => "success",
                "message" => "City deleted successfully"
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
