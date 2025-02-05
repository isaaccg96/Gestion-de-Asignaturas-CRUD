package DAO;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static final String URL = "jdbc:mysql://localhost:3306/eusa";
    private static final String USER = "root"; // Cambia si tu usuario es diferente
    private static final String PASSWORD = ""; // Cambia si tienes contraseña

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Cargar el driver
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error al cargar el driver de MySQL", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}