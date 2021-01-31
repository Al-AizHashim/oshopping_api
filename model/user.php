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
    public $firebase_user_id;
    public$firebase_user_name;
    public $database;
    public $checked;

    function __construct()
    {
        $this->database = new DBConfig();
    }


    function addUser()
    {
        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare("INSERT INTO `user`( `first_name`, `last_name`, `email`, `phone_number`,
             `details`, `address`,`image`,`firebase_user_id`, `firebase_user_name`) VALUES (?,?,?,?,?,?,?,?,?)");
            $statement->execute([  $this->first_name,$this->last_name,$this->email, $this->phone_number,$this->details,
            $this->address,$this->image,$this->firebase_user_id, $this->firebase_user_name]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }
    }


   function updateRow()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update user set first_name=?,last_name=?, phone_number=? , details=?, address=? 
             WHERE user_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->first_name, $this->last_name, $this->phone_number,
             $this->details,$this->address,$this->user_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }
   }
    function getUserIdByEmail($email)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from user where email=?");
        $statement->execute([$email]);
        $row= (object) array("ListOfUsers"=> $statement->  fetchAll( PDO::FETCH_ASSOC)) ;
        return $row  ;

    }

    function BlockUser()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update user set block=? WHERE user_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->block,$this->user_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }
    }

    function checkUserReports(){
        try {
            $pdo= $this->database->connect();
            $sql = "update report_details set checked=? WHERE against=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->checked,$this->user_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }
    }

    function getUsers()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from user WHERE block != 1  ORDER BY user_id DESC");
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

    function getUsersByBlock($block)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from user where block=?");
        $statement->execute([$block]);
        $rows= (object) array("ListOfUsers"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
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

}

?>
