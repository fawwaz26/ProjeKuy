<?php
class ModelSettingApi extends Model {
	public function login($username, $password) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "api WHERE username = '" . $this->db->escape($username) . "' AND password = '" . $this->db->escape($password) . "'");

		return $query->row;
	}
}