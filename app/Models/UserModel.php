<?php

namespace App\Models;

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $DBGroup = 'airbnb';
    protected $table      = 'user';
    protected $primaryKey = 'id_user';

    protected $returnType     = 'object';
    protected $useSoftDeletes = true;

    protected $allowedFields = ['user_name', 'user_lastname', 'user_email', 'id_document_type', 'user_identification', 'user_password'];

    protected $useTimestamps = true;
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    protected $validationRules = [
        'user_name' => 'required|min_length[2]|max_length[40]|alpha_space',
        'user_lastname' => 'required|min_length[2]|max_length[40]|alpha_space',
        'user_email' => 'required|valid_email|is_unique[user.user_email]|max_length[100]',
        'id_document_type' => 'required|is_not_unique[document_type.id_document_type,id_document_type,{id_document_type}]',
        'user_identification' => 'required|min_length[8]|max_length[15]|alpha_numeric_space',
        'user_password' => 'required|min_length[8]|max_length[16]|regex_match[(?=(?:.*[!@#$%^&*?¿()\-_=+{};:,<.>]){2,})]',
        'user_is_active' => 'min_length[1]'
    ];

    protected $validationMessages = [
        'user_name' => [
            'required' => 'Your name, please.',
            'min_length' => 'Your name must contain a minimum of 2 characters.',
            'max_length' => 'Your name cannot exceed 40 characters.',
            'alpha_space' => 'Your name cannot contain special characters or accents.'
        ],
        'user_lastname' => [
            'required' => 'Your lastname, please.',
            'min_length' => 'Your lastname must contain a minimum of 2 characters.',
            'max_length' => 'Your lastname cannot exceed 40 characters.',
            'alpha_space' => 'Your lastname cannot contain special characters or accents.'
        ],
        'user_email' => [
            'required' => 'Your email, please.',
            'valid_email' => 'Your email must be valid',
            'is_unique' => 'Your email is already registered.',
            'max_length' => 'Your password cannot exceed 100 characters.',
        ],
        'id_document_type' => [
            'required' => 'Your document type, please.',
            'is_not_unique' => 'The document type provided does not exist'
        ],
        'user_identification' => [
            'required' => 'Your identification, please.',
            'min_length' => 'Your identification must contain a minimum of 10 characters.',
            'max_length' => 'Your identification cannot exceed 15 characters.',
        ],
        'user_password' => [
            'required' => 'Your password, please.',
            'min_length' => 'Your password must contain a minimum of 8 characters.',
            'max_length' => 'Your password cannot exceed 16 characters.',
            'regex_match' => 'Your password must contain a minimum of 2 special characters.'
        ],
    ];
}
