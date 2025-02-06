/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author Isaac
 */

public class ResultadoAprendizaje {
    private int id;
    private String nombre;
    private int id_asignatura;

    // Constructor vacío
    public ResultadoAprendizaje() {
    }

    // Constructor con todos los atributos
    public ResultadoAprendizaje(int id, String nombre, int id_asignatura) {
        this.id = id;
        this.nombre = nombre;
        this.id_asignatura = id_asignatura;
    }

    // Constructor sin ID (para inserciones)
    public ResultadoAprendizaje(String nombre, int id_asignatura) {
        this.nombre = nombre;
        this.id_asignatura = id_asignatura;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getId_asignatura() {
        return id_asignatura;
    }

    public void setId_asignatura(int id_asignatura) {
        this.id_asignatura = id_asignatura;
    }

    @Override
    public String toString() {
        return "ResultadoAprendizaje{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", id_asignatura=" + id_asignatura +
                '}';
    }
}
