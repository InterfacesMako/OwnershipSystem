btnGuardar.addEventListener("click", function (e) {
    e.preventDefault();

    if (validarFrm()) {
        var data = GetData();

        if (Id.value == 0) {
            guardarRegistro(data);
        } else {
            getID(data);
            actualizarRegistro(data);
        }
    }
});