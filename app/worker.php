<?php

use Phalcon\Di\FactoryDefault;
use Phalcon\Mvc\Micro;

$di = new FactoryDefault();
$app = new Micro($di);

$worker = new GearmanWorker();
$worker->addServer();


$worker->addFunction("send_new_order", function(GearmanJob $job) use (&$app, &$di) {

    $data = unserialize($job->workload());
    //access Phalcon model
    $order = Orders::findFirstById($job->workload($data->order_id));
    $driver_id = $data->driver_id;
    echo "Sending order: $order->id \n";
    $result = push($order->id, $driver_id);  // отправляем водителю новый заказ на принятие
    $job->sendStatus($result);
});

while ($worker->work());