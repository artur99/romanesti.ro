<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;
use Symfony\Component\HttpFoundation\JsonResponse;

use Models\UserModel;

class ContAjaxController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->post('/signup', [$this, 'signup']);
        $indexController->post('/login', [$this, 'login']);
        $indexController->post('/signout', [$this, 'signout']);
        $indexController->post('/add_magaz_fizic', [$this, 'addMagazFizic']);

        $this->userModel = new UserModel($app['db'], $app['session']);
        return $indexController;
    }
    public function index(Application $app){
        return true;
    }

    public function signup(Application $app){
        $nume = $app['request']->request->get('nume');
        $email = $app['request']->request->get('email');
        $password = $app['request']->request->get('password');
        $password2 = $app['request']->request->get('password2');

        $q = $this->userModel->signup($nume, $email, $password, $password2);

        return new JsonResponse($q);
    }

    public function login(Application $app){
        $email = $app['request']->request->get('email');
        $password = $app['request']->request->get('password');

        $q = $this->userModel->login($email, $password);

        return new JsonResponse($q);
    }

    public function signout(){
        $q = $this->userModel->signout();
        return new JsonResponse($q);
    }

    public function addMagazFizic(Application $app){
        $data = $app['request']->request->all();
        $q = $this->userModel->prepMagaz($data);

        return new JsonResponse($q);
    }
}
