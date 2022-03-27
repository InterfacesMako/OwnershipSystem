function clearBodyList() {
    let listado = document.querySelector("#listado");
    if (listado.children[1]) {
        listado.children[1].remove();
    }
    if (!listado.children[1]) {
        tbody = document.createElement('tbody');
        listado.appendChild(tbody);
    }
}

function addPaginator(pagActiva, pagMostrar, pagTotales) {
    var paginador = document.querySelector("#paginador");

    if (paginador != null) {

        removePaginator();

        let paginasMargen = Math.ceil((pagMostrar / 2));
        let PaginaPrimera = 1; //indicador de pagina Inicial
        let paginaUltima = pagMostrar; //indicador de pagina Final

        if (pagActiva <= paginasMargen) {
            PaginaPrimera = 1;
        }
        else if (pagActiva >= paginasMargen) {
            PaginaPrimera = pagActiva - parseInt(paginasMargen);
            paginaUltima = pagActiva + parseInt(paginasMargen);
        }

        if (paginaUltima > pagTotales)
            paginaUltima = pagTotales;

        paginador.appendChild(addFirstOrLast(pagActiva - 1, "«", pagTotales));

        for (var i = PaginaPrimera; i <= paginaUltima; i++) {

            let esPagActiva = false;

            if (i == pagActiva) {
                esPagActiva = true;
            }

            paginador.appendChild(addLiToList(esPagActiva, i));
        }

        paginador.appendChild(addFirstOrLast(pagActiva + 1, "»", pagTotales));
    }
}

function removePaginator() {
    while (paginador.children.length > 0) {
        paginador.children[0].remove();
    }
}

function addLiToList(esPagActiva, pag) {
    let li = document.createElement('li');
    li.appendChild(addPageRedirect(pag));
    if (esPagActiva) {
        li.classList = ["page-item active"];
    }

    return li;
}

function addPageRedirect(pag) {
    let a = document.createElement('a');
    a.classList = ["page-link"];
    a.href = "#";
    a.addEventListener("click", function () { Listar(pag); });
    a.textContent = pag;
    return a;
}

function addFirstOrLast(pag, simbolo, pagTotales) {
    let li = document.createElement('li');
    let a = document.createElement('a');
    a.classList = ["page-link"];
    a.href = "#";
    a.textContent = simbolo;

    if (pag <= 0 || pag > pagTotales) {
        li.classList = ["page-item disabled"];
    } else {
        a.addEventListener("click", function () { Listar(pag); });
    }

    li.appendChild(a);
    return li;
}

function crearFila(item) {
    var tr = document.createElement("tr");
    tr.className = "text-center";

    for (var i in item) {
        var td = crearColumna(item, i);
        tr.appendChild(td);
    }

    if (Edit != "False") {
        tr.appendChild(crearActualizar(item.Id));
    }

    if (Delete != "False") {
        tr.appendChild(crearEliminar(item.Id));
    }

    tbody.appendChild(tr);
}

function crearColumna(item, i) {
    var td = document.createElement("td");
    td.textContent = item[i];
    return td;
}

function crearActualizar(Id) {
    var i = document.createElement("i");
    i.className = "fas fa-sync-alt";

    var a = document.createElement("a");
    a.className = "btn btn-success";
    a.href = linkEdit + Id;
    a.appendChild(i);

    var td = document.createElement("td");
    td.appendChild(a);

    return td;
}

function crearEliminar(Id) {
    var i = document.createElement("i");
    i.className = "far fa-trash-alt";

    var button = document.createElement("button");
    button.className = "btn btn-warning";
    button.addEventListener("click", function (e) {
        e.preventDefault();

        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {

            if (result.value == true) {
                Eliminar(Id);
            }
        });
    });

    button.appendChild(i);

    var td = document.createElement("td");
    td.appendChild(button);

    return td;
}

function Eliminar(Id) {

    let data = {
        Id: Id
    };

    $.ajax({
        type: 'POST',
        datatype: 'json',
        contentType: 'application/json; charset=utf-8',
        url: urlDelete,
        data: JSON.stringify(data),
        success: function (response) {

            for (var i = 0; i < tbody.rows.length; i++) {
                if (tbody.rows[i].childNodes[0].textContent == Id) {
                    tbody.deleteRow(i);
                }
            }

            Swal.fire(
                'Deleted!',
                'Your file has been deleted.',
                'success'
            )
        },
        error: function (xhr, status, error) {
            console.log(error);
            swal("Error!", "Ha ocurrido un error en el servidor!", "error");
        }
    });
}

function Listar(pag = 1) {
    var lista = [];

    let data = {
        paginator: {
            ActualPage: pag,
            ItemsPerPage: ddlRegistroPaginacion.value
        },
        filters: GetFilters()
    }

    $.ajax({
        type: 'POST',
        datatype: 'json',
        contentType: 'application/json; charset=utf-8',
        url: urlGetList,
        data: JSON.stringify(data),
        success: function (response) {
            clearBodyList();

            addPaginator(response.d.ActualPage,
                response.d.NumPageShow,
                response.d.PagesTot);

            response.d.Model.forEach(item => {
                obj = GetData(item);
                lista.push(obj);
            });

            lista.forEach(item => crearFila(item));
        },
        error: function (xhr, status, error) {
            console.log(error);
            swal("Error!", "Ha ocurrido un error en el servidor!", "error");
        }
    });
}
