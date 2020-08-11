<?php
    include "config.php";
    include "utils.php";


    $dbConn = connect($db);
    // listar todos lo post o solo uno (fetch-> solo muestra uno el 1r0)

    if ($_SERVER['REQUEST_METHOD']== 'GET') {
        if (isset($_GET['id'])) {
            // mostrar un post
            $sql = $dbConn->prepare("SELECT * FROM monedas where id = :id");
            $sql->bindValue(':id',$_GET['id']);
            $sql->execute();
            header("HTTP/1.1 200 OK");
            echo json_encode($sql->fetch(PDO::FETCH_ASSOC));
            exit();
        }
        else{
            // mostrar lista de posto(fetchAll->muestra todos)
            $sql = $dbConn->prepare("SELECT * FROM monedas");
            $sql->execute();
            $sql->setFetchMode(PDO::FETCH_ASSOC);
            header("HTTP/1.1 200 OK");
            echo json_encode($sql->fetchAll());
            exit();
        }
    }

    // CREAR UN NUEVO POST
    if ($_SERVER['REQUEST_METHOD']=='POST') {
        $input = $_POST;
        $sql = "INSERT INTO monedas
                (simbolo, nombre, actualizacion, tarifa) 
                VALUES(:simbolo, :nombre, :actualizacion, :tarifa)";
        $statement = $dbConn->prepare($sql);
        bindAllValues($statement, $input);
        $statement->execute();
        $postId = $dbConn->lastInsertId();
        if($postId){
            $input['id']=$postId;
            header("HTTP/1.1 200 OK");
            echo json_encode($input);
            exit();
        }        
    }


    // BORRAR UN REGISTRO
    if ($_SERVER['REQUEST_METHOD']== 'DELETE') {
        $id = $_GET['id'];
        $statement = $dbConn->prepare("DELETE FROM monedas where id=:id");
        $statement->bindValue(':id', $id);
        $statement->execute();
        header("HTTP/1.1 200 OK");
        exit();
    }

    // ACTUALIAR UN REGISTRO
    if ($_SERVER['REQUEST_METHOD'] == 'PUT')
    {
        $input = $_GET;
        $postId = $input['id'];
        $fields = getParams($input);
    
        $sql = "
              UPDATE monedas
              SET $fields
              WHERE id='$postId'
               ";
    
        $statement = $dbConn->prepare($sql);
        bindAllValues($statement, $input);
    
        $statement->execute();
        header("HTTP/1.1 200 OK");
        exit();
    }

        // SI NINGUNA DE LAS OPCIONES ANTERIORES SON EJECUTADAS
        header("HTTP/1.1 400 Bad Request");
?>