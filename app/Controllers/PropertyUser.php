<?php

namespace App\Controllers;

use App\Entities\ResponseEntity;
use App\Models\PropertyUserModel;

class PropertyUser extends BaseController
{
	protected $propertyUserModel;
	protected $res;
	protected $sql;

	public function __construct()
	{
		$this->propertyUserModel = new PropertyUserModel();
		$this->res = new ResponseEntity();
	}

	public function index()
	{
		$sql = $this->sqlCompiled();

		$db = db_connect('airbnb');
		$data = $db->query($sql)->getResultObject();

		$this->res->success = true;
		$this->res->data = $data;

		$this->response
			->setStatusCode(200)
			->setHeader('Content-Type', 'application/json')
			->setBody($this->res->render());

		echo json_encode($this->response->getBody());
	}

	public function insert()
	{
		$data = $this->request->getJSON();

		$isSaved = $this->propertyUserModel->insert($data);

		if (!is_int($isSaved)) {
			$this->res->success = false;
			$this->res->titleError = 'Errors in validation';
			$this->res->messageError = $this->propertyUserModel->errors();

			$this->response
				->setStatusCode(200)
				->setHeader('Content-Type', 'application/json')
				->setBody($this->res->render());
			echo json_encode($this->response->getBody());
			return;
		} else {
			$this->res->success = true;

			$this->response
				->setStatusCode(201)
				->setHeader('Content-Type', 'application/json')
				->setBody($this->res->render());
			echo json_encode($this->response->getBody());
			return;
		}
	}

	public function delete()
	{
		$this->updateStatus(0, $this->request->getJSON());
	}

	public function restore()
	{
		$this->updateStatus(1, $this->request->getJSON());
	}

	public function deletePermanent()
	{
		$this->updateStatus(2, $this->request->getJSON());
	}

	public function byUser(int $id, string $order = 'DESC')
	{
		$sql = $this->sqlCompiled(['user' => $id, 'price' => $order]);

		$db = db_connect('airbnb');
		$data = $db->query($sql)->getResultObject();

		$this->res->success = true;
		$this->res->data = $data;

		$this->response
			->setStatusCode(201)
			->setHeader('Content-Type', 'application/json')
			->setBody($this->res->render());

		echo json_encode($this->response->getBody());
	}

	public function byPrice(string $order)
	{
		$sql = $this->sqlCompiled(['price' => $order]);

		$db = db_connect('airbnb');
		$data = $db->query($sql)->getResultObject();

		$this->res->success = true;
		$this->res->data = $data;

		$this->response
			->setStatusCode(201)
			->setHeader('Content-Type', 'application/json')
			->setBody($this->res->render());

		echo json_encode($this->response->getBody());
	}

	private function sqlCompiled(array $orderBy = null)
	{
		$builder = $this->propertyUserModel->builder();

		$builder->select('document_type.document_type, user.user_identification, user.user_name, user.user_lastname, property.property_title, property_type.property_type, property.property_address, property.property_area, property.property_rooms, property.property_price, property.property_description');
		$builder->join('user', 'property_user.id_user = user.id_user', 'INNER');
		$builder->join('property', 'property_user.id_property = property.id_property', 'INNER');
		$builder->join('document_type', 'document_type.id_document_type = user.id_document_type', 'INNER');
		$builder->join('property_type', 'property_type.id_property_type = property.id_property_type', 'INNER');
		$builder->where('user.user_is_active', 1);
		$builder->where('property_user.property_user_is_active', 1);

		if (!empty($orderBy)) {
			foreach ($orderBy as $key => $value) {
				switch ($key) {
					case 'user':
						$builder->where('user.id_user', $value);
						break;
					case 'price':
						if (strcmp($value, 'desc') == 0 or strcmp($value, 'asc') == 0) {
							$builder->orderBy("property.property_price " . strtoupper($value));
						} else {
							$builder->orderBy("property.property_price DESC");
						}
						break;
				}
			}
		}

		return $builder->getCompiledSelect();
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

	private function updateStatus(int $isActive, object $data)
	{
		$builder = $this->propertyUserModel->builder();

		foreach ($data as $key => $value) {
			if (empty($value) or is_string($value)) {
				$this->res->messageError = 'There are empty fields or invalid data types';
				goto finalize;
			}
		}

		$isOwner = $this->isUserOwner($data->id_user, $data->id_property);

		if ($isOwner) {
			if ($isActive > 1) {
				$this->propertyUserModel->delete($data->id_property);
			} else {

				$builder->set('property_user_is_active', $isActive);
				$builder->where('id_user', $data->id_user);

				if (is_integer($data->id_property)) {
					$builder->where('id_property', $data->id_property);
				} else {
					$builder->whereIn('id_property', $data->id_property);
				}

				$builder->update();
				$builder->resetQuery();
			}

			$this->res->success = true;

			$this->response
				->setStatusCode(200)
				->setHeader('Content-Type', 'application/json')
				->setBody($this->res->render());

			echo json_encode($this->response->getBody());
			return;
		} else {
			switch ($isActive) {
				case 0:
					$this->res->messageError = 'Problems with deleting. The user may not be the property owner or the property does not exist.';
					goto finalize;
					break;
				case 1:
					$this->res->messageError = 'Problems with restoring. The user may not be the property owner or the property does not exist.';
					goto finalize;
					break;
				case $isActive > 1:
					$this->res->messageError = 'The user does not own the property or the property does not exist, therefore, you will not be able to delete';
					goto finalize;
					break;
				default:
					break;
			}
		}

		finalize: $this->res->success = false;
		$this->res->titleError = 'Process error';

		$this->response
			->setStatusCode(200)
			->setHeader('Content-Type', 'application/json')
			->setBody($this->res->render());

		echo json_encode($this->response->getBody());
		return;
	}
}
