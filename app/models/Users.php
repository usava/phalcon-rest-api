<?php
use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;
class Users extends Model
{
    public function validation()
    {
        $validator = new Validation();

        $validator->add(
            'phone',
            new UniquenessValidator([
                'message' => 'Sorry, The phone was registered by another user'
            ]));
        $validator->add(
            'name',
            new UniquenessValidator([
                'message' => 'Sorry, That username is already taken'
            ]));

        return $this->validate($validator);
    }
}