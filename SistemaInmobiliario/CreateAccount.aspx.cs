using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAndLogin_Click(object sender, EventArgs e)
        {
            NUser nUser = new NUser();

            string pass = UserPassword.Value;
            string passRepeat = UserRepeatPassword.Value;

            if(pass.Equals(passRepeat))
            {
                string user = UserName.Value;
                string email = UserMail.Value;

                try
                {
                    Session["idUser"] = nUser.Registrar(new Entidad.User() { Correo = email, Username = user, Password = pass });
                    Response.Redirect("Dashboard");
                }
                catch(Exception ex)
                {
                    lblResp.Text = "Hubo un error interno, por favor comuniquese con el proveedor del servicio";
                    throw ex;
                }
            }
            else
            {
                lblResp.Text = "Debe repetir la misma contraseña ";
            }
        }
    }
}