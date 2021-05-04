<?php

require_once ("Person_controller.php");
require_once ("Secure_area.php");


class Lotes extends Person_controller {

    function __construct()
    {
        parent::__construct('lotes');
         //$this->load->model("Lote"); 
         // Debug
        //$this->output->enable_profiler(TRUE);
    }

    function index()
    {
        $config['base_url'] = site_url('/lotes/index');
        $config['total_rows'] = $this->Lote->count_all();
        $config['per_page'] = '20';
        $config['uri_segment'] = 3;
        $this->pagination->initialize($config);
        
        $res = $this->Employee->getLowerLevels();
        $data['staffs'] = $res;

        $data['controller_name'] = strtolower(get_class());
        $data['form_width'] = $this->get_form_width();
        $data['manage_table'] = get_people_manage_table2($this->Lote->get_all($config['per_page'], $this->uri->segment($config['uri_segment'])), $this);
        $this->load->view('people/manage2', $data);
    }

    /*
      Returns customer table data rows. This will be called with AJAX.
     */

    function search()
    {
        $search = $this->input->post('search');
        $data_rows = get_people_manage_table_data_rows($this->Lote->search($search), $this);
        echo $data_rows;
    }

    /*
      Gives search suggestions based on what is being searched for
     */

    function suggest()
    {
        //$suggestions = $this->Customer->get_search_suggestions($this->input->post('q'), $this->input->post('limit'));
        $suggestions = $this->Lote->get_search_suggestions($this->input->post('query'), 30);
        //echo implode("\n", $suggestions);

        $data = $tmp = array();

        foreach ($suggestions as $suggestion):
            $t = explode("|", $suggestion);
            $tmp = array("value" => $t[1], "data" => $t[0]);
            $data[] = $tmp;
        endforeach;

        echo json_encode(array("suggestions" => $data));
        exit;
    }

    /*
      Loads the customer edit form
     */

    function view($lote_id = -1)
    {
        $data['lote_info'] = $this->Lote->get_info($lote_id);
            
       

        $data['lote_id'] = $lote_id;
        

        $this->load->view("lotes/form", $data);
    }
    
    

    /*
      Inserts/updates a customer
     */

    function save($lote_id = -1)
    {
       
        $lote_data = array(
            'desarrollo' => $this->input->post('desarrollo') == '' ? null : $this->input->post('desarrollo'),
            'sm' => $this->input->post('sm') == '' ? 'sin sm' : 'SM '.$this->input->post('sm'),
            'lote' => $this->input->post('lote') == '' ? 'sin lote' : 'LOTE '.$this->input->post('lote'),
            'superficie' => $this->input->post('superficie') == '' ? 1000 : $this->input->post('superficie'),
            'estado' => 'disponible',
            'comentarios' => $this->input->post('comentarios') == '' ? 'sin comentarios' : $this->input->post('comentarios'),

        );

        // if (is_array($this->input->post("sources")))
        // {
        //     $income_sources = array();
        //     $i = 0;
        //     foreach ($this->input->post("sources") as $sources)
        //     {
        //         $tmp = $this->input->post("values");
        //         $income_sources[] = $sources . "=" . $tmp[$i];
        //         $i++;
        //     }
        // }

        // $financial_data = array(
        //     "financial_status_id" => $this->input->post("financial_status_id"),
        //     "income_sources" => json_encode($income_sources)
        // );

        if ($this->Lote->save($lote_data, $lote_id))
        {
            //New customer
            if ($lote_id == -1)
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line('lotes_successful_adding') . ' ' .
                    $lote_data['desarrollo'] . ' ' . $lote_data['sm']. ' '.$lote_data['lote'], 'lote_id' => $lote_data['lote_id']));
            }
            else //previous customer
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line('lotes_successful_updating') . ' ' .
                    $lote_data['desarrollo'] . ' ' . $lote_data['sm'] . ' ' . $lote_data['lote'], 'lote_id' => $lote_id));
            }
        }
        else//failure
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('lotes_error_adding_updating') . ' ' .
                $person_data['desarrollo'] . ' ' . $person_data['lote'], 'lote_id' => -1));
        }
    }

    /*
      This deletes lotes from the lotes table
     */

    function delete()
    {
        $lotes_to_delete = $this->input->post('ids');

        if ($this->Lote->delete_list($lotes_to_delete))
        {
            echo json_encode(array('success' => true, 'message' => $this->lang->line('lotes_successful_deleted') . ' ' .
                count($lotes_to_delete) . ' ' . $this->lang->line('lotes_one_or_multiple')));
        }
        else
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('lotes_cannot_be_deleted')));
        }
    }

    function excel()
    {
        $data = file_get_contents("import_lotes.csv");
        $name = 'import_lotes.csv';
        force_download($name, $data);
    }

    function excel_import()
    {
        $this->load->view("lotes/excel_import", null);
    }

    // function do_excel_import()
    // {
    //     $msg = 'do_excel_import';
    //     $failCodes = array();
    //     if ($_FILES['file_path']['error'] != UPLOAD_ERR_OK)
    //     {
    //         $msg = $this->lang->line('items_excel_import_failed');
    //         echo json_encode(array('success' => false, 'message' => $msg));
    //         return;
    //     }
    //     else
    //     {
    //         if (($handle = fopen($_FILES['file_path']['tmp_name'], "r")) !== FALSE)
    //         {
    //             //Skip first row
    //             fgetcsv($handle);

    //             $i = 1;
    //             while (($data = fgetcsv($handle)) !== FALSE)
    //             {
    //                 $person_data = array(
    //                     'first_name' => $data[0],
    //                     'last_name' => $data[1],
    //                     'email' => $data[2],
    //                     'phone_number' => $data[3],
    //                     'address_1' => $data[4],
    //                     'address_2' => $data[5],
    //                     'city' => $data[6],
    //                     'state' => $data[7],
    //                     'zip' => $data[8],
    //                     'country' => $data[9],
    //                     'comments' => $data[10]
    //                 );

    //                 $lote_data = array(
    //                     'account_number' => $data[11] == '' ? null : $data[11],
    //                     'taxable' => $data[12] == '' ? 0 : 1,
    //                 );

    //                 // if (!$this->Customer->save($person_data, $customer_data))
    //                 if (!$this->Lote->save($lote_data))
    //                 {
    //                     $failCodes[] = $i;
    //                 }

    //                 $i++;
    //             }
    //         }
    //         else
    //         {
    //             echo json_encode(array('success' => false, 'message' => 'Your upload file has no data or not in supported format.'));
    //             return;
    //         }
    //     }

    //     $success = true;
    //     if (count($failCodes) > 1)
    //     {
    //         $msg = "Most lotes imported. But some were not, here is list of their CODE (" . count($failCodes) . "): " . implode(", ", $failCodes);
    //         $success = false;
    //     }
    //     else
    //     {
    //         $msg = "Import Lotes successful";
    //     }

    //     echo json_encode(array('success' => $success, 'message' => $msg));
    // }

    /*
      get the width for the add/edit form
     */

    function get_form_width()
    {
        return 350;
    }

    function data()
    {

        
        $sel_user = $this->input->get("employee_id");
        $index = isset($_GET['order'][0]['column']) ? $_GET['order'][0]['column'] : 1;
        $dir = isset($_GET['order'][0]['dir']) ? $_GET['order'][0]['dir'] : "asc";
        $order = array("index" => $index, "direction" => $dir);
        $length = isset($_GET['length'])?$_GET['length']:50;
        $start = isset($_GET['start'])?$_GET['start']:0;
        $key = isset($_GET['search']['value'])?$_GET['search']['value']:"";

        $lotesarray = $this->Lote->get_all($length, $start, $key, $order, $sel_user);

        $format_result = array();



        foreach ($lotesarray->result() as $loter)
        {
            $format_result[] = array(
                "<input type='checkbox' name='chk[]' id='lote_$loter->lote_id' value='" . $loter->lote_id . "'/>",
                $loter->lote_id,
                $loter->desarrollo,
                $loter->sm,
                $loter->lote,
                $loter->estado,
                anchor('lotes/view/' . $loter->lote_id, $this->lang->line('common_view'), array('class' => 'btn btn-success', "title" => "Update Lote"))
            ); 
        }

        $data = array(
            "recordsTotal" => $this->Lote->count_all(),
            "recordsFiltered" => $this->Lote->count_all(),
            "data" => $format_result
        );

       
        
       echo json_encode($data);
        exit;
    }
    
    // function upload_profile_pic()
    // {
    //     $directory = FCPATH . 'uploads/profile-' . $_REQUEST["user_id"] . "/";
    //     $this->load->library('uploader');
    //     $data = $this->uploader->upload($directory);

    //     $this->Lote->save_profile_pic($data['params']['user_id'], $data);

    //     $return = [
    //         "status" => "OK", 
    //         "token_hash" => $this->security->get_csrf_hash()
    //     ];
    //     echo json_encode($return);
    //     exit;
    // }
    
    // function upload_attachment()
    // {
    //     $directory = FCPATH . 'uploads/customer-' . $_REQUEST["lote_id"] . "/";
    //     $this->load->library('uploader');
    //     $data = $this->uploader->upload($directory);

    //     $this->Lote->save_attachments($data['params']['lote_id'], $data);

    //     $file = $this->_get_formatted_file($data['attachment_id'], $data['filename']);
    //     $file['lote_id'] = $data['params']['lote_id'];
    //     $file['token_hash'] = $this->security->get_csrf_hash();

    //     echo json_encode($file);
    //     exit;
    // }
    
    // function remove_file()
    // {
    //     $file_id = $this->input->post("file_id");
    //     $return = array(
    //         "status" => $this->Lote->remove_file($file_id),
    //         "token_hash" => $this->security->get_csrf_hash()
    //     );
    //     echo json_encode($return);
    //     exit;
    // }

    function lote_search()
    {
        $suggestions = $this->Lote->get_lote_search_suggestions($this->input->get('query'), 30);
        $data = $tmp = array();

        foreach ($suggestions as $suggestion):
            $t = explode("|", $suggestion);
            $tmp = array("value" => $t[1], "data" => $t[0], "email" => $t[2]);
            $data[] = $tmp;
        endforeach;

        echo json_encode(array("suggestions" => $data));
        exit;
    }
}

?>