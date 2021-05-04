<?php

class Lote extends CI_Model {
    /*
      Determines if a given person_id is a customer
     */

    function exists($lote_id)
    {
        $this->db->from('lotes');
       
        $this->db->where('lotes.lote_id', $lote_id);
       
        $query = $this->db->get();

        return ($query->num_rows() > 0);
    }

    /*
      Returns all the lotes
     */

    function get_all($limit = 10000, $offset = 0, $search = "", $order = array(), $sel_user = false)
    {
        $sorter = array("", "lote_id", "desarrollo", "sm", "lote", "superficie", "estado");

        $this->db->from('lotes');
      
        $this->db->where('deleted', 0);

        $employee_id = $this->session->userdata('person_id');

        $employee_id = ($sel_user) ? $sel_user : $employee_id;

        if ($employee_id !== "1")
        {
            $this->db->where("added_by", $employee_id);
        }

        if ($search !== "")
        {
            $this->db->where('desarrollo LIKE ', '%' . $search . '%');
            $this->db->or_where('sm LIKE', '%' . $search . '%');
            $this->db->or_where('lote LIKE', '%' . $search . '%');
            $this->db->or_where('estado LIKE', '%' . $search . '%');
           
        }

        if (count($order) > 0 && $order['index'] < count($sorter))
        {
            $this->db->order_by($sorter[$order['index']], $order['direction']);
        }
        else
        {
            $this->db->order_by("desarrollo", "asc");
        }

        $this->db->limit($limit);
        $this->db->offset($offset);
        return $this->db->get();
    }

    function count_all()
    {
        $this->db->from('lotes');
        $this->db->where('deleted', 0);
        return $this->db->count_all_results();
    }

    /*
      Gets information about a particular customer
     */

    function get_info($lote_id)
    {
        $this->db->from('lotes');
        $this->db->select('lotes.*');
        $this->db->where('lotes.lote_id', $lote_id);
        $query = $this->db->get();

        if ($query->num_rows() == 1)
        {
            return $query->row();
        }
        else
        {
            //Get empty base parent object, as $customer_id is NOT an customer
        			      $lote_obj = new stdClass;

            //Get all the fields from customer table
         				   $fields = $this->db->list_fields('lotes');

            //append those fields to base parent object, we we have a complete empty object
            foreach ($fields as $field)
            {
                $lote_obj->$field = '';
            }

            return $lote_obj;
        }
    }

    
    

    /*
      Gets information about multiple lotes
     */

    function get_multiple_info($lotes_ids)
    {
        $this->db->from('lotes');
        
        $this->db->where_in('lotes.lote_id', $lotes_ids);
        $this->db->order_by("desarrollo", "asc");
        return $this->db->get();
    }

    function get_attachments($lote_id)
    {
        $this->db->from('attachments');
        $this->db->where('lote_id', $customer_id);
        $query = $this->db->get();

        return $query->result();
    }

    /*
      Inserts or updates a customer
     */

    // function save(&$person_data, &$customer_data = [], $customer_id = false, &$financial_data = array())

      function save(&$lote_data = [], $lote_id = false)
    {
        $success = false;
        //Run these queries as a transaction, we want to make sure we do all or nothing
        $this->db->trans_start();

        if (!$lote_id || ! $this->exists($lote_id))
        {
        	$employee_id = $this->Employee->get_logged_in_employee_info()->person_id;
        	$lote_data['added_by'] = $employee_id;

            $success = $this->db->insert('lotes', $lote_data);
          
        }

        else
        {
            $this->db->where('lote_id', $lote_id);
           $success =  $this->db->update('lotes', $lote_data);
        }
        
        


        

        $this->db->trans_complete();
        return $success;
    }

    // function move_attachments($lote_data)
    // {
    //     $linker = $this->session->userdata('linker');

    //     $this->db->from('attachments');
    //     $this->db->where('session_id', $linker);
    //     $query = $this->db->get();

    //     $this->db->where('session_id', $linker);
    //     $this->db->update('attachments', array("lote_id" => $customer_data['person_id']));

    //     $attachments = $query->result();
    //     foreach ($attachments as $attachment)
    //     {
    //         $tmp_dir = FCPATH . "uploads/customer-/";
    //         $user_dir = FCPATH . "uploads/customer-" . $customer_data['person_id'] . "/";

    //         if (!file_exists($user_dir))
    //         {
    //             // temporary set to full access
    //             @mkdir($user_dir);
    //         }

    //         $target_dist = $user_dir . $attachment->filename;

    //         if (file_exists($tmp_dir . $attachment->filename))
    //         {
    //             copy($tmp_dir . $attachment->filename, $target_dist);
    //             unlink($tmp_dir . $attachment->filename);
    //         }
    //     }
    // }

    /*
      Deletes one customer
     */

    function delete($lote_id)
    {
        $this->db->where('lote_id', $lote_id);
        return $this->db->update('lotes', array('deleted' => 1));
    }

    /*
      Deletes a list of lotes
     */

    function delete_list($lote_ids)
    {
        $this->db->where_in('lote_id', $lote_ids);
        return $this->db->update('lotes', array('deleted' => 1));
    }

    /*
      Get search suggestions to find lotes
     */

    function get_search_suggestions($search, $limit = 25)
    {
        $suggestions = array();

        $this->db->from('lotes');
        $this->db->where("(desarrollo LIKE '%" . $this->db->escape_like_str($search) . "%' or 
		estado LIKE '%" . $this->db->escape_like_str($search) . "%' or 
		CONCAT(`sm`,' ',`lote`) LIKE '%" . $this->db->escape_like_str($search) . "%') and deleted=0");
        $this->db->order_by("desarrollo", "asc");
        $by_name = $this->db->get();
        foreach ($by_name->result() as $row)
        {
            $suggestions[] = $row->desarrollo . ' ' . $row->lote;
        }

        $this->db->from('lotes');
        $this->db->where('deleted', 0);
        $this->db->like("estado", $search);
        $this->db->order_by("desarrollo", "asc");
        $by_desarrollo = $this->db->get();
        foreach ($by_desarrollo->result() as $row)
        {
            $suggestions[] = $row->estado;
        }

        $this->db->from('lotes');
        $this->db->where('deleted', 0);
        $this->db->like("sm", $search);
        $this->db->order_by("sm", "asc");
        $by_sm = $this->db->get();
        foreach ($by_sm->result() as $row)
        {
            $suggestions[] = $row->sm;
        }

        $this->db->from('lotes');
        $this->db->where('deleted', 0);
        $this->db->like("lote", $search);
        $this->db->order_by("lote", "asc");
        $by_lote = $this->db->get();
        foreach ($by_lote->result() as $row)
        {
            $suggestions[] = $row->lote;
        }

        //only return $limit suggestions
        if (count($suggestions > $limit))
        {
            $suggestions = array_slice($suggestions, 0, $limit);
        }

        return $suggestions;
    }

    /*
      Get search suggestions to find lotes
     */

    function get_lote_search_suggestions($search, $limit = 25)
    {
        $suggestions = array();

        $user_id = $this->Employee->get_logged_in_employee_info()->person_id;
        $add_where = '';
        if ($user_id > 1)
        {
            $add_where = "";//" and added_by = " . $user_id . " ";
        }

        $this->db->from('lotes');
        //$this->db->join('people', 'lotes.person_id=people.person_id');
        $this->db->where("(desarrollo LIKE '%" . $this->db->escape_like_str($search) . "%'  or 
        sm LIKE '%" . $this->db->escape_like_str($search) . "%' or
		CONCAT(`desarrollo`,' ',`sm`, ' ', `lote`) LIKE '%" . $this->db->escape_like_str($search) . "%') and deleted=0
                    " . $add_where . "
                    ");
        $this->db->order_by("lote", "desc");
        $by_name = $this->db->get();
        foreach ($by_name->result() as $row)
        {
            $suggestions[] = $row->lote_id . '|' .$row->desarrollo . ' ' .$row->sm .  ' '.$row->lote;
        }
            
        // $this->db->from('lotes');
        // $this->db->where('deleted', 0);
        // $this->db->like("lote", $search);
        // $this->db->order_by("desarrollo", "asc");
        // $by_account_number = $this->db->get();
        // foreach ($by_account_number->result() as $row)
        // {
        //     $suggestions[] = $row->lote_id . '|' . $row->lote . '|' . $row->sm;
        // }

        //only return $limit suggestions
        // if (count($suggestions > $limit))
        // {
        //     $suggestions = array_slice($suggestions, 0, $limit);
        // }
        return $suggestions;
    }

    /*
      Preform a search on lotes
     */

    function search($search)
    {
        $this->db->from('lotes');
        //$this->db->join('people', 'lotes.person_id=people.person_id');
        $this->db->where("(desarrollo LIKE '%" . $this->db->escape_like_str($search) . "%' or 
		sm LIKE '%" . $this->db->escape_like_str($search) . "%' or 
		lote LIKE '%" . $this->db->escape_like_str($search) . "%' or 
		CONCAT(`lote`,' ',`sm`) LIKE '%" . $this->db->escape_like_str($search) . "%') and deleted=0");
        $this->db->order_by("desarrollo", "asc");

        return $this->db->get();
    }
    
    
}

?>
