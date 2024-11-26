<?php

class Orderdetail
{

    private $conn;
    private $orderdetails = "orderdetails";
    private $sellaraddress = "sellaraddress";
    
    // private $table_payment = "payment";

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public $id, $orderId,$userId,$paymentId,$sellarId,$deliveryId,$productId,$adminCommision, $productSkuId, $quantity, $total, $gst, $status,$sgst,$cgst;
    public $cuId, $cuName,$cuEmail, $cuAddress,$paymentMethod, $cuMobile,$createdOn,$createdBy,$updatedBy,$updatedOn, $requiredService, $discount, $sellerId,$workingPincode, $otp ;
    
    
    public function readorderdetails()
    {
        if($this->orderId==true){
            //echo $this->orderId;
      $query = "Select userId,orderId,deliveryId,sellerId,paymentId,total, cgst, sgst, status, totalCommision,createdOn,createdBy from $this->orderdetails  where 
        sellerId=:sellerId";
         $stmt = $this->conn->prepare($query);
         $stmt->bindParam(":sellerId", $this->sellerId); 
}
else {
   // echo $this->orderId;
      $query = "Select a.userId,a.orderId,a.deliveryId,a.sellerId,a.paymentId,a.total,
      a.cgst, a.sgst, a.status, a.totalCommision,a.createdOn,a.createdBy,b.pincode
       from $this->orderdetails as a INNER JOIN $this->sellaraddress as b ON a.sellerId=b.sellarId where b.pincode=:workingPincode and a.status=1";
    // $query = "Select userId,orderId,deliveryId,sellerId,paymentId,total,productSkuId, productId, gst, status, quantity, discount, paymentMethod, adminCommision,createdOn,createdBy from $this->orderdetails";
     $stmt = $this->conn->prepare($query);
    $stmt->bindParam(":workingPincode", $this->workingPincode); 
}
$stmt->execute();
return $stmt;
}
    public function readacceptedOrder()
    {
        if($this->orderId==true){
            //echo $this->orderId;
      $query = "Select userId,orderId,deliveryId,sellerId,paymentId,total, cgst, sgst, status, totalCommision,updatedOn,updatedBy from $this->orderdetails  where 
        status=3";
         $stmt = $this->conn->prepare($query);
        //  $stmt->bindParam(":sellerId", $this->sellerId); 
}
else {
   // echo $this->orderId;
    //   $query = "Select a.userId,a.orderId,a.deliveryId,a.sellerId,a.paymentId,a.total,
    //   a.cgst, a.sgst, a.status, a.totalCommision,a.createdOn,a.createdBy,b.pincode
    //    from $this->orderdetails as a INNER JOIN $this->sellaraddress as b ON a.sellerId=b.sellarId where b.pincode=:workingPincode and a.status=1";

    $query = "Select userId,orderId,deliveryId,sellerId,paymentId,total, cgst, sgst, status, totalCommision,updatedOn,updatedBy from $this->orderdetails  where 
    status=3";

    // $query = "Select userId,orderId,deliveryId,sellerId,paymentId,total,productSkuId, productId, gst, status, quantity, discount, paymentMethod, adminCommision,createdOn,createdBy from $this->orderdetails";
     $stmt = $this->conn->prepare($query);
    // $stmt->bindParam(":workingPincode", $this->workingPincode); 
}
$stmt->execute();
return $stmt;
}


    public function insertorderdetails()
    {
        echo $query = "INSERT INTO
        " . $this->orderdetails . "
    SET      orderId=:orderId,
             userId=:userId,
             sellerId=:sellarId,
             deliveryId=:deliveryId,
             paymentId=:paymentId,
             total=:total,
             sgst=:sgst,
             cgst=:cgst,
             totalCommision=:adminCommision,
             createdBy=:createdBy,
             createdOn=:createdOn";

        $stmt = $this->conn->prepare($query);
        $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->userId = htmlspecialchars(strip_tags($this->userId));
        $this->sellarId = htmlspecialchars(strip_tags($this->sellarId));
        $this->deliveryId = htmlspecialchars(strip_tags($this->deliveryId));
        $this->sgst = htmlspecialchars(strip_tags($this->sgst));
        $this->cgst = htmlspecialchars(strip_tags($this->cgst));
        $this->paymentId = htmlspecialchars(strip_tags($this->paymentId));
        $this->total = htmlspecialchars(strip_tags($this->total));
        $this->adminCommision = htmlspecialchars(strip_tags($this->adminCommision));
        $this->createdOn = htmlspecialchars(strip_tags($this->createdOn));
        $this->createdBy = htmlspecialchars(strip_tags($this->createdBy));





        
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":userId", $this->userId);
        $stmt->bindParam(":sellarId", $this->sellarId);
        $stmt->bindParam(":sgst", $this->sgst);
        $stmt->bindParam(":cgst", $this->cgst);
        $stmt->bindParam(":deliveryId", $this->deliveryId);
        $stmt->bindParam(":paymentId", $this->paymentId);
        $stmt->bindParam(":total", $this->total);
        $stmt->bindParam(":adminCommision", $this->adminCommision);
        $stmt->bindParam(":createdOn", $this->createdOn);
        $stmt->bindParam(":createdBy", $this->createdBy);

        
        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function deleteorderdetails(){
  
        // delete user detatail
        $query = " DELETE FROM " . $this->orderdetails . " 
        WHERE orderId=:orderId";
        // prepare query
        $stmt = $this->conn->prepare($query);
        // sanitize
        $this->orderId=htmlspecialchars(strip_tags($this->orderId));
        // bind id of record to delete
        $stmt->bindParam(":orderId", $this->orderId);
        // execute query
        if ($stmt->execute()){
            return true;
        }
      
        return false;
    }
    function updateorderdetails()
    {

        // query to update record
         $query = "UPDATE 
         " . $this->orderdetails . "
     SET
        status=:status,
        updatedOn=:updatedOn,
        updatedBy=:updatedBy 
        where orderId=:orderId";

 
        // prepare query
        $stmt = $this->conn->prepare($query);
 
        $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->status = htmlspecialchars(strip_tags($this->status));
        $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
        $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));

        
        //bind values with stmt
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":status", $this->status);
        $stmt->bindParam(":updatedOn", $this->updatedOn);
        $stmt->bindParam(":updatedBy", $this->updatedBy);
       
       
        
        // execute query
        $stmt->execute();
            return $stmt;
        }

    function updateorderdetailsforDelivery()
    {

        // query to update record
         $query = "UPDATE 
         " . $this->orderdetails . "
     SET
        status=:status,
        deliveryId=deliveryId,
        updatedOn=:updatedOn,
        updatedBy=:updatedBy 
        where orderId=:orderId";

 
        // prepare query
        $stmt = $this->conn->prepare($query);
 
        $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->status = htmlspecialchars(strip_tags($this->status));
        $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
        $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));

        
        //bind values with stmt
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":status", $this->status);
        $stmt->bindParam(":updatedOn", $this->updatedOn);
        $stmt->bindParam(":updatedBy", $this->updatedBy);
       
       
        
        // execute query
        $stmt->execute();
            return $stmt;
        }
    function updateOtp()
    {

        // query to update record
        $query = "UPDATE 
         " . $this->orderdetails . "
     SET
        status=:status,
        deliveryId=:deliveryId,
        updatedOn=:updatedOn,
        updatedBy=:updatedBy 
        where orderId=:orderId";

       // UPDATE orderdetails SET status="4", deliveryId="345", updatedOn="22/22/22", updatedBy="admin" where orderId="465"
 
        // prepare query
        $stmt = $this->conn->prepare($query);
 
        // $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->deliveryId = htmlspecialchars(strip_tags($this->deliveryId));
        $this->status = ($this->status);
        // $this->otp = htmlspecialchars(strip_tags($this->otp));
        $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
        $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));

        
        //bind values with stmt
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":deliveryId", $this->deliveryId);
        $stmt->bindParam(":status", $this->status);
        // $stmt->bindParam(":otp", $this->otp);
        $stmt->bindParam(":updatedOn", $this->updatedOn);
        $stmt->bindParam(":updatedBy", $this->updatedBy);
       
       
        
        // execute query
        $stmt->execute();
            return $stmt;
        }

    function order()
    {

        // query to update record
        $query = "SELECT COUNT(*) FROM  
         " . $this->orderdetails;

 
        // prepare query
        $stmt = $this->conn->prepare($query);
 
        // $this->id = htmlspecialchars(strip_tags($this->id));
        // $this->name = htmlspecialchars(strip_tags($this->name));
        // $this->email = htmlspecialchars(strip_tags($this->email));
        // $this->contactno = htmlspecialchars(strip_tags($this->contactno));

        // //bind values with stmt
        // $stmt->bindParam(":id", $this->id);
        // $stmt->bindParam(":name", $this->name);
        // $stmt->bindParam(":email", $this->email);
        // $stmt->bindParam(":contactno", $this->contactno);
        
        
        // execute query
        if ($stmt->execute()){
            return true;
        }

        return false;
    }

  }
?>