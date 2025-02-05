package Controller;

import DAO.CriterioEvaluacionDAO;
import Clases.CriterioEvaluacion;
import java.util.List;

/**
 * Controlador para gestionar los criterios de evaluación
 */
public class CriterioController {

    // Instancia del DAO para interactuar con la base de datos
    CriterioEvaluacionDAO dao = new CriterioEvaluacionDAO();

    // Listar los criterios asociados a un resultado específico
    public List<CriterioEvaluacion> listarCriteriosPorResultado(int idResultado) {
        return dao.listarPorResultado(idResultado);
    }

    // Insertar un nuevo criterio de evaluación
    public void insertarCriterio(String nombre, int idResultado) {
        CriterioEvaluacion criterio = new CriterioEvaluacion();
        criterio.setNombre(nombre);
        criterio.setId_resultado(idResultado); // Asignar el ID de resultado

        dao.insertarCriterio(criterio);
    }

    // Eliminar un criterio de evaluación por ID
    public void eliminarCriterio(int idCriterio) {
        dao.eliminarCriterio(idCriterio);
    }

    // Actualizar un criterio de evaluación
    public void actualizarCriterio(String nombreAnterior, String nuevoNombre) {
        dao.actualizarCriterio(nombreAnterior, nuevoNombre);
    }

}
