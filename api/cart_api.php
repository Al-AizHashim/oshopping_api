<?php

include('../model/cart.php');

$cart_model = new cart();

if($_SERVER['REQUEST_METHOD']=="GET"){
if(isset($_GET['user_id'])){

    echo json_encode($cart_model->getSingleUserProductInCart($_GET['user_id']));
}
else{
    echo json_encode($cart_model->getRows());
}
}

else if(isset($_POST) && !empty($_POST)){
    $cart_model->user_id=$_POST['fk_user_id'];
    $cart_model->product_id=$_POST['fk_product_id'];
    $cart_model->cart_statuse=$_POST['cart_statuse'];
    $cart_model->product_name = $_POST['product_name'];
    $cart_model->product_price_RY= $_POST['yrial_price'];
    $cart_model->product_price_D= $_POST['dollar_price'];
    $cart_model->vendor_id= $_POST['vendor_id'];
    $cart_model->cat_id=$_POST['cat_id'];
    $cart_model->product_details= $_POST['product_details'];
    $cart_model->product_image= $_POST['product_img'];
    $cart_model->product_quantity= $_POST['product_quantity'];
    $cart_model->product_discount= $_POST['product_discount'];
    $cart_model->color= $_POST['color'];
    if($cart_model->addRow()){
        $feedback['code'] =200;
        $feedback['message']="data inserted successfull";
      } else{
         $feedback['code'] =400;
         $feedback['message']=" faild inserted data";
      }
      echo json_encode($feedback);
    
}

else if($_SERVER['REQUEST_METHOD']=="PUT"){
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