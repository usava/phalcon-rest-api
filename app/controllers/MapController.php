<?php

use Phalcon\Mvc\Controller;

class MapController extends Controller
{
    public function getInfo()
    {
        $access_token = $this->request->get('access_token');
        if($access_token) {
            $phql = 'SELECT id FROM Users WHERE access_token = :access_token:';
            $user = $this->modelsManager->executeQuery($phql, ['access_token' => $access_token,])->getFirst();

            if ( $user ) {
                $cars = Cars::find('status = 1');
                $response = $cars->toArray();
            } else {
                $response[ 'error' ][] = "User id not found.";
            }
        }else{
            $response[ 'error' ][] = "Miss access token";
        }

        return print(json_encode($response));
    }
}