package DAO;

import Clases.CriterioEvaluacion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Isaac
 */
public class CriterioEvaluacionDAO {

    // Listar los resultados por ID de resultado (anteriormente por ID de asignatura)
    public List<CriterioEvaluacion> listarPorResultado(int idResultado) {
        List<CriterioEvaluacion> resultados = new ArrayList<>();
        String sql = "SELECT id, nombre FROM criterios WHERE id_resultado = ?";

        try (Connection conn = Database.getConnection(); // Usando la clase Database
                 PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idResultado); // Cambiado id_asignatura por id_resultado
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CriterioEvaluacion criterio = new CriterioEvaluacion(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        idResultado  // Aquí el id_resultado reemplaza id_asignatura
                );
                resultados.add(criterio);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Esto imprimirá el error en la consola
        }
        return resultados;
    }

    // Insertar un nuevo resultado
    public void insertarCriterio(CriterioEvaluacion criterio) {
        String sql = "INSERT INTO criterios (nombre, id_resultado) VALUES (?, ?)";

        try (Connection conn = Database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, criterio.getNombre());
            ps.setInt(2, criterio.getId_resultado());
            ps.executeUpdate();

            // Obtener el ID generado automáticamente
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    criterio.setId(rs.getInt(1));
                }
            }

        } catch (Exception e) {
            System.err.println("Error al insertar criterio: " + e.getMessage());
        }
    }

    // Editar un resultado existente
    public void actualizarCriterio(String nombreAnterior, String nuevoNombre) {
        String query = "UPDATE criterios SET nombre = ? WHERE nombre = ?";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, nuevoNombre);
            ps.setString(2, nombreAnterior);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error al actualizar resultado: " + e.getMessage());
        }
    }

    // Eliminar un criterio por ID
    public void eliminarCriterio(int id) {
        String sql = "DELETE FROM criterios WHERE id = ?";

        try (Connection conn = Database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error al eliminar criterio: " + e.getMessage());
        }
    }

    // Obtener un resultado específico por ID
    public CriterioEvaluacion obtenerPorId(int id) {
        String sql = "SELECT id, nombre, id_resultado FROM criterios WHERE id = ?"; // Cambiar id_asignatura por id_resultado
        CriterioEvaluacion resultado = null;

        try (Connection conn = Database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                resultado = new CriterioEvaluacion(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getInt("id_resultado")  // Cambiar id_asignatura por id_resultado
                );
            }
        } catch (Exception e) {
            System.err.println("Error al obtener resultado por ID: " + e.getMessage());
        }

        return resultado;
    }
}
