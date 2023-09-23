<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    public $primaryKey  = 'id';
    protected $table = 'posts';
    public $incrementing = false;

    protected $fillable = [
        'user_id', 'cat_id', 'title', 'content', 'image'
    ];

    function username()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    function category()
    {
        return $this->belongsTo('App\Models\Category', 'cat_id');
    }
}
