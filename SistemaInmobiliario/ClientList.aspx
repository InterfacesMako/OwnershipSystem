<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="ClientList.aspx.cs" Inherits="SistemaInmobiliario.ClientList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <!-- Content here-->
    <div class="table-responsive">
        <table class="table table-dark table-sm">
            <thead>
                <tr class="text-center roboto-medium">
                    <th>#</th>
                    <th>DNI</th>
                    <th>NOMBRE</th>
                    <th>APELLIDO</th>
                    <th>TELEFONO</th>
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
        const linkEdit = "/ClientNew?Id=";
        const urlDelete = '<%=ResolveUrl(WebService+".asmx")%>/Eliminar';
        const urlGetList = '<%=ResolveUrl(WebService+".asmx")%>/Listar';

        let GetData = function (item) {
            return {
                Id: item.Id,
                DNI: item.DNI,
                Nombre: item.Nombre,
                Apellido: item.Apellido,
                Telefono: item.Telefono
            };
        }

        Listar();

    </script>
</asp:Content>
