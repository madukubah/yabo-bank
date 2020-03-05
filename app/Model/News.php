<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    public const PHOTO_PATH = "uploads/news";
    protected $fillable = [
		'id',
		'title',
		'image',
		'preview',
		'file_content',
	];
	
	public static function getFormData(  )
    {
        
        $form =  [
            'id' => [
				'type' => 'hidden',
            ],
            'title' => [
                'type' => 'text',
				'label' => 'Judul',
				// 'value' => 'asdf'
            ],
            'image' => [
                'type' => 'file',
                'label' => 'Gambar',

            ],
            'preview' => [
                'type' => 'text',
				'label' => 'Preview',
				// 'value' => 'asdf'
				
            ],
            'file_content' => [
                'type' => 'summernote',
				'label' => 'Isi',
				// 'value' => 'asdf'
				
            ],
        ];

        return $form;
    }
}
