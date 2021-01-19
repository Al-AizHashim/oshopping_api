<?PHP
include('../db_config.php');
class User {
    public $user_id;
    public $first_name;
    public $last_name;
    public $email;
    public $phone_number;
    public $details;
    public $address;
    public $vendor;
    public $block;
    public $admin;
    public $image;
    public$created_at;
    public $database;


    function __construct()
    {
        $this->database = new DBConfig();
    }


    function addUser()
    {
        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare("INSERT INTO `user`( `first_name`, `last_name`, `email`, `phone_number`, `details`, `address`,`image`) 
            VALUES (?,?,?,?,?,?,?)");
            $statement->execute([  $this->first_name,$this->last_name,$this->email, $this->phone_number,$this->details,$this->address,$this->image]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }

    function updateRow()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update user set first_name=?,last_name=?, phone_number=? , details=?, address=? , image=? WHERE id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->first_name, $this->last_name, $this->phone_number, $this->details,$this->address,$this->image,$this->user_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }
    function getUsers()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from user");
        $statement->execute();
        $rows= (object) array("ListOfUsers"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
    }

    function getUser($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from user where user_id=?");
        $statement->execute([$id]);
        $row= array("user"=> $statement->  fetch( PDO::FETCH_OBJ)) ;
        return $row  ;
    }
}

?>

