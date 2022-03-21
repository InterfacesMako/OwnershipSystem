using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class UserNew : System.Web.UI.Page
    {
        public readonly string WebService = "WebServiceUser";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    int IdUser = Convert.ToInt32(Request.QueryString["Id"]);

                    var nUser = new Negocio.NUser();
                    var user = nUser.Seleccionar(IdUser);
                    LlenarFormulario(user);
                }
            }
        }
        private void LlenarFormulario(User user)
        {
            usuario_id.Value = user.Id.ToString();
            usuario_dni.Value = user.DNI;
            usuario_nombre.Value = user.Nombres;
            usuario_apellido.Value = user.Apellidos;
            usuario_telefono.Value = user.Telefono;
            usuario_direccion.Value = user.Direccion;
            usuario_email.Value = user.Correo;
            usuario_usuario.Value = user.Username;

            SeleccionarRol(user.IdRol);
        }

        private void SeleccionarRol(Roles idRol)
        {
            switch(idRol) 
            {
                case Roles.CONTROL_TOTAL:
                    rbControlTotal.Checked = true;
                    break;
                case Roles.EDICCION:
                    rbEdiccion.Checked = true;
                    break;
                case Roles.REGISTRAR:
                    rbRegistrar.Checked = true;
                    break;
                case Roles.SOLO_LEER:
                    rbLeer.Checked = true;
                    break;
            }
        }
    }
}