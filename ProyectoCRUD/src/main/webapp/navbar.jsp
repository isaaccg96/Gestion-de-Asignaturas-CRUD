<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Resultados de Aprendizaje por Asignatura</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="JS/confirmarEliminacion.js" type="text/javascript"></script>
        <link href="CSS/style.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"> <!-- Agregar Bootstrap Icons -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@700&display=swap" rel="stylesheet">
</head>
<header>
    <!-- Barra de navegación -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" >
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp">Gestión Educativa</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <!-- Enlace a Asignaturas -->
                    <li class="nav-item">
                        <a class="nav-link" href="asignaturas.jsp">Asignaturas</a>
                    </li>
                    <!-- Enlace a Resultados -->
                    <li class="nav-item">
                        <a class="nav-link" href="resultados.jsp">Resultados</a>
                    </li>
                    <!-- Enlace a Criterios -->
                    <li class="nav-item">
                        <a class="nav-link" href="criterios.jsp">Criterios</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Aquí va el contenido de la página (Asigna contenido según cada página específica) -->
    <div class="container mt-5">
        <!-- Contenido dinámico de la página -->
    </div>

    <!-- Scripts de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</header>
</html>
