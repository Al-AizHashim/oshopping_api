<?php
include('../model/report.php');
$report_model=new Report();



 if(isset($_POST)&&!empty($_POST)){
    $report_model->report_name = $_POST['report_name'];
    if ($report_model->addReport()){
        $feedback['code'] = 200;
        $feedback['message'] = "data inserted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to insert data";

    }
    echo json_encode ($feedback);
}

else if($_SERVER['REQUEST_METHOD']=="PUT"){
    $_PUT= array();
    parse_str(file_get_contents('php://input'), $_PUT);
    $report_model->report_name = $_PUT['report_name'];
    $report_model->report_id = $_PUT['report_id'];


    if ($report_model->updateRow()){
        $feedback['code'] = 200;
        $feedback['message'] = "row ".$_PUT['report_id']." updated successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to update row ".$_PUT['report_id'];

    }
    echo json_encode ($feedback);

}

else if($_SERVER['REQUEST_METHOD']=="DELETE"){

    $report_model->report_id = $_GET['report_id'];
    if ($report_model->deleteReport()){
        $feedback['code'] = 200;
        $feedback['message'] = "the report  is deleted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to delete report ";

    }
    echo json_encode ($feedback);

}


else if($_SERVER['REQUEST_METHOD']=="GET"){
    if (isset($_GET['report_id'])){
        echo  json_encode (  $report_model->  getSingleReport($_GET['report_id'])  ) ;
    }
    else {

        echo json_encode ($report_model->getReports());

    }
}

    ?>