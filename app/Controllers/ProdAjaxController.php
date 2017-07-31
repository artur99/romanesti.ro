<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;
use Symfony\Component\HttpFoundation\JsonResponse;

use Models\ProdModel;

class ProdAjaxController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->post('/search', [$this, 'search']);
        $indexController->post('/check_barcode', [$this, 'checkBarcode']);
        // $indexController->post('/gey_bycoord', [$this, 'getbycoord']);
        $this->ProdModel = new ProdModel($app['db']);
        return $indexController;
    }
    public function index(Application $app){
        $twigdata = [
            // 'date' => $themodel->getdate()
        ];

        return JsonResponse(['type' => 'error']);
    }

    public function search(Application $app){
        $query = $app['request']->request->get('q');

        $results = null;//$this->CityModel->search($query);

        return new JsonResponse($results);
    }

    public function checkBarcode(Application $app){
        $code = $app['request']->request->get('code');

        $rp = $this->ProdModel->barcodeCheck($code);

        return new JsonResponse($rp);
    }

}
