<?PHP
include('../db_config.php');
class Report {
    public $report_id;
    public $report_name;
 
 
    function __construct()
    {
        $this->database = new DBConfig();
    }

    function addReport()
    {

        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare('insert into report values(null,?)');
            $statement->execute([$this->report_name]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }


    function getReports()
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from report  ORDER BY report_id DESC");
        $statement->execute();
        $rows= (object) array("ListOfReports"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
    }

    function getSingleReport($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("select * from report where report_id=?");
        $statement->execute([$id]);
        $row= array("report"=> $statement->  fetch( PDO::FETCH_OBJ)) ;
        return $row  ;
    }
    function updateRow()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "update report set report_name=? WHERE report_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->report_name, $this->report_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    }

    function deleteReport()
    {
        try {
            $pdo= $this->database->connect();
            $sql = "delete from report WHERE report_id=?";
            $statement= $pdo->prepare($sql);
            $statement->execute([$this->report_id]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }

    } 
   

}


?>



