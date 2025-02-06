<%@ page import="Controller.AsignaturaController, java.util.List, Clases.Asignatura" %>
<%
    AsignaturaController controller = new AsignaturaController();
    List<Asignatura> asignaturas = controller.listarAsignaturas();
%>
<%@ include file="navbar.jsp" %>

<body>
    <div class="container mt-5">
        <h1>Gestión de Asignaturas</h1>

        <!-- Mostrar mensaje si no hay asignaturas -->
        <% if (asignaturas.isEmpty()) { %>
        <div class="alert alert-warning text-center">No hay asignaturas disponibles.</div>
        <% } else { %>
        <div class="card mb-4">
            <div class="card-header bg-dark text-white">
                <h4>Asignaturas</h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead class="table-light">
                        <tr>
                            <th>Nombre</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Asignatura asignatura : asignaturas) {%>
                        <tr>
                            <td><%= asignatura.getNombre()%></td>
                            <td>
                                <!-- Botón para editar con icono de lápiz -->
                                <a href="editarAsignatura.jsp?id=<%= asignatura.getNombre()%>" class="btn btn-warning-custom btn-sm">
                                    <i class="bi bi-pencil-fill"></i> Editar
                                </a>

                                <!-- Formulario para eliminar con icono de papelera -->
                                <form id="eliminarForm-<%= asignatura.getNombre()%>" action="asignaturas.jsp" method="POST" style="display:inline;">
                                    <input type="hidden" name="id" value="<%= asignatura.getNombre()%>">
                                    <button type="button" class="btn btn-warning-custom btn-sm" onclick="confirmarEliminacion('<%= asignatura.getNombre()%>')">
                                        <i class="bi bi-trash-fill"></i> Eliminar
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <!-- Botón para nueva asignatura con icono de más -->
                <a href="nuevaAsignatura.jsp" class="btn btn-warning-custom mt-2">
                    <i class="bi bi-plus-circle-fill"></i> Añadir Asignatura
                </a>
            </div>
        </div>
        <% } %>


    </div>

    <%
        // Procesar la eliminación si se recibe la solicitud
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String nombre = request.getParameter("id");
            if (nombre != null && !nombre.trim().isEmpty()) {
                try {
                    controller.eliminarAsignatura(nombre);
                    response.sendRedirect("asignaturas.jsp");
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger mt-3'>Error al eliminar asignatura: " + e.getMessage() + "</div>");
                }
            }
        }
    %>
</body>

