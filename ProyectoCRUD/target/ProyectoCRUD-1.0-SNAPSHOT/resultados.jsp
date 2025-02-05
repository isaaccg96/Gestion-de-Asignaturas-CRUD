<%@ page import="Controller.ResultadoController, Controller.AsignaturaController, Clases.Asignatura, Clases.ResultadoAprendizaje, java.util.List" %>
<%@ include file="navbar.jsp" %>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Resultados de Aprendizaje por Asignatura</h1>

        <%
            // Obtener todas las asignaturas
            AsignaturaController asignaturaController = new AsignaturaController();
            List<Asignatura> asignaturas = asignaturaController.listarAsignaturas(); // Método que obtiene todas las asignaturas

            if (asignaturas.isEmpty()) {
        %>
        <div class="alert alert-warning">No hay asignaturas disponibles.</div>
        <%
        } else {
            // Recorremos cada asignatura y mostramos sus resultados de aprendizaje
            ResultadoController resultadoController = new ResultadoController();
            for (Asignatura asignatura : asignaturas) {
        %>
        <div class="card mb-4">
            <div class="card-header bg-dark text-white">
                <h4><%= asignatura.getNombre()%></h4>
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
                        <%
                            // Obtener los resultados de aprendizaje de la asignatura actual
                            List<ResultadoAprendizaje> resultados = resultadoController.listarResultadosPorAsignatura(asignatura.getId());

                            if (resultados.isEmpty()) {
                        %>
                        <tr>
                            <td colspan="3" class="text-center text-muted">No hay resultados de aprendizaje para esta asignatura.</td>
                        </tr>
                        <%
                        } else {
                            for (ResultadoAprendizaje resultado : resultados) {
                        %>
                        <tr>
                            <td><%= resultado.getNombre()%></td>
                            <td>
                                <!-- Botón para editar con icono de lápiz -->
                                <a href="editarResultado.jsp?id=<%= resultado.getNombre()%>" class="btn btn-warning-custom btn-sm">
                                    <i class="bi bi-pencil-fill"></i> Editar
                                </a>

                                <!-- Formulario para eliminar con icono de papelera -->
                                <form id="eliminarForm-<%= resultado.getId()%>" action="resultados.jsp" method="POST" style="display:inline;">
                                    <input type="hidden" name="idResultado" value="<%= resultado.getId()%>">
                                    <button type="button" class="btn btn-warning-custom btn-sm" onclick="confirmarEliminacion('<%= resultado.getId()%>')">
                                        <i class="bi bi-trash-fill"></i> Eliminar
                                    </button>
                                </form>

                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>
                <!-- Botón para añadir un nuevo resultado con icono de más -->
                <a href="nuevoResultado.jsp?idAsignatura=<%= asignatura.getId()%>" class="btn btn-warning-custom mt-2">
                    <i class="bi bi-plus-circle-fill"></i> Añadir Resultado
                </a>
            </div>
            <%
                // Procesar la eliminación si se recibe la solicitud
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String idResultadoStr = request.getParameter("idResultado");

                    if (idResultadoStr != null && !idResultadoStr.trim().isEmpty()) {
                        try {
                            int idResultado = Integer.parseInt(idResultadoStr);
                            resultadoController.eliminarResultado(idResultado); // Método en el controlador
                            response.sendRedirect("resultados.jsp"); // Recargar la página tras eliminar
                        } catch (Exception e) {
                            out.println("<div class='alert alert-danger mt-3'>Error al eliminar resultado: " + e.getMessage() + "</div>");
                        }
                    }
                }
            %>
        </div>
        <%
                }
            }
        %>
    </div>
</body>
