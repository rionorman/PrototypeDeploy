<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Http\Controllers\RabbitMQController;

class CategoryConsumerCommand extends Command
{
	/**
	 * The name and signature of the console command.
	 *
	 * @var string
	 */
	protected $signature = 'app:category-consumer-command';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Command description';

	/**
	 * Execute the console command.
	 */
	public function handle()
	{
		$mqService = new RabbitMQController();
		$mqService->receive_category();
	}
}
