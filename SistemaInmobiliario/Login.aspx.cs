using Entidad;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Abandon();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user = UserName.Value;
            string pass = UserPassword.Value;

            LoguearUsuario(user, pass);
        }

        private void LoguearUsuario(string user, string pass)
        {
            lblResp.Text = string.Empty;

            NUser nUser = new NUser();
            int resp = nUser.Login(user, pass);
            if (resp != (int)StatusCalledDB.NoProceso)
            {
                int idUser = resp;

                User userIdentity = nUser.Seleccionar(idUser);

                Session["identity"] = userIdentity;
                Session["idUser"] = idUser;
                Response.Redirect("Dashboard");
            }
            else
            {
                lblResp.Text = "Login incorrecto, vuelva a intentar";
            }
        }
    }
}