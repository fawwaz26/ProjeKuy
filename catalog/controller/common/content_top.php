<?php

class ControllerCommonContentTop extends Controller {

	public function index() {

		$this->load->model('design/layout');



		if (isset($this->request->get['route'])) {

			$route = (string)$this->request->get['route'];

		} else {

			$route = 'common/home';

		}



		$layout_id = 0;










		if (!$layout_id) {

			$layout_id = $this->model_design_layout->getLayout($route);

		}



		if (!$layout_id) {

			$layout_id = $this->config->get('config_layout_id');

		}



		$this->load->model('extension/module');



		$data['modules'] = array();



		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'content_top');



		foreach ($modules as $module) {

			$part = explode('.', $module['code']);



			if (isset($part[0]) && $this->config->get($part[0] . '_status')) {

				$module_data = $this->load->controller('extension/module/' . $part[0]);



				if ($module_data) {

					$data['modules'][] = $module_data;

				}

			}



			

		}



		return $this->load->view('common/content_top', $data);

	}

}

