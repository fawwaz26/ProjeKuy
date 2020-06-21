<?php
class ModelJobEmploy extends Model {
	public function addEmploy ($data) {
		$sql="INSERT INTO " . DB_PREFIX . "employ set
			fullname='".$this->db->escape($data['fullname'])."',
			email='".$this->db->escape($data['email'])."',
			salt = '" . $this->db->escape($salt = token(9)) . "',
			password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "',
			
			date_of_birth='".$this->db->escape($data['date_of_birth'])."',
			address='".$this->db->escape($data['address'])."',
			country_id='".(int)$data['country_id']."',
			zone_id='".(int)$data['zone_id']."',
            about_self='".$this->db->escape($data['about_self'])."',
			jobtype_id='".(int)$data['jobtype_id']."',
			category_id='".(int)$data['category_id']."',
			status='".(int)$data['status']."',

			city='".$this->db->escape($data['city'])."',
			pincode='".$this->db->escape($data['pincode'])."',
			mobile_phone='".$this->db->escape($data['mobile_phone'])."',
			home_phone='".$this->db->escape($data['home_phone'])."',
			profissional='".$this->db->escape($data['profissional'])."',
			experience='".$this->db->escape($data['experience'])."',
			interest='".$this->db->escape($data['interest'])."',
			career='".$this->db->escape($data['career'])."',
			image='".$data['image']."',
			achievement='".$this->db->escape($data['achievement'])."',
			gender='".(int)$data['gender']."',date_added=now()";
	    $this->db->query($sql);
		$employ_id=$this->db->getLastId();
		if (isset($data['education_rows'])) {
			foreach ($data['education_rows'] as $language_id => $value) {
				foreach ($value as $education_row) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "employ_education SET 
					employ_id = '" . (int)$employ_id . "', 
					language_id = '" .(int)$language_id . "',
					degree='".$education_row['degree']."',
					collage='".$education_row['collage']."',
					percentage='".$education_row['percentage']."',
					passed_year='".$education_row['passed_year']."'");
				}
			}
		}
	}   
 	public function editEmploy($employ_id,$data){
		$sql="update " . DB_PREFIX . "employ set
			fullname='".$data['fullname']."',
			email='".$data['email']."',
			date_of_birth='".$data['date_of_birth']."',
			address='".$data['address']."',
			city='".$data['city']."',
			pincode='".$data['pincode']."',
			country_id='".$data['country_id']."',
			zone_id='".$data['zone_id']."',
			mobile_phone='".$data['mobile_phone']."',
			gender='".(int)$data['gender']."',
			home_phone='".$data['home_phone']."',
			profissional='".$data['profissional']."',
			experience='".$data['experience']."',
			interest='".$data['interest']."',
			career='".$data['career']."',
			image='".$data['image']."',
			 about_self='".$this->db->escape($data['about_self'])."',
			jobtype_id='".(int)$data['jobtype_id']."',
			category_id='".(int)$data['category_id']."',
			status='".(int)$data['status']."',
			achievement='".$data['achievement']."',
			date_modified=now() where employ_id='".$employ_id."'";
			
			if ($data['password']) {
				$this->db->query("UPDATE `" . DB_PREFIX . "employ` SET 
				salt = '" . $this->db->escape($salt = token(9)) . "',
				password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE employ_id = '" . (int)$employ_id . "'");
			}
			$this->db->query("DELETE FROM " . DB_PREFIX . "employ_education WHERE employ_id = '" . $employ_id . "'");
			
			if (isset($data['education_rows'])) {
				foreach ($data['education_rows'] as $language_id => $value) {
					foreach ($value as $education_row) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "employ_education SET 
						employ_id = '" . $employ_id . "', 
						language_id = '" .(int)$language_id . "',
						degree='".$education_row['degree']."',
						collage='".$education_row['collage']."',
						percentage='".$education_row['percentage']."',
						passed_year='".$education_row['passed_year']."'");
					}
				}
			}	
		$this->db->query($sql);
	}

	public function getEducations($employ_id) {
		$education_row_data = array();
		$education_row_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "employ_education WHERE employ_id = '" . (int)$employ_id . "'");
			foreach ($education_row_query->rows as $education_row) {
				$education_row_data[$education_row['language_id']][] = array(
					'degree'     => $education_row['degree'],
					'collage'    => $education_row['collage'],
					'percentage' => $education_row['percentage'],
					'passed_year' => $education_row['passed_year']
				);
			}
		return $education_row_data;
	}
	public function getEducation ($employ_id){
		$sql="select * from " . DB_PREFIX . "employ_education where employ_id='".$employ_id."'";
		$query=$this->db->query($sql);
		return $query->rows;
	}


	public function getTotalCompanysByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "employ WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}
	
	public function approve($employ_id){
		$this->db->query("UPDATE " . DB_PREFIX . "employ SET approved = '1' WHERE employ_id = '" . (int)$employ_id . "'");
	
         $this->load->model('job/mail');
		$companytype = 'employ_approve_mail';
		$mailinfo = $this->model_job_mail->getMailInfo($companytype);
    	$employ_info = $this->model_job_employ->getEmploy($employ_id);

		if(isset($mailinfo['status'])){
			$find = array(
				'{firstname}',
				'{email}',		
				'{loginlink}'										
			);

		if(isset($employ_info['full_name'])){
		  $firstname=$employ_info['full_name'];
		}else{
		  $firstname='';
		}

		if(isset($employ_info['email'])){
		  $emaillist=$employ_info['email'];
		}else{
		  $emaillist='';
		}

		$replace = array(
		 	'firstname'  => $firstname,
			 'email' 	 => $emaillist,
			 'loginlink'  => $this->url->link('company/login', '', 'SSL') . "\n\n"
		);

	    $subject = str_replace(array("\r\n", "\r", "\n"), '', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '', trim(str_replace($find, $replace, $mailinfo['subject']))));
		$message = str_replace(array("\r\n", "\r", "\n"), '', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '', trim(str_replace($find, $replace, $mailinfo['message']))));
		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
		$mail->setTo($emaillist);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setHtml(html_entity_decode($message));
		$mail->send();


	
	}


	}

	public function disApprove($employ_id){
		$this->db->query("UPDATE " . DB_PREFIX . "employ SET approved = '0' WHERE employ_id = '" . (int)$employ_id . "'");
	}
	
 	public function deleteEmploy($employ_id){
		$sql="delete  from " . DB_PREFIX . "employ where employ_id='".$employ_id."'";
		$query=$this->db->query($sql);
	}
	public function getEmploy($employ_id){
		$sql="select * from " . DB_PREFIX . "employ where employ_id='".$employ_id."'";
		$query=$this->db->query($sql);
		return $query->row;
	}
	public function getEmploys($data){
		$sql="select * from " . DB_PREFIX . "employ where employ_id<>0 ";
		
		if (isset($data['filter_fullname'])){
		 	$sql .=" and fullname like '".$this->db->escape($data['filter_fullname'])."%'";
		}
		
		if (isset($data['filter_email'])){
		 	$sql .=" and email like '".$this->db->escape($data['filter_email'])."%'";
		}
		
		
		$sort_data = array(
		'fullname',
		'email',
		'address',
		'country_id',
		'zone_id'
		);
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
		 	$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY fullname";
		}
		if (isset($data['order']) && ($data['order'] == 'ASC')) {
		 	$sql .= " DESC";
		} else {
		 	$sql .= " ASC";
		}
		if (isset($data['start']) || isset($data['limit'])) {

		if ($data['start'] < 0) {
			$data['start'] = 0;
		}
		if ($data['limit'] < 1) {
			$data['limit'] = 20;
		}
		$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);
		return $query->rows;	
	}
		
	public function getTotalEmployss($data){
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "employ where employ_id<>0";
		if (isset($data['filter_fullname'])){
		 	$sql .=" and fullname like '".$this->db->escape($data['filter_fullname'])."%'";
		}
		
		if (isset($data['filter_email'])){
		 	$sql .=" and email like '".$this->db->escape($data['filter_email'])."%'";
		}
		
		$query = $this->db->query($sql);
		return $query->row['total'];
	}
}
?>