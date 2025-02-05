<%@ page import="Controller.CriterioController, Controller.ResultadoController" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Nuevo Criterio</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Registrar Nuevo Criterio</h2>

        <%
            // Obtener el ID del resultado desde la URL
            String idResultadoParam = request.getParameter("idResultado");
            int idResultado = (idResultadoParam != null) ? Integer.parseInt(idResultadoParam) : 0;
        %>

        <form action="nuevoCriterio.jsp?idResultado=<%= idResultado %>" method="POST">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre del Criterio</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>

            <button type="submit" class="btn btn-primary">Registrar</button>
            <a href="criterios.jsp?idResultado=<%= idResultado %>" class="btn btn-secondary">Volver</a>
        </form>

        <%
            // Procesar el formulario y llamar al Controller
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String nombre = request.getParameter("nombre");

                if (nombre != null && !nombre.trim().isEmpty() && idResultado != 0) {
                    CriterioController criterioController = new CriterioController();
                    criterioController.insertarCriterio(nombre, idResultado);
                    out.println("<div class='alert alert-success mt-3'>Criterio registrado con éxito.</div>");
                } else {
                    out.println("<div class='alert alert-danger mt-3'>Error: ID de resultado no válido o nombre vacío.</div>");
                }
            }
        %>
    </div>
</body>
</html>

