<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use Models\ProdModel;

class ProdController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->get('/', [$this, 'index']);

        $this->ProdModel = new ProdModel($app['db']);

        return $indexController;
    }
    public function index(Application $app){
        // $themodel = new DemoModel($app);

        $twigdata = [
            // 'date' => $themodel->getdate()
        ];
        // var_dump($this->ProdModel->searchAndGroup('pigna'));die();

        return $app['twig']->render('producatori.twig', $twigdata);
    }
}
