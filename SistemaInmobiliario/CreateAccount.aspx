<%@ Page Title="" Language="C#" MasterPageFile="~/Access.Master" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="SistemaInmobiliario.CreateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="login-container">
		<div class="login-content">
            <a style="text-decoration:none; color:#ccc;" href="login"><i class="fas fa-arrow-left"></i> BACK </a>
			
			<p class="text-center">
				<i class="fas fa-user-circle fa-5x"></i>
			</p>
			<p class="text-center">
				Crea tu cuenta
			</p>
			<p>
                <span id="msjValidaciones" style="color:red; font-weight:bold;">
                </span>
			</p>
			<div class="form-group">
				<label for="UserName" class="bmd-label-floating"><i class="fas fa-user-secret"></i> &nbsp; Usuario</label>
				<input runat="server" type="text" class="form-control" id="UserName" name="usuario" pattern="[a-zA-Z0-9]{1,35}" maxlength="35">
			</div>
			<div class="form-group">
				<label for="UserPassword" class="bmd-label-floating"><i class="fas fa-at"></i> &nbsp; Correo</label>
				<input runat="server" type="text" class="form-control" id="UserMail" name="clave" maxlength="200">
			</div>
			<div class="form-group">
				<label for="UserPassword" class="bmd-label-floating"><i class="fas fa-key"></i> &nbsp; Contraseña</label>
				<input runat="server" type="password" class="form-control" id="UserPassword" name="clave" maxlength="200">
			</div>
			<div class="form-group">
				<label for="UserRepeatPassword" class="bmd-label-floating"><i class="fas fa-key"></i> &nbsp; Repite Contraseña</label>
				<input runat="server" type="password" class="form-control" id="UserRepeatPassword" name="clave" maxlength="200">
			</div>
			<asp:Button runat="server" ID="btnCreateAndLogin" OnClick="btnCreateAndLogin_Click" class="btn-login text-center" Text="CREATE AND LOGIN"></asp:Button>
		</div>
	</div>

	<script type="text/javascript">

        let btnCreate = document.querySelector("#<%=btnCreateAndLogin.ClientID%>");
        let msjValidaciones = document.querySelector("#msjValidaciones");

		btnCreate.addEventListener("click", (e) => {
            let user = document.querySelector("#<%=UserName.ClientID%>").value;
            let mail = document.querySelector("#<%=UserMail.ClientID%>").value;
            let pass = document.querySelector("#<%=UserPassword.ClientID%>").value;
            let passRepeated = document.querySelector("#<%=UserRepeatPassword.ClientID%>").value;

            msjValidaciones.innerHTML = "";

			if (user == "") {
				msjValidaciones.innerHTML = "username vacio";
				e.preventDefault();
				return false;
			}

            if (mail == "") {
                msjValidaciones.innerHTML = "email vacio";
				e.preventDefault();
                return false;
			}

            if (pass == "") {
                msjValidaciones.innerHTML = "password vacio";
				e.preventDefault();
                return false;
            }

            if (pass != passRepeated) {
                msjValidaciones.innerHTML = "no se repitio password";
				e.preventDefault();
                return false;
            }

            return true;
        });
        
    </script>
</asp:Content>
