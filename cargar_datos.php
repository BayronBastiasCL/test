<?php
header('Content-Type: application/json'); // Encabezado para JSON

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "votacion";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$response = [];

// Cargar regiones y comunas
$sql = "SELECT r.id AS region_id, r.nombre AS region_nombre, c.id AS comuna_id, c.nombre AS comuna_nombre 
        FROM regiones r
        LEFT JOIN comunas c ON r.id = c.region_id";
$result = $conn->query($sql);

$regiones = [];
while ($row = $result->fetch_assoc()) {
    $regiones[$row['region_id']]['id'] = $row['region_id'];
    $regiones[$row['region_id']]['nombre'] = $row['region_nombre'];
    if ($row['comuna_id']) {
        $regiones[$row['region_id']]['comunas'][] = [
            'id' => $row['comuna_id'],
            'nombre' => $row['comuna_nombre']
        ];
    }
}

$response['regiones'] = array_values($regiones);

// Cargar candidatos
$sql = "SELECT id, nombre FROM candidatos";
$result = $conn->query($sql);

$candidatos = [];
while ($row = $result->fetch_assoc()) {
    $candidatos[] = [
        'id' => $row['id'],
        'nombre' => $row['nombre']
    ];
}

$response['candidatos'] = $candidatos; // Asegúrate de que estás agregando candidatos al response

echo json_encode($response);

$conn->close();
?>