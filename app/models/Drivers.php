<?php
use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Validation\Validator\Email as EmailValidator;
use Phalcon\Validation\Validator\Uniqueness as UniquenessValidator;
class Drivers extends Model
{
    public static function getNext($id)
    {
        return $id+1;//Mock for retrieve next driver :)
    }
}