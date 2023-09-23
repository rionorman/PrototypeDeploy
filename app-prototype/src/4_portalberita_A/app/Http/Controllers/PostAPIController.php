<?php

namespace App\Http\Controllers;

use App\Models\Post;
use Illuminate\Http\Request;

class PostAPIController extends Controller
{
	public function storeAPI(Request $request)
	{

		$post = new Post;
		$post->user_id = $request->user_id;
		$post->cat_id = $request->cat_id;
		$post->title = $request->title;
		$post->content = $request->content;
		$post->image = $request->image_name;

		$post->save();
		return response()->json([
			'success' => 1,
			'data' => $post
		]);
	}

	public function searchPostAPI($search)
	{
		$posts = Post::select('id', 'title', 'content', 'image', 'updated_at')
			->where('content', 'like', '%' . $search . '%')->get();
		foreach ($posts as $post) {
			$post->content = substr($post->content, 0, 150);
			$post->url =  env('APP_URL') . '/detail' .'/'. $post->id;
			$post->image_url = env('APP_URL') . '/images' .'/'. $post->image;
			$post->sumber = 'Portal Berita A';
		}
		return response()->json([
			'success' => 1,
			'data' => $posts
		]);
	}
}
