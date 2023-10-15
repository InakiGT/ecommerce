<?php
$servername = "db";
$username = "root";
$password = "root"; // Reemplaza 'tu_contraseña' con la contraseña correcta
$database = "ecommerce";

try {
    $conn = mysqli_connect($servername, $username, $password, $database);
    echo "Conexión exitosa";

    $stmt = $conn->query('SELECT * FROM Clients');
    
    while ($row = $stmt->fetch()) {
        echo $row['name'] . ' ' . $row['email'];
    }
} catch (PDOException $e) {
    echo "Conexión fallida: " . $e->getMessage();
}
?>
