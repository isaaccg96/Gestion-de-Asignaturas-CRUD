package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Clases.Asignatura;
import java.sql.Statement;

public class AsignaturaDAO {

    public List<Asignatura> listarAsignaturas() {
        List<Asignatura> asignaturas = new ArrayList<>();
        String query = "SELECT * FROM asignaturas";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(query); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                asignaturas.add(new Asignatura(
                        rs.getInt("id"), // Primero el ID
                        rs.getString("nombre") // Luego el nombre
                ));
            }

        } catch (Exception e) {
            System.err.println("Error al listar asignaturas: " + e.getMessage());
        }
        return asignaturas;
    }

    public void insertarAsignatura(Asignatura asignatura) {
        String query = "INSERT INTO asignaturas (nombre) VALUES (?)";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, asignatura.getNombre());
            ps.executeUpdate();

            // Obtener el ID generado automáticamente
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    asignatura.setId(rs.getInt(1)); // Asignamos el ID generado al objeto
                }
            }

        } catch (Exception e) {
            System.err.println("Error al insertar asignatura: " + e.getMessage());
        }
    }

    public void eliminarAsignaturaPorNombre(String nombre) {
        String query = "DELETE FROM asignaturas WHERE nombre = ?";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, nombre);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error al eliminar asignatura: " + e.getMessage());
        }
    }

    public void actualizarAsignatura(String nombreAnterior, String nuevoNombre) {
        String query = "UPDATE asignaturas SET nombre = ? WHERE nombre = ?";

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, nuevoNombre);
            ps.setString(2, nombreAnterior);
            ps.executeUpdate();

        } catch (Exception e) {
            System.err.println("Error al actualizar asignatura: " + e.getMessage());
        }
    }

    public Asignatura obtenerPorId(int id) {
        String query = "SELECT * FROM asignaturas WHERE id = ?";
        Asignatura asignatura = null;

        try (Connection con = Database.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    asignatura = new Asignatura(
                            rs.getInt("id"),
                            rs.getString("nombre")
                    );
                }
            }
        } catch (Exception e) {
            System.err.println("Error al obtener asignatura por ID: " + e.getMessage());
        }

        return asignatura;
    }
}
