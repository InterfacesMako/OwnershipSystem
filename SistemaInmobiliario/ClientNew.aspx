<%@ Page Title="" Language="C#" MasterPageFile="~/Client.Master" AutoEventWireup="true" CodeBehind="ClientNew.aspx.cs" Inherits="SistemaInmobiliario.ClientNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
	<fieldset>
		<legend><i class="fas fa-user"></i> &nbsp; Información básica</legend>
		<input type="hidden" runat="server" id="cliente_Id" value="0" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-md-6">
					<div class="form-group">
						<label for="cliente_dni" class="bmd-label-floating">DNI</label>
						<input type="text" runat="server" class="form-control" id="cliente_dni" name="cliente_dni" maxlength="27">
					</div>
				</div>
				<div class="col-12 col-md-6">
					<div class="form-group">
						<label for="cliente_nombre" class="bmd-label-floating">Nombre</label>
						<input type="text" runat="server" class="form-control" name="cliente_nombre" id="cliente_nombre" maxlength="40">
					</div>
				</div>
				<div class="col-12 col-md-4">
					<div class="form-group">
						<label for="cliente_apellido" class="bmd-label-floating">Apellido</label>
						<input type="text" runat="server" class="form-control" name="cliente_apellido" id="cliente_apellido" maxlength="40">
					</div>
				</div>
				<div class="col-12 col-md-4">
					<div class="form-group">
						<label for="cliente_telefono" class="bmd-label-floating">Teléfono</label>
						<input type="text" runat="server" class="form-control" name="cliente_telefono" id="cliente_telefono" maxlength="20">
					</div>
				</div>
				<div class="col-12 col-md-4">
					<div class="form-group">
						<label for="cliente_direccion" class="bmd-label-floating">Dirección</label>
						<input type="text" runat="server" class="form-control" name="cliente_direccion" id="cliente_direccion" maxlength="150">
					</div>
				</div>
			</div>
		</div>
	</fieldset>
	<br><br><br>
	<p class="text-center" style="margin-top: 40px;">
		<a href="ClientNew.aspx" class="btn btn-raised btn-success btn-sm"><i class="fas fa-file"></i> &nbsp; NUEVO</a>
		&nbsp; &nbsp;
		<button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
		&nbsp; &nbsp;
		<button id="btnGuardar" type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
	</p>

	<script type="text/javascript">
        const urlCreate = '<%=ResolveUrl($"{WebService}.asmx")%>/Registrar';
        const urlEdit = '<%=ResolveUrl($"{WebService}.asmx")%>/Actualizar';
        const btnGuardar = document.querySelector("#btnGuardar");

        const Id = document.querySelector("#<%=cliente_Id.ClientID%>");
        const dni = document.querySelector("#<%=cliente_dni.ClientID%>");
        const nombre = document.querySelector("#<%=cliente_nombre.ClientID%>");
        const apellido = document.querySelector("#<%=cliente_apellido.ClientID%>");
        const telefono = document.querySelector("#<%=cliente_telefono.ClientID%>");
        const direccion = document.querySelector("#<%=cliente_direccion.ClientID%>");
    </script>
    <script src="Scripts/Formularios/FrmClientNew.js"></script>
    <script src="Scripts/Formularios/FrmStandard.js"></script>
    <script src="Scripts/actionsMain.js"></script>
</asp:Content>
