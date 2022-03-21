const validarFrm = () => {
    if (dni.value.trim() == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar DNI',
            'warning'
        )
        return false;
    }

    if (nombre.value.trim() == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar Nombre de cliente',
            'warning'
        )
        return false;
    }

    if (apellido.value.trim() == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar Apellido del cliente',
            'warning'
        )
        return false;
    }

    if (telefono.value.trim() == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar Telefono del cliente',
            'warning'
        )
        return false;
    }

    return true;
}
    
let GetData = function () {
    return {
        cliente: {
            DNI: dni.value,
            Nombre: nombre.value,
            Apellido: apellido.value,
            Telefono: telefono.value,
            Direccion: direccion.value
        }
    };
}

let getID = (data) => {
    data.cliente.Id = Id.value;
}
