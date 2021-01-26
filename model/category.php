<?PHP
include('../db_config.php');
class Category {
    public $cat_id;
    public $cat_name;
    public $category_image;
 
 
    function __construct()
    {
        $this->database = new DBConfig();
    }

    function addCategory()
    {

        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare('insert into category values(null,?,?)');
            $statement->execute([  $this->cat_name,$this->category_image]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }


    function getCategories()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from category");
        $statement->execute();
        $rows= (object) array("ListOfCategories"=>$statement->fetchAll(PDO::FETCH_ASSOC));

        return $rows;
    }

    function getSingleCategory($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from category where cat_id=?");
        $statement->execute([$id]);

        $row= array("category"=> $statement->  fetch( PDO::FETCH_OBJ)) ;
        return $row  ;
    }
    function updateRow()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update category set cat_name=?, category_image=? WHERE cat_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->cat_name, $this->category_image, $this->cat_id]);

            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }
    function deleteCategory()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "delete from category WHERE cat_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->cat_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }
   

}


?>



