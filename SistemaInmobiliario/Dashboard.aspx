﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="SistemaInmobiliario.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SiteContent" runat="server">
    <!-- Page header -->
	<div class="full-box page-header">
		<h3 class="text-left">
			<i class="fab fa-dashcube fa-fw"></i> &nbsp; DASHBOARD
		</h3>
		<p class="text-justify">
			Lorem ipsum dolor sit amet, consectetur adipisicing elit. Suscipit nostrum rerum animi natus beatae ex. Culpa blanditiis tempore amet alias placeat, obcaecati quaerat ullam, sunt est, odio aut veniam ratione.
		</p>
	</div>
			
	<!-- Content -->
	<div class="full-box tile-container">
		<a href="ClientList" class="tile">
			<div class="tile-tittle">Clientes</div>
			<div class="tile-icon">
				<i class="fas fa-users fa-fw"></i>
				<p>5 Registrados</p>
			</div>
		</a>

		<a href="ItemsList" class="tile">
			<div class="tile-tittle">Items</div>
			<div class="tile-icon">
				<i class="fas fa-pallet fa-fw"></i>
				<p>9 Registrados</p>
			</div>
		</a>

		<%--<a href="reservation-list.html" class="tile">
			<div class="tile-tittle">Prestamos</div>
			<div class="tile-icon">
				<i class="fas fa-file-invoice-dollar fa-fw"></i>
				<p>10 Registrados</p>
			</div>
		</a>--%>

		<a href="UserList" class="tile">
			<div class="tile-tittle">Usuarios</div>
			<div class="tile-icon">
				<i class="fas fa-user-secret fa-fw"></i>
				<p>50 Registrados</p>
			</div>
		</a>

		<a href="Company" class="tile">
			<div class="tile-tittle">Empresa</div>
			<div class="tile-icon">
				<i class="fas fa-store-alt fa-fw"></i>
				<p>1 Registrada</p>
			</div>
		</a>
	</div>
</asp:Content>
