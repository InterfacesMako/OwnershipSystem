using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class UserUpdate : System.Web.UI.Page
    {
        public readonly string WebService = "WebServiceUser";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int IdUser = Convert.ToInt32(Session["idUser"]);

                var nUser = new Negocio.NUser();
                var User = nUser.Seleccionar(IdUser);
                LlenarFormulario(User);
            }
        }

        private void LlenarFormulario(Entidad.User user)
        {
            usuario_id.Value = user.Id.ToString();
            usuario_dni.Value = user.DNI;
            usuario_nombre.Value = user.Nombres;
            usuario_apellido.Value = user.Apellidos;
            usuario_telefono.Value = user.Telefono;
            usuario_direccion.Value = user.Direccion;
            usuario_email.Value = user.Correo;
            usuario_usuario.Value = user.Username;
            usuario_idRol.Value = ((int)user.IdRol).ToString();
        }
    }
}