# Gestion-de-Asignaturas-CRUD
El propósito de esta práctica es desarrollar una aplicación web utilizando JSP para realizar operaciones CRUD (Crear, Leer, Actualizar, Eliminar) sobre una base de datos MySQL.

SCRIPT PARA LA BASE DE DATOS EN MYSQL:

-- Crear la base de datos si no existe
CREATE DATABASE IF NOT EXISTS eusa;
USE eusa;

-- Crear tabla de asignaturas
CREATE TABLE IF NOT EXISTS asignaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla de resultados
CREATE TABLE IF NOT EXISTS resultados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_asignatura INT NOT NULL,
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id) ON DELETE CASCADE
);

-- Crear tabla de criterios (relacionados directamente con los resultados)
CREATE TABLE IF NOT EXISTS criterios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    id_resultado INT NOT NULL,
    FOREIGN KEY (id_resultado) REFERENCES resultados(id) ON DELETE CASCADE
);

-- Insertar asignaturas
INSERT INTO asignaturas (nombre) VALUES 
('Programación'),
('Estructuras de Datos'),
('Gestión de Proyectos');

-- Insertar resultados asociados a las asignaturas
INSERT INTO resultados (nombre, id_asignatura) VALUES 
('Comprende los fundamentos de programación', 1),
('Domina la sintaxis y estructura de código', 1),
('Aplica algoritmos en problemas reales', 1),
('Domina estructuras de datos lineales y no lineales', 2),
('Implementa algoritmos eficientes', 2),
('Gestiona proyectos de software', 3),
('Aplica metodologías ágiles', 3);

-- Insertar criterios asociados a los resultados
INSERT INTO criterios (nombre, id_resultado) VALUES 
('Comprensión de conceptos', 1),
('Resolución de problemas', 1),
('Trabajo en equipo', 2),
('Creatividad e innovación', 2),
('Uso de herramientas tecnológicas', 3),
('Comunicación efectiva', 3),
('Gestión del tiempo', 4),
('Análisis crítico', 5);
