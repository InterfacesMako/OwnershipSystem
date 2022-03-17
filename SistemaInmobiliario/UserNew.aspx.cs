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
                    int IdCliente = Convert.ToInt32(Request.QueryString["Id"]);

                    var nCliente = new Negocio.NCliente();
                    var Cliente = nCliente.Seleccionar(IdCliente);
                    LlenarFormulario(Cliente);
                }
            }
        }
        private void LlenarFormulario(Entidad.Cliente cliente)
        {
            usuario_id.Value = cliente.Id.ToString();
            usuario_dni.Value = cliente.Direccion;
            usuario_nombre.Value = cliente.DNI;
            usuario_apellido.Value = cliente.Nombre;
            usuario_telefono.Value = cliente.Telefono;
            usuario_direccion.Value = cliente.Direccion;
            usuario_email.Value = cliente.Direccion;
            usuario_usuario.Value = cliente.Direccion;
            usuario_clave_1.Value = cliente.Direccion;
        }

    }
}