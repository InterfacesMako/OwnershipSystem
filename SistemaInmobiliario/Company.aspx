<%@ Page Title="" Language="C#" MasterPageFile="~/Company.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="SistemaInmobiliario.NewCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <fieldset>
        <legend><i class="far fa-building"></i>&nbsp; Información de la empresa</legend>
		<input type="hidden" runat="server" id="empresa_Id" value="0" />
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="empresa_nombre" class="bmd-label-floating">Nombre de la empresa</label>
                        <input type="text" runat="server" class="form-control" name="empresa_nombre" id="empresa_nombre" maxlength="70">
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="empresa_correo" class="bmd-label-floating">Correo</label>
                        <input type="email" runat="server" class="form-control" name="empresa_correo" id="empresa_correo" maxlength="70">
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="empresa_telefono" class="bmd-label-floating">Telefono</label>
                        <input type="text" runat="server" class="form-control" name="empresa_telefono" id="empresa_telefono" maxlength="30">
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="empresa_direccion" class="bmd-label-floating">Dirección</label>
                        <input type="text" runat="server" class="form-control" name="empresa_direccion" id="empresa_direccion" maxlength="500">
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
    <br>
    <br>
    <br>
    <p class="text-center" style="margin-top: 40px;">
        <button type="reset" class="btn btn-raised btn-secondary btn-sm"><i class="fas fa-paint-roller"></i>&nbsp; LIMPIAR</button>
        &nbsp; &nbsp;
        <button  id="btnGuardar" type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i>&nbsp; GUARDAR</button>
    </p>
    <script type="text/javascript">
        const urlCreate = '<%=ResolveUrl($"{WebService}.asmx")%>/Registrar';
        const urlEdit = '<%=ResolveUrl($"{WebService}.asmx")%>/Actualizar';
        const btnGuardar = document.querySelector("#btnGuardar");

        const Id = document.querySelector("#<%=empresa_Id.ClientID%>");
        const nombre = document.querySelector("#<%=empresa_nombre.ClientID%>");
        const correo = document.querySelector("#<%=empresa_correo.ClientID%>");
        const telefono = document.querySelector("#<%=empresa_telefono.ClientID%>");
        const direccion = document.querySelector("#<%=empresa_direccion.ClientID%>");

        let GetData = function () {
            return {
                company: {
                    Nombre: nombre.value,
                    Correo: correo.value,
                    Telefono: telefono.value,
                    Direccion: direccion.value
                }
            };
		}

        let getID = (data) => {
            data.company.Id = Id.value;
        }

    </script>
    <script src="Scripts/actionsMain.js"></script>
</asp:Content>
