<?php

namespace App\Http\Controllers;

use App\Models\Post;
use PhpAmqpLib\Message\AMQPMessage;
use Illuminate\Support\Facades\File;
use PhpAmqpLib\Connection\AMQPStreamConnection;

class RabbitMQController extends Controller
{
	public function receive()
	{
		$connection = new AMQPStreamConnection(env('RMQ_URL'), 5672, 'user_proto', 'password_proto');
		$channel = $connection->channel();

		$channel->exchange_declare('post_data', 'fanout', false, false, false);

		list($queue_name,,) = $channel->queue_declare("subscriberB", false, false, true, false);

		$channel->queue_bind($queue_name, 'post_data');

		echo " [*] Waiting for messages. To exit press CTRL+C\n";

		$callback = function ($msg) {
			$post_data = json_decode($msg->body);
			echo " [x] Received Data\n";

			// image converting
			$ext = explode(';base64', $post_data->image);
			$ext = explode('/', $ext[0]);
			$ext = $ext[1];
			$image = str_replace('data:@image/' . $ext . ';base64,', '',  $post_data->image);
			$image = str_replace(' ', '+', $image);
			$image_name = time() . '.' . $ext;
			File::put(public_path('images') . '/' . $image_name, base64_decode($image));

			$post = new Post;
			$post->user_id =  $post_data->user_id;
			$post->cat_id = $post_data->cat_id;
			$post->title = $post_data->title;
			$post->content = $post_data->content;
			$post->image =  $image_name;
			$post->save();
		};

		$channel->basic_consume($queue_name, '', false, true, false, false, $callback);

		while ($channel->is_open()) {
			$channel->wait();
		}

		$channel->close();
		$connection->close();
	}
}

