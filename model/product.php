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
    public $hide;
    public $checked;


    function __construct()
    {
        $this->database = new DBConfig();
    }

    function addProduct()
    {

        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare('insert into product values(null,?,?,?,?,?,?,?,null,?,?,?,null)');
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
        product.color,product.hide,user.first_name,user.last_name, user.firebase_user_id, user.firebase_user_name
        FROM product
        INNER JOIN user ON  product.vendor_id =user.user_id
        LEFT OUTER JOIN rating
        ON product.product_id = rating.product_id
        WHERE product.hide=0
        GROUP BY product.product_id,product.product_name,
        product.yrial_price,product.dollar_price,product.vendor_id,product.cat_id,
        product.product_details,product.product_img,product.product_date,product.product_quantity,
        product.product_discount,product.color,product.hide
        ORDER BY product.product_date DESC ");
        $statement->execute();
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
    }

     function getProductsAdmin()
    {   
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("SELECT product.product_id,product.product_name,
        product.yrial_price,product.dollar_price,product.vendor_id,product.cat_id,
        product.product_details,product.product_img,product.product_date,product.product_quantity,
        product.product_discount,IFNULL(ROUND(AVG(rating.rating),1),0) as rating_average,COUNT(rating.rating_id) as number_of_ratings,
        product.color,product.hide
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
       product.product_discount,IFNULL(ROUND(AVG(rating.rating),1),0) AS rating_average,COUNT(rating_id)
       AS number_of_ratings,
       product.color,user.first_name,user.last_name,  user.firebase_user_id, user.firebase_user_name
       FROM rating
       RIGHT JOIN product
       ON rating.product_id = product.product_id
       INNER JOIN user ON  product.vendor_id =user.user_id
       WHERE product.product_id = ?
       GROUP BY product.product_id,product.product_name,
       product.yrial_price,product.dollar_price,product.vendor_id,product.cat_id,
       product.product_details,product.product_img,product.product_date,product.product_quantity,
       product.product_discount,product.color");
       $statement->execute([$id]);
       $row1= $statement-> fetchAll(PDO::FETCH_ASSOC);
       
       $statement2= $pdo->prepare("SELECT COUNT(product_report_details.product_r_d_id) AS number_of_reports
       FROM product_report_details
       RIGHT JOIN product
       ON product_report_details.product_id = product.product_id
       WHERE product.product_id = ?");
       $statement2->execute([$id]);
       $row2=$statement2-> fetchAll(PDO::FETCH_ASSOC);
       $result = array_merge($row1, $row2);
       return (object)array("ListOfProducts"=>$result)  ;
   }

    function getProductByCategory($cat_id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where cat_id=? AND hide=0");
        $statement->execute([$cat_id]);
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }
    function getProductByVendor($vendor_id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where vendor_id=? AND hide=0");
        $statement->execute([$vendor_id]);
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }

    function getProductByHide($hide)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where hide=? ");
        $statement->execute([$hide]);
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }

    function getProductByColor($color)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where color=? AND hide=0");
        $statement->execute([$color]);
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }

    function searchProduct($query)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from product where product_name LIKE ? AND hide=0");
        $query="%".$query."%" ;
        $statement->execute([$query]);
        $rows= (object) array("ListOfProducts"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }

    function hideProduct(){
        try {
            $pdo= $this->database->connect();
            $sql = "update product set hide=? WHERE product_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->hide,$this->product_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

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

    function checkProductReports(){
        try {
            $pdo= $this->database->connect();
            $sql = "update product_report_details set checked=? WHERE product_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->checked,$this->product_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }
    }


    function checkUserType($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select admin from user where user_id=?");
        $statement->execute([$id]);
        $row=$statement->fetch(PDO::FETCH_OBJ);
        if ($row->admin)
            return true ;
        else
            return false;
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



