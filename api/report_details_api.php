<?php
include('../model/report_details.php');
$report_details_model=new Report_details();

 if(isset($_POST)&&!empty($_POST)){
    $report_details_model->sender = $_POST['sender_id'];
    $report_details_model->against = $_POST['against_id'];
    $report_details_model->report_id = $_POST['report_id'];

    if ($report_details_model->addReportDetials()){
        $feedback['code'] = 200;
        $feedback['message'] = "data inserted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to insert data";

    }
    echo json_encode ($feedback);
}



else if(isset($_GET)){
    if (isset($_GET['against'])){
        echo  json_encode (  $report_details_model->getReportDetails($_GET['against'])  ) ;
    }
    else if (isset($_GET['block'] )) {
        if(isset($_GET['checked'])){
            $report_details_model->block=$_GET['block'];
            $report_details_model->checked=$_GET['checked'];
        echo json_encode ($report_details_model->getReportsDetails());}
        else  echo json_encode ("there is no response for your request");
    }
    else {
        echo json_encode ("there is no response for your request");

    }
}

    ?>
