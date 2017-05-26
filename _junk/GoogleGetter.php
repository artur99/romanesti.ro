<?php
$db = new mysqli("localhost", "root", "", "romanesti");
$db->query("SET NAMES UTF8");
$file = file("list.txt");
foreach($file as $itm){
    $city = trim($itm);
    $data = file_get_contents("https://maps.googleapis.com/maps/api/geocode/json?&address=".urlencode('orasul '.$city.', romania'));
    $data = json_decode($data);
    if(!isset($data->results[0])){
        echo "DIDnt find $itm\n";
        continue;
    }
    $res = $data->results[0];

    $name = $city;
    $judet = 0;
    foreach($res->address_components as $comp){

      if(in_array('administrative_area_level_1', $comp->types)){
          $judet = trim(str_replace('County', '', $comp->long_name));
          break;
      }

    }
    $judq = $db->query("SELECT * FROM judete WHERE nume like '%$judet%'")->fetch_array();
    $jud_id = intval($judq['id']);

    $long = $res->geometry->location->lng;
    $lat = $res->geometry->location->lat;
    file_put_contents('ress.txt', $name.'|'.$jud_id.'|'.$lat.'|'.$long."\n", FILE_APPEND);
    echo "INSERT INTO orase(nume, judet, coord_lat, coord_long) VALUES ('$name', $jud_id, $lat, $long)"."\n";
    //echo $city."\n";
}
