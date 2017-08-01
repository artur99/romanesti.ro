<?php
namespace Misc;

class StaticSeoClass{
    function get($what){
        global $app;
        $res = [];
        if($what == 'home'){
            $res['title'] = $app['conf.title'];
        }elseif($what == 'city'){
            $res['descr'] = 'Identifică magazinele românești și cele sătrine din orașul tău. Sprijină economia țării cumpărând românește';
        }
        return $res;
    }
}
