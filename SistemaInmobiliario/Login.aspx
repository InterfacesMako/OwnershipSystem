<%@ Page Title="" Language="C#" MasterPageFile="~/Access.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SistemaInmobiliario.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
		<div class="login-content">
			<p class="text-center">
				<i class="fas fa-user-circle fa-5x"></i>
			</p>
			<p class="text-center">
				Inicia sesión con tu cuenta
			</p>
			<div class="form-group">
				<label for="UserName" class="bmd-label-floating"><i class="fas fa-user-secret"></i> &nbsp; Usuario</label>
				<input runat="server" type="text" class="form-control" id="UserName" name="usuario" pattern="[a-zA-Z0-9]{1,35}" maxlength="35">
			</div>
			<div class="form-group">
				<label for="UserPassword" class="bmd-label-floating"><i class="fas fa-key"></i> &nbsp; Contraseña</label>
				<input runat="server" type="password" class="form-control" id="UserPassword" name="clave" maxlength="200">
			</div>
			<asp:Button runat="server" id="btnLogin" OnClick="btnLogin_Click" class="btn-login text-center" text="LOG IN"></asp:Button>
			<a href="CreateAccount" class="btn-login text-center">CREATE ACCOUNT</a>
		</div>
	</div>
</asp:Content>
