<?php 

    
    //array to show the response
    $response = array();
    
    //uploads directory, we will upload all the files inside this folder
    $target_dir = "uploads/";

    //checking if we are having an api call, using the get parameters 'apicall'
    if(isset($_GET['apicall'])){
		
		switch($_GET['apicall']){
            
            //if the api call is for uploading the image 
            case 'upload':
                //error message and error flag
                $message = 'Params ';
                $is_error = false; 
                
                //validating the request to check if all the required parameters are available or not 


                if(!isset($_FILES['image']['name'])){
                    $message .= "image ";
                    $is_error = true; 
                }
                
                //in case we have an error in validation, displaying the error message 
                if($is_error){
                    $response['error'] = true; 
                    $response['message'] = $message . " required."; 
                }else{
                    //if validation succeeds 
                    //creating a target file with a unique name, so that for every upload we create a unique file in our server
                    $target_file = $target_dir . uniqid() . '.'.pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
                    
                    //saving the uploaded file to the uploads directory in our target file
                    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
                            $response['error'] = false; 
                            $response['message'] = 'Image Uploaded Successfully';
                            $response['image'] =$target_file;    

                    } else {
                        $response['error'] = true; 
                        $response['message'] = 'Try again later...';
                    }
                }
            break;
			default: 
				$response['error'] = true; 
				$response['message'] = 'Invalid Operation Called';
		}
		
	}else{
		$response['error'] = true; 
		$response['message'] = 'Invalid API Call';
    }
   

    header('Content-Type: application/json');
    echo json_encode($response);