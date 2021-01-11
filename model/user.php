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


    function __construct()
    {

        $this->database = new DBConfig();

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


    function updateUser()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update user set first_name=?,last_name=?,email=?,latitude=?,
            longitude=?,details=?,is_vendor=?,block=? WHERE user_id=?";

            $statement= $pdo->prepare($sql);
            $statement->execute([$this->first_name,$this->last_name,$this->user_email,
            $this->latitude,$this->longitude,$this->user_details,$this->is_vendor
            ,$this->block, $this->user_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }

    //user_id	first_name	last_name	email	latitude	longitude	details	is_vendor	block	create_at

    function deleteUser()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "delete from user WHERE user_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->user_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }


    

}


?>



