<%@ Page Title="Listado de Items" Language="C#" MasterPageFile="~/Items.Master" AutoEventWireup="true" CodeBehind="ItemsList.aspx.cs" Inherits="SistemaInmobiliario.ItemsList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
	<!--CONTENT-->
    <div class="container-fluid form-neon" style="margin-bottom:10px; display:none" id="buscador">
        <div class="container-fluid">
            <div class="row justify-content-md-center">
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="inputSearch" class="bmd-label-floating">¿Qué item estas buscando?</label>
                        <input type="text" class="form-control" name="busqueda" id="inputSearch" maxlength="30">
                    </div>
                </div>
                <div class="col-12">
                    <p class="text-center" style="margin-top: 40px;">
                        <button type="submit" class="btn btn-raised btn-info" id="btnBuscar">
                            <i class="fas fa-search"></i> &nbsp; BUSCAR</button>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="table-responsive">
		<table class="table table-dark table-sm" id="listado">
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
	<div class="navegacion-controles">
        Registros:
        <asp:DropDownList ID="ddlRegistroPaginacion" runat="server" style="display:inline-block" CssClass="" Width="50px" >
            <asp:ListItem Text="1" Value="1" />
            <asp:ListItem Text="5" Value="5" />
            <asp:ListItem Text="10" Value="10" Selected />
            <asp:ListItem Text="20" Value="20" />
            <asp:ListItem Text="50" Value="50" />
        </asp:DropDownList>
        De:
        <asp:Label ID="lblNumeroRegistros" CssClass="negrita" runat="server" Text="100"></asp:Label>
    </div>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center" id="paginador">
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

        const linkEdit = "/ItemsNew?Id=";
        const urlDelete = '<%=ResolveUrl(WebService+".asmx")%>/Eliminar';
		const urlGetList = '<%=ResolveUrl(WebService+".asmx")%>/Listar';
        const Delete = '<%=Delete%>'
        const Edit = '<%=Edit%>'
        const Register = '<%=Register%>'
        const inputSearch = document.querySelector("#inputSearch");

        const buscar = document.querySelector("#btnBuscar");
        buscar.addEventListener("click", (e) => {
            e.preventDefault();
            Listar();
        });

        let tbody = document.querySelector("tbody");
        const ddlRegistroPaginacion = document.querySelector("#<%=ddlRegistroPaginacion.ClientID%>");
        ddlRegistroPaginacion.addEventListener("change", () => Listar());

        let GetData = function (item) {
            return {
                Id: item.Id,
                Nombre: item.Nombre,
                Stock: item.Stock,
            };
		}

        let GetFilters = function () {
            return {
                Search: inputSearch.value.trim()
            }
        };

        Listar();
    </script>
</asp:Content>
