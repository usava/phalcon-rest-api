<?php

use \Phalcon\Mvc\Controller;

class UsersController extends Controller
{
    public function auth()
    {
        if ( $this->request->isPost() ) {
            $phone = $this->request->getPost('phone');
            $password = $this->request->getPost('password');
            $key = $this->request->getPost('key');

            if ( $key === $this->config->application->appKey ) {
                $user = Users::findFirst([
                    "phone = :phone: AND password = :password:",
                    'bind' => ['phone' => $phone, 'password' => $password]
                ]);
                if ( $user != false ) {
                    $response = array('user_id' => $user->id, 'access_token' => $user->access_token, 'user_status' => $user->status);
                    return print(json_encode($response));
                }
            }

            return print(json_encode(array("error" => "Wrong credentials")));
        }
    }

    public function registration()
    {
        if ( $this->request->isPost() ) {
            $name = $this->request->getPost('name', ['string', 'striptags']);
            $phone = $this->request->getPost('phone');
            $country_id = $this->request->getPost('country_id');
            $password = $this->request->getPost('password');
            $key = $this->request->getPost('key');

            $response = array();

            if ( $key === $this->config->application->appKey ) {
                $user = new Users();
                $user->password = sha1($password);
                $user->name = $name;
                $user->country_id = $country_id;
                $user->phone = $phone;
                $user->status = 1;
                $user->access_token = bin2hex(random_bytes(8));


                if ( $user->save() ) {
                    $response = array('user_id' => $user->id, 'access_token' => $user->access_token);
                    //return print(json_encode($response));

                } else {
                    foreach ($user->getMessages() as $message) {
                        $response['error'][] = (string)$message;
                    }
                }
            }else{
                $response['error'][] = "Wrong app key";
            }

            return print(json_encode($response));
        }
    }
}