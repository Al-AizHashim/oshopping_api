<?php

include('../model/activity.php');
$activity_model = new Activity();

if(isset($_POST)&&!empty($_POST)){
    $activity_model->userId = $_POST['fk_user_id'];
    $activity_model->productId= $_POST['fk_product_id'];
    $activity_model->quantity= $_POST['quantity'];
    $activity_model->totalPrice= $_POST['total_price'];
    $activity_model->activityType=$_POST['activity_type'];
    
   if ($activity_model->addActivity()){
       $feedback['code'] = 200;
       $feedback['message'] = "data inserted successfully";

   }else{
       $feedback['code'] = 400;
       $feedback['message'] = "failed to insert data";

   }
   echo json_encode ($feedback);
}
else if($_SERVER['REQUEST_METHOD']=="GET"){
    if (isset($_GET['fk_user_id'])){
        echo  json_encode (  $activity_model->  getActivitiesUser($_GET['fk_user_id'])  ) ;
    }
    else{
    echo  json_encode (  $activity_model->  getActivities()  );
    }
}

?>