<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Category;
use Illuminate\Support\Facades\File;
use PhpAmqpLib\Connection\AMQPStreamConnection;


class RabbitMQController extends Controller
{
	public function receive_category()
	{
		$connection = new AMQPStreamConnection(env('RMQ_URL'), 5672, 'user_proto', 'password_proto');
		$channel = $connection->channel();

		$exchange_name = 'category_pda';
		$queue_name = 'cat_cd';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->queue_declare($queue_name, false, true, false, false);
		$channel->queue_bind($queue_name, $exchange_name);

		$exchange_name = 'category_pdb';
		$queue_name = 'cat_cd';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->queue_declare($queue_name, false, true, false, false);
		$channel->queue_bind($queue_name, $exchange_name);

		$exchange_name = 'category_pdc';
		$queue_name = 'cat_cd';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->queue_declare($queue_name, false, true, false, false);
		$channel->queue_bind($queue_name, $exchange_name);

		$callback = function ($msg) {
			$category_data = json_decode($msg->body);
			echo " [x] Received Data \n";
			if ($category_data->action == 'insert') {
				$category = new Category;
				$category->id = $category_data->id;
				$category->category = $category_data->category;
				$category->save();
			} else if ($category_data->action == 'update') {
				$category = Category::find($category_data->id);
				if($category){
					$category->category = $category_data->category;
					$category->save();
				}
			} else if ($category_data->action == 'delete') {
				$category = Category::find($category_data->id);
				if($category)	$category->delete();
			}
		};
		$channel->basic_consume($queue_name, '', false, true, false, false, $callback);

		echo " [*] Waiting for messages. To exit press CTRL+C\n";
		while ($channel->is_open()) {
			$channel->wait();
		}

		$channel->close();
		$connection->close();
	}

	public function receive_post()
	{
		$connection = new AMQPStreamConnection(env('RMQ_URL'), 5672, 'user_proto', 'password_proto');
		$channel = $connection->channel();

		$queue_name = 'post_cd';
		$exchange_name = 'post_pda';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->queue_declare($queue_name, false, true, false, false);
		$channel->queue_bind($queue_name, $exchange_name);

		$exchange_name = 'post_pdb';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->queue_declare($queue_name, false, true, false, false);
		$channel->queue_bind($queue_name, $exchange_name);

		$exchange_name = 'post_pdc';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->queue_declare($queue_name, false, true, false, false);
		$channel->queue_bind($queue_name, $exchange_name);

		$callback = function ($msg) {
			$post_data = json_decode($msg->body);
			echo " [x] Received Data \n";
			if ($post_data->action == 'insert') {

				$ext = explode(';base64', $post_data->image);
				$ext = explode('/', $ext[0]);
				$ext = $ext[1];
				
				$image = str_replace('data:@image/' . $ext . ';base64,', '',  $post_data->image);
				$image = str_replace(' ', '+', $image);
				$image_name = time() . '.' . $ext;
				File::put(public_path('images') . '/' . $image_name, base64_decode($image));

				$post = new Post;
				$post->id = $post_data->id;
				$post->user_id = $post_data->user_id;
				$post->cat_id = $post_data->cat_id;
				$post->title = $post_data->title;
				$post->content = $post_data->content;
				$post->image = $image_name;
				$post->save();
			} else if ($post_data->action == 'update') {
				$post = Post::find($post_data->id);
				if($post){
					$post->user_id = $post_data->user_id;
					$post->cat_id = $post_data->cat_id;
					$post->title = $post_data->title;
					$post->content = $post_data->content;

					if ($post_data->image != null) {
						// delete file exist
						$image = $post->image;
						$image_path = public_path('images' . '/' . $image[4]);
						if (file_exists($image_path)) {
							unlink($image_path);
						}

						// add new file
						$ext = explode(';base64', $post_data->image);
						$ext = explode('/', $ext[0]);
						$ext = $ext[1];
						
						$image = str_replace('data:@image/' . $ext . ';base64,', '',  $post_data->image);
						$image = str_replace(' ', '+', $image);
						$image_name = time() . '.' . $ext;
						File::put(public_path('images') . '/' . $image_name, base64_decode($image));

						$post->image = $image_name;
					}
					$post->save();
				}
			} else if ($post_data->action == 'delete') {
				$post = Post::find($post_data->id);
				if($post){
					// delete file exist
					$image = $post->image;
					$image_path = public_path('images' . '/' . $image[4]);
					if (file_exists($image_path)) {
						unlink($image_path);
					}
					$post->delete();
				}
			}
		};
		$channel->basic_consume($queue_name, '', false, true, false, false, $callback);

		echo " [*] Waiting for messages. To exit press CTRL+C\n";
		while ($channel->is_open()) {
			$channel->wait();
		}

		$channel->close();
		$connection->close();
	}
}
