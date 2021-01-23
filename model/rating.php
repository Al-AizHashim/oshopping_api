<?PHP
include('../db_config.php');
class Rating {
    public $rating_id;
    public $product_id;
    public $rating;
    public $user_id;
 
 
    function __construct()
    {
        $this->database = new DBConfig();
    }

    function addRating()
    {

        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare('INSERT INTO `rating`( `product_id`, `user_id`, `rating`) VALUES (?,?,?)');
            $statement->execute([$this->product_id,$this->user_id,$this->rating]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }


    function getRatings()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from rating");
        $statement->execute();
        $rows= (object) array("ListOfRatings"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
    }

    function getSingleRating($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from Rating where rating_id=?");
        $statement->execute([$id]);
        $row= array("Rating"=> $statement->  fetch( PDO::FETCH_OBJ)) ;
        return $row  ;
    }
    function updateRow()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update Rating set rating=? WHERE user_id=? AND product_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->rating,$this->user_id, $this->product_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }
    }


    function checkExistUser(){
        try{
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from Rating where user_id=? AND product_id=?");
        $statement->execute([$this->user_id,$this->product_id]);
        $row= array("Rating"=> $statement->  fetch( PDO::FETCH_OBJ)) ;
        if($row['Rating'])
        return true ;
        else 
        return false;
        }
     catch (PDOException $ex) {
        return false;
    }
    }
    
}


?>



