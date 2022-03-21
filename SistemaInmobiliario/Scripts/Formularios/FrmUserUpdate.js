const validarFrm = () => {
    if (usuario.value == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar usuario',
            'warning'
        )
        return false;
    }

    if (correo.value == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar el correo',
            'warning'
        )
        return false;
    }

    if (clave1.value.trim() != clave2.value.trim()) {
        Swal.fire(
            'Advertencia?',
            'Debe repetir la contraseña y deben ser las mismas',
            'warning'
        )
        return false;
    }

    return true;
}

let GetData = function () {
    return {
        user: {
            DNI: dni.value,
            Nombres: nombres.value,
            Apellidos: apellidos.value,
            Telefono: telefono.value,
            Direccion: direccion.value,
            Username: usuario.value,
            Correo: correo.value,
            Password: clave1.value,
            IdRol: IdRol.value,
        }
    };
}

let getID = (data) => {
    data.user.Id = Id.value;
}