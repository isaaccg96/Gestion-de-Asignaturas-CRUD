<%@ page import="Controller.AsignaturaController, Clases.Asignatura" %>
<%
    // Obtener el nombre de la asignatura desde la URL (id)
    String nombre = request.getParameter("id");
    AsignaturaController asignaturaController = new AsignaturaController();
%>
<%@ include file="navbar.jsp" %>
    <body>
        <div class="container mt-5">
            <h2>Editar Asignatura: <%= nombre%></h2>

            <form action="editarAsignatura.jsp?id=<%= nombre%>" method="POST" onsubmit="return confirmarActualizar();">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre de la Asignatura</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%= nombre%>" required>
                </div>
                <button type="submit" class="btn btn-warning-custom">Actualizar</button>
                <a href="asignaturas.jsp" class="btn btn-warning-custom">Volver</a>
            </form>
        </div>

        <%
            // Procesar la actualización si se recibe la solicitud POST
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String nuevoNombre = request.getParameter("nombre"); // Obtener el nuevo nombre de la asignatura
                if (nuevoNombre != null && !nuevoNombre.trim().isEmpty()) {
                    try {
                        asignaturaController.actualizarAsignatura(nombre, nuevoNombre);                       
                        response.sendRedirect("asignaturas.jsp"); // Redirigir tras la actualización
                    } catch (Exception e) {
                        out.println("<div class='alert alert-danger mt-3'>Error al actualizar asignatura: " + e.getMessage() + "</div>");
                    }
                }
            }
        %>
    </body>
</html>
