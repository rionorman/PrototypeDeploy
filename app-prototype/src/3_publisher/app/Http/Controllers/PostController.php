<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\RabbitMQController;


class PostController extends Controller
{

	public function index()
	{
		$rows = Post::orderby("updated_at", "Desc")->get();
		return view('post/postlist', ['rows' => $rows]);
	}

	public function create()
	{
		$rows = Category::orderby('category')->get();
		return view('post/postform', ['action' => 'insert', 'categories' => $rows]);
	}

	public function store(Request $request)
	{

		$this->validate($request, [
			'image' => 'required|mimes:jpg,png,jpeg',
		]);

		$image_ext = $request->image->extension();
		$image_name = time() . '.' . $request->image->extension();
		$request->image->move(public_path('images'), $image_name);

		// convert to base 64
		$image = 'data:@image/' . $image_ext . ';base64,' . base64_encode(file_get_contents(public_path('images/') . $image_name));

		$post = new Post;
		$post->user_id = Auth::user()->id;
		$post->cat_id = $request->cat_id;
		$post->title = $request->title;
		$post->content = $request->content;
		$post->image = $image_name;
		$post->save();

		//send data to RabbitMQ
		$postdata = [
			'user_id' => $post->user_id,
			'cat_id' => $post->cat_id,
			'title' => $post->title,
			'content' => $post->content,
			'image' => $image
		];
		
		$postdata =  json_encode($postdata);
		$mqService = new RabbitMQController();
		$mqService->send($postdata);

		return redirect('/post');
	}

	public function show($id)
	{
		$post = Post::find($id);
		return view('post/postform', ['row' => $post, 'action' => 'detail']);
	}

	public function edit($id)
	{
		$post = Post::find($id);
		$rows = Category::orderby('category')->get();

		return view('post/postform', ['row' => $post, 'action' => 'update', 'categories' => $rows]);
	}

	public function update(Request $request)
	{
		$post = Post::find($request->id);
		// $post->id = $request->id;
		$post->user_id = Auth::user()->id;
		$post->cat_id = $request->cat_id;
		$post->title = $request->title;
		$post->content = $request->content;
		if ($request->image != NULL) {
			$image = $post->image;
			$image_path = public_path('images' . '/' . $image);
			if (file_exists($image_path)) {
				unlink($image_path);
			}
			$imageName = time() . '.' . $request->image->extension();
			$request->image->move(public_path('images'), $imageName);
			$post->image = $imageName;
		}
		$post->save();
		return redirect('/post');
	}

	public function delete($id)
	{
		$post = Post::find($id);
		return view('post/postform', ['row' => $post, 'action' => 'delete']);
	}

	public function destroy($id)
	{
		$post = Post::find($id);
		$image = $post->image;
		$image_path = public_path('images/' . $image);
		if (file_exists($image_path)) {
			unlink($image_path);
		}
		$post->delete();
		return redirect('/post');
	}
}
