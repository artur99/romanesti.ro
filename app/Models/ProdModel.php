<?php

namespace Models;

use Stringy\Stringy as S;
use PDO;
use Misc\StaticData;

class ProdModel extends BaseModel{
    public function search($string, $limit = 25){
        $string = S::create($string)->slugify('%')->__toString();
        $results = [];

        if(strlen(trim($string))>0){
            $stmt = $this->db->prepare("SELECT * FROM producers WHERE name LIKE :product_like OR FIND_IN_SET(:product, products) ORDER BY romanesc DESC LIMIT :limit");
            $stmt->bindValue('product', $string);
            $stmt->bindValue('product_like', '%'.$string.'%');
            $stmt->bindValue('limit', $limit, PDO::PARAM_INT);
            $stmt->execute();

            $results = $stmt->fetchAll();
        }
        return [
            'results' => $results
        ];
    }
    public function searchAndGroup($string, $limit = 25){
        $result = $this->search($string, $limit)['results'];

        $sp = -1;
        foreach($result as $i => $res){
            if($res['romanesc'] == '1'){
                $sp = $i;
            }else{
                break;
            }
        }
        return [
            'romanesti' => array_slice($result, 0, $sp+1),
            'straine' => array_slice($result, $sp+1, sizeof($result))
        ];
    }

    public function barcodeCheck($code){
        $code = trim($code);
        $code = preg_replace("/[^0-9]/", '', $code);
        $code = substr($code, 0, 3);
        $codes_ro = ['594', '642'];
        $codes_md = ['484'];

        $ok = 0;
        $country = null;

        if(in_array($code, $codes_ro)){
            $country = 'ro';
            $ok = 1;
        }elseif(in_array($code, $codes_md)){
            $country = 'md';
            $ok = 1;
        }
        if($ok){
            $cns = StaticData::countryNames();
            $cnm = isset($cns[$country]) ? $cns[$country] : 'România';
            $text = 'Acest produs provine din '.$cnm.'.';
            $title = 'Produs românesc';
        }else{
            $text = 'Acest produs provine din străinătate.';
            $title = 'Produs străin';
        }

        return [
            'type' => $ok?'success':'error',
            'text' => $text,
            'title' => $title
        ];
    }
}
