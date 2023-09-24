<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class PostController extends Controller
{

	public function index()
	{
		// $response = Http::get(env('DOC_URL').'/api/indexPostAPI');
		// $response = Http::get('http://localhost:8290/postAPI/indexPostAPI');
		$response = Http::get(env('MIN_URL').'/postAPI/indexPostAPI');
		$response = (json_decode($response, true));
		if ($response != NULL) {
			return view('post/postlist', ['rows' => $response['data']]);
		} else {
			dd('Error');
		}
	}

	public function create()
	{
		// $response = Http::get(env('DOC_URL').'/api/getCategoriesAPI');
		// $response = Http::get('http://localhost:8290/postAPI/getCategoriesAPI');
		$response = Http::get(env('MIN_URL').'/postAPI/getCategoriesAPI');
		
		$response = (json_decode($response, true));
		$categories = $response['data'];

		return view('post/postform', ['action' => 'insert', 'categories' => $categories]);
	}

	public function store(Request $request)
	{
		// $url_api = env('DOC_URL').'/api/storePostAPI';
		// $url_api = 'http://nginx_proto:8002/api/storePostAPILsg';
		$url_api = env('MIN_URL').'/postAPI/storePostAPI';
		
		$this->validate($request, [
			'title' => 'required',
			'content' => 'required',
			'image' => 'required|mimes:jpg',
		]);

		$image_ext = $request->image->extension();
		$image_name = time() . '.' . $image_ext;
		$request->image->move(public_path('images'), $image_name);
		$image = 'data:@image/' . $image_ext . ';base64,' . base64_encode(file_get_contents(public_path('images/') . $image_name));

		$response = Http::asForm()->withHeaders([
			'Authorization' => 'token',
			'Content-Type' =>  'multipart/form-data; boundary='.strval(rand()),
			'Accept' => '*/*',
			'Connection' => 'keep-alive',
			'Accept-Encoding' => 'gzip, deflate, br'
			])->post($url_api, [
			'id' => $request->id,
			'user_id' => $request->user_id,
			'cat_id' => $request->cat_id,
			'title' => $request->title,
			'content' => $request->content,
			'image' => $image
		]);

		$response = (json_decode($response, true));
		
		if ($response['success']) {
			$image_path = public_path('images/' . $image_name);
			if (file_exists($image_path)) {
				unlink($image_path);
			}
			return redirect('/post');
		}
	}

	public function show($id)
	{
		// $response = Http::get(env('DOC_URL').'/api/showPostAPI/' . $id);
		// $response = Http::get('http://localhost:8290/postAPI/showPostAPI/' . $id);
		$response = Http::get(env('MIN_URL').'/postAPI/showPostAPI/' . $id);
		$response = (json_decode($response, false));
		$post = $response->data;
		
		return view('post/postform', ['row' => $post, 'action' => 'detail']);
	}

	public function edit($id)
	{
		// $response = Http::get(env('DOC_URL').'/api/showPostAPI/' . $id);
		// $response = Http::get('http://localhost:8290/postAPI/showPostAPI/' . $id);
		$response = Http::get(env('MIN_URL').'/postAPI/showPostAPI/' . $id);
		$response = (json_decode($response, false));
		$post = $response->data;

		// $response = Http::get(env('DOC_URL').'/api/getCategoriesAPI');
		// $response = Http::get('http://localhost:8290/postAPI/getCategoriesAPI');
		$response = Http::get(env('MIN_URL').'/postAPI/getCategoriesAPI');

		$response = (json_decode($response, true));
		$rows = $response['data'];

		return view('post/postform', ['row' => $post, 'action' => 'update', 'categories' => $rows]);
	}

	public function update(Request $request)
	{
		// $url_api = env('DOC_URL').'/api/updatePostAPI';
		// $url_api = 'http://localhost:8290/postAPI/updatePostAPI';
		$url_api = env('MIN_URL').'/postAPI/updatePostAPI';

		$this->validate($request, [
			'title' => 'required',
			'content' => 'required'
		]);

		if ($request->image != NULL) {

			$image_ext = $request->image->extension();
			$image_name = time() . '.' . $image_ext;
			$request->image->move(public_path('images'), $image_name);
			$image = 'data:@image/' . $image_ext . ';base64,' . base64_encode(file_get_contents(public_path('images/') . $image_name));

			$response = Http::asForm()->post($url_api, [
				'id' => $request->id,
				'user_id' => $request->user_id,
				'cat_id' => $request->cat_id,
				'title' => $request->title,
				'content' => $request->content,
				'image' => $image
			]);

			$image_path = public_path('images/' . $image_name);
			if (file_exists($image_path)) {
				unlink($image_path);
			}
		} else {
			$response = Http::post($url_api, [
				'id' => $request->id,
				'user_id' => $request->user_id,
				'cat_id' => $request->cat_id,
				'title' => $request->title,
				'content' => $request->content
			]);
		}

		return redirect('/post');
	}

	public function delete($id)
	{
		// $response = Http::get(env('DOC_URL').'/api/showPostAPI/' . $id);
		// $response = Http::get('http://localhost:8290/postAPI/showPostAPI/' . $id);
		$response = Http::get(env('MIN_URL').'/postAPI/showPostAPI/' . $id);

		$response = (json_decode($response, false));
		$post = $response->data;

		return view('post/postform', ['row' => $post, 'action' => 'delete']);
	}

	public function destroy($id)
	{
		// Http::post(env('DOC_URL').'/api/destroyPostAPI/' . $id);
		// Http::post('http://localhost:8290/postAPI/destroyPostAPI/' . $id);
		Http::get(env('MIN_URL').'/postAPI/destroyPostAPI/' . $id);

		return redirect('/post');
	}
}
