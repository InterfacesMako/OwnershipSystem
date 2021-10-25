using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class ItemsNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["Id"] != null)
                {
                    int Id = Convert.ToInt32(Request.QueryString["Id"]);

                    var negocio = new Negocio.NItem();
                    var item = negocio.Seleccionar(Id);
                    LlenarFormulario(item);
                }
            }
        }
        private void LlenarFormulario(Entidad.Item item)
        {
            item_codigo.Value = item.Id.ToString();
            item_nombre.Value = item.Nombre;
            item_stock.Value = item.Stock.ToString();
            IdEstado.Value = item.Estado.ToString();
            item_detalle.Value = item.Detalle.ToString();
        }
    }
}