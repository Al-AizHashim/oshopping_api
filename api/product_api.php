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
     $product_model->color= $_POST['color'];
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
    if(isset($_PUT['hide']) && isset($_PUT['product_id']) && isset($_PUT['user_id']) && isset($_PUT['checked']) )
    {
    if($product_model->checkUserType($_PUT['user_id'])){
        $product_model->hide = $_PUT['hide'];
        $product_model->checked = $_PUT['checked'];
        $product_model->product_id = $_PUT['product_id'];
        if ($product_model->hideProduct()){
            $feedback['code'] = 200;
            $feedback['message'] = "product ".$_PUT['product_id']." hided successfully";
        }else{
            $feedback['code'] = 400;
            $feedback['message'] = "failed to hide user ".$_PUT['product_id'];
        }
        if ($product_model->checkProductReports()){
            $feedback['code'] = 200;
            $feedback['message'] = "user ".$_PUT['user_id']." checked successfullyu";
        }
    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed user is not admin";
    }
    echo json_encode ($feedback);
    }
    else{
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
     $product_model->color= $_PUT['color'];

    if ($product_model->updateRow()){
        $feedback['code'] = 200;
        $feedback['message'] = "product ".$_PUT['product_id']." updated successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to update product ".$_PUT['product_name'];
    }
    echo json_encode ($feedback);
    }
}

else if($_SERVER['REQUEST_METHOD']=="DELETE"){

    $product_model->product_id = $_GET['product_id'];
    if ($product_model->deleteProduct()){
        $feedback['code'] = 200;
        $feedback['message'] = "the product  is deleted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to delete product ";

    }
    echo json_encode ($feedback);

}

else if($_SERVER['REQUEST_METHOD']=="GET"){
    if (isset($_GET['product_id'])){
        echo  json_encode (  $product_model->  getProductById($_GET['product_id'])  ) ;
    }
    else if (isset($_GET['cat_id'])){
        echo  json_encode (  $product_model->  getProductByCategory($_GET['cat_id'])  ) ;
    }
    else if (isset($_GET['vendor_id'])){
        echo  json_encode (  $product_model->  getProductByVendor($_GET['vendor_id'])  ) ;
    }
    else if (isset($_GET['query'])){
        echo  json_encode (  $product_model->  searchProduct($_GET['query'])  ) ;
    }
    else if (isset($_GET['color'])){
        echo  json_encode (  $product_model->  getProductByColor($_GET['color'])  ) ;
    }
    else if (isset($_GET['user_id'])){
        if($product_model->checkUserType($_GET['user_id'])){
            echo  json_encode (  $product_model->  getProductsAdmin() ) ;
        }
        else
        echo json_encode ($product_model->getProducts());
        }

        
    else {

        echo json_encode ($product_model->getProducts());
    }
}

    ?>
