<?php

class OrderItem
{

    private $conn;
    private $orderitem = "orderitem";
    private $orderdetails = "orderdetails";
    // private $table_payment = "payment";

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public $id, $orderId, $productId,$discount,$price,$sgst,$cgst,$createdOn,$createdBy,$productSkuId, $quantity, $total;
    public $cuId, $cuName,$cuEmail, $cuAddress, $cuMobile, $requiredService, $updatedOn, $updatedBy, $userId, $adminCommision;
    public function readOrderItem()
    {

        if($this->orderId!=""){
        $query = "Select productId,productSkuId,quantity,discount,price,sgst,cgst,a.createdOn, a.createdBy,a.updatedOn,a.updatedBy from  $this->orderitem as a INNER JOIN $this->orderdetails as b ON a.orderId=b.orderId INNER JOIN  where orderId=:orderId";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":orderId", $this->orderId);
        }
        else{ 
        $query = "Select productId,productSkuId,quantity,discount,price,sgst,cgst,a.createdOn,a.createdBy,a.updatedOn,a.updatedBy from  $this->orderitem as a INNER JOIN $this->orderdetails as b ON a.orderId=b.orderId";
         $stmt = $this->conn->prepare($query);
        //$stmt->bindParam(":orderId", $this->orderId); 
    }
        $stmt->execute();
        return $stmt;
    }


    public function insertOrderItem()
    {
          $query = "INSERT INTO
        " . $this->orderitem . "
    SET      orderId=:orderId,
             productId=:productId,
             productSkuId=:productSkuId,
             quantity=:quantity,
             userId=:userId,
             adminCommision=:adminCommision,
             discount=:discount,
             price=:price,
             createdOn=:createdOn,
             createdBy=:createdBy";

        $stmt = $this->conn->prepare($query);
        $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->productId = htmlspecialchars(strip_tags($this->productId));
        $this->productSkuId = htmlspecialchars(strip_tags($this->productSkuId));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));
        $this->userId = htmlspecialchars(strip_tags($this->userId));
        $this->adminCommision = htmlspecialchars(strip_tags($this->adminCommision));
        $this->discount = htmlspecialchars(strip_tags($this->discount));
        $this->price = htmlspecialchars(strip_tags($this->price));
        $this->createdOn = htmlspecialchars(strip_tags($this->createdOn));
        $this->createdBy = htmlspecialchars(strip_tags($this->createdBy));




        
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":productId", $this->productId);
        $stmt->bindParam(":productSkuId", $this->productSkuId);
        $stmt->bindParam(":quantity", $this->quantity);
        $stmt->bindParam(":userId", $this->userId);
        $stmt->bindParam(":adminCommision", $this->adminCommision);
        $stmt->bindParam(":discount", $this->discount);
        $stmt->bindParam(":price", $this->price); 
        $stmt->bindParam(":createdOn", $this->createdOn);
        $stmt->bindParam(":createdBy", $this->createdBy);
        
        
        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function deleteOrderItem(){
  
        // delete user detatail
        $query = " DELETE FROM " . $this->orderitem . " 
        WHERE orderId=:orderId";
    
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
        $this->orderId=htmlspecialchars(strip_tags($this->orderId));
      
        // bind id of record to delete
        $stmt->bindParam(":orderId", $this->orderId);
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
    function updateOrderItem()
    {

        // query to update record
        $query = "UPDATE 
         " . $this->orderitem . "
     SET
        productId=:productId,
        productSkuId=:productSkuId,
        quantity=:quantity,
        discount=:discount,
        price=:price,
        sgst=:sgst,
        cgst=:cgst,
        updatedOn=:updatedOn,
        updatedBy=:updatedBy
        where orderId=:orderId";

 
        // prepare query
        $stmt = $this->conn->prepare($query);
 
        $this->orderId = htmlspecialchars(strip_tags($this->orderId));
        $this->productId = htmlspecialchars(strip_tags($this->productId));
        $this->productSkuId = htmlspecialchars(strip_tags($this->productSkuId));
        $this->price = htmlspecialchars(strip_tags($this->price));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));
        $this->discount = htmlspecialchars(strip_tags($this->discount));
        $this->sgst = htmlspecialchars(strip_tags($this->sgst));
        $this->cgst = htmlspecialchars(strip_tags($this->cgst));
        $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
        $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));

        //bind values with stmt
        $stmt->bindParam(":orderId", $this->orderId);
        $stmt->bindParam(":productId", $this->productId);
        $stmt->bindParam(":productSkuId", $this->productSkuId);
        $stmt->bindParam(":quantity", $this->quantity);
        $stmt->bindParam(":price", $this->price);
        $stmt->bindParam(":discount", $this->discount);
        $stmt->bindParam(":sgst", $this->sgst);
        $stmt->bindParam(":cgst", $this->cgst);
        $stmt->bindParam(":updatedOn", $this->updatedOn);
        $stmt->bindParam(":updatedBy", $this->updatedBy);
       
        
        // execute query
        $stmt->execute();
            return $stmt;
        }

    function orderCountItem()
    {

        // query to update record
        $query = "SELECT COUNT(*) FROM  
         " . $this->orderitem;

 
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