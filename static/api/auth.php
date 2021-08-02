<?php
// 루트 파일
define("_ERP_", true);

require './lib/phpExpress.php';
require './lib/phpSequelize.php';

$app = new phpExpress();
$sql = new phpSequelize($host, $user, $pass, $dbname);

// Request : http://localhost:3000/example/get.test.php/text
// Result : phpExpress
$app->get('/text', static function ($req, $res) {
    try {
        // get login info
        $login = $sql->findOne('users', (object) [
            'attributes' => ['password', 'blocked', 'HWID'],
            'where' => (object) [
                'username' => $reqUsername,
            ],
        ]);

        $res->send("phpExpress");
    } catch (Exception $e) {
        http_response_code(500);
        $res->send($e);
    }
});

// 404 return
$app->listen();
