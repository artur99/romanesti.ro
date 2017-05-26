<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use Models\UserModel;

class ContactController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->get('/', [$this, 'index']);

        $this->userModel = new UserModel($app['db']);

        return $indexController;
    }
    public function index(Application $app){
        // $themodel = new DemoModel($app);

        $twigdata = [
            'contribs' => $this->userModel->getContribs(10)
        ];

        return $app['twig']->render('contact.twig', $twigdata);
    }
}
