<%@ page import="Controller.ResultadoController, Controller.CriterioController, Controller.AsignaturaController, Clases.Asignatura, Clases.ResultadoAprendizaje, Clases.CriterioEvaluacion, java.util.List" %>
<%@ include file="navbar.jsp" %>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">Criterios por Resultado y Asignatura</h1>

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
            CriterioController criterioController = new CriterioController(); // Instanciamos el controlador de criterios
            for (Asignatura asignatura : asignaturas) {
        %>
        <div class="card mb-4">
            <div class="card-header bg-dark text-white">
                <h4><%= asignatura.getNombre()%></h4>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
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
                            <td>
                                <h5>Resultado de Aprendizaje: <%= resultado.getNombre()%></h5>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3">
                                <h6>Criterios asociados:</h6>
                                <table class="table table-bordered">
                                    <thead class="table-light">
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            // Obtener los criterios asociados a este resultado de aprendizaje
                                            List<CriterioEvaluacion> criterios = criterioController.listarCriteriosPorResultado(resultado.getId());

                                            if (criterios.isEmpty()) {
                                        %>
                                        <tr>
                                            <td colspan="2" class="text-center text-muted">No hay criterios para este resultado.</td>
                                        </tr>
                                        <%
                                        } else {
                                            for (CriterioEvaluacion criterio : criterios) {
                                        %>
                                        <tr>
                                            <td><%= criterio.getNombre()%></td>
                                            <td>
                                                <!-- Botón para editar con icono de lápiz -->
                                                <a href="editarCriterio.jsp?id=<%= criterio.getNombre()%>" class="btn btn-warning-custom btn-sm">
                                                    <i class="bi bi-pencil-fill"></i> Editar
                                                </a>

                                                <!-- Formulario para eliminar con icono de papelera -->
                                                <form id="eliminarForm-<%= criterio.getId()%>" action="criterios.jsp" method="POST" style="display:inline;">
                                                    <input type="hidden" name="idCriterio" value="<%= criterio.getId()%>">
                                                    <button type="button" class="btn btn-warning-custom btn-sm" onclick="confirmarEliminacion('<%= criterio.getId()%>')">
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
                                <!-- Botón para añadir un nuevo criterio con icono de más -->
                                <a href="nuevoCriterio.jsp?idResultado=<%= resultado.getId()%>" class="btn btn-warning-custom mt-2">
                                    <i class="bi bi-plus-circle-fill"></i> Añadir Criterio
                                </a>
                            </td>
                        </tr>

                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>

            </div>
            <%
                // Procesar la eliminación si se recibe la solicitud
                if ("POST".equalsIgnoreCase(request.getMethod())) {
                    String idCriterioStr = request.getParameter("idCriterio");

                    if (idCriterioStr != null && !idCriterioStr.trim().isEmpty()) {
                        try {
                            int idCriterio = Integer.parseInt(idCriterioStr);
                            criterioController.eliminarCriterio(idCriterio); // Método en el controlador
                            response.sendRedirect("criterios.jsp"); // Recargar la página tras eliminar
                        } catch (Exception e) {
                            out.println("<div class='alert alert-danger mt-3'>Error al eliminar criterio: " + e.getMessage() + "</div>");
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
