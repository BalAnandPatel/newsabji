<?php

class Seller
{

    private $conn;
    private $sellar = "sellar";
    private $sellaraddress="sellaraddress";
    private $sellarbankdetails="sellarbankdetails";
    // private $table_payment = "payment";

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public $id,$sellarName,$counterName,$gst,$updatedBy,$status,$pan,$address,$city,$pincode,$sgst,$cgst,$aadhar,$image,$phonNo,$regFee,$depositAmount,$password,$pwd,$createdOn,$createdBy,$updatedOn,$phoneNo,$email;

    public $cuId, $cuName,$cuEmail, $cuAddress, $cuMobile, $requiredService;
   
   
    public function readSellar()
    {
        $query = "Select a.sellarName,a.counterName,a.id,a.password,a.pan,a.gst,b.city,b.pincode,a.createdOn,b.address,a.aadhar,image,phoneNo,regFee,depositAmount,email,status from " . $this->sellar .  " as a INNER JOIN " . $this->sellaraddress . " as b ON b.sellarId=a.id JOIN " . $this->sellaraddress . " as c ON c.sellarId=a.id";
         $stmt = $this->conn->prepare($query);
        // $stmt->bindParam(":userName", $this->userName); 
        $stmt->execute();
        return $stmt;
    }


    


    public function readSellarById()
    {
        $query = "Select a.sellarName,a.counterName,c.bankName,b.sellarId,c.updatedOn,c.updatedBy,c.upiId,b.city,b.pincode,c.accountNo,c.ifscCode,a.id,a.pan,a.gst,b.city,b.pincode,a.createdOn,b.address,a.aadhar,image,phoneNo,regFee,depositAmount,password,email,status from " . $this->sellar .  " as a INNER JOIN " . $this->sellaraddress . " as b ON b.sellarId=a.id JOIN " . $this->sellarbankdetails . " as c ON c.sellarId=a.id where a.id=:id";
         $stmt = $this->conn->prepare($query);
          $stmt->bindParam(":id", $this->id); 
        $stmt->execute();
        return $stmt;
    }


    public function sellarLogin()
    {
        $query = "Select a.sellarName,a.counterName,c.bankName,b.sellarId,c.updatedOn,c.updatedBy,c.upiId,b.city,b.pincode,c.accountNo,c.ifscCode,a.id,a.pan,a.gst,b.city,b.pincode,a.createdOn,b.address,a.aadhar,image,phoneNo,regFee,depositAmount,password,email,status from " . $this->sellar .  " as a INNER JOIN " . $this->sellaraddress . " as b ON b.sellarId=a.id JOIN " . $this->sellarbankdetails . " as c ON c.sellarId=a.id where a.id=:id and a.password=:pwd";
         $stmt = $this->conn->prepare($query);
          $stmt->bindParam(":id", $this->id); 
          $stmt->bindParam(":pwd", $this->pwd); 
        $stmt->execute();
        return $stmt;
    }

    public function readSellarmaxId()
    {
        $query = "Select max(id) as id from " . $this->sellar;
         $stmt = $this->conn->prepare($query);
        // $stmt->bindParam(":userName", $this->userName); 
        $stmt->execute();
        return $stmt;
    }


    public function insertSellar()
    {
         $query = "INSERT INTO
        " . $this->sellar. "
    SET      sellarName=:sellarName,
             counterName=:counterName,
             pan=:pan,
             email=:email,
             aadhar=:aadhar, 
             gst=:gst, 
             status=:status, 
             regFee=:regFee,
             depositAmount=:depositAmount, 
             phoneNo=:phoneNo,
             createdOn=:createdOn,
             createdBy=:createdBy, 
             password=:password";           ;

        $stmt = $this->conn->prepare($query);
        $this->sellarName = htmlspecialchars(strip_tags($this->sellarName));
        $this->gst = htmlspecialchars(strip_tags($this->gst));
        $this->counterName = htmlspecialchars(strip_tags($this->counterName));
        $this->pan = htmlspecialchars(strip_tags($this->pan));
        $this->regFee = htmlspecialchars(strip_tags($this->regFee));
        $this->email = htmlspecialchars(strip_tags($this->email));
        $this->password = htmlspecialchars(strip_tags($this->password));
        $this->depositAmount = htmlspecialchars(strip_tags($this->depositAmount));
        $this->phoneNo = htmlspecialchars(strip_tags($this->phoneNo));
        $this->status = htmlspecialchars(strip_tags($this->status));
        $this->createdBy = htmlspecialchars(strip_tags($this->createdBy));
        $this->createdOn = htmlspecialchars(strip_tags($this->createdOn));
        
        $stmt->bindParam(":sellarName", $this->sellarName);
        $stmt->bindParam(":gst", $this->gst);
        $stmt->bindParam(":counterName", $this->counterName);
        $stmt->bindParam(":pan", $this->pan);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":aadhar", $this->aadhar);
        $stmt->bindParam(":phoneNo", $this->phoneNo);
        $stmt->bindParam(":regFee", $this->regFee);
        $stmt->bindParam(":depositAmount", $this->depositAmount);
        $stmt->bindParam(":password", $this->password);
        $stmt->bindParam(":status", $this->status);
        $stmt->bindParam(":createdOn", $this->createdOn);
        $stmt->bindParam(":createdBy", $this->createdBy);

        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function deactivateSellar(){
  
  echo $query = "UPDATE 
     " . $this->sellar . "
 SET
    status=:status
    where id=:id";


    // prepare query
    $stmt = $this->conn->prepare($query);

    
    $this->id = htmlspecialchars(strip_tags($this->id));    
   // $this->status = htmlspecialchars(strip_tags($this->status));


    //bind values with stmt
    $stmt->bindParam(":status", $this->status);
    $stmt->bindParam(":id", $this->id);


    
    // execute query
    if ($stmt->execute()){
        return true;
    }

    return false;
}

    function updateSellar()
    {

        // query to update record
        $query = "UPDATE 
         " . $this->sellar . "
     SET
        counterName=:counterName,
        pan=:pan,
        aadhar=:aadhar,
        phoneNo=:phoneNo,
        gst=:gst,
        email=:email,
        updatedOn=:updatedOn,
        updatedBy=:updatedBy
        where id=:id";

 
        // prepare query
        $stmt = $this->conn->prepare($query);
 
        
        $this->counterName = htmlspecialchars(strip_tags($this->counterName));
        $this->phoneNo = htmlspecialchars(strip_tags($this->phoneNo));
        $this->pan = htmlspecialchars(strip_tags($this->pan));
        $this->aadhar = htmlspecialchars(strip_tags($this->aadhar));
        $this->gst = htmlspecialchars(strip_tags($this->gst));
        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->email = htmlspecialchars(strip_tags($this->email));    
        $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
        $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));


        //bind values with stmt
        $stmt->bindParam(":counterName", $this->counterName);
        $stmt->bindParam(":id", $this->id);
        $stmt->bindParam(":phoneNo", $this->phoneNo);
        $stmt->bindParam(":pan", $this->pan);
        $stmt->bindParam(":aadhar", $this->aadhar);
        $stmt->bindParam(":gst", $this->gst);
        $stmt->bindParam(":email", $this->email);
        $stmt->bindParam(":updatedBy", $this->updatedBy);
        $stmt->bindParam(":updatedOn", $this->updatedOn);

        
        // execute query
        if ($stmt->execute()){
            return true;
        }

        return false;
    }


// updated Sellar address

function updateSellaraddrss()
{

    // query to update record
    $query = "UPDATE 
     " . $this->sellaraddress . "
 SET
    address=:address,
    city=:city,
    pincode=:pincode,
    updatedOn=:updatedOn,
    updatedBy=:updatedBy
    where sellarId=:id";


    // prepare query
    $stmt = $this->conn->prepare($query);

    
    $this->address = htmlspecialchars(strip_tags($this->address));
    $this->city = htmlspecialchars(strip_tags($this->city));
    $this->pincode = htmlspecialchars(strip_tags($this->pincode));
    $this->id = htmlspecialchars(strip_tags($this->id));    
    $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
    $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));


    //bind values with stmt
    $stmt->bindParam(":address", $this->address);
    $stmt->bindParam(":city", $this->city);
    $stmt->bindParam(":id", $this->id);
    $stmt->bindParam(":pincode", $this->pincode);
    $stmt->bindParam(":updatedBy", $this->updatedBy);
    $stmt->bindParam(":updatedOn", $this->updatedOn);

    
    // execute query
    if ($stmt->execute()){
        return true;
    }

    return false;
}





    function countSellar()
    {

        // query to update record
        $query = "SELECT COUNT(*) FROM  
         " . $this->sellar;

 
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