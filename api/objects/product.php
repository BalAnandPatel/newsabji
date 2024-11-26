<?php

class Product
{

    private $conn;
    private $sellar = "sellar";
    private $products = "products";
    private $categories = "categories";
    private $productskuid = "productskuid";
    private $cart = "cart";

    private $producthistory="producthistory";

    private $wall_upload_history = "wall_upload_history";
    // private $table_payment = "payment";

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public $id,$name,$productId,$description,$price,$quantity,$discount,$userId,$image,$skuId,$papular,$trending,$arrival,$bestselling,$categoriesId,$creatdOn,$updatedOn,$summary,$sellarId,$shippingCharge,$updatedBy;
   
   
    public function readProductById()
    {
        $query = "Select a.name,a.categoriesId,a.description,b.quantity,a.id,a.createdOn,a.image,a.sellarId,a.skuId,a.price,a.shippingCharge,a.discount from " . $this->products . " as a INNER JOIN " .$this->productskuid . " as b ON b.productId=a.id where a.id=:id";
         $stmt = $this->conn->prepare($query);
         $stmt->bindParam(":id", $this->id); 
        $stmt->execute();
        return $stmt;
    }


    public function readProductDetailsforOrder()
    {
       $query = "Select a.name,a.categoriesId,a.description,b.quantity,a.createdOn,a.image,a.sellarId,a.skuId,a.price,a.shippingCharge,a.discount from " . $this->products . " as a INNER JOIN " .$this->productskuid . " as b ON b.productId=a.id INNER JOIN " .$this->cart . " as c ON c.productId=a.id where c.userId=:userId";
         $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":userId", $this->userId); 
        $stmt->execute();
        return $stmt;
    }




    // Read Product Max id

    public function readProductMaxId()
    {
        $query = "Select max(id) as id from " . $this->products;
         $stmt = $this->conn->prepare($query);
        // $stmt->bindParam(":skuId", $this->skuId); 
        $stmt->execute();
        return $stmt;
    }



    public function readAllProductDetails()
    {
   $query = "Select a.name as productName,a.id,d.counterName, c.name,b.quantity, a.categoriesId,a.description,b.quantity,a.id,a.createdOn,a.image,a.sellarId,a.skuId,a.price,a.discount from " . $this->products . " as a INNER JOIN " .$this->productskuid . " as b ON b.productId=a.id JOIN " . $this->categories . " as c ON c.id=a.categoriesId JOIN " . $this->sellar . " as d ON a.sellarId=d.id";
         $stmt = $this->conn->prepare($query);
        //  $stmt->bindParam(":skuId", $this->skuId); 
        $stmt->execute();
        return $stmt;
    }



    public function readAllProductDetailsBySellar()
    {
  $query = "Select a.name as productName,a.id,c.name,c.commision, a.categoriesId,a.description,b.quantity,a.id,a.createdOn,a.image,a.sellarId,a.skuId,a.price,a.discount from " . $this->products . " as a INNER JOIN " .$this->productskuid . " as b ON b.productId=a.id JOIN " . $this->categories . " as c ON c.id=a.categoriesId  where a.sellarId=:sellarId";
         $stmt = $this->conn->prepare($query);
         $stmt->bindParam(":sellarId", $this->sellarId); 
        $stmt->execute();
        return $stmt;
    }




    


    public function readAllProduct()
    {
       $query = " Select name,categoriesId,description,image,sellarId,skuId,price,discount from " . $this->products . "INNER JOIN ON";
         $stmt = $this->conn->prepare($query);
        //  $stmt->bindParam(":skuId", $this->skuId); 
        $stmt->execute();
        return $stmt;
    }

    public function insertProduct()
    {
         $query = "INSERT INTO
        " . $this->products. "
    SET      name=:name,
             categoriesId=:categoriesId,
             shippingCharge=:shippingCharge,
             description=:description,
             image=:image,
             skuId=:skuId,
             price=:price,
             sellarId=:sellarId,
             discount=:discount";

        $stmt = $this->conn->prepare($query);
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->skuId = htmlspecialchars(strip_tags($this->skuId));
        $this->categoriesId = htmlspecialchars(strip_tags($this->categoriesId));
        $this->shippingCharge = htmlspecialchars(strip_tags($this->shippingCharge));
        $this->description = htmlspecialchars(strip_tags($this->description));
        $this->image = htmlspecialchars(strip_tags($this->image));
        $this->price = htmlspecialchars(strip_tags($this->price));
        $this->discount = htmlspecialchars(strip_tags($this->discount));
        $this->sellarId = htmlspecialchars(strip_tags($this->sellarId));
        
       
        
        $stmt->bindParam(":skuId", $this->skuId);
        $stmt->bindParam(":sellarId", $this->sellarId);
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":price", $this->price);
        $stmt->bindParam(":discount", $this->discount);
        $stmt->bindParam(":shippingCharge", $this->shippingCharge);
        $stmt->bindParam(":image", $this->image);
        $stmt->bindParam(":description", $this->description);
        $stmt->bindParam(":categoriesId", $this->categoriesId);
      

               
       
        // execute query
        if ($stmt->execute()) {
            return true;
        }

        return false;
    }

    function deletProducts(){
  
        // delete user detatail
        $query1 = " DELETE FROM " . $this->products. " 
        WHERE id=:id";
        $query2 = " DELETE FROM " . $this->producthistory. " 
        WHERE productId=:id";
        $query3 = " DELETE FROM " . $this->productskuid. " 
        WHERE productId=:id";
    
       
        // prepare query
        $stmt1 = $this->conn->prepare($query1);
        $stmt2 = $this->conn->prepare($query2);
        $stmt3 = $this->conn->prepare($query3);
       
        // sanitize
        $this->id=htmlspecialchars(strip_tags($this->id));
      
        // bind id of record to delete
        $stmt1->bindParam(":id", $this->id);
        $stmt2->bindParam(":id", $this->id);
        $stmt3->bindParam(":id", $this->id);
       
        // execute query
        if ($stmt1->execute() && $stmt2->execute() && $stmt2->execute()){
            return true;
        }
      
        return false;
    }
    
    function updateProduct()
    {

        // query to update record
         $query = "UPDATE 
         " . $this->products . "
     SET      
             name=:name,
             price=:price,
             description=:descripation,
             discount=:discount";

        $stmt = $this->conn->prepare($query);
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->price = htmlspecialchars(strip_tags($this->price));
        $this->description = htmlspecialchars(strip_tags($this->description));
        $this->discount = htmlspecialchars(strip_tags($this->discount));
       
        
        $stmt->bindParam(":name", $this->name);
        $stmt->bindParam(":price", $this->price);
        $stmt->bindParam(":description", $this->description);
        $stmt->bindParam(":discout", $this->discount);

        
        
        // execute query
        if ($stmt->execute()){
            return true;
        }

        return false;
    }


///Update Product Quantity after Sold

function updateProductQuantity()
    {

        // query to update record
         $query = "UPDATE 
         " . $this->productskuid . "
     SET      
             quantity=quantity-:quantity,
             updatedOn=:updatedOn,
             updatedBy=:updatedBy
              where productId=:productId";

        $stmt = $this->conn->prepare($query);
        // $this->quantity = htmlspecialchars(strip_tags($this->quantity));
        // $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));
        // $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
        // $this->productId = htmlspecialchars(strip_tags($this->productId));
        
       
        
        $stmt->bindParam(":quantity", $this->quantity);
        $stmt->bindParam(":updatedBy", $this->updatedBy);
        $stmt->bindParam(":updatedOn", $this->updatedOn);
        $stmt->bindParam(":productId", $this->productId);
      

        
        
        // execute query
        if ($stmt->execute()){
            return true;
        }

        return false;
    }




    function updateProductQuantitydata()
    {

        // query to update record
         $query = "UPDATE 
         " . $this->productskuid . "
     SET      
             quantity=quantity+:quantity,
             updatedOn=:updatedOn
              where productId=:productId";

        $stmt = $this->conn->prepare($query);
        // $this->quantity = htmlspecialchars(strip_tags($this->quantity));
        // $this->updatedBy = htmlspecialchars(strip_tags($this->updatedBy));
        // $this->updatedOn = htmlspecialchars(strip_tags($this->updatedOn));
        // $this->productId = htmlspecialchars(strip_tags($this->productId));
        
       
        
        $stmt->bindParam(":quantity", $this->quantity);
        $stmt->bindParam(":updatedOn", $this->updatedOn);
        $stmt->bindParam(":productId", $this->productId);
      

        
        
        // execute query
        if ($stmt->execute()){
            return true;
        }

        return false;
    }


    function countCart()
    {

        // query to update record
        $query = "SELECT COUNT(*) FROM  
         " . $this->products;

 
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