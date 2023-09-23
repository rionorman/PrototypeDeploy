<?php

namespace App\Http\Controllers;

use App\Models\Post;
use PhpAmqpLib\Message\AMQPMessage;
use PhpAmqpLib\Connection\AMQPStreamConnection;

class RabbitMQController extends Controller
{
	public function send($postdata)
	{
		$connection = new AMQPStreamConnection(env('RMQ_URL'), 5672, 'user_proto', 'password_proto');
		$channel = $connection->channel();

		$channel->exchange_declare('post_data', 'fanout', false, false, false);

		$msg = new AMQPMessage($postdata);

		$channel->basic_publish($msg, 'post_data');

		// echo " [x] Sent : " . $postdata . "\n";

		$channel->close();
		$connection->close();
		return 1;
	}
}
