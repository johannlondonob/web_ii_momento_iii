<?php

namespace App\Models;

use CodeIgniter\Model;

class PropertyUserModel extends Model
{
    protected $DBGroup = 'airbnb';
    protected $table      = 'property_user';
    protected $primaryKey = 'id_property';

    protected $returnType     = 'object';
    protected $useSoftDeletes = false;

    protected $allowedFields = ['id_user', 'id_property', 'property_user_is_active'];

    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';

    protected $validationRules    = [
        'id_user' => 'required|greater_than[0]|is_not_unique[user.id_user,id_user,{id_user}]',
        'id_property' => 'required|greater_than[0]|is_not_unique[property.id_property,id_property,{id_property}]|is_unique[property_user.id_property,id_property]',
    ];
    protected $validationMessages = [
        'id_user' => [
            'required' => 'The user id is required',
            'greater_than' => 'User id must be numeric and greater than zero',
            'is_not_unique' => 'The user is not registered',
        ],
        'id_property' => [
            'required' => 'The property id is required',
            'greater_than' => 'Property id must be numeric and greater than zero',
            'is_unique' => 'The property already has an owner',
            'is_not_unique' => 'The property is not registered'
        ],
    ];

    protected $skipValidation     = false;
}
