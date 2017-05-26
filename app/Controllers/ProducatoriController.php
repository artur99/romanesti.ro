<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use Models\OrasModel;

class ProducatoriController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->get('/', [$this, 'index']);

        // $this->orasModel = new OrasModel($app['db']);

        return $indexController;
    }
    public function index(Application $app){
        // $themodel = new DemoModel($app);

        $twigdata = [
            // 'date' => $themodel->getdate()
        ];

        return $app['twig']->render('producatori.twig', $twigdata);
    }
}
