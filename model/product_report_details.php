<?PHP
include('../db_config.php');
class Product_report_details {
    public $product_r_id;
    public $product_r_d_id;
    public $product_id;
    public $sender_id;
    public $created_at;

    function __construct()
    {
        $this->database = new DBConfig();
    }

    function addProductReportDetials()
    {
        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare('INSERT INTO `product_report_details`( `product_id`, `product_r_id`, `sender_id`) VALUES (?,?,?)');
            $statement->execute([$this->product_id,$this->product_r_id,$this->sender_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }

    function getProductReportsDetails()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("SELECT product.product_id,product.product_name,
        IFNULL(COUNT(product_report_details.product_r_d_id),0) AS number_of_reports
        FROM user vendor 
        INNER JOIN product 
        ON product.vendor_id = vendor.user_id 
        INNER JOIN product_report_details 
        ON product.product_id = product_report_details.product_id 
        GROUP BY product.product_id,product.product_name  
        ORDER BY number_of_reports DESC");
        $statement->execute();
        $rows= (object) array("ListOfReportsDetails"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
    }

    function getProductReportDetails($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("SELECT product.product_name,product_report.product_r_type report_type,
        CONCAT(sender_id.first_name,' ',sender_id.last_name) as sender_name,
        CONCAT(vendor.first_name,' ',vendor.last_name) as vendor_name,
        product_report_details.created_at
        FROM product_report
        INNER JOIN product_report_details
        ON product_report.product_r_id = product_report_details.product_r_id
        INNER JOIN product
        ON product.product_id = product_report_details.product_id
        INNER JOIN user sender_id
        ON product_report_details.sender_id = sender_id.user_id
        INNER JOIN user vendor
        ON product.vendor_id = vendor.user_id
        WHERE product.product_id=?
        ORDER BY product_report_details.created_at DESC");
        $statement->execute([$id]);
        $rows= (object) array("reports_details"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }   
}

?>

