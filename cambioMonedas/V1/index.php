<?php
require __DIR__ . '/vendor/autoload.php';
use GuzzleHttp\Client;
//Crear el cliente para llamadas al servicio
//Debes cambiar el valor de base_uri a la dirección en donde esta tu servicio
//El valor de timeout, en este caso es para decir que despues de 5 segundos
//si el servicio no responde, se cancela el proceso.
$client = new Client([
    'base_uri' => 'http://localhost/cambioMonedas/post.php',
    'timeout'  => 5.0,
]);
//Hacer la llamada al metodo get, sin ningún parametro
$res = $client->request('GET');
if ($res->getStatusCode() == '200') //Verifico que me retorne 200 = OK
{
  echo $res->getBody();
}
?>