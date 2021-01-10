<?php
include('../model/category.php');
$category_model=new Category();



 if(isset($_POST)&&!empty($_POST)){
    $category_model->cat_name = $_POST['cat_name'];

    if ($category_model->addCategory()){
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
    $category_model->cat_name = $_PUT['category'];
    $category_model->cat_id = $_PUT['cat_id'];

    if ($category_model->updateRow()){
        $feedback['code'] = 200;
        $feedback['message'] = "row ".$_PUT['cat_id']." updated successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to update row ".$_PUT['id'];

    }
    echo json_encode ($feedback);

}
else if($_SERVER['REQUEST_METHOD']=="DELETE"){

    $category_model->cat_id = $_GET['cat_id'];
    if ($category_model->deleteCategory()){
        $feedback['code'] = 200;
        $feedback['message'] = "the row  is deleted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to delete row ";

    }
    echo json_encode ($feedback);

}

else if(isset($_GET)){
    if (isset($_GET['cat_id'])){
        echo  json_encode (  $category_model->  getSingleCategory($_GET['cat_id'])  ) ;
    }
    else {

        echo json_encode ($category_model->getCategories());

    }
}

    ?>