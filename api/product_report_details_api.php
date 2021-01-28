<?php
include('../model/product_report_details.php');
$product_report_details_model=new Product_report_details();

 if(isset($_POST)&&!empty($_POST)){
    $product_report_details_model->sender_id = $_POST['sender_id'];
    $product_report_details_model->product_id = $_POST['product_id'];
    $product_report_details_model->product_r_id = $_POST['product_r_id'];

    if ($product_report_details_model->addProductReportDetials()){
        $feedback['code'] = 200;
        $feedback['message'] = "data inserted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to insert data";

    }
    echo json_encode ($feedback);
}


else if(isset($_GET)){
    if (isset($_GET['product_id'])){
        echo  json_encode (  $product_report_details_model->getProductReportDetails($_GET['product_id'])  ) ;
    }
    else if (isset($_GET['hide'] )) {
        if(isset($_GET['checked'])){
            $product_report_details_model->hide=$_GET['hide'];
            $product_report_details_model->checked=$_GET['checked'];
        echo json_encode ($product_report_details_model->getProductReportsDetails());}
        else  echo json_encode ("there is no response for your request");
    }
    else {
        // echo json_encode ($product_report_details_model->getProductReportsDetails());

    }
}

    ?>
