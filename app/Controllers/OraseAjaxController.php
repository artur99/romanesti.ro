<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;
use Symfony\Component\HttpFoundation\JsonResponse;

use Models\CityModel;

class OraseAjaxController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->post('/search', [$this, 'search']);
        $indexController->post('/get', [$this, 'getdata']);
        $indexController->post('/gey_bycoord', [$this, 'getbycoord']);
        $this->CityModel = new CityModel($app['db']);
        return $indexController;
    }
    public function index(Application $app){
        // $themodel = new DemoModel($app);

        $twigdata = [
            // 'date' => $themodel->getdate()
        ];

        return 2;//$app['twig']->render('oras_cautare.twig', $twigdata);
    }

    public function search(Application $app){
        $query = $app['request']->request->get('q');

        $results = $this->CityModel->search($query);

        return new JsonResponse($results);
    }

    public function getdata(Application $app){
        $o_id = $app['request']->request->get('id');

        $mgz = $this->CityModel->getShops($o_id);

        return new JsonResponse([
            'magazine' => $mgz
        ]);
    }

    public function getbycoord(Application $app){
        $mgz = null;

        if($app['request']->request->has('size')){
            $lat = (float) $app['request']->request->get('lat');
            $lng = (float) $app['request']->request->get('lng');
            $size = (float) $app['request']->request->get('size');
            $mgz = $this->CityModel->getShopsByCoord($lat, $lng, $size);
        }else{
            $lat_l = (float) $app['request']->request->get('lat_l');
            $lat_r = (float) $app['request']->request->get('lat_r');
            $lng_l = (float) $app['request']->request->get('lng_l');
            $lng_r = (float) $app['request']->request->get('lng_r');

            $mgz = $this->CityModel->getShopsByBorder($lng_l, $lng_r, $lat_l, $lat_r);
        }

        return new JsonResponse([
            'results' => $mgz
        ]);
    }
}
