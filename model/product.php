<?PHP
include('../db_config.php');
class Product {
    public $product_id;
    public $product_name;
    public $product_price_RY;
    public $product_price_D;
    public $vendor_id;
    public $cart_id;
    public $product_details;
    public $product_image;
    public $product_date;
    public $product_quantity;
    public $product_discount;


    function __construct()
    {
        $this->database = new DBConfig();
    }

    function addProduct()
    {

        try {
            $pdo= $this->database->connect();
            echo "in try";
            $statement= $pdo->prepare('insert into product values(null,?,?,?,?,?,?,?,null,?,?)');
            $statement->execute([$this->product_name,$this->product_price_RY,$this->product_price_D,
            $this->vendor_id,$this->cart_id,$this->product_details,$this->product_image
            ,$this->product_quantity,$this->product_discount]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }


    function getProducts()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product");
        $statement->execute();
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));

        return $rows;
    }

    function getSingleProduct($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where Product_id=?");
        $statement->execute([$id]);
        $row= array("Product"=> $statement->  fetch( PDO::FETCH_OBJ)) ;
        return $row  ;
    }

    function getProductByCategory($cat_id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where cat_id=?");
        $statement->execute([$cat_id]);
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }

    function searchProduct($query)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where product_name LIKE ?");
        $query="%".$query."%" ;
        $statement->execute([$query]);
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }


    function updateRow()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update Product set product_name=?,yrial_price=?,dollar_price=?,vendor_id=?,
            cat_id=?,product_details=?,product_img=?,product_quantity=?,
            product_discount=?, WHERE product_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->product_name,$this->product_price_RY,$this->product_price_D,
            $this->vendor_id,$this->cart_id,$this->product_details,$this->product_image
            ,$this->product_quantity,$this->product_discount, $this->product_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }

    function deleteProduct()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "delete from product WHERE product_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->product_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }
   

}


?>



