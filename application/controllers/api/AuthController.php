<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class AuthController extends CI_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('api/Auth_model'); 
        $this->load->model('api/Student_model');
           
        $this->load->helper('verifyAuthToken');
        
            }

	public function login()
	{
    //     $jwt=new JWT();
    //     $JwtSecretKey="myloginsecret";
      $email=$this->input->post('email');
      $password=$this->input->post('password');
       

        $headerToken = $this->input->get_request_header('Authorization');
        $jwt = new JWT();
        $jwtSecret = 'myloginsecret';
        $verification = $jwt->decode($headerToken,$jwtSecret,'HS256');
        $verification_json = $jwt->jsonEncode($verification);
    //  $result= $this->Auth_model->check_login($email,$password);

    //  echo json_encode($token);
    //  $result= json_encode($result);

    //  $data=array(
    //     "user_id"=> $result->user_id,
    //     "name"=>$result->name,
    //     "email"=> $result->email,
    //     "password"=>$result->password,
    //     "status"=>$result->status,
    //     "role_id"=>$result->role_id
    // );


    //  $this->response(array(
    //     "status"=>1,
    //     "message"=>"Students Found",
    //     "data"=>$data
    //     ), REST_Controller::HTTP_OK);
	}


    public function signup(){
        if($this->input->post()){
            $name=$this->input->post('name');
            $email=$this->input->post('email');
            $password=$this->input->post('password');
            $role_id=$this->input->post('role_id');
            
            $data=array(
                "name"=>$name,
                "email"=>$email,
                "password"=>$password,
                "role_id"=>$role_id
            );


            $jwt=new JWT();
            $JwtSecretKey="myloginsecret";
            $token = $jwt->encode($data,$JwtSecretKey,'HS256');
            echo $token;

        }
    }


    // public function token(){
    //     $jwt=new JWT();
    //     $JwtSecretKey="Mysecretwordshere";
    //     $data=array(
    //         'userId'=>145,
    //         'email'=>'suraj@gmail.com',
    //         'userType'=>'admin'
    //     );

    //     $token = $jwt->encode($data,$JwtSecretKey,'HS256');
    //     echo $token;
    // }

    // public function decode_token(){
    //     $token=$this->uri->segment(4);
    //     $jwt =new JWT();
    //     $JwtSecretKey="Mysecretwordshere";
    //     $decoded_token=$jwt->decode($token,$JwtSecretKey,'HS256');

        // this will return std_object

        // echo '<pre>';
        // print_r($decoded_token);

        // It will return json formate

    //     $token1=$jwt->jsonEncode($decoded_token);
    //     echo $token1;
    // }


    // public function getUsers(){
		
    //     $headerToken = $this->input->get_request_header('Authorization');
    //     $splitToken = explode(" ", $headerToken);
    //     $token =  $splitToken[1];
    
    //         try {
    //             $token = verifyAuthToken($token);
    //             if($token){
    //                 echo "done hua bhaji";
    //                 $result=$this->Student_model->get_students();
    //                 echo json_encode($result);
                    // $data=array(
                    //     "status"=>1,
                    //     "message"=>"Students Found",
                    //     "data"=>$result
                    //     );

                      
        //         }
                    
        //     }
        //     catch(Exception $e) {
        //     // echo 'Message: ' .$e->getMessage();
        //         $error = array(
        //             "status"=>401,
        //             "message"=>"Invalid Token provided",
        //             "sucess"=>false
        //             );
    
        //         echo json_encode($error);
        //     }
            
            
        // }


}

?>