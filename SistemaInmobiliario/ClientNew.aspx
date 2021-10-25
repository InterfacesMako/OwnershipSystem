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
		<button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i> &nbsp; LIMPIAR</button>
		&nbsp; &nbsp;
		<button id="btnGuardar" type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i> &nbsp; GUARDAR</button>
	</p>

	<script type="text/javascript">
		var btnGuardar = document.querySelector("#btnGuardar");

		btnGuardar.addEventListener("click", function (e) {
			e.preventDefault();

            var Id = document.querySelector("#<%=cliente_Id.ClientID%>");
            var dni = document.querySelector("#<%=cliente_dni.ClientID%>");
            var nombre = document.querySelector("#<%=cliente_nombre.ClientID%>");
            var apellido = document.querySelector("#<%=cliente_apellido.ClientID%>");
            var telefono = document.querySelector("#<%=cliente_telefono.ClientID%>");
            var direccion = document.querySelector("#<%=cliente_direccion.ClientID%>");

			var data = {
				cliente: {
					DNI: dni.value,
					Nombre: nombre.value,
					Apellido: apellido.value,
					Telefono: telefono.value,
					Direccion: direccion.value
                }
			}

			if (Id.value == 0) {
				$.ajax({
					type: 'POST',
					datatype: 'json',
					contentType: 'application/json; charset=utf-8',
					url: '<%=ResolveUrl("WebServiceCliente.asmx")%>/Registrar',
					data: JSON.stringify(data),
					success: function (response) {
						Id.value.value = response.d;
						Swal.fire({
							position: 'top-end',
							icon: 'success',
							title: 'Registrado sastifactoriamente',
							showConfirmButton: false,
							timer: 1500
						})
					},
					error: function (xhr, status, error) {
						console.log(error);
						swal("Error!", "Ha ocurrido un error en el servidor!", "error");
					}
				});
			} else {

				data.cliente.Id = Id.value;

                $.ajax({
                    type: 'POST',
                    datatype: 'json',
                    contentType: 'application/json; charset=utf-8',
                    url: '<%=ResolveUrl("WebServiceCliente.asmx")%>/Actualizar',
                    data: JSON.stringify(data),
                    success: function (response) {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: response.d,
                            showConfirmButton: false,
                            timer: 1500
                        })
                    },
                    error: function (xhr, status, error) {
                        console.log(error);
                        swal("Error!", "Ha ocurrido un error en el servidor!", "error");
                    }
                });
			}
		});

        document.querySelector("#aNew").className = " active";
    </script>
</asp:Content>
