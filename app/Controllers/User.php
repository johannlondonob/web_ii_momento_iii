<?php

namespace App\Controllers;

use App\Models\UserModel;
use App\Entities\ResponseEntity;

class User extends BaseController
{
	protected $userModel;
	protected $res;

	public function __construct()
	{
		$this->userModel = new UserModel();
		$this->res = new ResponseEntity();
	}

	public function index()
	{
		$data = $this->userModel->where('user_is_active', 1)->findAll();
		$this->res->success = true;
		$this->res->data = $data;

		$this->response
			->setStatusCode(201)
			->setHeader('Content-Type', 'application/json')
			->setBody($this->res->render());

		echo json_encode($this->response->getBody());
	}

	public function signin()
	{
		$data = $this->request->getJSON(false);
		$userEmail = $data->user_email;
		$userPassword = $data->user_password;
		unset($data);

		if (empty($userPassword)) {
			if (!filter_var($userEmail, FILTER_VALIDATE_EMAIL or empty($userEmail))) {
				$this->res->success = false;
				$this->res->titleError = 'Unable to authenticate';
				$this->res->messageError = 'Maybe there are empty fields or the email format is invalid';

				$this->response
					->setStatusCode(200)
					->setHeader('Content-Type', 'application/json')
					->setBody($this->res->render());
				echo json_encode($this->response->getBody());
				return;
			}
		}

		$user = $this->userModel
			->where('user_email', $userEmail)
			->where('user_is_active', 1)->findAll();

		if (empty($user)) {
			$this->res->success = false;
			$this->res->titleError = 'Email not found';
			$this->res->messageError = 'The email provided does not exist';

			$this->response
				->setStatusCode(200)
				->setHeader('Content-Type', 'application/json')
				->setBody($this->res->render());
			echo json_encode($this->response->getBody());
			return;
		} else {
			if ($user[0]->user_password == $userPassword) {
				$this->res->success = true;

				$this->response
					->setStatusCode(200)
					->setHeader('Content-Type', 'application/json')
					->setBody($this->res->render());
				echo json_encode($this->response->getBody());
				return;
			} else {
				$this->res->success = false;
				$this->res->titleError = 'Authentication failed';
				$this->res->messageError = 'Data authentication was failed. The password is wrong';

				$this->response
					->setStatusCode(200)
					->setHeader('Content-Type', 'application/json')
					->setBody($this->res->render());
				echo json_encode($this->response->getBody());
				return;
			}
		}
	}

	public function signup()
	{
		$data = $this->request->getJSON();

		$identificationType = $data->id_document_type;
		$identification = $data->user_identification;

		if (($identificationType == 1 and !is_numeric($identification) or ($identificationType == 3 && is_numeric($identification)))) {
			$this->res->messageError = 'Identification invalid for the document type ' . $identificationType;
			goto finalize;
		}

		$isSaved = $this->userModel->save($data);

		if (!$isSaved) {
			$this->res->messageError = $this->userModel->errors();
			goto finalize;
		} else {
			$this->res->success = true;

			$this->response
				->setStatusCode(201)
				->setHeader('Content-Type', 'application/json')
				->setBody($this->res->render());
			echo json_encode($this->response->getBody());
			return;
		}

		finalize: $this->res->success = false;
		$this->res->titleError = 'Errors in validation';

		$this->response
			->setStatusCode(200)
			->setHeader('Content-Type', 'application/json')
			->setBody($this->res->render());
		echo json_encode($this->response->getBody());
		return;
	}
}
