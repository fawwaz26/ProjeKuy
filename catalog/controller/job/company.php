<?php
class ControllerJobCompany extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('job/company');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('job/company');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()){
			 $this->model_job_company->addcompany($this->request->post);
            
            $this->session->data['success'] = $this->language->get('text_success');
		} 
		

				$data['breadcrumbs'] = array();

				$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
				);

				$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_company'),
				'href' => $this->url->link('account/account', '', true)
				);

				$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_job'),
				'href' => $this->url->link('job/company', '', true)
				);

				$data['heading_title']        = $this->language->get('heading_title');

				$data['text_account_already'] = sprintf($this->language->get('text_account_already'), $this->url->link('job/companylogin', '', true));
				$data['text_your_details']    = $this->language->get('text_your_details');
				$data['text_job']    = $this->language->get('text_job');
				$data['text_company']    = $this->language->get('text_company');
				$data['text_your_address']    = $this->language->get('text_your_address');
				$data['text_your_password']   = $this->language->get('text_your_password');
				$data['text_newsletter']      = $this->language->get('text_newsletter');
				$data['text_select']          = $this->language->get('text_select');
				$data['text_none']            = $this->language->get('text_none');
				$data['text_loading']         = $this->language->get('text_loading');

				$data['entry_full_name']      = $this->language->get('entry_full_name');
        $data['entry_company_name']   = $this->language->get('entry_company_name');
        $data['entry_email']          = $this->language->get('entry_email');
        $data['entry_password']    		= $this->language->get('entry_password');
        $data['entry_confirm_password'] = $this->language->get('entry_confirm_password');
        $data['entry_landline_phone']  = $this->language->get('entry_landline_phone');
        $data['entry_cell_phone']      = $this->language->get('entry_cell_phone');
        $data['entry_fax']             = $this->language->get('entry_fax');
        $data['entry_address']         = $this->language->get('entry_address');
        $data['entry_country']         = $this->language->get('entry_country');
        $data['entry_zone']           = $this->language->get('entry_zone');
        $data['entry_city']            = $this->language->get('entry_city');
        $data['entry_pincode']         = $this->language->get('entry_pincode');
        $data['entry_company_website'] = $this->language->get('entry_company_website');
        $data['entry_company_logo']    = $this->language->get('entry_company_logo');
        $data['entry_no_of_employees'] = $this->language->get('entry_no_of_employees');
        $data['entry_company_description'] = $this->language->get('entry_company_description');

				$data['button_continue']           = $this->language->get('button_continue');
				$data['button_upload']             = $this->language->get('button_upload');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['full_name'])) {
            $data['error_full_name'] = $this->error['full_name'];
        } else {
            $data['error_full_name'] = '';
        }
        
        if (isset($this->error['company_name'])) {
            $data['error_company_name'] = $this->error['company_name'];
        } else {
            $data['error_company_name'] = '';
        }
				
				if (isset($this->error['email'])) {
            $data['error_email'] = $this->error['email'];
        } else {
            $data['error_email'] = '';
        }
				
				if (isset($this->error['password'])) {
				$data['error_password'] = $this->error['password'];
				} else {
				$data['error_password'] = '';
				}
				
				if (isset($this->error['confirm_password'])) {
            $data['error_confirm_password'] = $this->error['confirm_password'];
        } else {
            $data['error_confirm_password'] = '';
        }
				
				if (isset($this->error['landline_phone'])) {
            $data['error_landline_phone'] = $this->error['landline_phone'];
        } else {
            $data['error_landline_phone'] = '';
        }
				
				if (isset($this->error['cell_phone'])) {
            $data['error_cell_phone'] = $this->error['cell_phone'];
        } else {
            $data['error_cell_phone'] = '';
        }
				
				if (isset($this->error['fax'])) {
            $data['error_fax'] = $this->error['fax'];
        } else {
            $data['error_fax'] = '';
        }
				
				if (isset($this->error['address'])) {
            $data['error_address'] = $this->error['address'];
        } else {
            $data['error_address'] = '';
        }
				
				if (isset($this->error['country'])) {
				$data['error_country'] = $this->error['country'];
				} else {
				$data['error_country'] = '';
				}

				if (isset($this->error['city'])) {
            $data['error_city'] = $this->error['city'];
        } else {
            $data['error_city'] = '';
        }
				
				if (isset($this->error['pincode'])) {
            $data['error_pincode'] = $this->error['pincode'];
        } else {
            $data['error_pincode'] = '';
        }
				
				if (isset($this->error['company_website'])) {
            $data['error_company_website'] = $this->error['company_website'];
        } else {
            $data['error_company_website'] = '';
        }
				
				if (isset($this->error['company_description'])) {
            $data['error_company_description'] = $this->error['company_description'];
        } else {
            $data['error_company_description'] = '';
        }
				
				if (isset($this->error['company_logo'])) {
            $data['error_company_logo'] = $this->error['company_logo'];
        } else {
            $data['error_company_logo'] = '';
        }
				
				if (isset($this->error['no_of_employees'])) {
            $data['error_no_of_employees'] = $this->error['no_of_employees'];
        } else {
            $data['error_no_of_employees'] = '';
        }

			$data['action'] = $this->url->link('job/company', '', true);

			$data['customer_groups'] = array();

			if (is_array($this->config->get('config_customer_group_display'))) {
			$this->load->model('account/customer_group');

			$customer_groups = $this->model_account_customer_group->getCustomerGroups();

			foreach ($customer_groups as $customer_group) {
				if (in_array($customer_group['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$data['customer_groups'][] = $customer_group;
				}
			}
		}
if (isset($this->request->post['country_id'])) {
			$data['country_id'] = (int)$this->request->post['country_id'];
		} elseif (isset($this->session->data['shipping_address']['country_id'])) {
			$data['country_id'] = $this->session->data['shipping_address']['country_id'];
		} else {
			$data['country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['zone_id'])) {
			$data['zone_id'] = (int)$this->request->post['zone_id'];
		} elseif (isset($this->session->data['shipping_address']['zone_id'])) {
			$data['zone_id'] = $this->session->data['shipping_address']['zone_id'];
		} else {
			$data['zone_id'] = '';
		}

		$this->load->model('localisation/country');
		$data['countries'] = $this->model_localisation_country->getCountries();
		
		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm_password'])) {
			$data['confirm_password'] = $this->request->post['confirm_password'];
		} else {
			$data['confirm_password'] = '';
		}

				if ($this->config->get('config_account_id')) {
				$this->load->model('catalog/information');

				$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

				if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_account_id'), true), $information_info['title'], $information_info['title']);
				} else {
				$data['text_agree'] = '';
				}
				} else {
				$data['text_agree'] = '';
				}

				if (isset($this->request->post['agree'])) {
				$data['agree'] = $this->request->post['agree'];
				} else {
				$data['agree'] = false;
				}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('job/company', $data));
	}

	private function validate() {
			if ((utf8_strlen(trim($this->request->post['full_name'])) < 1) || (utf8_strlen(trim($this->request->post['full_name'])) > 32)) {
			$this->error['full_name'] = $this->language->get('error_full_name');
			}

			if ((utf8_strlen(trim($this->request->post['company_name'])) < 1) || (utf8_strlen(trim($this->request->post['company_name'])) > 32)) {
			$this->error['company_name'] = $this->language->get('error_company_name');
			}

			if ((utf8_strlen($this->request->post['email']) > 96) || !filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)) {
			$this->error['email'] = $this->language->get('error_email');
			}

			if ((utf8_strlen($this->request->post['cell_phone']) < 3) || (utf8_strlen($this->request->post['cell_phone']) > 32)) {
			$this->error['cell_phone'] = $this->language->get('error_cell_phone');
			}

			if ((utf8_strlen($this->request->post['landline_phone']) < 3) || (utf8_strlen($this->request->post['landline_phone']) > 32)) {
			$this->error['landline_phone'] = $this->language->get('error_landline_phone');
			}

			if ((utf8_strlen($this->request->post['fax']) < 3) || (utf8_strlen($this->request->post['fax']) > 32)) {
			$this->error['fax'] = $this->language->get('error_fax');
			}

			if ((utf8_strlen($this->request->post['company_website']) < 3) || (utf8_strlen($this->request->post['company_website']) > 32)) {
			$this->error['company_website'] = $this->language->get('error_company_website');
			}

			if ((utf8_strlen($this->request->post['company_description']) < 3) || (utf8_strlen($this->request->post['company_description']) > 32)) {
			$this->error['company_description'] = $this->language->get('error_company_company_description');
			}

			if ((utf8_strlen($this->request->post['company_logo']) < 3) || (utf8_strlen($this->request->post['company_logo']) > 32)) {
			$this->error['company_logo'] = $this->language->get('error_company_logo');
			}
			
			if ((utf8_strlen($this->request->post['no_employees']) < 3) || (utf8_strlen($this->request->post['no_employees']) > 32)) {
			$this->error['no_employees'] = $this->language->get('error_no_of_employees');
			}

			if ((utf8_strlen(trim($this->request->post['address'])) < 3) || (utf8_strlen(trim($this->request->post['address'])) > 128)) {
			$this->error['address'] = $this->language->get('error_address');
			}

			if ((utf8_strlen(trim($this->request->post['city'])) < 2) || (utf8_strlen(trim($this->request->post['city'])) > 128)) {
			$this->error['city'] = $this->language->get('error_city');
			}

			if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
			}

			if ((utf8_strlen($this->request->post['pincode']) < 4) || (utf8_strlen($this->request->post['pincode']) > 20)) {
			$this->error['pincode'] = $this->language->get('error_pincode');
			}

			if ($this->request->post['confirm_password'] != $this->request->post['password']) {
			$this->error['confirm_password'] = $this->language->get('error_confirm_password');
			}
			
			$this->load->model('localisation/country');

			$country_info = $this->model_localisation_country->getCountry($this->request->post['country_id']);

			if ($this->request->post['country_id'] == '') {
			$this->error['country'] = $this->language->get('error_country');
			}
		return !$this->error;
	}
}