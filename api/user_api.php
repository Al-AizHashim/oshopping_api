<?php
include('../model/user.php');
$user_model=new User();



 if(isset($_POST)&&!empty($_POST)){
    $user_model->first_name = $_POST['first_name'];
    $user_model->last_name = $_POST['last_name'];
    $user_model->email = $_POST['email'];
    $user_model->phone_number = $_POST['phone_number'];
    $user_model->details = $_POST['details'];
    $user_model->address = $_POST['address'];
    $user_model->image = $_POST['image'];

    if ($user_model->addUser()){
        $feedback['code'] = 200;
        $feedback['message'] = "data inserted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to insert data";

    }
    echo json_encode ($feedback);
}



else if(isset($_GET)){
    if (isset($_GET['user_id'])){
        echo  json_encode (  $user_model->  getUser($_GET['user_id'])  ) ;
    }
    else {
      
        echo json_encode ($user_model->getUsers());

    }

}
else if($_SERVER['REQUEST_METHOD']=="PUT"){
        $_PUT= array();
        parse_str(file_get_contents('php://input'), $_PUT);
         $product_model->user_id = $_PUT['user_id'];
         $product_model->first_name = $_PUT['first_name'];
         $product_model->last_name= $_PUT['last_name'];
         $product_model->phone_number= $_PUT['phone_number'];
         $product_model->address= $_PUT['address'];
         $product_model->image=$_PUT['image'];
         $product_model->details= $_PUT['details'];
    
        if ($product_model->updateRow()){
            $feedback['code'] = 200;
            $feedback['message'] = "row ".$_PUT['user_id']." updated successfully";
    
        }else{
            $feedback['code'] = 400;
            $feedback['message'] = "failed to update row ".$_PUT['User_id'];
        }
        echo json_encode ($feedback);
    
    } 



?>



}



else if(isset($_GET)){
    if (isset($_GET['user_id'])){
        echo  json_encode (  $user_model->  getSingleUser($_GET['user_id'])  ) ;
    }
    else {

        echo json_encode ($user_model->getUsers());

    }

}// end of get







?>

