<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="SistemaInmobiliario.UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="table-responsive">
        <table class="table table-dark table-sm">
            <thead>
                <tr class="text-center roboto-medium">
                    <th>#</th>
                    <th>DNI</th>
                    <th>NOMBRE</th>
                    <th>APELLIDO</th>
                    <th>TELÉFONO</th>
                    <th>USUARIO</th>
                    <th>EMAIL</th>
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
    <script src="Scripts/actionsList.js"></script>
    <script type="text/javascript">
        const tbody = document.querySelector("tbody");
        const linkEdit = "/UserNew?Id=";
        const urlDelete = '<%=ResolveUrl(WebService+".asmx")%>/Eliminar';
        const urlGetList = '<%=ResolveUrl(WebService+".asmx")%>/Listar';

        let GetData = function (item) {
            return {
                Id: item.Id,
                DNI: item.DNI,
                Nombre: item.Nombres,
                Apellido: item.Apellidos,
                Telefono: item.Telefono,
                Usuario: item.Username,
                Email: item.Correo,
            };
        }

        Listar();
    </script>
</asp:Content>
