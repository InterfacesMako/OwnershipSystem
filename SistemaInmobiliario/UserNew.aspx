<%@ Page Title="" Language="C#" MasterPageFile="~/Users.Master" AutoEventWireup="true" CodeBehind="UserNew.aspx.cs" Inherits="SistemaInmobiliario.UserNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <fieldset>
        <legend><i class="far fa-address-card"></i>&nbsp; Información personal</legend>
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
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="usuario_clave_1" class="bmd-label-floating">Contraseña</label>
                        <input type="password" runat="server" class="form-control" name="usuario_clave_1" id="usuario_clave_1" maxlength="200">
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="usuario_clave_2" class="bmd-label-floating">Repetir contraseña</label>
                        <input type="password" runat="server" class="form-control" name="usuario_clave_2" id="usuario_clave_2" maxlength="200">
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
    <br>
    <br>
    <br>
    <fieldset>
        <legend><i class="fas fa-medal"></i>&nbsp; Nivel de privilegio</legend>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <p> <asp:RadioButton GroupName="privilegios" ID="rbControlTotal" runat="server" checked /> <span class="badge badge-info">Control total</span> Permisos para registrar, actualizar, eliminar y leer</p>
                    <p> <asp:RadioButton GroupName="privilegios" ID="rbEdiccion" runat="server" /> <span class="badge badge-success">Edición</span> Permisos para registrar, actualizar y leer</p>
                    <p> <asp:RadioButton GroupName="privilegios" ID="rbRegistrar" runat="server" /> <span class="badge badge-dark">Registrar</span> Solo permisos para registrar y leer </p>
                    <p> <asp:RadioButton GroupName="privilegios" ID="rbLeer" runat="server" /> <span class="badge badge-danger">Lectura</span> Solo permisos para solo lectura </p>
                </div>
            </div>
        </div>
    </fieldset>
    <p class="text-center" style="margin-top: 40px;">
        <button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i>&nbsp; LIMPIAR</button>
        &nbsp; &nbsp;
		<button id="btnGuardar" type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i>&nbsp; GUARDAR</button>
    </p>
    <script type="text/javascript">
        const urlCreate = '<%=ResolveUrl($"{WebService}.asmx")%>/Registrar';
        const urlEdit = '<%=ResolveUrl($"{WebService}.asmx")%>/Actualizar';
        const btnGuardar = document.querySelector("#btnGuardar");

        const Id = document.querySelector("#<%=usuario_id.ClientID%>");
        const dni = document.querySelector("#<%=usuario_dni.ClientID%>");
        const nombres = document.querySelector("#<%=usuario_nombre.ClientID%>");
        const apellidos = document.querySelector("#<%=usuario_apellido.ClientID%>");
        const telefono = document.querySelector("#<%=usuario_telefono.ClientID%>");
        const direccion = document.querySelector("#<%=usuario_direccion.ClientID%>");
        const usuario = document.querySelector("#<%=usuario_usuario.ClientID%>");
        const correo = document.querySelector("#<%=usuario_email.ClientID%>");
        const clave1 = document.querySelector("#<%=usuario_clave_1.ClientID%>");
        const clave2 = document.querySelector("#<%=usuario_clave_2.ClientID%>");

        //Roles Privigelios & Permisos
        const rbControlTotal = document.querySelector("#<%=rbControlTotal.ClientID%>");
        const rbEdiccion = document.querySelector("#<%=rbEdiccion.ClientID%>");
        const rbRegistrar = document.querySelector("#<%=rbRegistrar.ClientID%>");
        const rbLeer = document.querySelector("#<%=rbLeer.ClientID%>");
        
        

    </script>
    <script src="Scripts/Formularios/FrmUserNew.js"></script>
    <script src="Scripts/Formularios/FrmStandard.js"></script>
    <script src="Scripts/actionsMain.js"></script>
</asp:Content>
