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
		$post->id = generate_uuid();
		$post->user_id = Auth::user()->id;
		$post->cat_id = $request->cat_id;
		$post->title = $request->title;
		$post->content = $request->content;
		$post->image = $image_name;
		$post->save();

		$postdata = [
			'id' => $post->id,
			'user_id' => $post->user_id,
			'cat_id' => $post->cat_id,
			'title' => $post->title,
			'content' => $post->content,
			'image_name' => $image_name,
			'image' => $image,
			'action' => 'insert'
		];

		$postdata =  json_encode($postdata);
		$mqService = new RabbitMQController();
		$mqService->send_post($postdata);

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
		$post->user_id = Auth::user()->id;
		$post->cat_id = $request->cat_id;
		$post->title = $request->title;
		$post->content = $request->content;


		$postdata = [
			'id' => $post->id,
			'user_id' => $post->user_id,
			'cat_id' => $post->cat_id,
			'title' => $post->title,
			'content' => $post->content,
			'image' => null,
			'action' => 'update'
		];

		if ($request->image != NULL) {
			$image = $post->image;
			$image_path = public_path('images' . '/' . $image);
			if (file_exists($image_path)) {
				unlink($image_path);
			}
			$image_ext = $request->image->extension();
			$image_name = time() . '.' . $image_ext;
			$request->image->move(public_path('images'), $image_name);
			$post->image = $image_name;

			$image = 'data:@image/' . $image_ext . ';base64,' . base64_encode(file_get_contents(public_path('images/') . $image_name));
			$postdata['image_name'] = $image_name;
			$postdata['image'] = $image;
		}

		$postdata =  json_encode($postdata);
		$mqService = new RabbitMQController();
		$mqService->send_post($postdata);

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
		$image_path = public_path('images/' . $image[4]);
		if (file_exists($image_path)) {
			unlink($image_path);
		}

		$postdata = [
			'id' => $post->id,
			'action' => 'delete'
		];
		$postdata =  json_encode($postdata);
		$mqService = new RabbitMQController();
		$mqService->send_post($postdata);


		$post->delete();
		return redirect('/post');
	}
}
