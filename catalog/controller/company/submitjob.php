<?php
class ControllerCompanySubmitJob extends Controller {
	private $error = array();
	public function index() {
		if (!$this->company->isLogged()) {
			$this->response->redirect($this->url->link('employ/login', '', true));
		}
		$this->load->language('company/submitjob');
		$this->load->model('job/job');
		$this->load->model('job/company');
		$this->load->model('catalog/category');
		$this->load->model('tool/image');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if (isset($this->request->get['job_id'])) {
			$job_id = $this->request->get['job_id'];
		} else {
			$job_id = 0;
		}		
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			
			if($job_id != 0){
				$jobs_id = $this->model_job_job->editJob($job_id,$this->request->post);
			
				$this->response->redirect($this->url->link('company/jobsubmitlist'));
				$this->session->data['success'] = $this->language->get('text_successedit');
			}
			else {
				$this->model_job_job->addJob($this->request->post);

				$this->session->data['success'] = $this->language->get('text_success');

				$this->response->redirect($this->url->link('company/jobsubmitlist'));
			}
		}
		
		$data['breadcrumbs'] = array();
		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('company/submitjob')
		);
		$data['heading_title'] 			= $this->language->get('heading_title');
		$data['text_select'] 			= $this->language->get('text_select');
		$data['text_none'] 				= $this->language->get('text_none');
		$data['entry_zone'] 			= $this->language->get('entry_zone');
		$data['entry_country'] 			= $this->language->get('entry_country');
		$data['entry_experience'] 		= $this->language->get('entry_experience');
		$data['entry_keyword'] 			= $this->language->get('entry_keyword');
		$data['entry_url'] 				= $this->language->get('entry_url');
		$data['entry_youremail'] 		= $this->language->get('entry_youremail');
		$data['entry_jobtitle'] 		= $this->language->get('entry_jobtitle');
		$data['entry_city'] 			= $this->language->get('entry_city');
		$data['entry_location'] 		= $this->language->get('entry_location');
		$data['entry_jobtype'] 			= $this->language->get('entry_jobtype');
		$data['entry_jobcategory'] 		= $this->language->get('entry_jobcategory');
		$data['entry_salary'] 			= $this->language->get('entry_salary');
		$data['entry_description'] 		= $this->language->get('entry_description');
		$data['entry_banner'] 			= $this->language->get('entry_banner');
		$data['entry_choosefile'] 		= $this->language->get('entry_choosefile');
		$data['entry_filelimit'] 		= $this->language->get('entry_filelimit');
		$data['entry_partime'] 			= $this->language->get('entry_partime');
		$data['entry_fultime'] 			= $this->language->get('entry_fultime');
		$data['entry_optional'] 		= $this->language->get('entry_optional');
		$data['entry_company_details'] 	= $this->language->get('entry_company_details');
		$data['entry_company_name'] 	= $this->language->get('entry_company_name');
		$data['entry_website'] 			= $this->language->get('entry_website');
		$data['entry_tagline'] 			= $this->language->get('entry_tagline');
		$data['entry_socialprofiles'] 	= $this->language->get('entry_socialprofiles');
		$data['entry_submitjob'] 		= $this->language->get('entry_submitjob');
		$data['button_upload'] 			= $this->language->get('button_upload');
		$data['text_loading'] 			= $this->language->get('text_loading');
		
		
		if (!isset($this->request->get['job_id'])) {
			$data['action'] = $this->url->link('company/submitjob', '', true);
		} else {
			$data['action'] = $this->url->link('company/submitjob', '&job_id=' . $this->request->get['job_id'], true);
		}
		
		// GET COMPANY INFORMATION
	
		$company_info = $this->model_job_company->showCompany($this->company->getId());
		
		$data['company_id'] = $this->company->getId();
		$data['company_name'] =  $company_info['company_name'];
		$data['companyemail'] =  $company_info['email'];
		
		$data['company_website'] =  $company_info['company_website'];
		$data['company_logo'] =  $company_info['company_logo'];
		$data['company_description'] =  $company_info['company_description'];
		
		$this->load->model('localisation/country');
		$data['countries'] = $this->model_localisation_country->getCountries();
		
		// Errors
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}
		
		if (isset($this->error['title'])) {
			$data['error_title'] = $this->error['title'];
		} else {
			$data['error_title'] = '';
		}
		
		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = '';
		}

		if (isset($this->error['zone'])) {
			$data['error_zone'] = $this->error['zone'];
		} else {
			$data['error_zone'] = '';
		}
		
		if (isset($this->error['city'])) {
			$data['error_city'] = $this->error['city'];
		} else {
			$data['error_city'] = '';
		}
		
		if (isset($this->error['jobtype_id'])) {
			$data['error_jobtype_id'] = $this->error['jobtype_id'];
		} else {
			$data['error_jobtype_id'] = '';
		}
		
		if (isset($this->error['salary'])) {
			$data['error_salary'] = $this->error['salary'];
		} else {
			$data['error_salary'] = '';
		}
		
		if (isset($this->error['jobcategory'])) {
			$data['error_jobcategory'] = $this->error['jobcategory'];
		} else {
			$data['error_jobcategory'] = '';
		}
		
		if (isset($this->error['description'])) {
			$data['error_description'] = $this->error['description'];
		} else {
			$data['error_description'] = '';
		}
		
			
		if (isset($this->error['enquiry'])) {
			$data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$data['error_enquiry'] = '';
		}
		
		
		
		if (isset($this->request->get['job_id'])){
			$job_info = $this->model_job_job->getJob($this->request->get['job_id']);
		}
		
		if (isset($this->request->post['title'])) {
			$data['title'] = $this->request->post['title'];
		} elseif (isset($job_info['title'])) {
			$data['title'] = $job_info['title'];
		} else {
			$data['title'] = '';
		}

		if (isset($this->request->post['experience'])) {
			$data['experience'] = $this->request->post['experience'];
		} elseif (isset($job_info['experience'])) {
			$data['experience'] = $job_info['experience'];
		} else {
			$data['experience'] = '';
		}
		
		if (isset($this->request->post['meta_keyword'])) {
			$data['meta_keyword'] = $this->request->post['meta_keyword'];
		} elseif (isset($job_info['meta_keyword'])) {
			$data['meta_keyword'] = $job_info['meta_keyword'];
		} else {
			$data['meta_keyword'] = '';
		}
		
		if (isset($this->request->post['city'])) {
			$data['city'] = $this->request->post['city'];
		} elseif (isset($job_info['city'])) {
			$data['city'] = $job_info['city'];
		} else {
			$data['city'] = '';
		}
		
		if (isset($this->request->post['category_id'])) {
			$data['category_id'] = $this->request->post['category_id'];
		} elseif (isset($job_info['category_id'])) {
			$data['category_id'] = $job_info['category_id'];
		} else {
			$data['category_id'] = '';
		}
		
		if(!empty($data['category_id'])) {
			$cat_name = $this->model_catalog_category->getJobCategory($data['category_id']);
			$data['cat_name'] = $cat_name['name'];
		}
		else{
			$data['cat_name'] = '';
		}
		
		if (isset($this->request->post['location'])) {
			$data['location'] = $this->request->post['location'];
		} elseif (isset($job_info['location'])) {
			$data['location'] = $job_info['location'];
		} else {
			$data['location'] = '';
		}
		
		if (isset($this->request->post['url'])) {
			$data['url'] = $this->request->post['url'];
		} elseif (isset($job_info['url'])) {
			$data['url'] = $job_info['url'];
		} else {
			$data['url'] = '';
		}
		
		if (isset($this->request->post['tag'])) {
			$data['tag'] = $this->request->post['tag'];
		} elseif (isset($job_info['tag'])) {
			$data['tag'] = $job_info['tag'];
		} else {
			$data['tag'] = '';
		}
		
		if (isset($this->request->post['jobtype_id'])) {
			$data['jobtype_id'] = $this->request->post['jobtype_id'];
		} elseif (isset($job_info['jobtype_id'])) {
			$data['jobtype_id'] = $job_info['jobtype_id'];
		} else {
			$data['jobtype_id'] = '';
		}
		
		if (isset($this->request->post['salary'])) {
			$data['salary'] = $this->request->post['salary'];
		} elseif (isset($job_info['salary'])) {
			$data['salary'] = $job_info['salary'];
		} else {
			$data['salary'] = '';
		}
		
		if (isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif (isset($job_info['description'])) {
			$data['description'] = $job_info['description'];
		} else {
			$data['description'] = '';
		}
		
		
		
		$data['thumb'] = $this->model_tool_image->resize('placeholder.png',45,45);
		
		if (isset($this->request->post['banner'])) {
			$data['banner'] = $this->request->post['banner'];
			if(!empty($this->request->post['banner']))
			{
				$data['thumb'] = $this->model_tool_image->resize($this->request->post['banner'],45,45);
			}
			
		}
		elseif (isset($job_info['banner'])) {
			$data['banner'] = $job_info['banner'];
			$data['thumb'] = $this->model_tool_image->resize($job_info['banner'],45,45);
		}
		else {
			$data['banner'] = '';
		}
		
		$data['column_left'] 	= $this->load->controller('common/column_left');
		$data['column_right'] 	= $this->load->controller('common/column_right');
		$data['content_top'] 	= $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] 		= $this->load->controller('common/footer');
		$data['header'] 		= $this->load->controller('common/header');
		$this->response->setOutput($this->load->view('company/submitjob', $data));
	}
	
	public function validateForm(){
				
		if ((utf8_strlen($this->request->post['email'])< 3)||(utf8_strlen($this->request->post['email']) > 255)) {
	    	$this->error['email']= $this->language->get('error_email');
		}
		
		if ((utf8_strlen($this->request->post['title'])< 3)||(utf8_strlen($this->request->post['title']) > 255)) {
	    	$this->error['title']= $this->language->get('error_title');
		}
		
				
		if (($this->request->post['jobtype_id'] == '')) {
			$this->error['jobtype_id'] = $this->language->get('error_jobtype_id');
		}
		
		if ((utf8_strlen(trim($this->request->post['salary'])) < 2) || (utf8_strlen(trim($this->request->post['salary'])) > 128)) {
			$this->error['salary'] = $this->language->get('error_salary');
		}
		
		if ((utf8_strlen(trim($this->request->post['jobcategory'])) == '')) {
			$this->error['jobcategory'] = $this->language->get('error_jobcategory');
		}
		
		if ((utf8_strlen(trim($this->request->post['description'])) < 20) || (utf8_strlen(trim($this->request->post['description'])) > 1000)) {
			$this->error['description'] = $this->language->get('error_description');
		}
		

		return !$this->error;
	}
	public function autocomplete() {
		$json = array();
		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/category');
		
			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5
			);
			$results = $this->model_catalog_category->getJobCategories($filter_data);
			
			foreach ($results as $result) {
				$json[] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}
		
		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);
		
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	} 
	
	public function upload(){
		$this->load->language('tool/upload');
			$json = array();
			if (!empty($this->request->files['file']['name']) && is_file($this->request->files['file']['tmp_name'])) {
				// Sanitize the filename
				$filename = basename(preg_replace('/[^a-zA-Z0-9\.\-\s+]/', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));
				// Validate the filename length
				if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
					$json['error'] = $this->language->get('error_filename');
				}
				// Allowed file extension types
				$allowed = array();
				$extension_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_ext_allowed'));
				
				$filetypes = explode("\n", $extension_allowed);
				
				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}
				if (!in_array(strtolower(substr(strrchr($filename, '.'), 1)), $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}
				// Allowed file mime types
				$allowed = array();
				$mime_allowed = preg_replace('~\r?\n~', "\n", $this->config->get('config_file_mime_allowed'));
				$filetypes = explode("\n", $mime_allowed);
				foreach ($filetypes as $filetype) {
					$allowed[] = trim($filetype);
				}
				if (!in_array($this->request->files['file']['type'], $allowed)) {
					$json['error'] = $this->language->get('error_filetype');
				}
				// Check to see if any PHP files are trying to be uploaded
				$content = file_get_contents($this->request->files['file']['tmp_name']);
				if (preg_match('/\<\?php/i', $content)) {
					$json['error'] = $this->language->get('error_filetype');
				}
				// Return any upload error
				
				if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
					$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
				}
			} else {
				$json['error'] = $this->language->get('error_upload');
			}
			if (!$json) {
				$targetDir = DIR_IMAGE.'catalog/';
				$file = $filename;
				$location = $targetDir.$file;
				$location1 = 'catalog/'.$file;
				move_uploaded_file($this->request->files['file']['tmp_name'], $location);
				$json['location1'] =$location1;
				$json['success'] = $this->language->get('text_upload');
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
	} 
}