package DAO;

import Clases.ResultadoAprendizaje;
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
public class ResultadoAprendizajeDAO {

    public List<ResultadoAprendizaje> listarPorAsignatura(int idAsignatura) {
        List<ResultadoAprendizaje> resultados = new ArrayList<>();
        String sql = "SELECT id, nombre FROM resultados WHERE id_asignatura = ?";

        try (Connection conn = Database.getConnection(); // Usando la clase Database
                 PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, idAsignatura);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                ResultadoAprendizaje resultado = new ResultadoAprendizaje(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        idAsignatura
                );
                resultados.add(resultado);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Esto imprimirá el error en la consola
        }
        return resultados;
    }

    // Insertar un nuevo resultado
    public void insertarResultado(ResultadoAprendizaje resultado) {
        String sql = "INSERT INTO resultados (nombre, id_asignatura) VALUES (?, ?)";

        try (Connection conn = Database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, resultado.getNombre());
            ps.setInt(2, resultado.getId_asignatura());
            ps.executeUpdate();

            // Obtener el ID generado automáticamente
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    resultado.setId(rs.getInt(1));
                }
            }

        } catch (Exception e) {
            System.err.println("Error al insertar resultado: " + e.getMessage());
        }
    }

    // Editar un resultado existente
    public void actualizarResultado(String nombreAnterior, String nuevoNombre) {
        String query = "UPDATE resultados SET nombre = ? WHERE nombre = ?";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, nuevoNombre);
            ps.setString(2, nombreAnterior);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error al actualizar resultado: " + e.getMessage());
        }
    }

    // Eliminar un resultado por ID
    public void eliminarResultado(int id) {
        String sql = "DELETE FROM resultados WHERE id = ?";

        try (Connection conn = Database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error al eliminar resultado: " + e.getMessage());
        }
    }

    // Obtener un resultado específico por ID
    public ResultadoAprendizaje obtenerPorId(int id) {
        String sql = "SELECT id, nombre, id_asignatura FROM resultados WHERE id = ?";
        ResultadoAprendizaje resultado = null;

        try (Connection conn = Database.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                resultado = new ResultadoAprendizaje(
                        rs.getInt("id"),
                        rs.getString("nombre"),
                        rs.getInt("id_asignatura")
                );
            }
        } catch (Exception e) {
            System.err.println("Error al obtener resultado por ID: " + e.getMessage());
        }

        return resultado;
    }
}
