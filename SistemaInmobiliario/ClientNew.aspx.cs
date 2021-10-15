using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class ClientNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Request.QueryString["Id"] != null)
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
            cliente_Id.Value = cliente.Id.ToString();
            cliente_dni.Value = cliente.DNI;
            cliente_nombre.Value = cliente.Nombre;
            cliente_apellido.Value = cliente.Apellido;
            cliente_telefono.Value = cliente.Telefono;
            cliente_direccion.Value = cliente.Direccion;
        }
    }
}