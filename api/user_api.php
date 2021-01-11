<?php
include('../model/user.php');
$user_model=new User();



 if(isset($_POST)&&!empty($_POST)){
    $user_model->first_name = $_POST['firstName'];
    $user_model->last_name = $_POST['lastName'];
    $user_model->user_email = $_POST['email'];
    $user_model->latitude = $_POST['latitude'];
    $user_model->longitude = $_POST['longitude'];
    $user_model->user_details = $_POST['details'];

    if ($user_model->addUser()){
        $feedback['code'] = 200;
        $feedback['message'] = "data inserted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to insert data";

    }
    echo json_encode ($feedback);
}


/*
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
*/
else if($_SERVER['REQUEST_METHOD']=="PUT"){
    $_PUT= array();
    parse_str(file_get_contents('php://input'), $_PUT);
     $user_model->user_id = $_PUT['user_id'];
     $user_model->first_name = $_PUT['first_name'];
     $user_model->last_name= $_PUT['last_name'];
     $user_model->user_email= $_PUT['email'];
     $user_model->latitude= $_PUT['latitude'];
     $user_model->longitude=$_PUT['longitude'];
     $user_model->user_details= $_PUT['details'];
     $user_model->is_vendor= $_PUT['is_vendor'];
     $user_model->block= $_PUT['block'];

    if ($user_model->updateUser()){
        $feedback['code'] = 200;
        $feedback['message'] = "user ".$_PUT['user_name']." updated successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to update user ".$_PUT['user_name'];
    }
    echo json_encode ($feedback);

}

else if($_SERVER['REQUEST_METHOD']=="DELETE"){

    $user_model->user_id = $_GET['user_id'];
    if ($user_model->deleteUser()){
        $feedback['code'] = 200;
        $feedback['message'] = "the user  is deleted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to delete user ";

    }
    echo json_encode ($feedback);

}



else if(isset($_GET)){
    if (isset($_GET['user_id'])){
        echo  json_encode (  $user_model->  getSingleUser($_GET['user_id'])  ) ;
    }
    else {

        echo json_encode ($user_model->getUsers());

    }

}// end of get





/*

else if($_SERVER['REQUEST_METHOD']=="PUT"){
    $_PUT= array();
    parse_str(file_get_contents('php://input'), $_PUT);
    $user_model->user_category = $_PUT['category'];
    $user_model->user_region = $_PUT['region'];
    $user_model->user_title = $_PUT['title'];
    $user_model->user_details = $_PUT['details'];
    $user_model->user_id = $_PUT['id'];


    if ($user_model->updateRow()){
        $feedback['code'] = 200;
        $feedback['message'] = "row ".$_PUT['id']." updated successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to update row ".$_PUT['id'];

    }
    echo json_encode ($feedback);

}
else if($_SERVER['REQUEST_METHOD']=="DELETE"){
    // $_DELETE=array();
    //parse_str(file_get_contents('php://input'), $_DELETE);

    $user_model->user_id = $_GET['id'];
    if ($user_model->deleteRow()){
        $feedback['code'] = 200;
        $feedback['message'] = "the row  is deleted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to delete row ";

    }
    echo json_encode ($feedback);

}
*/




?>

