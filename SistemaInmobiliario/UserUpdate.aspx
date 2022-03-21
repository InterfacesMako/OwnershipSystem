<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserUpdate.aspx.cs" Inherits="SistemaInmobiliario.UserUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SiteContent" runat="server">
    <!-- Page header -->
    <div class="full-box page-header">
        <h3 class="text-left">
            <i class="fas fa-sync-alt fa-fw"></i>&nbsp; ACTUALIZAR USUARIO
        </h3>
        <p class="text-justify">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
        </p>
    </div>

    <!-- Content -->
    <div class="container-fluid">
        <fieldset>
            <legend><i class="far fa-address-card"></i>&nbsp; Información personal</legend>
		<input type="hidden" runat="server" id="usuario_idRol" value="0" />
		<input type="hidden" runat="server" id="usuario_id" value="0" />
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="usuario_dni" class="bmd-label-floating">DNI</label>
                            <input type="text" runat="server" class="form-control" name="usuario_dni" id="usuario_dni" maxlength="20">
                        </div>
                    </div>

                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="usuario_nombre" class="bmd-label-floating">Nombres</label>
                            <input type="text" runat="server" class="form-control" name="usuario_nombre" id="usuario_nombre" maxlength="50">
                        </div>
                    </div>
                    <div class="col-12 col-md-4">
                        <div class="form-group">
                            <label for="usuario_apellido" class="bmd-label-floating">Apellidos</label>
                            <input type="text" runat="server" class="form-control" name="usuario_apellido" id="usuario_apellido" maxlength="50">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="usuario_telefono" class="bmd-label-floating">Teléfono</label>
                            <input type="text" runat="server" class="form-control" name="usuario_telefono" id="usuario_telefono" maxlength="30">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="usuario_direccion" class="bmd-label-floating">Dirección</label>
                            <input type="text" runat="server" class="form-control" name="usuario_direccion" id="usuario_direccion" maxlength="500">
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <br>
        <br>
        <br>
        <fieldset>
            <legend><i class="fas fa-user-lock"></i>&nbsp; Información de la cuenta</legend>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="usuario_usuario" class="bmd-label-floating">Nombre de usuario</label>
                            <input type="text" runat="server" class="form-control" name="usuario_usuario" id="usuario_usuario" maxlength="35">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="usuario_email" class="bmd-label-floating">Email</label>
                            <input type="email" runat="server" class="form-control" name="usuario_email" id="usuario_email" maxlength="70">
                        </div>
                    </div>
                    <div class="col-12">
                        <legend style="margin-top: 40px;"><i class="fas fa-lock"></i>&nbsp; Nueva contraseña</legend>
                        <p>Para actualizar la contraseña de esta cuenta ingrese una nueva y vuelva a escribirla. En caso que no desee actualizarla debe dejar vacíos los dos campos de las contraseñas.</p>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="usuario_clave_nueva_1" class="bmd-label-floating">Contraseña</label>
                            <input type="password" runat="server" class="form-control" name="usuario_clave_1" id="usuario_clave_1" maxlength="200">
                        </div>
                    </div>
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="usuario_clave_nueva_2" class="bmd-label-floating">Repetir contraseña</label>
                            <input type="password" runat="server" class="form-control" name="usuario_clave_2" id="usuario_clave_2" maxlength="200">
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <br>
        <br>
        <br>
        <p class="text-center" style="margin-top: 40px;">
            <button id="btnGuardar" type="submit" class="btn btn-raised btn-success btn-sm"><i class="fas fa-sync-alt"></i>&nbsp; ACTUALIZAR</button>
        </p>
    </div>
    <script type="text/javascript">
        const urlEdit = '<%=ResolveUrl($"{WebService}.asmx")%>/Actualizar';
        const btnGuardar = document.querySelector("#btnGuardar");
        
        const Id = document.querySelector("#<%=usuario_id.ClientID%>");
        const IdRol = document.querySelector("#<%=usuario_idRol.ClientID%>");
        const dni = document.querySelector("#<%=usuario_dni.ClientID%>");
        const nombres = document.querySelector("#<%=usuario_nombre.ClientID%>");
        const apellidos = document.querySelector("#<%=usuario_apellido.ClientID%>");
        const telefono = document.querySelector("#<%=usuario_telefono.ClientID%>");
        const direccion = document.querySelector("#<%=usuario_direccion.ClientID%>");
        const usuario = document.querySelector("#<%=usuario_usuario.ClientID%>");
        const correo = document.querySelector("#<%=usuario_email.ClientID%>");
        const clave1 = document.querySelector("#<%=usuario_clave_1.ClientID%>");
        const clave2 = document.querySelector("#<%=usuario_clave_2.ClientID%>");
    </script>
    <script src="Scripts/Formularios/FrmUserUpdate.js"></script>
    <script src="Scripts/Formularios/FrmStandard.js"></script>
    <script src="Scripts/actionsMain.js"></script>
</asp:Content>
