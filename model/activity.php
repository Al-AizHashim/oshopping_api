<?php
include('../db_config.php');
class Activity{
    public $activityId;
    public $userId;
    public $productId;
    public $quantity;
    public $totalPrice;
    public $activityType;

    public $db_conn;

    function __construct(){
        $this->db_conn = new DBConfig();
    }

    function getActivitiesUser($uId){

        $pdo=$this->db_conn->connect();
        $statement = $pdo->prepare('SELECT * FROM activity WHERE fk_user_id=?');
        $statement->execute([$uId]);
        $row= (object) array("ListOfActivities"=> $statement->  fetchAll( PDO::FETCH_OBJ)) ;
        return $row  ;
    }
    function getActivities(){

        $pdo=$this->db_conn->connect();
        $statement = $pdo->prepare('SELECT * FROM activity');
        $statement->execute();
        $statement->execute();
        $rows= (object) array("ListOfActivities"=>$statement->fetchAll(PDO::FETCH_ASSOC));

        return $rows;

    }

    function addActivity()
    {

        try {
            $pdo= $this->db_conn->connect();
            echo "in try";
            $statement= $pdo->prepare('INSERT into activity values(null,?,?,?,?,?)');
            $statement->execute([$this->userId,$this->productId,$this->quantity,
                                 $this->totalPrice,$this->activityType]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }
}


?>