<?php
ini_set('display_errors',1);
use Phalcon\Mvc\Controller;

class OrdersController extends Controller
{

    public function add()
    {
        if ($this->request->isPost()) {
            $response = array();

            $data = $this->request->getPost();

            $user = Users::findFirstById($data['passanger_id']);
            if(!$user){
                return $response['error'][] = "User id not found";
            }

            $order = new Orders();
            if ( $data['access_token'] === $user->access_token ) {

                $order->passanger_id = $data['passanger_id'];
                $order->car_id = $data['car_id'];
                $order->pass_count = $data['pass_count'];
                $order->user_location = json_encode($data['user_location']);
                $order->route_points = json_encode($data['route_points']);
                $order->wishlist_option_id = json_encode($data['wishlist_option_id']);
                $order->driver_id = $data['driver_id'];
                $order->country_id = $data['country_id'];
                $order->pass_phone = $data['pass_phone'];
                $order->region_id = $data['region_id'];
                $order->start_time = $data['start_time'];
                $order->callme = $data['callme'];
                $order->large = $data['large'];
                $order->pets = $data['pets'];
                $order->baby_chair = $data['baby_chair'];
                $order->payment_type_id = $data['payment_type_id'];
                $order->deffered_payment = $data['deffered_payment'];
                $order->duration = $data['duration'];
                $order->extension = $data['extension'];
                $order->comment = $data['comment'];

                $order->status = 0;
                $order->active = 0;

                $ordersStatus = 'Ожидает ответ водителя';//OrdersStatus::findFirstById($order->status);

                if ( $order->save() ) {
                    $response = array('order_id' => $order->id, 'order_status_id' => $order->status, 'order_status'=>$ordersStatus);

                    $gmclient = new GearmanClient();
                    $gmclient->addServer('localhost');
                    $this->current_driver = $order->driver_id;
                    do{
                        $data = new StdClass;
                        $data->order_id = $order->id;
                        $data->driver_id = $this->current_driver;

                        $is_driver_accept = $gmclient->doBackground("send_new_order", serialize($data));
                    }while($is_driver_accept && $this->current_driver = Drivers::findFirst(["id > ".$this->current_driver,"status = 1"]));

                } else {
                    foreach ($order->getMessages() as $message) {
                        $response['error'][] = (string)$message;
                    }
                }
            }else{
                $response['error'][] = "Wrong access token";
            }
            return print(json_encode($response));
        }
    }

    public function setStatus()
    {
        if ($this->request->isPut()) {

            $response = array();

            $data = $this->request->getJsonRawBody();

            $order = Orders::findFirstById($data->order_id);
            $user = Users::findFirstById($order->passanger_id);
            if ( !$user ) {
                return $response[ 'error' ][] = "User id not found";
            }

            if ( $data->access_token === $user->access_token ) {

                $order->status = $data->order_status_id;

                if ( $order->save() ) {
                    $response = array("success"=>"1");



                } else {
                    foreach ($order->getMessages() as $message) {
                        $response['error'][] = (string)$message;
                    }
                }
            }else{
                $response['error'][] = "Wrong access token";
            }

            return print(json_encode($response));
        }
    }
}