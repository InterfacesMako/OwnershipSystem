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
					<th id="thEdit">ACTUALIZAR</th>
					<th id="thDelete">ELIMINAR</th>
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
    <script src="Scripts/actionsList.js"></script>
	<script type="text/javascript">

        const tbody = document.querySelector("tbody");
        const linkEdit = "/ItemsNew?Id=";
        const urlDelete = '<%=ResolveUrl(WebService+".asmx")%>/Eliminar';
		const urlGetList = '<%=ResolveUrl(WebService+".asmx")%>/Listar';
        const Delete = '<%=Delete%>'
        const Edit = '<%=Edit%>'
        const Register = '<%=Register%>'

        let GetData = function (item) {
            return {
                Id: item.Id,
                Nombre: item.Nombre,
                Stock: item.Stock,
            };
        }

        Listar();
    </script>
</asp:Content>
