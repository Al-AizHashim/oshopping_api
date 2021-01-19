<?php

include('../model/cart.php');

$cart_model = new cart();

if($_SERVER['REQUEST_METHOD']=="GET"){
if(isset($_GET['cart_id'])){

    echo json_encode($cart_model->getSingleRows($_GET['cart_id']));
}
else{
    echo json_encode($cart_model->getRows());
}
}

elseif(isset($_POST) && !empty($_POST)){
    $cart_model->user_id=$_POST['user_id'];
    $cart_model->product_id=$_POST['product_id'];
    $cart_model->cart_statuse=$_POST['cart_statuse'];
    if($cart_model->addRow()){
        $feedback['code'] =200;
        $feedback['message']="data inserted successfull";
      } else{
         $feedback['code'] =400;
         $feedback['message']=" faild inserted data";
      }
      echo json_encode($feedback);
    
}

elseif($_SERVER['REQUEST_METHOD']=="PUT"){
    $cart_model->cart_id=$_GET['cart_id'];
    $_PUT= array();
    parse_str(file_get_contents('php://input'), $_PUT);
    $cart_model->cart_statuse=$_PUT['cart_statuse'];
    if($cart_model->updateRow()){
        $feedback['code'] =200;
        $feedback['message']="data updated successfull";
      } else{
         $feedback['code'] =400;
         $feedback['message']=" faild updated data";
      }
      echo json_encode($feedback);
    }
else if($_SERVER['REQUEST_METHOD']=="DELETE"){
    $cart_model->user_id=$_GET['user_id'];
    if($cart_model->delete()){
        $feedback['code'] =200;
        $feedback['message']="data deleted successfull";
      } else{
         $feedback['code'] =400;
         $feedback['message']=" faild deleted data";
      }
      echo json_encode($feedback);
}
?>