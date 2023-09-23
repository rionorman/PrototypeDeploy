<?php

namespace App\Http\Controllers;

use App\Models\Post;
use PhpAmqpLib\Message\AMQPMessage;
use PhpAmqpLib\Connection\AMQPStreamConnection;

class RabbitMQController extends Controller
{
	public function send_category($categorydata)
	{
		$connection = new AMQPStreamConnection(env('RMQ_URL'), 5672, 'user_proto', 'password_proto');
		$channel = $connection->channel();

		$msg = new AMQPMessage($categorydata);
		$exchange_name = 'category_pdb';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->basic_publish($msg, $exchange_name);

		$exchange_name = 'category_pdb';
		$queue_name = 'cat_cd';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->queue_declare($queue_name, false, true, false, false);
		$channel->queue_bind($queue_name, $exchange_name);

		$channel->close();
		$connection->close();
		return 1;
	}

	public function send_post($postdata)
	{
		$connection = new AMQPStreamConnection(env('RMQ_URL'), 5672, 'user_proto', 'password_proto');
		$channel = $connection->channel();

		$msg = new AMQPMessage($postdata);
		$exchange_name = 'post_pdb';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->basic_publish($msg, $exchange_name);

		$queue_name = 'post_cd';
		$exchange_name = 'post_pdb';
		$channel->exchange_declare($exchange_name, 'fanout', false, true, false);
		$channel->queue_declare($queue_name, false, true, false, false);
		$channel->queue_bind($queue_name, $exchange_name);

		$channel->close();
		$connection->close();
		return 1;
	}
}
