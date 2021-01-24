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
    public $color;


    function __construct()
    {
        $this->database = new DBConfig();
    }

    function addProduct()
    {

        try {
            $pdo= $this->database->connect();
            echo "in try";
            $statement= $pdo->prepare('insert into product values(null,?,?,?,?,?,?,?,null,?,?,?)');
            $statement->execute([$this->product_name,$this->product_price_RY,$this->product_price_D,
            $this->vendor_id,$this->cart_id,$this->product_details,$this->product_image
            ,$this->product_quantity,$this->product_discount,$this->color]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }


      function getProducts()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("SELECT product.product_id,product.product_name,
        product.yrial_price,product.dollar_price,product.vendor_id,product.cat_id,
        product.product_details,product.product_img,product.product_date,product.product_quantity,
        product.product_discount,IFNULL(ROUND(AVG(rating.rating),1),0) as rating_average,COUNT(rating.rating_id) as number_of_ratings,
        product.color 
        FROM product
        LEFT OUTER JOIN rating
          ON product.product_id = rating.product_id
          GROUP BY product.product_id
          ORDER BY product.product_date 
          DESC  limit 10
          ");
        $statement->execute();
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
    }


   function getProductById($id)


    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("SELECT product.product_id,product.product_name,
        product.yrial_price,product.dollar_price,product.vendor_id,product.cat_id,
        product.product_details,product.product_img,product.product_date,product.product_quantity,
        product.product_discount,IFNULL(ROUND(AVG(rating.rating),1),0) as rating_average,COUNT(rating_id) as number_of_ratings,
        product.color
        FROM rating
        INNER JOIN product
          ON rating.product_id = product.product_id
          AND product.product_id = ?");

        $statement->execute([$id]);
        $row= (object) array("ListOfProducts"=> $statement->  fetchAll( PDO::FETCH_OBJ)) ;
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
    function getProductByVendor($vendor_id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where vendor_id=?");
        $statement->execute([$vendor_id]);
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }
    function getProductByColor($color)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where color=?");
        $statement->execute([$color]);
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
            $sql = "update product set product_name=?,yrial_price=?,dollar_price=?,vendor_id=?,
            cat_id=?,product_details=?,product_img=?,product_quantity=?,
            product_discount=?,color=? WHERE product_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->product_name,$this->product_price_RY,$this->product_price_D,
            $this->vendor_id,$this->cart_id,$this->product_details,$this->product_image
            ,$this->product_quantity,$this->product_discount,$this->color, $this->product_id]);
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



