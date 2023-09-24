<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class FrontendController extends Controller
{
    public function beranda()
    {
        // $response = Http::get(env('DOC_URL').'/api/indexPostAPI');
        // $response = Http::get('http://192.168.1.8:8002/api/indexPostAPI');
        $response = Http::get(env('MIN_URL').'/postAPI/indexPostAPI');
        $response = (json_decode($response, false));
        $rows = $response->data;
        return view('frontend/beranda', ['rows' => $rows]);
    }

    public function detail($id)
    {
        // $response = Http::get(env('DOC_URL').'/api/showPostAPI/' . $id);
        // $response = Http::get('http://localhost:8290/postAPI/showPostAPI/' . $id);
        $response = Http::get(env('MIN_URL').'/postAPI/showPostAPI/' . $id);
        $response = (json_decode($response, false));
        $row = $response->data;
        return view('frontend/detail', ['row' => $row]);
    }
}
