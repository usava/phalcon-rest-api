<?php
/**
 * Local variables
 * @var \Phalcon\Mvc\Micro $app
 */

/**
 * Add your routes here
 */

use Phalcon\Mvc\Micro\Collection as MicroCollection;

// Обработчик Users
$users = new MicroCollection();
$users->setHandler(new UsersController());
$users->setPrefix('/apiv1');
$users->post('/auth', 'auth');
$users->post('/registration', 'registration');
$app->mount($users);

// Обработчик Orders
$orders = new MicroCollection();
$orders->setHandler(new OrdersController());
$orders->setPrefix('/apiv1');
$orders->put('/setOrderStatus', 'setStatus');
$orders->post('/addOrder', 'add');
$app->mount($orders);

$map = new MicroCollection();
$map->setHandler(new MapController());
$map->setPrefix('/apiv1');
$map->get('/getMapInfo', 'getInfo');
$app->mount($map);

$app->get('/',
    function () {
        echo $this['view']->render('index');
    }
);


/**
 * Not found handler
 */
$app->notFound(function () use($app) {
    $app->response->setStatusCode(404, "Not Found")->sendHeaders();
    echo '{"error":"Method is not defined"}';
});
