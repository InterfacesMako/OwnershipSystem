<%@ Page Title="Listado de Items" Language="C#" MasterPageFile="~/Items.Master" AutoEventWireup="true" CodeBehind="ItemsList.aspx.cs" Inherits="SistemaInmobiliario.ItemsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="table-responsive">
		<table class="table table-dark table-sm">
			<thead>
				<tr class="text-center roboto-medium">
					<th>#</th>
					<th>NOMBRE</th>
					<th>STOCK</th>
					<th>ACTUALIZAR</th>
					<th>ELIMINAR</th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
		</table>
	</div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled">
				<a class="page-link" href="#" tabindex="-1">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item">
				<a class="page-link" href="#">Next</a>
			</li>
		</ul>
	</nav>
	<script type="text/javascript">

        let tbody = document.querySelector("tbody");

        function crearFila(item) {
            var tr = document.createElement("tr");
            tr.className = "text-center";

            for (var i in item) {
                var td = crearColumna(item, i);
                tr.appendChild(td);
            }

            tr.appendChild(crearActualizar(item.Id));
            tr.appendChild(crearEliminar(item.Id));

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
            a.href = "/ItemsNew?Id=" + Id;
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
                    if (result.value) {
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

            var data = {
                item: {
                    Id: Id
                }
            };

            $.ajax({
                type: 'POST',
                datatype: 'json',
                contentType: 'application/json; charset=utf-8',
                url: '<%=ResolveUrl("WebServiceItem.asmx")%>/Eliminar',
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

        function Listar() {
            var lista = [];

            $.ajax({
                type: 'POST',
                datatype: 'json',
                contentType: 'application/json; charset=utf-8',
                url: '<%=ResolveUrl("WebServiceItem.asmx")%>/Listar',
                success: function (response) {
                    response.d.forEach(item => {
                        obj = {
                            Id: item.Id,
                            Nombre: item.Nombre,
                            Stock: item.Stock,
                        };

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

        Listar();

        document.querySelector("#aListItem").className = " active";
    </script>
</asp:Content>
