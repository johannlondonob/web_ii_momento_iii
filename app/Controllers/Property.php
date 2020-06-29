<?php

namespace App\Controllers;

use App\Models\PropertyModel;
use App\Entities\ResponseEntity;
use App\Models\PropertyUserModel;

class Property extends BaseController
{
	protected $propertyModel;
	protected $propertyUserModel;
	protected $res;

	public function __construct()
	{
		$this->propertyModel = new PropertyModel();
		$this->propertyUserModel = new PropertyUserModel();
		$this->res = new ResponseEntity();
	}

	public function index()
	{
		$data = $this->propertyModel->where('property_is_active', 1)->findAll();
		$this->res->success = true;
		$this->res->data = $data;

		$this->response
			->setStatusCode(201)
			->setHeader('Content-Type', 'application/json')
			->setBody($this->res->render());
		echo json_encode($this->response->getBody());
	}

	public function insert()
	{
		$data = $this->request->getJSON();
		$isSaved = $this->propertyModel->save($data);

		if (!$isSaved) {
			$this->res->success = false;
			$this->res->titleError = 'Errors in validation';
			$this->res->messageError = $this->propertyModel->errors();

			$this->response
				->setStatusCode(200)
				->setHeader('Content-Type', 'application/json')
				->setBody($this->res->render());
			echo json_encode($this->response->getBody());
			return;
		} else {
			$this->res->success = true;
			$this->res->data = $this->propertyModel->getInsertID();

			$this->response
				->setStatusCode(201)
				->setHeader('Content-Type', 'application/json')
				->setBody($this->res->render());
			echo json_encode($this->response->getBody());
			return;
		}
	}

	public function edit()
	{
		$data = $this->request->getJSON();
		$isOk = $this->isUserOwner($data->id_user, $data->id_property);

		if ($isOk) {
			$this->propertyModel->update($data->id_property, $data);

			$this->res->success = true;

			$this->response
				->setStatusCode(200)
				->setHeader('Content-Type', 'application/json')
				->setBody($this->res->render());
			echo json_encode($this->response->getBody());
			return;
		} else {
			$this->res->messageError = 'Problems with updating. The user may not be the property owner or the property does not exist.';
		}

		$this->res->success = false;
		$this->res->titleError = 'Error in updating data';

		$this->response
			->setStatusCode(200)
			->setHeader('Content-Type', 'application/json')
			->setBody($this->res->render());
		echo json_encode($this->response->getBody());
		return;
	}

	private function isUserOwner($idUser, $idProperty)
	{
		$builder = $this->propertyUserModel->builder();

		$builder->select();
		$builder->where('id_user', $idUser);

		if (is_int($idProperty)) {
			$builder->where('id_property', $idProperty);
		} else {
			$builder->whereIn('id_property', $idProperty);
		}

		$data = $builder->get();
		$builder->resetQuery();

		return (empty($data->getResult())) ? false : true;
	}
}
