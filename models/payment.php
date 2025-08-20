<?php
require_once("db.php");

class payment extends db {

    function createpayment($bookingid, $paymentdate, $paymentmethod, $amountpaid) {
        try {
            $sql = "CALL sp_createPayment($bookingid, '$paymentdate', '$paymentmethod', $amountpaid)";
            $this->getData($sql);
            return ["status" => "success", "message" => "Payment created successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    function getallpayments() {
        $sql = "CALL sp_getAllPayments()";
        return $this->getJSON($sql);
    }

    function updatepayment($paymentid, $bookingid, $paymentdate, $paymentmethod, $amountpaid) {
        try {
            $sql = "CALL sp_updatePayment($paymentid, $bookingid, '$paymentdate', '$paymentmethod', $amountpaid)";
            $this->getData($sql);
            return ["status" => "success", "message" => "Payment updated successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }

    function deletepayment($paymentid) {
        try {
            $sql = "CALL sp_deletePayment($paymentid)";
            $this->getData($sql);
            return ["status" => "success", "message" => "Payment deleted successfully"];
        } catch (Exception $e) {
            return ["status" => "error", "message" => $e->getMessage()];
        }
    }
}
?>
