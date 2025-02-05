<%@page import="Controller.ResultadoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Nuevo Resultado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Registrar Nuevo Resultado</h2>

        <%
            // Obtener el ID de la asignatura desde la URL
            String idAsignaturaParam = request.getParameter("idAsignatura");
            int idAsignatura = (idAsignaturaParam != null) ? Integer.parseInt(idAsignaturaParam) : 0;
        %>

        <form action="nuevoResultado.jsp?idAsignatura=<%= idAsignatura %>" method="POST">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre del Resultado</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <button type="submit" class="btn btn-primary">Registrar</button>
            <a href="resultados.jsp?idAsignatura=<%= idAsignatura %>" class="btn btn-secondary">Volver</a>
        </form>

        <%
            // Procesar el formulario y llamar al Controller
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String nombre = request.getParameter("nombre");

                if (nombre != null && !nombre.trim().isEmpty() && idAsignatura != 0) {
                    ResultadoController resultadoController = new ResultadoController();
                    resultadoController.insertarResultado(nombre, idAsignatura);
                    out.println("<div class='alert alert-success mt-3'>Resultado registrado con éxito.</div>");
                } else {
                    out.println("<div class='alert alert-danger mt-3'>Error: ID de asignatura no válido o nombre vacío.</div>");
                }
            }
        %>
    </div>
</body>
</html>

