<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use Models\CityModel;
use Misc\SeoClass;

class OraseController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->get('/', [$this, 'index']);
        $indexController->get('/{nume_oras}', [$this, 'oras']);

        $this->CityModel = new CityModel($app['db']);

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
        $res = $this->CityModel->find(substr($nume_oras, 0, 25));
        if(!$res){
            //not found exc
        }
        if(strtolower($res['slug']) != strtolower($nume_oras)){
            return $app->redirect('/oras/'.$res['slug']);
        }
        $magazs = $this->CityModel->getShops($res['id']);

        $seo = new SeoClass('city', $app);
        $seo->auto('desc');
        $seo->set('title', 'Magazine românești în '.$res['name']);

        $twigdata = [
            'title' => 'Orașul '.$res['name'],
            'meta' => $seo->getAll(),
            'magazine' => $magazs,
            'oras' => $res
        ];

        return $app['twig']->render('oras.twig', $twigdata);
    }
}
