package Clases;

/**
 *
 * @author Isaac
 */

public class CriterioEvaluacion {
    private int id;
    private String nombre;
    private int id_resultado;

    // Constructor vacío
    public CriterioEvaluacion() {
    }

    // Constructor con todos los atributos
    public CriterioEvaluacion(int id, String nombre, int id_resultado) {
        this.id = id;
        this.nombre = nombre;
        this.id_resultado = id_resultado;
    }

    // Constructor sin ID (para inserciones)
    public CriterioEvaluacion(String nombre, int id_resultado) {
        this.nombre = nombre;
        this.id_resultado = id_resultado;
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

    public int getId_resultado() {
        return id_resultado;
    }

    public void setId_resultado(int id_resultado) {
        this.id_resultado = id_resultado;
    }

    @Override
    public String toString() {
        return "CriterioEvaluacion{" +
                "id=" + id +
                ", nombre='" + nombre + '\'' +
                ", id_resultado=" + id_resultado +
                '}';
    }
}
