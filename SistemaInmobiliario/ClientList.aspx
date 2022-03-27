<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="ClientList.aspx.cs" Inherits="SistemaInmobiliario.ClientList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
	<!--CONTENT-->
    <div class="container-fluid form-neon" style="margin-bottom:10px; display:none" id="buscador">
        <div class="row">
            <div class="col-12 col-md-4">
                <div class="form-group">
                    <label for="inputSearch" class="bmd-label-floating">¿Busque al cliente por apellido y nombre?</label>
                    <input type="text" class="form-control" name="busqueda" id="inputSearch" maxlength="30">
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="form-group">
                    <label for="inputSearch" class="bmd-label-floating">DNI</label>
                    <input type="text" class="form-control" name="busqueda" id="inputDNI" maxlength="30">
                </div>
            </div>
            <div class="col-12 col-md-4">
                <div class="form-group">
                    <label for="inputSearch" class="bmd-label-floating">Telefono</label>
                    <input type="text" class="form-control" name="busqueda" id="inputTelefono" maxlength="30">
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
    <div class="table-responsive">
        <table class="table table-dark table-sm" id="listado">
            <thead>
                <tr class="text-center roboto-medium">
                    <th>#</th>
                    <th>DNI</th>
                    <th>NOMBRE</th>
                    <th>APELLIDO</th>
                    <th>TELEFONO</th>
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

        const linkEdit = "/ClientNew?Id=";
        const urlDelete = '<%=ResolveUrl(WebService+".asmx")%>/Eliminar';
        const urlGetList = '<%=ResolveUrl(WebService+".asmx")%>/Listar';
        const Delete = '<%=Delete%>'
        const Edit = '<%=Edit%>'
        const Register = '<%=Register%>'
        let tbody = document.querySelector("tbody");
        const inputSearch = document.querySelector("#inputSearch");
        const inputDNI = document.querySelector("#inputDNI");
        const inputTelefono = document.querySelector("#inputTelefono");

        const buscar = document.querySelector("#btnBuscar");
        buscar.addEventListener("click", (e) => {
            e.preventDefault();
            Listar();
        });

        const ddlRegistroPaginacion = document.querySelector("#<%=ddlRegistroPaginacion.ClientID%>");
        ddlRegistroPaginacion.addEventListener("change", () => Listar());

        let GetData = function (item) {
            return {
                Id: item.Id,
                DNI: item.DNI,
                Nombre: item.Nombre,
                Apellido: item.Apellido,
                Telefono: item.Telefono
            };
        }

        let GetFilters = function () {
            return {
                Search: inputSearch.value.trim(),
                DNI: inputDNI.value.trim(),
                Telefono: inputTelefono.value.trim()
            }
        };

        Listar();
    </script>
</asp:Content>
