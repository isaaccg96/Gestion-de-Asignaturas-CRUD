package Controller;

import DAO.ResultadoAprendizajeDAO;
import Clases.ResultadoAprendizaje;
import java.util.List;

/**
 *
 * @author DAW2
 */
public class ResultadoController {

    ResultadoAprendizajeDAO dao = new ResultadoAprendizajeDAO();

    public List<ResultadoAprendizaje> listarResultadosPorAsignatura(int idAsignatura) {
        return dao.listarPorAsignatura(idAsignatura);
    }

    public void insertarResultado(String nombre, int idAsignatura) {
        ResultadoAprendizaje resultado = new ResultadoAprendizaje();
        resultado.setNombre(nombre);
        resultado.setId_asignatura(idAsignatura);

        dao.insertarResultado(resultado);
    }

    public void eliminarResultado(int idResultado) {
        dao.eliminarResultado(idResultado);
    }

    // Método para actualizar un resultado de aprendizaje por nombre
    public void actualizarResultado(String nombreAnterior, String nuevoNombre) {
        dao.actualizarResultado(nombreAnterior, nuevoNombre);
    }

}
