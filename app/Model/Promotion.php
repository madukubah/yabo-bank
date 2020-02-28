<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Promotion extends Model
{
    public const PHOTO_PATH = "uploads/iklan";
    protected $fillable = [
		'id',
		'image',
    ];
}
