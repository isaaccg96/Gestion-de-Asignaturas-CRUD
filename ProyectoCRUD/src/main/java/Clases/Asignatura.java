/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author Isaac
 */
public class Asignatura {
    private int id;
    private String nombre;

    // Constructor cuando ya tenemos el ID
    public Asignatura(int id, String nombre) {
        this.id = id;
        this.nombre = nombre;
    }

    // Constructor sin ID (para inserciones)
    public Asignatura(String nombre) {
        this.nombre = nombre;
    }

    // Getters y setters
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

    // Método toString
    @Override
    public String toString() {
        return "Asignatura{Nombre='" + nombre + "}";
    }
}
