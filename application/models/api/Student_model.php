<?php

class Student_model extends CI_model{
    public function __construct(){
            parent::__construct();
            $this->load->database();
             }
             public function get_students(){
                $query = $this->db->get('user');
                return $query->result();
             }

             public function insert_student($data){
               return $this->db->insert('res_api',$data);
             }

             public function check_exist($email){
              //  echo $email;
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
                
                  if($email==$row['email']){
                   return 1;
                  }
                  $sno = $sno + 1;
            } 

             }
             public function insert_data($data){
               return $this->db->insert('user',$data);
             }

             public function delete_student($student_id){
               // delete method
               $this->db->where("id",$student_id);
               return $this->db->delete('res_api');
             }

             public function update_student_information($student_id,$information){
               // delete method
               $this->db->where("id",$student_id);
               return $this->db->update('res_api',$information);
             }
             public function user_detail($user_id){
              
            // return   $this->db->where("id",$user_id);
              //  return $this->db->update('res_api',$information);
              return $this->db->get_where('user',array('user_id'=>$user_id))->row_array();
             }
}

?> 