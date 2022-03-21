const validarFrm = () => {
    if (nombre.value == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar el nombre de la empresa',
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

    if (telefono.value == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar el telefono',
            'warning'
        )
        return false;
    }

    if (direccion.value == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar la direccion',
            'warning'
        )
        return false;
    }

    return true;
}
    
let GetData = function () {
    return {
        company: {
            Nombre: nombre.value,
            Correo: correo.value,
            Telefono: telefono.value,
            Direccion: direccion.value
        }
    };
}

let getID = (data) => {
    data.company.Id = Id.value;
}