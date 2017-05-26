<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use Models\OrasModel;

class OraseController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->get('/', [$this, 'index']);
        $indexController->get('/{nume_oras}', [$this, 'oras']);

        $this->orasModel = new OrasModel($app['db']);

        return $indexController;
    }
    public function index(Application $app){
        // $themodel = new DemoModel($app);

        $twigdata = [
            // 'date' => $themodel->getdate()
        ];

        return $app['twig']->render('oras_cautare.twig', $twigdata);
    }
    public function oras(Application $app, $nume_oras){
        $res = $this->orasModel->find(substr($nume_oras, 0, 25));
        if(!$res){
            //not found exc
        }
        if(strtolower($res['slug']) != strtolower($nume_oras)){
            return $app->redirect('/oras/'.$res['slug']);
        }
        $magazs = $this->orasModel->getMagazs($res['id']);
        $twigdata = [
            'title' => 'Orașul '.$res['nume'],
            'magazine' => $magazs,
            'oras' => $res
        ];

        return $app['twig']->render('oras.twig', $twigdata);
    }
}