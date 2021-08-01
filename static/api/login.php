<?php
require './lib/phpExpress.php';

$app = new phpExpress();

// Request : http://localhost:3000/example/get.test.php/text
// Result : phpExpress
$app->get('/text', function ($req, $res) {
    try {
        $res->send("phpExpress");
    } catch (Exception $e) {
        http_response_code(500);
        $res->send($e);
    }
});

// 404 return
$app->listen();
