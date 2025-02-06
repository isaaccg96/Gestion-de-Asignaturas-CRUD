<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="CSS/style2.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Bienvenido a la Gestión de Asignaturas</h1>
        <p class="lead text-center mb-5">Este sistema permite gestionar asignaturas, resultados y criterios de evaluación de manera sencilla y efectiva.</p>

        <div class="row">
            <!-- Tarjeta 1: Gestión de Asignaturas -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-lg border-0 rounded">
                    <img src="IMG/1.jpg" class="card-img-top" alt="Gestión de Asignaturas">
                    <div class="card-body">
                        <h5 class="card-title">Gestión de Asignaturas</h5>
                        <p class="card-text">Accede y gestiona todas las asignaturas registradas en el sistema.</p>
                        <a href="asignaturas.jsp" class="btn btn-dark">Ir a Asignaturas</a>
                    </div>
                </div>
            </div>

            <!-- Tarjeta 2: Gestión de Resultados -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-lg border-0 rounded">
                    <img src="IMG/2.jpg" class="card-img-top" alt="Gestión de Resultados">
                    <div class="card-body">
                        <h5 class="card-title">Gestión de Resultados</h5>
                        <p class="card-text">Consulta, edita o elimina los resultados de aprendizaje de cada asignatura.</p>
                        <a href="resultados.jsp" class="btn btn-dark">Ir a Resultados</a>
                    </div>
                </div>
            </div>

            <!-- Tarjeta 3: Gestión de Criterios -->
            <div class="col-md-4 mb-4">
                <div class="card shadow-lg border-0 rounded">
                    <img src="IMG/3.jpg" class="card-img-top" alt="Gestión de Criterios">
                    <div class="card-body">
                        <h5 class="card-title">Gestión de Criterios Evaluación</h5>
                        <p class="card-text">Administra los criterios de evaluación para cada resultado de aprendizaje.</p>
                        <a href="criterios.jsp" class="btn btn-dark">Ir a Criterios</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>


