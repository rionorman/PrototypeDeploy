<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;


class SearchController extends Controller
{
    public function searching()
    {
        return view("search.searching");
    }

    public function quering(Request $request)
    {
        $keyword = $request->keyword;
        $response = Http::get(env('MIN_URL') . '/searchnews'. '/' . $keyword);
        $data = json_decode($response->body(), true);
        $posts = [];
        foreach ($data as $post) {
            if (isset($post['id'])) {
                array_push($posts, $post);
            } else if (isset($post)) {
                $posts = array_merge($posts, $post);
            }
        }
        // dd(count($posts));
        return view("search.searching", ["posts" => $posts, "keyword" => $keyword]);
    }
}
