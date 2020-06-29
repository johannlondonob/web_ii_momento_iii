<?php

namespace App\Models;

use CodeIgniter\Model;

class PropertyModel extends Model
{
    protected $DBGroup = 'airbnb';
    protected $table      = 'property';
    protected $primaryKey = 'id_property';

    protected $returnType     = 'object';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['id_property', 'property_title', 'property_address', 'property_rooms', 'id_property_type', 'property_price', 'property_description', 'property_is_active', 'property_area'];

    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    protected $validationRules = [
        'property_title' => 'required|min_length[10]|max_length[100]|alpha_space',
        'property_address' => 'required|min_length[10]|max_length[100]|alpha_numeric_punct',
        'property_area' => 'required|greater_than[0]|numeric',
        'property_rooms' => 'required|is_natural',
        'property_price' => 'required|greater_than_equal_to[30000]',
        'property_description' => 'required|min_length[8]|max_length[500]',
        'property_is_active' => 'min_length[1]|is_natural',
        'id_property_type' => 'required|is_not_unique[property_type.id_property_type,id_property_type,{id_property_type}]',
    ];

    protected $validationMessages = [
        'property_title' => [
            'required' => 'Your property title, please.',
            'min_length' => 'Your property title must contain a minimum of 10 characters.',
            'max_length' => 'Your property title cannot exceed 100 characters.',
            'alpha_space' => 'Your property title cannot contain special characters or accents.'
        ],
        'property_address' => [
            'required' => 'Your property address, please.',
            'min_length' => 'Your property address must contain a minimum of 10 characters.',
            'max_length' => 'Your property address cannot exceed 100 characters.',
            'alpha_numeric_punct' => 'Your property address maybe contain special characters or accents.'
        ],
        'property_area' => [
            'required' => 'Your property area, please.',
            'greater_than' => 'The area of property must be numeric and greater than zero',
        ],
        'property_rooms' => [
            'required' => 'Your number of rooms on the property, please.',
            'is_natural' => 'Your number of rooms on the property must be zero or more.',
        ],
        'id_property_type' => [
            'required' => 'The property type, please.',
            'is_not_unique' => 'The property type provided does not exist.',
        ],
        'property_price' => [
            'required' => 'The value of the property, please.',
            'greater_than_equal_to' => 'The value of the property must be greater than 30000.',
        ],
        'property_description' => [
            'required' => 'Your property description, please.',
            'min_length' => 'Your property description must contain a minimum of 8 characters.',
            'max_length' => 'Your property description cannot exceed 100 characters.',
        ],
    ];
}
