<?php

// Router list
// $app->mount('/', new Controllers\SectController());

$app->mount('/', new Controllers\IndexController());
$app->mount('/orase', new Controllers\OraseController());
$app->mount('/magazine', new Controllers\MagazineController());
$app->mount('/producatori', new Controllers\ProducatoriController());
$app->mount('/contact', new Controllers\ContactController());
$app->mount('/cont', new Controllers\ContController());

$app->mount('/', new Controllers\FixerController());

$app->mount('/ajax/orase', new Controllers\OraseAjaxController());
$app->mount('/ajax/cont', new Controllers\ContAjaxController());
