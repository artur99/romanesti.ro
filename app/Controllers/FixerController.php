<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

class FixerController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->get('/oras', [$this, 'oras']);
        $indexController->get('/oras/{id}', [$this, 'oras_id']);
        return $indexController;
    }
    public function oras(Application $app){
        return $app->redirect('/orase');
    }
    public function oras_id(Application $app, $id){
        return $app->redirect('/orase/'.$id);
    }
}
