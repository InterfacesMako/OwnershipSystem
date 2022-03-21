const validarFrm = () => {
    if (nombre.value.trim() == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar el nombre',
            'warning'
        )
        return false;
    }

    if (stock.value.trim() == "") {
        Swal.fire(
            'Advertencia?',
            'Debe completar el stock',
            'warning'
        )
        return false;
    }

    return true;
}

let GetData = function () {
    return {
        item: {
            Nombre: nombre.value,
            Detalle: detalle.value,
            Stock: stock.value,
            Estado: estado.value
        }
    };
}

let getID = (data) => {
    data.item.Id = Id.value;
}

if (IdEstado.value == "Habilitado") {
    document.querySelector("#item_estado").value = "1"
} else {
    document.querySelector("#item_estado").value = "0"
}