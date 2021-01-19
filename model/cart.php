<?php 
include('../db_config.php');
class cart
{
  public $cart_id;
  public $user_id;
  public $product_id;
  public $cart_statuse;
  public $database;

function __construct()
{

  $this->database=new DBConfig();

}

function getRows(){

	$pdo=$this->database->connect();
    
    
   $statement= $pdo->prepare("select * from cart");
    
    $statement->execute();
    
    return (object) array("Cart"=>$statement->fetchAll(PDO::FETCH_OBJ)); 
    
}
    
 function getSingleRows($cart_id){

  $pdo=$this->database->connect();
    
    
   $statement= $pdo->prepare("select * from cart where cart_id = ?");
    
    $statement->execute([$cart_id]);
    
    return (object) array("getSingleCart"=>$statement->fetchAll(PDO::FETCH_OBJ));
    
    
}
    
    
    
    function updateRow(){
           $pdo=$this->database->connect();
         try{

        $statement=  $pdo->prepare(" UPDATE cart set cart_statuse=? where cart_id = ? ");
         $statement->execute([$this->cart_statuse,$this->cart_id]);
        
            return true;
        
             
   }catch(PDOException $e){
   return false;
       }
        
        
    }
    
   public function delete()
    {
         try{
             
      $pdo=$this->database->connect();
      $statement=  $pdo->prepare("DELETE FROM cart WHERE  cart_id=?");
      $statement->execute([$this->cart_id]);
       return true;


          }catch(PDOException $e){
             return false;
                  }
    }
    
    
    function addRow()
 {
   try{
     $pdo=$this->database->connect();
     $qury='insert into cart values(null,?,?,?)';
    $statement=  $pdo->prepare($qury);
    $statement->execute([$this->user_id,$this->product_id,$this->cart_statuse]);
  return true;
}
    catch(PDOException $e){
return false;
    }   
}
      
}

 ?>