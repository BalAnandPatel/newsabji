<?php

class Deliveryincome
{

    private $conn;
    private $deliveryincome = "deliveryincome";
    private $deliveryboy = "deliveryboy";
    private $business_category = "business_category";
    private $customer_inquiry = "customer_inquiry";
    private $users = "users";
    private $user_type = "user_type";
    private $wall_uploads = "wall_uploads";
    private $wall_upload_history = "wall_upload_history";
    // private $table_payment = "payment";

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public $id, $userId, $userType, $city, $state, $name, $email,$email_id, $contactno, $password, $regDate, $sellar_name,$sellar_id,$father,$address, $sellarId, $mobile_no,$payment_status,$pincode,$created_on, $created_by, $emp_id, $alterMobile, $businessDay, $userWebsite, $deliveryId, $establishmentYear, $paymentMode, $businessTiming, $userServices, $aboutUser, $status, $remark, $createdOn,$pan,$aadhar,$orderId,$amount,$commision,$otherCommision,$fuelCharges,$tipAmount,
    $createdBy,$wallImg,$workingAddress,$regidenceAddress,$workingPincode,$phoneNo, $updatedOn, $updatedBy;

    public $cuId, $cuName,$cuEmail, $cuAddress, $cuMobile, $requiredService;
   
   
    public function readDeliveryIncome()
    {
        $query = "Select sellarId,deliveryId,orderId,amount,commision,otherCommision,fuelCharges,tipAmount,createdOn,createdBy from " . $this->deliveryincome . " where id=:id";
         
        $stmt = $this->conn->prepare($query);

        $this->deliveryId = htmlspecialchars(strip_tags($this->deliveryId));
        //$this->emp_id = htmlspecialchars(strip_tags(string: $this->emp_id));
        $stmt->bindParam(":deliveryId", $this->deliveryId); 
        $stmt->execute();
        return $stmt;
                
    }


    public function insertDeliveryIncome()
    {
         $query = "INSERT INTO
        " . $this->deliveryboy. "
    SET      deliveryId=:deliveryId,
             sellarId=:sellarId,
             orderId=:orderId,
             amount=:amount, 
             commision=:commision,
             otherCommision=:otherCommision,
             fuelCharges=:fuelCharges,
             tipAmoun=:tipAmount,
             createdOn=:createdOn,
             createdBy=:createdBy";           ;

        $stmt = $this->conn->prepare($query);
        $this->deliveryId = htmlspecialchars(strip_tags($this->deliveryId));
        $this->sellarId = htmlspecialchars(strip_tags($this->sellarId));
        $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->amount = htmlspecialchars(strip_tags($this->amount));
        $this->commision = htmlspecialchars(strip_tags($this->commision));
        $this->otherCommision = htmlspecialchars(strip_tags($this->otherCommision));
        $this->fuelCharges = htmlspecialchars(strip_tags($this->fuelCharges));
        $this->tipAmount = htmlspecialchars(strip_tags($this->tipAmount));
        $this->createdOn = htmlspecialchars(strip_tags($this->createdOn));
        $this->createdBy = htmlspecialchars(strip_tags($this->createdBy));
        
       
        
        $stmt->bindParam(":deliveryId", $this->deliveryId);
        $stmt->bindParam(":sellarId", $this->sellarId);
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":amount", $this->amount);
        $stmt->bindParam(":commision", $this->commision);
        $stmt->bindParam(":otherCommiion", $this->otherCommision);
        $stmt->bindParam(":fuelCharges", $this->fuelCharges);
        $stmt->bindParam(":tipAmount", $this->tipAmount);
        $stmt->bindParam(":createdOn", $this->createdOn);
        $stmt->bindParam(":createdBy", $this->createdBy);
       
        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function deliveryIncomeDelete(){
  
        // delete user detatail
        $query = " DELETE FROM " . $this->deliveryboy . " 
        WHERE deliveryId=:deliveryId";
    
        // $query2 = " DELETE FROM " . $this->user_profile . " 
        // WHERE userId=:id";
    
        // $query3 = " DELETE FROM " . $this->user_profile_history . " 
        // WHERE userId=:id";
    
        // $query4 = " DELETE FROM " . $this->wall_uploads . " 
        // WHERE userId=:id";
    
        // $query5 = " DELETE FROM " . $this->wall_upload_history . " 
        // WHERE userId=:id";
      
        // prepare query
        $stmt = $this->conn->prepare($query);
        // $stmt2 = $this->conn->prepare($query2);
        // $stmt3 = $this->conn->prepare($query3);
        // $stmt4 = $this->conn->prepare($query4);
        // $stmt5 = $this->conn->prepare($query5);
      
        // sanitize
        $this->deliveryId=htmlspecialchars(strip_tags($this->deliveryId));
      
        // bind id of record to delete
        $stmt->bindParam(":deliveryId", $this->deliveryId);
        // $stmt2->bindParam(":id", $this->id);
        // $stmt3->bindParam(":id", $this->id);
        // $stmt4->bindParam(":id", $this->id);
        // $stmt5->bindParam(":id", $this->id);
      
        // execute query
        if ($stmt->execute()){
            return true;
        }
      
        return false;
    }
    function updateDelivery()
    {

        // query to update record
        $query = "UPDATE 
         " . $this->deliveryincome . "
     SET
        sellarId=:sellarId,
        orderId=:orderId,
        amount=:amount,
        commision=:commision,
        otherCommision=:otherCommision,
        fuelCharges=:fuelCharges,
        tipAmount=:tipAmount,
        updatedOn=:updatedOn,
        updatedBy=:upadatedBy,
        where deliveryId=:deliveryId";

 
        // prepare query
        $stmt = $this->conn->prepare($query);
 
        
        $this->sellarId = htmlspecialchars(strip_tags($this->sellarId));
        $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->amount = htmlspecialchars(strip_tags($this->amount));
        $this->commision = htmlspecialchars(strip_tags($this->commision));
        $this->otherCommision = htmlspecialchars(strip_tags($this->otherCommision));
        $this->fuelCharges = htmlspecialchars(strip_tags($this->fuelCharges));
        $this->tipAmount = htmlspecialchars(strip_tags($this->tipAmount));
        $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
        $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));
        $this->deliveryId = htmlspecialchars(strip_tags($this->deliveryId));


        //bind values with stmt
        $stmt->bindParam(":sellarId", $this->sellarId);
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":amount", $this->amount);
        $stmt->bindParam(":commision", $this->commision);
        $stmt->bindParam(":otherCommision", $this->otherCommision);
        $stmt->bindParam(":fuelCharges", $this->fuelCharges);
        $stmt->bindParam(":tipAmount", $this->tipAmount);
        $stmt->bindParam(":updatedOn", $this->updatedOn);
        $stmt->bindParam(":upadatedBy", $this->updatedBy);
        $stmt->bindParam(":deliveryId", $this->deliveryId);
        
        
        // execute query
        if ($stmt->execute()){
            return true;
        }

        return false;
    }

    function countDeliveryBoy()
    {

        // query to update record
        $query = "SELECT COUNT(*) FROM  
         " . $this->deliveryboy;

 
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