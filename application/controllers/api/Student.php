<?php
// defined('BASEPATH') OR exit('No direct script access allowed');
require(APPPATH.'/libraries/REST_Controller.php');
class Student extends  REST_Controller{
    // INSERT : POST REQUEST TYPE
    // UPDATE : PUT REQUEST TYPE
    // DELETE : DELETE REQUEST TYPE
    // LIST : GET REQUEST TYPE

public function __construct(){
parent::__construct();
$this->load->database();
$this->load->model('api/Student_model');
$this->load->library("form_validation");
$this->load->helper('security');
    }

    public function index_post(){ // project_name/index.php/student
    
        // print_r($this->input->post());die;
// connecting for data here
        // $name=$this->input->post('name');
         // $email=$this->input->post('email');
         // $mobile=$this->input->post('mobile');
          // $course=$this->input->post('course');


        $name=$this->security->xss_clean($this->input->post('name')); 
        $email=$this->security->xss_clean($this->input->post('email'));  
        $mobile=$this->security->xss_clean($this->input->post('mobile'));  
        $course=$this->security->xss_clean($this->input->post('course'));

        // form validation for input data
        $this->form_validation->set_rules("name","Name","required");
        $this->form_validation->set_rules("email","Email","required|valid_email");
        $this->form_validation->set_rules("mobile","Mobile","required");
        $this->form_validation->set_rules("course","Course","required");

        // checking here error in form submitted data 
        if($this->form_validation->run()===FALSE){
        // we have some errors 
        $this->response(array(
            "status"=>0,
            "message"=>"Enter correct data"
        ),REST_Controller::HTTP_NOT_FOUND);
        }else{
            if(!empty($name) && !empty($email) && !empty($mobile) && !empty($course)){
                // all values are available
                $student=array(
                    "name"=>$name,
                    "email"=>$email,
                    "mobile"=>$mobile,
                    "course"=>$course
                );
    
                if($this->Student_model->insert_student($student)){
                    $this->response(array(
                        "status"=>1,
                        "message"=>"Student has been created"
                    ),REST_Controller::HTTP_OK);
                }else{
                    $this->response(array(
                        "status"=>0,
                        "message"=>"Failed to create student"
                    ),REST_Controller::HTTP_INTERNAL_SERVER_ERROR);
                }
    
            }else{
                // we have some empty filled
                $this->response(array(
                    "status"=>0,
                    "message"=>"All fields are needed"
                ),REST_Controller::HTTP_NOT_FOUND);
            }
        }

        // $data=json_decode(file_get_contents("php://input"));

        // $name=isset($data->name)?$data->name:"";
        // $email=isset($data->email)?$data->email:"";
        // $mobile=isset($data->mobile)?$data->mobile:"";
        // $course=isset($data->course)?$data->course:"";

 
    }


    public function index_put(){ // project_name/index.php/student
        $data=json_decode(file_get_contents("php://input"));
        // $student_id=$this->security->xss_clean($data->student_id);
        if(isset($data->id) && isset($data->email) && isset($data->name) && isset($data->mobile) && isset($data->course)){
                $student_id=$data->id;
                $student_info=array(
                    "name"=>$data->name,
                    "email"=>$data->email,
                    "mobile"=>$data->mobile,
                    "course"=>$data->course,
                    "status"=>$data->status
                );

                if($this->Student_model->update_student_information($student_id,$student_info)){
                    // successfully updated
                    $this->response(array(
                        "status"=>1,
                        "message"=>"sucessfully student updated",
                        ), REST_Controller::HTTP_OK);
                }else{
                    $this->response(array(
                    "status"=>0,
                    "message"=>"Failed to updat the student",
                    ), REST_Controller::HTTP_INTERNAL_SERVER_ERROR); 
                }

        }else{
            $this->response(array(
                "status"=>0,
                "message"=>"All fields needed",
                ), REST_Controller::HTTP_NOT_FOUND);
        }
    }


    public function index_delete(){ // project_name/index.php/student
      $data=json_decode(file_get_contents("php://input"));
      $student_id=$this->security->xss_clean($data->student_id);
    //   print_r($student_id);

    if( $this->Student_model->delete_student($student_id)){
        // return true if successfully deleted
        $this->response(array(
            "status"=>1,
            "message"=>"Student has been deleted successfully",
            ), REST_Controller::HTTP_OK);
            }else{
            // failed to delete sue to some error
            $this->response(array(
            "status"=>0,
            "message"=>"failed to delete Student",
            ), REST_Controller::HTTP_NOT_FOUND);
    }
    }


    public function index_get($myid=0){ // project_name/index.php/student
 // echo "get method here";
        // $this->db-select("*");
        // $this->db->from("res_api");
        // $query=$this->db->get();
        // print_r($query->result());
if($myid){
    // public function get_user_get($myid=1){
        if(!empty($myid)){
        $result=$this->Student_model->user_detail($myid);
        if($result){
            $this->response(array(
                "status"=>1,
                "message"=>"Students details are",
                "data"=>$result
                ), REST_Controller::HTTP_OK);
    
           }else{
            $this->response(array(
                "status"=>0,
                "message"=>"Students not found",
                "data"=>$result
                ), REST_Controller::HTTP_NOT_FOUND);
           }
        }else{
            $this->response(array(
                "status"=>0,
                "message"=>"Please provide user Id",
                "data"=>$result
                ), REST_Controller::HTTP_NOT_FOUND);
        }
    // }
}else{
    
    $students= $this->Student_model->get_students();
      
    // print_r($query->result());
if(count($students)>0)
   {
    $this->response(array(
        "status"=>1,
        "message"=>"Students Found",
        "data"=>$students
        ), REST_Controller::HTTP_OK);
   }else{
    $this->response(array(
        "status"=>0,
        "message"=>"Students not Found",
        "data"=>$students
        ), REST_Controller::HTTP_NOT_FOUND);

   }
}

       
    }



    // public function get_user_get($myid=1){
    //     if(!empty($myid)){
    //     $result=$this->Student_model->user_detail($myid);
    //     if($result){
    //         $this->response(array(
    //             "status"=>1,
    //             "message"=>"Students details are",
    //             "data"=>$result
    //             ), REST_Controller::HTTP_OK);
    
    //        }else{
    //         $this->response(array(
    //             "status"=>0,
    //             "message"=>"Students not found",
    //             "data"=>$result
    //             ), REST_Controller::HTTP_NOT_FOUND);
    //        }
    //     }else{
    //         $this->response(array(
    //             "status"=>0,
    //             "message"=>"Please provide user Id",
    //             "data"=>$result
    //             ), REST_Controller::HTTP_NOT_FOUND);
    //     }
    // }


    public function signup_post(){
        if($this->input->post()){
            $name=$this->input->post('name');
            $email=$this->input->post('email');
            $password=$this->input->post('password');
            $role_id=$this->input->post('role_id');
            

            $data2=array(
                "email"=>$email,
                "password"=>$password,
            );

            $jwt=new JWT();
            $JwtSecretKey="myloginsecret";
            $token = $jwt->encode($data2,$JwtSecretKey,'HS256');

            $data=array(
                "name"=>$name,
                "email"=>$email,
                "password"=>$password,
                "role_id"=>$role_id,
                "token"=>$token
            );

           $check_mail=$this->Student_model->check_exist($email);
        //    echo $check_mail;
          if($check_mail){
            $this->response(array(
                "status"=>false,
                "message"=>"user already exist with this email",
                ), REST_Controller::HTTP_NOT_FOUND);
          }else{
           
                $insert_val = $this->Student_model->insert_data($data);

                $this->response(array(
                    "status"=>true,
                    "message"=>"Successfully registered",
                    "data inserted"=>$insert_val,
                    "Token"=>$token
                    ), REST_Controller::HTTP_OK);
          }

        }
    }

	public function login_post()
	{
    //     $jwt=new JWT();
    //     $JwtSecretKey="myloginsecret";
      $email=$this->input->post('email');
      $password=$this->input->post('password');

      $data=array(
        "email"=>$email,
        "password"=>$password,
    );

    $jwt=new JWT();
    $JwtSecretKey="myloginsecret";
    $token = $jwt->encode($data,$JwtSecretKey,'HS256');
      


    // $mytoken = $this -> db
    //        -> select('token')
    //        -> where('token', $token)
    //        -> get('user');

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "rest";
    
    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
      echo ("Connection failed: " . $conn->connect_error);
    }else{
        // echo "ssuccessfully db connected";
    }

    $sql = "SELECT * FROM `user`";
    $result = mysqli_query($conn, $sql);
    $sno = 0;
    while($row = mysqli_fetch_assoc($result)){
        if($token==$row['token']){
            $this->response(array(
            "status"=>true,
            "message"=>"Successfully logged In",
            "Token"=>$token
            ), REST_Controller::HTTP_OK);
         break;
        }
        if($token!=$row['token']){
            $this->response(array(
            "status"=>false,
            "message"=>"Failed to login please enter correct emails id and password"        
            ), REST_Controller::HTTP_NOT_FOUND);
        }
        
        // echo $row['token'];
        echo "                ";
        $sno = $sno + 1;
     

  } 


    // if($result){
    //     $this->response(array(
    //         "status"=>true,
    //         "message"=>"Successfully logged In",
    //         "Token"=>$token
    //         ), REST_Controller::HTTP_OK);
    // }else{
    //     $this->response(array(
    //         "status"=>false,
    //         "message"=>"Email or password or incorrect",
    //         ));
    // }

    //     $headerToken = $this->input->get_request_header('Authorization');
      
    // if($token==$headerToken){
    //     $this->response(array(
    //     "status"=>true,
    //     "message"=>"Successfully LoggedIn",
    //     "Token"=>$headerToken
    //     ), REST_Controller::HTTP_OK);
    // }else{
    //     $this->response(array(
    //         "status"=>false,
    //         "message"=>"Failed to login"
    //         ), REST_Controller::HTTP_NOT_FOUND);
    // }

    // var_dump($token);
    // var_dump($headerToken);

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

}