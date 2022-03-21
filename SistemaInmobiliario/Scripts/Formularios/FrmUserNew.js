const validarFrm = () => {
    if(usuario.value == "") {
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

    if (Id.value == "0") {
        if (clave1.value == "") {
            Swal.fire(
                'Advertencia?',
                'Debe completar la contraseña',
                'warning'
            )
            return false;
        }

        if (clave1.value != clave2.value) {
            Swal.fire(
                'Advertencia?',
                'Debe repetir la contraseña y deben ser las mismas',
                'warning'
            )
            return false;
        }
    }

    return true;
}
    
let GetData = function () {
    const idRol = getPrivilegios();

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
            IdRol: idRol,
        }
    };
}

let getID = (data) => {
    data.user.Id = Id.value;
}

let getPrivilegios = () => {
    let privilegioRpta;

    const SOLO_LECTURA = 0;
    const CONTROL_TOTAL = 1;
    const EDICCION = 2;
    const REGISTRAR = 3;

    if (rbLeer.checked) {
        privilegioRpta = SOLO_LECTURA;
    } else if (rbControlTotal.checked) {
        privilegioRpta = CONTROL_TOTAL
    } else if (rbEdiccion.checked) {
        privilegioRpta = EDICCION
    } else if (rbRegistrar.checked) {
        privilegioRpta = REGISTRAR
    }

    return privilegioRpta;
}; 
