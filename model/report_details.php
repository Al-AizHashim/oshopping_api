<?PHP
include('../db_config.php');
clASs Report_details {
    public $report_id;
    public $report_D_id;
    public $sender;
    public $against;
    public $created_at;
    public $block;
    public $checked;
    

    function __construct()
    {
        $this->database = new DBConfig();
    }

    function addReportDetials()
    {
        try {
            $pdo= $this->database->connect();
            $statement= $pdo->prepare('insert into report_details values(null,?,?,?,null)');
            $statement->execute([$this->report_id,$this->sender,$this->against]);
            return true;
        } catch (PDOException $ex) {
            return false;
        }
    }


    function getReportsDetails()
    { 
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("SELECT report_details.against,
            IFNULL(COUNT(report_details.report_D_id),0) AS  number_of_reports,
            CONCAT(against.first_name,' ',against.lASt_name) AS report_against
            FROM report_details
            INNER JOIN user against
            ON report_details.against = against.user_id
            WHERE against.block = ?
            AND report_details.checked =?
            GROUP BY report_details.against
            ORDER BY number_of_reports DESC ");
        $statement->execute([$this->block, $this->checked]);
         $rows= (object) array("ListOfReportsDetails"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows;
    }

    function getReportDetails($id)
    {
        $pdo= $this->database->connect();
        $statement= $pdo->prepare("SELECT report.report_name report_type,
            CONCAT(sender.first_name,' ',sender.lASt_name) AS sender_name,
            CONCAT(against.first_name,' ',against.lASt_name) AS against,
            report_details.created_at
            FROM report
            INNER JOIN report_details
            ON report.report_id = report_details.report_id
            INNER JOIN user sender
            ON report_details.sender = sender.user_id
            INNER JOIN user against
            ON report_details.against = against.user_id
            WHERE report_details.against=?");
        $statement->execute([$id]);
        $rows= (object) array("reports_details"=>$statement->fetchAll(PDO::FETCH_ASSOC));
        return $rows  ;
    }
}

?>



