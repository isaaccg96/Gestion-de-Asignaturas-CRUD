<%@ page import="Controller.CriterioController" %>
<%
    // Obtener el nombre del criterio desde la URL (id)
    String nombreCriterio = request.getParameter("id");
    CriterioController criterioController = new CriterioController();
%>
<%@ include file="navbar.jsp" %>
    <body>
        <div class="container mt-5">
            <h2>Editar Criterio: <%= nombreCriterio%></h2>

            <form action="editarCriterio.jsp?id=<%= nombreCriterio%>" method="POST" onsubmit="return confirmarActualizar();">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre del Criterio</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombreCriterio%>" required>
                </div>
                <button type="submit" class="btn btn-warning-custom">Actualizar</button>
                <a href="resultados.jsp" class="btn btn-warning-custom">Volver</a>
            </form>
        </div>

        <%
            // Procesar la actualización si se recibe la solicitud POST
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String nuevoNombre = request.getParameter("nombre"); // Obtener el nuevo nombre del criterio
                if (nuevoNombre != null && !nuevoNombre.trim().isEmpty()) {
                    try {
                        criterioController.actualizarCriterio(nombreCriterio, nuevoNombre);
                        response.sendRedirect("criterios.jsp"); // Redirigir tras la actualización
                    } catch (Exception e) {
                        out.println("<div class='alert alert-danger mt-3'>Error al actualizar criterio: " + e.getMessage() + "</div>");
                    }
                }
            }
        %>
    </body>
</html>
