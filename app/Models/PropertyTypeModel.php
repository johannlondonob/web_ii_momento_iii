<?php

namespace App\Models;

use CodeIgniter\Model;

class PropertyTypeModel extends Model
{
    protected $DBGroup = 'airbnb';
    protected $table      = 'property_type';
    protected $primaryKey = 'id_property_type';

    protected $returnType     = 'object';
    protected $useSoftDeletes = false;

    protected $useTimestamps = false;
}
