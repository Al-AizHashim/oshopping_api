<?php
include('../model/rating.php');
$rating_model=new Rating();



 if(isset($_POST)&&!empty($_POST)){
    $rating_model->rating = $_POST['rating'];
    $rating_model->product_id = $_POST['product_id'];
    $rating_model->user_id = $_POST['user_id'];
    if ($rating_model->checkExistUser()){
    if ($rating_model->updateRow()){
        $feedback['code'] = 200;
        $feedback['message'] = "data updated successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to update data";

    }
}
else{
    if ($rating_model->addRating()){
        $feedback['code'] = 200;
        $feedback['message'] = "data inserted successfully";

    }else{
        $feedback['code'] = 400;
        $feedback['message'] = "failed to insert data";

    }

}
    echo json_encode ($feedback);
}

// else if($_SERVER['REQUEST_METHOD']=="PUT"){
//     $_PUT= array();
//     parse_str(file_get_contents('php://input'), $_PUT);
//     $rating_model->Rating = $_PUT['Rating'];
//     $rating_model->Rating_id = $_PUT['Rating_id'];


//     if ($rating_model->updateRow()){
//         $feedback['code'] = 200;
//         $feedback['message'] = "row ".$_PUT['Rating_id']." updated successfully";

//     }else{
//         $feedback['code'] = 400;
//         $feedback['message'] = "failed to update row ".$_PUT['id'];

//     }
//     echo json_encode ($feedback);

// }

else if(isset($_GET)){
  
    if (isset($_GET['rating_id'])){
     
        echo  json_encode (  $rating_model->  getSingleRating($_GET['rating_id'])  ) ;
    }
    else {

        echo json_encode ($rating_model->getRatings());

    }
}

    ?>