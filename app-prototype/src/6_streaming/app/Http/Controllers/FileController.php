<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FileController extends Controller
{
    public function form()
    {
        return view('upload/formcsv');
    }
}
