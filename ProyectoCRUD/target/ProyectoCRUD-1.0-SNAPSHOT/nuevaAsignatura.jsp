<%@page import="Controller.AsignaturaController"%>
<%@ include file="navbar.jsp" %>
<body>
    <div class="container mt-5">
        <h2>Registrar Nueva Asignatura</h2>
        <form action="nuevaAsignatura.jsp" method="POST">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre de la Asignatura</label>
                <input type="text" class="form-control" id="nombre" name="nombre" required>
            </div>
            <button type="submit" class="btn btn-warning-custom">Registrar</button>
            <a href="asignaturas.jsp" class="btn btn-warning-custom">Volver</a>
        </form>
    </div>

    <% 
        // Procesar el formulario y llamar al Controller en lugar del DAO
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String nombre = request.getParameter("nombre");
            if (nombre != null && !nombre.trim().isEmpty()) {
                AsignaturaController asignaturaController = new AsignaturaController();
                asignaturaController.insertarAsignatura(nombre);
                out.println("<div class='alert alert-success mt-3'>Asignatura registrada con éxito.</div>");
            } else {
                out.println("<div class='alert alert-danger mt-3'>Por favor ingrese un nombre para la asignatura.</div>");
            }
        }
    %>
</body>
</html>


