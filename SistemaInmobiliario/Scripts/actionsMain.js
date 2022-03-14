        
let guardarRegistro = (data) => {
    $.ajax({
        type: 'POST',
        datatype: 'json',
        contentType: 'application/json; charset=utf-8',
        url: urlCreate,
        data: JSON.stringify(data),
        success: function (response) {
            Id.value = response.d;
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Registrado sastifactoriamente',
                showConfirmButton: false,
                timer: 1500
            })
        },
        error: function (xhr, status, error) {
            console.log(error);
            swal("Error!", "Ha ocurrido un error en el servidor!", "error");
        }
    });
}

let actualizarRegistro = (data) => {
    $.ajax({
        type: 'POST',
        datatype: 'json',
        contentType: 'application/json; charset=utf-8',
        url: urlEdit,
        data: JSON.stringify(data),
        success: function (response) {
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: response.d,
                showConfirmButton: false,
                timer: 1500
            })
        },
        error: function (xhr, status, error) {
            console.log(error);
            swal("Error!", "Ha ocurrido un error en el servidor!", "error");
        }
    });
}

btnGuardar.addEventListener("click", function (e) {
    e.preventDefault();

    var data = GetData();

    if (Id.value == 0) {
        guardarRegistro(data);
    } else {
        getID(data);
        actualizarRegistro(data);
    }
});