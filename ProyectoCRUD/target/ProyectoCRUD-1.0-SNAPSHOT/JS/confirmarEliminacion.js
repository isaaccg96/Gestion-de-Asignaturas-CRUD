function confirmarEliminacion(id, mensaje) {
    if (confirm(mensaje || "¿Estás seguro de que deseas eliminar este elemento?")) {
        document.getElementById("eliminarForm-" + id).submit();
    }
}

