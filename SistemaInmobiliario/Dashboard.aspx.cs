using Datos;
using Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarMetricas();

                //Solo verifica que el usuario este en sesion 
                //si el usuario no esta en sesion el master de sacara
                if (Session["identity"] != null)
                {
                    User user = (User)Session["identity"];
                    if(user is User)
                    {
                        cargarCardsDashboardPorRolUsuario(user.IdRol);
                    }
                }
            }
        }

        void CargarMetricas()
        {
            Conexion conn = new Conexion();
            var conexion = conn.GetConexion();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter("select * from METRICAS_OBTERNER", conexion);
            da.Fill(dt);

            lblClienteRegistrados.Text = dt.Rows[0]["CountClientes"].ToString();
            lblEmpresaRegistradas.Text = dt.Rows[0]["CountEmpresas"].ToString();
            lblItemsRegistrados.Text = dt.Rows[0]["CountItems"].ToString();
            lblUserRegistrados.Text = dt.Rows[0]["CountUsers"].ToString();
        }

        private void cargarCardsDashboardPorRolUsuario(Roles Rol)
        {
            //Script para deshabilitar las cards pertinentes del dashboard
            //desde el Backend 
            switch (Rol)
            {
                case Roles.CONTROL_TOTAL:
                    break;
                case Roles.EDICCION:
                    break;
                case Roles.REGISTRAR:
                   
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                            "tmp",
                            @"cUsuarios.style.display = 'none'
                            "
                            , true);
                    break;
                case Roles.SOLO_LEER:
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                            "tmp",
                            @"cUsuarios.style.display = 'none'
                            "
                            , true);
                    break;

            }
        }
    }
}