﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Company.Master" AutoEventWireup="true" CodeBehind="Company.aspx.cs" Inherits="SistemaInmobiliario.NewCompany" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <fieldset>
        <legend><i class="far fa-building"></i>&nbsp; Información de la empresa</legend>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="empresa_nombre" class="bmd-label-floating">Nombre de la empresa</label>
                        <input type="text" pattern="[a-zA-z0-99áéíóúÁÉÍÓÚñÑ ]{1,70}" class="form-control" name="empresa_nombre" id="empresa_nombre" maxlength="70">
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="empresa_email" class="bmd-label-floating">Correo</label>
                        <input type="email" class="form-control" name="empresa_email" id="empresa_email" maxlength="70">
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="empresa_telefono" class="bmd-label-floating">Telefono</label>
                        <input type="text" pattern="[0-9()+]{1,20}" class="form-control" name="empresa_telefono" id="empresa_telefono" maxlength="20">
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="form-group">
                        <label for="empresa_direccion" class="bmd-label-floating">Dirección</label>
                        <input type="text" pattern="[a-zA-z0-99áéíóúÁÉÍÓÚñÑ ]{1,190}" class="form-control" name="empresa_direccion" id="empresa_direccion" maxlength="190">
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
        <button type="submit" class="btn btn-raised btn-info btn-sm"><i class="far fa-save"></i>&nbsp; GUARDAR</button>
    </p>
</asp:Content>
