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
                <tr class="text-center">
                    <td>1</td>
                    <th>03045643</th>
                    <th>NOMBRE DE USUARIO</th>
                    <th>APELLIDO DE USUARIO</th>
                    <th>2345456</th>
                    <th>NOMBRE DE USUARIO</th>
                    <th>ADMIN@ADMIN.COM</th>
                    <td>
                        <a href="user-update.html" class="btn btn-success">
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
                    <th>03045643</th>
                    <th>NOMBRE DE USUARIO</th>
                    <th>APELLIDO DE USUARIO</th>
                    <th>2345456</th>
                    <th>NOMBRE DE USUARIO</th>
                    <th>ADMIN@ADMIN.COM</th>
                    <td>
                        <a href="user-update.html" class="btn btn-success">
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
                    <th>03045643</th>
                    <th>NOMBRE DE USUARIO</th>
                    <th>APELLIDO DE USUARIO</th>
                    <th>2345456</th>
                    <th>NOMBRE DE USUARIO</th>
                    <th>ADMIN@ADMIN.COM</th>
                    <td>
                        <a href="user-update.html" class="btn btn-success">
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
                    <th>03045643</th>
                    <th>NOMBRE DE USUARIO</th>
                    <th>APELLIDO DE USUARIO</th>
                    <th>2345456</th>
                    <th>NOMBRE DE USUARIO</th>
                    <th>ADMIN@ADMIN.COM</th>
                    <td>
                        <a href="user-update.html" class="btn btn-success">
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
