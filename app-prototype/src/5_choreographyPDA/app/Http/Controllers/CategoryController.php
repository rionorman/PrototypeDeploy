<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{

	public function index()
	{
		$rows = Category::all();
		return view('category/categorylist', ['rows' => $rows]);
	}

	public function create()
	{
		return view('category/categoryform', ['action' => 'insert']);
	}

	public function store(Request $request)
	{
		$category = new Category;
		$category->id = generate_uuid();
		$category->category = $request->category;
		$category->save();

		$category_data = [
			'id' => $category->id,
			'category' => $category->category,
			'action' => 'insert'
		];

		$category_data = json_encode($category_data);
		$mqService = new RabbitMQController();
		$mqService->send_category($category_data);
		return redirect('/category');
	}

	public function show($id)
	{
		$category = Category::find($id);
		return view('category/categoryform', ['row' => $category, 'action' => 'detail']);
	}

	public function edit($id)
	{
		$category = Category::find($id);
		return view('category/categoryform', ['row' => $category, 'action' => 'update']);
	}

	public function update(Request $request)
	{
		$category = Category::find($request->id);
		$category->category = $request->category;
		$category->save();

		$category_data = [
			'id' => $category->id,
			'category' => $category->category,
			'action' => 'update'
		];

		$category_data = json_encode($category_data);
		$mqService = new RabbitMQController();
		$mqService->send_category($category_data);

		return redirect('/category');
	}

	public function delete($id)
	{
		$category = Category::find($id);
		return view('category/categoryform', ['row' => $category, 'action' => 'delete']);
	}

	public function destroy($id)
	{
		$category = Category::find($id);
		$category->delete();

		$category_data = [
			'id' => $category->id,
			'action' => 'delete'
		];

		$category_data = json_encode($category_data);
		$mqService = new RabbitMQController();
		$mqService->send_category($category_data);

		return redirect('/category');
	}
}
