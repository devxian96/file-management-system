<?php
// 루트 파일
define("_ERP_", true);

require './lib/phpExpress.php';
require './lib/phpSequelize.php';
require './config.php';

$app = new phpExpress();
$sql = new phpSequelize($host, $user, $pass, $dbname);

/*
Request : http://localhost:3000/example/get.test.php/text
Result : phpExpress
 */
$app->post('/login', static function ($req, $res) {
    try {
        // get login info
        $res->send($req['password']);
    } catch (Exception $e) {
        http_response_code(500);
        $res->send($e);
    }
});

$app->post('/register', static function ($req, $res) {
    try {
        $res->status(400)->send('hi');
    } catch (Exception $e) {
        http_response_code(500);
        $res->send($e);
    }
});

// 404 return
$app->listen();
