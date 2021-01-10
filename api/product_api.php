<?php
include('../model/product.php');
$product_model=new Product();



 if(isset($_POST)&&!empty($_POST)){
     $product_model->product_name = $_POST['product_name'];
     $product_model->product_price_RY= $_POST['yrial_price'];
     $product_model->product_price_D= $_POST['dollar_price'];
     $product_model->vendor_id= $_POST['vendor_id'];
     $product_model->cart_id=$_POST['cat_id'];
     $product_model->product_details= $_POST['product_details'];
     $product_model->product_image= $_POST['product_img'];
     $product_model->product_quantity= $_POST['product_quantity'];
     $product_model->product_discount= $_POST['product_discount'];
    if ($product_model->addProduct()){
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
     $product_model->product_id = $_PUT['product_id'];
     $product_model->product_name = $_PUT['product_name'];
     $product_model->product_price_RY= $_PUT['yrial_price'];
     $product_model->product_price_D= $_PUT['dollar_price'];
     $product_model->vendor_id= $_PUT['vendor_id'];
     $product_model->cart_id=$_PUT['cat_id'];
     $product_model->product_details= $_PUT['product_details'];
     $product_model->product_image= $_PUT['product_img'];
     $product_model->product_quantity= $_PUT['product_quantity'];
     $product_model->product_discount= $_PUT['product_discount'];

    if ($product_model->updateRow()){
        $feedback['code'] = 200;
        $feedback['message'] = "row ".$_PUT['product_id']." updated successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to update row ".$_PUT['id'];
    }
    echo json_encode ($feedback);

}

else if(isset($_GET)){
    if (isset($_GET['product_id'])){
        echo  json_encode (  $product_model->  getSingleProduct($_GET['product_id'])  ) ;
    }
    else {

        echo json_encode ($product_model->getProducts());
    }
}

    ?>