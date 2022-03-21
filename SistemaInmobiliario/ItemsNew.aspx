<%@ Page Title="Nuevo Item" Language="C#" MasterPageFile="~/Items.Master" AutoEventWireup="true" CodeBehind="ItemsNew.aspx.cs" Inherits="SistemaInmobiliario.ItemsNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <fieldset>
        <asp:HiddenField ID="IdEstado" runat="server" />
        <legend><i class="far fa-plus-square"></i>&nbsp; Información del item</legend>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-md-4">
                    <div class="form-group">
                        <label for="item_codigo" class="bmd-label-floating">Códido</label>
                        <input type="text" runat="server" class="form-control" name="item_codigo" id="item_codigo" readonly="readonly" maxlength="45">
                    </div>
                </div>

                <div class="col-12 col-md-4">
                    <div class="form-group">
                        <label for="item_nombre" class="bmd-label-floating">Nombre</label>
                        <input type="text" runat="server"  class="form-control" name="item_nombre" id="item_nombre" maxlength="140">
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="form-group">
                        <label for="item_stock" class="bmd-label-floating">Stock</label>
                        <input type="num" runat="server" class="form-control" name="item_stock" id="item_stock" maxlength="9">
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="item_estado" class="bmd-label-floating">Estado</label>
                        <select class="form-control" name="item_estado" id="item_estado">
                            <option value="" selected="" disabled="">Seleccione una opción</option>
                            <option selected="" value="1">Habilitado</option>
                            <option value="0">Deshabilitado</option>
                        </select>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="item_detalle" class="bmd-label-floating">Detalle</label>
                        <input type="text" runat="server" class="form-control" name="item_detalle" id="item_detalle" maxlength="190">
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
		<button type="submit" id="btnGuardar" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i>&nbsp; GUARDAR</button>
    </p>

    <script type="text/javascript">
        const urlCreate = '<%=ResolveUrl($"{WebService}.asmx")%>/Registrar';
        const urlEdit = '<%=ResolveUrl($"{WebService}.asmx")%>/Actualizar';
        const btnGuardar = document.querySelector("#btnGuardar");

        const Id = document.querySelector("#<%=item_codigo.ClientID%>");
        const nombre = document.querySelector("#<%=item_nombre.ClientID%>");
        const detalle = document.querySelector("#<%=item_detalle.ClientID%>");
        const stock = document.querySelector("#<%=item_stock.ClientID%>");
        const estado = document.querySelector("#item_estado");
        const IdEstado = document.querySelector("#<%=IdEstado.ClientID%>");
    </script>
    <script src="Scripts/Formularios/FrmItemNew.js"></script>
    <script src="Scripts/Formularios/FrmStandard.js"></script>
    <script src="Scripts/actionsMain.js"></script>
</asp:Content>
