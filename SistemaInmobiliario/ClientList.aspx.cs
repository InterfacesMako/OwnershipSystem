﻿using Entidad;
using SistemaInmobiliario.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class ClientList : System.Web.UI.Page
    {
        public readonly string WebService = "WebServiceCliente";
        public static bool Delete, Edit, Register;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Permisos.cargarPermisos(out Delete, out Edit, out Register);
            }
        }
    }
}