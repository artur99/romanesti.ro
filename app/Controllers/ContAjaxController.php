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
        $indexController->post('/add_magaz_fizic', [$this, 'addShopFizic']);
        $indexController->post('/set_magaz_fizic_done', [$this, 'setMagazFizicDone']);
        $indexController->post('/set_magaz_fizic_del', [$this, 'setMagazFizicDel']);


        $this->userModel = new UserModel($app['db'], $app['session']);
        $this->userInfo = $this->userModel->info();
        return $indexController;
    }
    public function index(Application $app){
        return true;
    }

    public function signup(Application $app){
        $name = $app['request']->request->get('name');
        $email = $app['request']->request->get('email');
        $password = $app['request']->request->get('password');
        $password2 = $app['request']->request->get('password2');

        $q = $this->userModel->signup($name, $email, $password, $password2);

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

    public function addShopFizic(Application $app){
        $data = $app['request']->request->all();

        if($this->userModel->isAdmin()){
            $q = $this->userModel->addShop($data);
        } else {
            $q = $this->userModel->prepShop($data);
        }

        return new JsonResponse($q);
    }

    function setMagazFizicDone(Application $app){
        $sgid = $app['request']->request->get('id');
        $q = $this->userModel->setFizShopSuggestionDone($sgid);

        return new JsonResponse($q);
    }
    function setMagazFizicDel(Application $app){
        $sgid = $app['request']->request->get('id');
        $q = $this->userModel->delFizShopSuggestion($sgid);

        return new JsonResponse($q);
    }
}
