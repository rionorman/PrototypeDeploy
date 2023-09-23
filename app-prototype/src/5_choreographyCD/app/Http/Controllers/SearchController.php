<?php

namespace App\Http\Controllers;

use App\Models\Post;
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
		$posts = Post::where('content', 'like', '%' . $keyword . '%')->get();
		// dd(count($posts));
		return view("search.searching", ["posts" => $posts, "keyword" => $keyword]);
	}
}
