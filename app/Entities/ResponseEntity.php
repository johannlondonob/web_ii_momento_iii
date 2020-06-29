<?php

namespace App\Entities;

final class ResponseEntity
{
    public $success;
    public $data = [];
    public $titleError;
    public $messageError;

    public function render()
    {
        return [
            'res' => [
                'success' => $this->success,
                'data' => $this->data,
                'error' => [
                    'title' => $this->titleError,
                    'message' => $this->messageError
                ]
            ]
        ];
    }
}
