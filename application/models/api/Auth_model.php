<?php

class Auth_model extends CI_model{
   
    function check_login($email,$password){
        $this->db->select('*');
        $this->db->from('user');
        $this->db->where('email',$email);
        $this->db->where('password',$password);
        $this->db->where('status',1);

        $query=$this->db->get();

        if($query->num_rows()>0){
            return $query->result_array();
        }else{
            return "User not found !";
        }

    }


    function signup($data){
        $this->db->insert('user',$data);
        return $this->db->insert_id();
    }

}

?>