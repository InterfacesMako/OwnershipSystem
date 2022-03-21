using SistemaInmobiliario.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class NewCompany : System.Web.UI.Page
    {
        public readonly string WebService = "WebServiceCompany";
        public static bool Edit;

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
                    Permisos.cargarPermisos(out Edit);

                    if (!Edit) {
                        //Script para deshabilitar boton de Guardar (Actualizar)
                        //No se podra tampoco hacer cambios en los textbox o inputs del form web empresa
                        //desde el Backend 
                        ScriptManager.RegisterStartupScript(this.Page, e.GetType(),
                            "tmp", "btnGuardar.style.display = 'none'", true);

                        empresa_Id.Disabled = true;
                        empresa_nombre.Disabled = true;
                        empresa_correo.Disabled = true;
                        empresa_telefono.Disabled = true;
                        empresa_direccion.Disabled = true;
                    }
                }
            }
        }

        private void LlenarFormulario(Entidad.Cliente cliente)
        {
            empresa_Id.Value = cliente.Id.ToString();
            empresa_nombre.Value = cliente.DNI;
            empresa_correo.Value = cliente.Nombre;
            empresa_telefono.Value = cliente.Telefono;
            empresa_direccion.Value = cliente.Direccion;
        }
    }
}