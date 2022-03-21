using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["identity"] != null)
                {
                    User user = (User)Session["identity"];
                    
                    if (user is User)
                    {
                        lblUser.Text = $"{user.Nombres} {user.Apellidos}";

                        if (lblUser.Text == string.Empty)
                        {
                            lblUser.Text = user.Username;
                        }

                        cargarMenuPorRolUsuario(user.IdRol);
                    }
                    else
                    {
                        Response.Redirect("Login");
                    }
                }
                else
                {
                    Response.Redirect("Login");
                }
            }
        }

        private void cargarMenuPorRolUsuario(Roles Rol)
        {
            switch (Rol) 
            {
                case Roles.CONTROL_TOTAL:
                    break;
                case Roles.EDICCION:
                    break;
                case Roles.REGISTRAR:
                    liUser.Visible = false;
                    break;
                case Roles.SOLO_LEER:
                    liUser.Visible = false;
                    //Script para deshabilitar los botones nuevos (registros) de lista
                    //desde el Backend 
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(),
                            "tmp",
                            @"ClientNew.style.display = 'none'
                            ItemsNew.style.display = 'none'
                            UserNew.style.display = 'none'
                            "
                            , true);
                    break;

            }
        }
    }
}