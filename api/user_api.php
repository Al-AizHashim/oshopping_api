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

else if($_SERVER['REQUEST_METHOD']=="PUT"){
    $_PUT= array();
    parse_str(file_get_contents('php://input'), $_PUT);
    if(isset($_PUT['block']) && isset($_PUT['admin_id']) && isset($_PUT['user_id']) && isset($_PUT['checked']))
    {
        if($user_model->checkUserType($_PUT['admin_id'])){
            $user_model->block = $_PUT['block'];
            $user_model->user_id = $_PUT['user_id'];
            $user_model->checked = $_PUT['checked'];
            if ($user_model->BlockUser()){
                $feedback['code'] = 200;
                $feedback['message'] = "user ".$_PUT['user_id']." blocked successfully";

            }
            else{
                $feedback['code'] = 400;
                $feedback['message'] = "failed to block user ".$_PUT['User_id'];
            }
            if ($user_model->checkUserReports()){
                $feedback['code'] = 200;
                $feedback['message'] = "user ".$_PUT['user_id']." blocked successfullyu";

            }
        }
    
        else{
            $feedback['code'] = 400;
            $feedback['message'] = "user is not admin".$_PUT['User_id'];
        }
    }
    else
    {
        $user_model->user_id = $_PUT['user_id'];
        $user_model->first_name = $_PUT['first_name'];
        $user_model->last_name= $_PUT['last_name'];
        $user_model->phone_number= $_PUT['phone_number'];
        $user_model->address= $_PUT['address'];
        $user_model->image=$_PUT['image'];
        $user_model->details= $_PUT['details'];

        if ($user_model->updateRow()){
            $feedback['code'] = 200;
            $feedback['message'] = "row ".$_PUT['user_id']." updated successfully";

        }else{
            $feedback['code'] = 400;
            $feedback['message'] = "failed to update row ".$_PUT['User_id'];
        }
    }
    echo json_encode ($feedback);
    } 






else if(isset($_GET)){
    if (isset($_GET['user_id'])){
        echo  json_encode (  $user_model->  getUser($_GET['user_id'])  ) ;
    }
    else if (isset($_GET['email'])){
        echo  json_encode (  $user_model->  getUserIdByEmail($_GET['email'])  ) ;       
    }
    else if (isset($_GET['block'])){
        echo  json_encode (  $user_model->  getUsersByBlock($_GET['block'])  ) ;       
    }
    else {      
        echo json_encode ($user_model->getUsers());
    }
}
?>
