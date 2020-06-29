<?php

namespace App\Models;

use CodeIgniter\Model;

class DocumentTypeModel extends Model
{
    protected $DBGroup = 'airbnb';
    protected $table      = 'document_type';
    protected $primaryKey = 'id_document_type';

    protected $returnType     = 'object';
    protected $useSoftDeletes = false;

    protected $useTimestamps = false;
}
