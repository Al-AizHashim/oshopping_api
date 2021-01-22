<?php 
include('../db_config.php');
class cart
{
  public $cart_id;
  public $user_id;
  public $product_id;
  public $cart_statuse;
  public $product_name;
  public $product_price_RY;
  public $product_price_D;
  public $vendor_id;
  public $cat_id;
  public $product_details;
  public $product_image;
  public $product_date;
  public $product_quantity;
  public $product_discount;
  public $color;
  public $database;

function __construct()
{

  $this->database=new DBConfig();

}

function getRows(){

	$pdo=$this->database->connect();
    
    
   $statement= $pdo->prepare("select * from cart ");
    
    $statement->execute();
    
    return (object) array("Cart"=>$statement->fetchAll(PDO::FETCH_OBJ)); 
    
}
    
 function getSingleRows($cart_id){

  $pdo=$this->database->connect();
    
    
   $statement= $pdo->prepare("select * from cart where cart_id = ?");
    
    $statement->execute([$cart_id]);
    
    return (object) array("getSingleCart"=>$statement->fetchAll(PDO::FETCH_OBJ));
    
    
}
function getSingleUserProductInCart($user_id)
{
    $pdo= $this->database->connect();
    $statement= $pdo->prepare("select * from cart where fk_user_id=?");
    $statement->execute([$user_id]);
    $rows= array("ListOfUserProductsInCart"=> $statement->  fetchAll( PDO::FETCH_ASSOC)) ;
    return $rows  ;
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
     $qury='insert into cart values(null,?,?,?,?,?,?,?,?,?,?,null,?,?,?)';
    $statement=  $pdo->prepare($qury);
    $statement->execute([$this->product_id,$this->user_id,$this->cart_statuse,$this->product_name,$this->product_price_RY,$this->product_price_D,
    $this->vendor_id,$this->cat_id,$this->product_details,$this->product_image
    ,$this->product_quantity,$this->product_discount,$this->color]);
  return true;
}
    catch(PDOException $e){
return false;
    }   
}
      
}

 ?>