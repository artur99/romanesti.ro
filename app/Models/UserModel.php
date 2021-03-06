<?php

namespace Models;

use Stringy\Stringy as S;
use PDO;
use Misc\StaticData;

class UserModel extends BaseModel{
    protected $hybridauth;

    function in(){
        $has = $this->session->has('user');
        if(!$has){
            return false;
        }
        $user = $this->session->get('user');
        if(!$user){
            return false;
        }
        return true;
    }
    function info(){
        if($this->in())
            return $this->session->get('user');
        return false;
    }
    function isAdmin(){
        $adm = $this->session->get('user');
        if(isset($adm['admin']) && $adm['admin'])
            return true;
        return false;
    }
    function pwEncode($pw){
        return substr(hash('sha512', $pw), 0, 50);
    }
    function emExists($em){
        $stmt = $this->db->prepare("SELECT COUNT(1) FROM users WHERE email = :em LIMIT 1");
        $stmt->bindValue('em', $em);
        $stmt->execute();
        $results = $stmt->fetch();
        if($results['COUNT(1)'] > 0)
            return true;
        return false;
    }
    function cityExists($nm){
        $nm = S::create($nm)->slugify('%')->__toString();

        if(strlen(trim($nm))>0){
            $stmt = $this->db->prepare("SELECT id, name FROM cities WHERE name LIKE :name LIMIT 1");
            $stmt->bindValue('name', '%'.$nm.'%');
            $stmt->execute();
            $result = $stmt->fetch();
            return $result;
        }
        return false;
    }
    function signup($nm, $em, $pw, $pw2){
        $err = false;
        $em = trim($em);
        $nm = trim($nm);
        $pw = trim($pw);
        $pw2 = trim($pw2);
        if(strlen($nm) < 3){
            $err = 'Numele introdus este prea scurt';
        }elseif(!filter_var($em, FILTER_VALIDATE_EMAIL)){
            $err = 'Adresa de email introdusă este invalidă';
        }elseif($this->emExists($em)){
            $err = 'Există deja un cont cu această adresă de email';
        }elseif(strlen($pw) < 6){
            $err = 'Parola introdusă este prea scrută';
        }elseif($pw != $pw2){
            $err = 'Parolele nu corespund';
        }else{
            $pw = (string) $this->pwEncode($pw);
            $nm = (string) S::create($nm)->toTitleCase()->__toString();
            $stmt = $this->db->prepare("INSERT INTO users(name, email, password, reg_tm, log_tm, reg_ip, log_ip) VALUES(:nm, :em, :pw, :tm, :tm, :ip, :ip)");
            $stmt->bindValue('nm', $nm);
            $stmt->bindValue('em', $em);
            $stmt->bindValue('pw', $pw);
            $stmt->bindValue('tm', time());
            $stmt->bindValue('ip', isset($_SERVER['REMOTE_ADDR'])?$_SERVER['REMOTE_ADDR']:NULL);
            $stmt->execute();
            $id = $this->db->lastInsertId();

            $this->loginSet($id, $nm, $em);
        }
        return [
            'type' => $err?'error':'success',
            'text' => $err?$err:'Înregistrat cu succes!'
        ];
    }
    function login($em, $pw){
        $err = false;
        $em = trim($em);
        $pw = trim($pw);
        if(!filter_var($em, FILTER_VALIDATE_EMAIL)){
            $err = 'Adresa de email introdusă este invalidă';
        }elseif(strlen($pw) < 6){
            $err = 'Parola introdusă este incorectă';
        }else{
            $pw = (string) $this->pwEncode($pw);
            $stmt = $this->db->prepare("SELECT * FROM users WHERE email = :em AND password = :pw LIMIT 1");
            $stmt->bindValue('em', $em);
            $stmt->bindValue('pw', $pw);
            $stmt->execute();
            $r = $stmt->fetch();
            if(!isset($r['id'])){
                $err = 'Adresa de email și parola nu corespund';
            }else{
                $stmt = $this->db->prepare("UPDATE users SET log_tm = :tm, log_ip = :ip");
                $stmt->bindValue('tm', time());
                $stmt->bindValue('ip', isset($_SERVER['REMOTE_ADDR'])?$_SERVER['REMOTE_ADDR']:NULL);
                $stmt->execute();
                $this->loginSet($r['id'], $r['name'], $r['email'], $r['reg_tm'], $r['contribs']);
            }
        }
        return [
            'type' => $err?'error':'success',
            'text' => $err?$err:'Autentificat cu succes!'
        ];
    }
    function loginSet($id, $nm, $em, $sup = null, $contrib = 0){
        if($sup == null)
            $sup = time();

        $data_arr = [
            'id' => $id,
            'name' => $nm,
            'email' => $em,
            'reg_tm' => $sup,
            'contribs' => $contrib
        ];
        if($id == 1){
            $data_arr['admin'] = 1;
        }
        $this->session->set('user', $data_arr);
        return true;
    }
    function signout(){
        $this->session->set('user', null);
        $this->session->remove('user');
        return [
            'type' => 'success',
            'text' => null
        ];
    }
    function checkShopData($data, $as_admin = 0){
        $err = false;
        if(!$this->in()){
            $err = 'Trebuie să fii conectat pentru a face această acțiune';
        }else{
            $countries = StaticData::countryNames();
            $shopTypes = StaticData::shopTypes();
            $all = ['lat', 'lng', 'nume', 'oras', 'nume_firma', 'logo', 'nationalit', 'tip', 'etichete', 'popularitate', 'descriere'];
            foreach($data as $k => $el2){
                $data[$k] = trim($data[$k]);
                if(!in_array($k, $all)){
                    unset($data[$k]);
                }
            }

            $checker = ['lat', 'lng', 'oras', 'nume', 'nume_firma', 'oras', /*'logo',*/ 'nationalit', 'tip', /*'etichete',*/ 'popularitate'/*, 'descriere'*/];
            foreach($checker as $itm){
                $data[$itm] = isset($data[$itm])?$data[$itm]:null;
            }


            $data['lat'] = (float) ($data['lat']);
            $data['lng'] = (float) ($data['lng']);
            $data['popularitate'] = (int) ($data['popularitate']);

            if(!$data['lat'] || !$data['lng']){
                $err = 'Coordonatele nu sunt valide';
            }elseif($data['popularitate']<1 || $data['popularitate']>9){
                $err = 'Nivelul de popularitate este invalid';
            }elseif(!isset($countries[$data['nationalit']])){
                $err = 'Naționalitatea aleasă este invalidă';
            }elseif(!isset($shopTypes[$data['tip']])){
                $err = 'Tipul de magazin ales este invalid';
            }elseif(strlen($data['nume']) < 3){
                $err = 'Numele magazinului este prea scurt';
            }elseif(!($o_data = $this->cityExists($data['oras']))){
                $err = 'Numele orașului este incorect';
            }else{
                if($as_admin !== 1){
                    $data_to_save = $data;
                    $uid = (int) $this->info()['id'];
                    $data_to_save['id_oras'] = $o_data['id'];
                    $data_to_save['nume_oras'] = $o_data['name'];
                    $data2 = json_encode($data_to_save);

                    $stmt = $this->db->prepare("INSERT INTO sugestii(user_id, tip, data) VALUES(:uid, :type, :data)");
                    $stmt->bindValue('uid', $uid);
                    $stmt->bindValue('type', 'magazin_fizic');
                    $stmt->bindValue('data', $data2);
                    $stmt->execute();
                }else{
                    $sql_tmp = 'INSERT INTO magazine_fizice(id_oras, nume, nume_firma, nat_firma, nat_detinator, coord_lat, coord_lng, tip, romanesc, etichete, popularitate, descriere, logo)';
                    $sql_tmp.= ' VALUES (:id_oras, :nume, :nume_f, :nat_f, :nat_det, :lat, :lng, :tip, :romanesc, :etichete, :pop, :descr, :logo)';
                    $stmt = $this->db->prepare($sql_tmp);

                    $isro = strtolower($data['nationalit']) == "ro" ? 1 : 0;
                    $stmt->bindValue('id_oras', (int) $o_data['id']);
                    $stmt->bindValue('nume', $data['nume']);
                    $stmt->bindValue('nume_f', $data['nume_firma']);
                    $stmt->bindValue('nat_f', NULL);
                    $stmt->bindValue('nat_det', strtolower($data['nationalit']));
                    $stmt->bindValue('lat', (float) $data['lat']);
                    $stmt->bindValue('lng', (float) $data['lng']);
                    $stmt->bindValue('tip', $data['tip']);
                    $stmt->bindValue('romanesc', $isro);
                    $stmt->bindValue('etichete', $data['etichete']);
                    $stmt->bindValue('pop', $data['popularitate']);
                    $stmt->bindValue('descr', $data['descriere']);
                    $stmt->bindValue('logo', $data['logo']);
                    $stmt->execute();
                }
            }
        }

        return [
            'type' => $err?'error':'success',
            'text' => $err?$err:($as_admin?'Magazin adăugat cu succes!':'Sugestie de magazin trimisă cu succes!')
        ];
    }
    function prepShop($data){
        return $this->checkShopData($data, 0);
    }
    function addShop($data){
        return $this->checkShopData($data, 1);
    }



    function getFizShopQuee(){
        $stmt = $this->db->prepare("SELECT sugestii.*, users.name AS user_name FROM sugestii LEFT JOIN users ON sugestii.user_id = users.id WHERE verificat = 0 ORDER BY sugestii.id DESC");
        $stmt->execute();
        $results = $stmt->fetchAll();
        foreach($results as $k=>$res){
            $results[$k]['data_json'] = $results[$k]['data'];
            $results[$k]['data'] = json_decode($results[$k]['data']);
        }
        return $results;
    }
    function setFizShopSuggestionDone($sid){
        $sid = intval($sid);
        $stmt = $this->db->prepare("UPDATE users u INNER JOIN sugestii s ON u.id = s.user_id SET u.contribs = u.contribs+1, s.verificat = 1 WHERE s.id = :sid");
        $stmt->bindValue('sid', $sid);
        $stmt->execute();

        return [
            'type' => 'success',
            'text' => 'Sugestie marcată ca finalizată'
        ];
    }
    function delFizShopSuggestion($sid){
        $sid = intval($sid);
        $stmt = $this->db->prepare("DELETE FROM sugestii WHERE id = :sid LIMIT 1");
        $stmt->bindValue('sid', $sid);
        $stmt->execute();

        return [
            'type' => 'success',
            'text' => 'Sugestie eliminată cu succes'
        ];
    }
    function getContribs($limit = 10){
        $limit = intval($limit);
        $stmt = $this->db->prepare("SELECT id, name, contribs FROM users WHERE contribs > 0 ORDER BY contribs DESC LIMIT :limit");
        $stmt->bindValue('limit', $limit, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll();
    }
}
