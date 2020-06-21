<?php
class ControllerJobEmploy extends Controller {
	private $error = array();

	public function index() {
		
		$this->load->language('job/employ');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$this->load->model('job/employ');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
		$employ_id = $this->model_job_employ->addfirsttable($this->request->post);	
			$this->session->data['success'] = $this->language->get('text_success');

		$url = '';

		if (isset($this->request->get['sort'])) {
		 $url .= '&sort=' . $this->request->get['sort'];
		}
		if (isset($this->request->get['order'])) {
		 $url .= '&order=' . $this->request->get['order'];
		}
    if (isset($this->request->get['page'])) {
		 $url .= '&page=' . $this->request->get['page'];
		}
		$this->response->redirect($this->url->link('job/employ', 'token=' . $this->session->data['token'] . $url, true));
			
		}
//  language //////
		$this->load->model('localisation/language');
		$data['languages'] = $this->model_localisation_language->getLanguages();
									     	///language Country////
		$this->load->model('localisation/country');
		$data['countrys'] = $this->model_localisation_country->getCountries($data);
									      ///  language Nationality
		$this->load->model('localisation/country');
		$data['nationality'] = $this->model_localisation_country->getCountries($data);
		                    ///  language zone  ////////////////
		$this->load->model('localisation/zone');        
		$data['zone'] = $this->model_localisation_zone->getZonesByCountryId($data);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_register'),
			'href' => $this->url->link('job/employ', '', true)
		);

		$data['heading_title']          = $this->language->get('heading_title');
		$data['text_form']              = !isset($this->request->get['information_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_account_already']   = sprintf($this->language->get('text_account_already'), $this->url->link('account/login', '', true));
		$data['text_your_details']      = $this->language->get('text_your_details');
		$data['text_your_address']      = $this->language->get('text_your_address');
		$data['text_your_password']     = $this->language->get('text_your_password');
		$data['text_newsletter']        = $this->language->get('text_newsletter');
		$data['text_select']            = $this->language->get('text_select');
		$data['text_none']              = $this->language->get('text_none');
		$data['text_loading']           = $this->language->get('text_loading');
		$data['text_default']           = $this->language->get('text_default');
		$data['text_male']              = $this->language->get('Male');
    $data['text_female']            = $this->language->get('Female');
		$data['entry_title']            = $this->language->get('entry_title');
		$data['entry_image']            = $this->language->get('entry_image');
		$data['entry_nationality']      = $this->language->get('entry_nationality');
		$data['entry_mobile_phone']     = $this->language->get('entry_mobile_phone');
		$data['entry_home_phone']       = $this->language->get('entry_home_phone');
		$data['entry_gender']           = $this->language->get('entry_gender');
		$data['entry_birth_date']       = $this->language->get('entry_birth_date');
		$data['entry_email']            = $this->language->get('entry_email');
		$data['entry_password']			    = $this->language->get('entry_password');
		$data['entry_status']				    = $this->language->get('entry_status');
		$data['entry_fullname']         = $this->language->get('entry_fullname');
		$data['entry_url']              = $this->language->get('entry_url');
		$data['entry_confirm_password'] = $this->language->get('entry_confirm_password');
		$data['entry_address']          = $this->language->get('entry_address');
		$data['entry_state']            = $this->language->get('entry_state');
		$data['entry_city']   					= $this->language->get('entry_city');
		$data['entry_pincode']				  = $this->language->get('entry_pincode');
		$data['entry_country']          = $this->language->get('entry_country');
		$data['entry_customer_group']   = $this->language->get('entry_customer_group');
		$data['button_save']            = $this->language->get('button_save');
		$data['button_remove']          = $this->language->get('button_remove');
		$data['button_cancel']          = $this->language->get('button_cancel');
		$data['button_continue']        = $this->language->get('button_continue');
		$data['button_upload']          = $this->language->get('button_upload');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		if(isset($this->error['fullname'])) {
		$data['error_fullname'] = $this->error['fullname'];
		} 	else {
		$data['error_fullname'] = '';
		}
		if(isset($this->error['email'])) {
		 	$data['error_email'] = $this->error['email'];
		} 	else {
				$data['error_email'] = '';
		}
		if (isset($this->error['password'])) {
       $data['error_password'] = $this->error['password'];
    } else {
            
        $data['error_password'] = '';
    }
		if(isset($this->error['confirm_password'])) {
		 	$data['error_confirm_password'] = $this->error['confirm_password'];
		} 	else {
				$data['error_confirm_password'] = '';
		}
		if(isset($this->error['gender'])) {
		 	$data['error_gender'] = $this->error['gender'];
		} 	else {
				$data['error_gender'] = '';
		}
		if(isset($this->error['date_of_birth'])) {
		 	$data['error_date_of_birth'] = $this->error['date_of_birth'];
		} 	else {
				$data['error_date_of_birth'] = '';
		}
		if(isset($this->error['address'])) {
		 	$data['error_address'] = $this->error['address'];
		} 	else {
				$data['error_address'] = '';
		}
		if(isset($this->error['country_id'])) {
		 	$data['error_country'] = $this->error['country_id'];
		} 	else {
				$data['error_country'] = '';
		}
		if(isset($this->error['state_id'])) {
		 	$data['error_state'] = $this->error['state_id'];
		} 	else {
				$data['error_state'] = '';
		}
		if(isset($this->error['city'])) {
		 	$data['error_city'] = $this->error['city'];
		} 	else {
				$data['error_city'] = '';
		}
		if(isset($this->error['pincode'])) {
		 	$data['error_pincode'] = $this->error['pincode'];
		} 	else {
				$data['error_pincode'] = '';
		}
		if(isset($this->error['nationality_id'])) {
		 	$data['error_nationality'] = $this->error['nationality_id'];
		} 	else {
				$data['error_nationality'] = '';
		}
		if(isset($this->error['mobile_phone'])) {
		 	$data['error_mobile_phone'] = $this->error['mobile_phone'];
		} 	else {
				$data['error_mobile_phone'] = '';
		}
		if(isset($this->error['home_phone'])) {
		 	$data['error_home_phone'] = $this->error['home_phone'];
		} 	else {
				$data['error_home_phone'] = '';
		}

		$data['action'] = $this->url->link('job/employ', '', true);

		$data['customer_groups'] = array();
		
	//																edit
		
		if(isset($this->request->post['fullname']))
		{
		 $data['fullname']=$this->request->post['fullname'];
		}
		else
		{
		 $data['fullname']='';
		}
		 if(isset($this->request->post['email']))
		{
		 $data['email']=$this->request->post['email'];
		}
		else
		{
		 $data['email']='';
		}
		if(isset($this->request->post['date_of_birth']))
		{
		 $data['date_of_birth']=$this->request->post['date_of_birth'];
		}
		else
		{
		 $data['date_of_birth']='';
		}
		 if(isset($this->request->post['address']))
		{
		 $data['address']=$this->request->post['address'];
		}
		else
		{
		 $data['address']='';
		}
		if(isset($this->request->post['city']))
		{
		 $data['city']=$this->request->post['city'];
		}
		else
		{
		 $data['city']='';
		}
		if(isset($this->request->post['pincode']))
		{
		 $data['pincode']=$this->request->post['pincode'];
		}
		else
		{
			$data['pincode']='';
		}
		if(isset($this->request->post['mobile_phone']))
		{
			$data['mobile_phone']=$this->request->post['mobile_phone'];
		}
		else
		{
			$data['mobile_phone']='';
		}
		if(isset($this->request->post['home_phone']))
		{
			$data['home_phone']=$this->request->post['home_phone'];
		}
		else
		{
			$data['home_phone']='';
		}
		if(isset($this->request->post['country_id']))
		{
			$data['country_id']=$this->request->post['country_id'];
		}
		else
		{
			$data['country_id']='';
		}
		if(isset($this->request->post['state_id']))
		{
		 $data['state_id']=$this->request->post['state_id'];
		}
		else
		{
		 $data['state_id']='';
		}
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('job/employ', $data));
	}

	private function validateForm(){
		
		  if ((utf8_strlen(trim($this->request->post['fullname'])) < 1) || (utf8_strlen(trim($this->request->post['fullname'])) > 32)) {
			$this->error['fullname'] = $this->language->get('error_fullname');
		  }
		  if ((utf8_strlen($this->request->post['email'])< 3)||(utf8_strlen($this->request->post['email']) > 255)) {
		   $this->error['email']= $this->language->get('error_email');
			}
			if ((utf8_strlen($this->request->post['password'])< 3)||(utf8_strlen($this->request->post['password']) > 255)) {
					$this->error['password']= $this->language->get('error_password');
			}
			if ((utf8_strlen($this->request->post['confirm_password'])< 3)||(utf8_strlen($this->request->post['confirm_password']) > 255)) {
		   $this->error['confirm_password']= $this->language->get('error_confirm_password');
			}
			if ((utf8_strlen($this->request->post['date_of_birth'])< 3)||(utf8_strlen($this->request->post['date_of_birth']) > 255)) {
			 $this->error['date_of_birth']= $this->language->get('error_date_of_birth');
			}
			if ((utf8_strlen($this->request->post['address'])< 3)||(utf8_strlen($this->request->post['address']) > 255)) {
			 $this->error['address']= $this->language->get('error_address');
			}
			if ((utf8_strlen($this->request->post['city'])< 3)||(utf8_strlen($this->request->post['city']) > 255)) {
		   $this->error['city']= $this->language->get('error_city');
			}
			if ((utf8_strlen($this->request->post['pincode'])< 3)||(utf8_strlen($this->request->post['pincode']) > 255)) {
		   $this->error['pincode']= $this->language->get('error_pincode');
			}
			if ((utf8_strlen($this->request->post['mobile_phone'])< 3)||(utf8_strlen($this->request->post['mobile_phone']) > 255)) {
		   $this->error['mobile_phone']= $this->language->get('error_mobile_phone');
			}
			if ((utf8_strlen($this->request->post['home_phone'])< 3)||(utf8_strlen($this->request->post['home_phone']) > 255)) {
		   $this->error['home_phone']= $this->language->get('error_home_phone');
			}
			
			return !$this->error;
	}
}