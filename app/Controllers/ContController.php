<?php

namespace Controllers;

use Silex\Application;
use Silex\Api\ControllerProviderInterface;

use Models\UserModel;
use Misc\StaticData;

class ContController implements ControllerProviderInterface{
    public function connect(Application $app){
        $indexController = $app['controllers_factory'];
        $indexController->get('/', [$this, 'index']);

        $this->userModel = new UserModel($app['db'], $app['session']);
        $app['twig']->addGlobal('user_in', $this->userModel->in());
        $app['twig']->addGlobal('user', $this->userModel->info());

        return $indexController;
    }
    public function index(Application $app){
        if(!$this->userModel->in()){
            return $app['twig']->render('cont_out.twig');
        }else {
            $twigdata = [
                'countries' => StaticData::countryNames(),
                'tipuri_magazin' => StaticData::shopTypes()
            ];
            if($this->userModel->isAdmin()){
                $twigdata['magaz_quee'] = $this->userModel->getFizShopQuee();
            }else{
                $twigdata['magaz_quee'] = null;
            }
            return $app['twig']->render('cont.twig', $twigdata);
        }
    }
}
