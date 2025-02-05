/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Clases.Asignatura;
import DAO.AsignaturaDAO;
import java.util.List;

/**
 *
 * @author DAW2
 */
public class AsignaturaController {

    private final AsignaturaDAO dao;

    public AsignaturaController() {
        this.dao = new AsignaturaDAO();
    }

    // Método para obtener todas las asignaturas
    public List<Asignatura> listarAsignaturas() {
        return dao.listarAsignaturas();
    }

    // Método para insertar una asignatura
    public void insertarAsignatura(String nombre) {
        Asignatura asignatura = new Asignatura(nombre); // Crear objeto Asignatura
        dao.insertarAsignatura(asignatura); // Insertar en la BD (el ID se genera automáticamente)

        // Ahora la asignatura tiene su ID asignado después de la inserción en la BD
        System.out.println("Asignatura insertada con ID: " + asignatura.getId());
    }

    // Método para eliminar una asignatura por su nombre
    public void eliminarAsignatura(String nombre) {
        dao.eliminarAsignaturaPorNombre(nombre);
    }

    // Método para actualizar una asignatura
    public void actualizarAsignatura(String nombreAnterior, String nuevoNombre) {
        dao.actualizarAsignatura(nombreAnterior, nuevoNombre);
    }

    public Asignatura obtenerAsignaturaPorId(int id) {
        return dao.obtenerPorId(id);
    }
}
