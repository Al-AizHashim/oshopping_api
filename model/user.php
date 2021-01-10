<?PHP
include('../db_config.php');
class User {
    public $user_id;
    public $first_name;
    public $last_name;
    public $user_email;
    public $latitude;
    public $longitude;
    public $user_image;
    public $user_details;
    public $is_vendor;
    public $block;

    public $database;
    public $timessstamp;

    function __construct()
    {

        $this->database = new DBConfig();

    }
    function setTime(){
        //$this->timessstamp=date();
        // $milliseconds = round(microtime(true) * 1000);
    }


    function addUser()
    {

        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare('insert into user values(null,?,?,?,?,?,?,0,0,null)');
            $statement->execute([  $this->first_name,$this->last_name,$this->user_email, $this->latitude,$this->longitude,$this->user_details]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }


    

    function updateRow()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update user set category=?,region=?, title=? , info=? WHERE id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->user_category, $this->user_region, $this->user_title, $this->user_details, $this->user_id]);

            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }
//user_id	first_name	last_name	email	latitude	longitude	details	is_vendor	block	create_at

    function getUsers()
    {
        $userObj=new User();
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select user_id,first_name,last_name,email,latitude,longitude,details,create_at from user");
        $statement->execute();
        $rows= (object) array("userprofile"=>$statement->fetchAll(PDO::FETCH_ASSOC));


        return $rows;
    }
    function getSingleUser($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from user where user_id=?");
        $statement->execute([$id]);

        $row= array("userDetails"=> $statement->  fetch( PDO::FETCH_OBJ)) ;
        return $row  ;
    }







    /*
    function getRows()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select id,title from user");
        $statement->execute();
        $rows= $statement->fetchAll(PDO::FETCH_OBJ);
        return $rows;
    }
    function getlastTenRows()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select id,title,date from user  ORDER BY date DESC  limit 10");
        $statement->execute();
        $rows= (object) array("lastuser"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
    }

    
    function deleteRow()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "delete from user WHERE id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->user_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }

    function getRowsByCategoryAndRegion($category,$region)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select id,title,date from user where category=? and region=?");
        $statement->execute([$category, $region]);
        $rows= $statement->fetchAll(PDO::FETCH_OBJ);
        return $rows;
    }
    function getRowsByCategory($category)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select id,title,date from user where category=?");
        $statement->execute([$category]);
        $rows= (object) array("userByCategory"=>$statement->fetchAll(PDO::FETCH_OBJ));
        return $rows;
    }
    function getRowsByRegion($region)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select id,title,date from user where  region=?");
        $statement->execute([$region]);
        $rows= $statement->fetchAll(PDO::FETCH_OBJ);
        return $rows;
    }









    */


    

}


?>



