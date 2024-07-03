<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "votacion";

// Conexión a la base de datos
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificación de conexión
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Recolección de datos del formulario
$nombre = $_POST['nombre'];
$alias = $_POST['alias'];
$rut = $_POST['rut'];
$email = $_POST['email'];
$region_id = $_POST['region'];
$comuna_id = $_POST['comuna'];
$candidato_id = $_POST['candidato'];
$como_se_entero = isset($_POST['enterado']) ? implode(', ', $_POST['enterado']) : '';

// Verificación de duplicación de votos por RUT
$sql = "SELECT COUNT(*) AS total FROM votos WHERE rut = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $rut);
$stmt->execute();
$stmt->bind_result($total);
$stmt->fetch();
$stmt->close();

if ($total > 0) {
    echo "Ya has votado con este RUT.";
} else {
    // Inserción de datos en la tabla votos
    $sql_insert = "INSERT INTO votos (nombre_apellido, alias, rut, email, region_id, comuna_id, candidato_id, como_se_entero)
                   VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt_insert = $conn->prepare($sql_insert);
    $stmt_insert->bind_param("ssssiiis", $nombre, $alias, $rut, $email, $region_id, $comuna_id, $candidato_id, $como_se_entero);

    if ($stmt_insert->execute()) {
        echo "Voto registrado exitosamente.";
    } else {
        echo "Error al registrar el voto: " . $stmt_insert->error;
    }

    $stmt_insert->close();
}

// Cierre de la conexión
$conn->close();
?>