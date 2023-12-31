<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;

    public $primaryKey  = 'id';
    protected $table = 'categories';
    public $incrementing = false;

    protected $fillable = [
        'category'
    ];

    public function posts()
    {
        return $this->hasMany('App\Post', 'cat_id');
    }
}
