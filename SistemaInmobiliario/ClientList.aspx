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
                <tr class="text-center">
                    <td>1</td>
                    <td>012342567</td>
                    <td>NOMBRE DEL CLIENTE</td>
                    <td>APELLIDO DEL CLIENTE</td>
                    <td>72349874</td>
                    <td>
                        <a href="client-update.html" class="btn btn-success">
                            <i class="fas fa-sync-alt"></i>
                        </a>
                    </td>
                    <td>
                        <form action="">
                            <button type="button" class="btn btn-warning">
                                <i class="far fa-trash-alt"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                <tr class="text-center">
                    <td>2</td>
                    <td>012342567</td>
                    <td>NOMBRE DEL CLIENTE</td>
                    <td>APELLIDO DEL CLIENTE</td>
                    <td>72349874</td>
                    <td>
                        <a href="client-update.html" class="btn btn-success">
                            <i class="fas fa-sync-alt"></i>
                        </a>
                    </td>
                    <td>
                        <form action="">
                            <button type="button" class="btn btn-warning">
                                <i class="far fa-trash-alt"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                <tr class="text-center">
                    <td>3</td>
                    <td>012342567</td>
                    <td>NOMBRE DEL CLIENTE</td>
                    <td>APELLIDO DEL CLIENTE</td>
                    <td>72349874</td>
                    <td>
                        <a href="client-update.html" class="btn btn-success">
                            <i class="fas fa-sync-alt"></i>
                        </a>
                    </td>
                    <td>
                        <form action="">
                            <button type="button" class="btn btn-warning">
                                <i class="far fa-trash-alt"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                <tr class="text-center">
                    <td>4</td>
                    <td>012342567</td>
                    <td>NOMBRE DEL CLIENTE</td>
                    <td>APELLIDO DEL CLIENTE</td>
                    <td>72349874</td>
                    <td>
                        <a href="client-update.html" class="btn btn-success">
                            <i class="fas fa-sync-alt"></i>
                        </a>
                    </td>
                    <td>
                        <form action="">
                            <button type="button" class="btn btn-warning">
                                <i class="far fa-trash-alt"></i>
                            </button>
                        </form>
                    </td>
                </tr>
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
</asp:Content>
