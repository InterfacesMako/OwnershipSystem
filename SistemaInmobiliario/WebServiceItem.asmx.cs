using Entidad;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace SistemaInmobiliario
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WebServiceItem : System.Web.Services.WebService
    {

        NItem nItem = new NItem();

        [WebMethod]
        public string Registrar(Item item)
        {
            var response = HttpContext.Current.Request;

            string resp = string.Empty;

            try
            {
                resp = nItem.Registrar(item);
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return resp;
        }

        [WebMethod]
        public string Actualizar(Item item)
        {
            var response = HttpContext.Current.Request;

            string resp = string.Empty;

            try
            {
                if (nItem.Actualizar(item) == (int)StatusCalledDB.NoProceso)
                {
                    resp = "Error no se pudo actualizar el registro";
                }
                else
                {
                    resp = "Se actualizo correctamente";
                }
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return resp;
        }

        [WebMethod]
        public string Eliminar(Item item)
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            try
            {
                if (nItem.Eliminar(item.Id) == (int)StatusCalledDB.NoProceso)
                {
                    resp = "Error no se pudo eliminar el registro";
                }
                else
                {
                    resp = "Se elimino correctamente";
                }
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return resp;
        }

        [WebMethod]
        public IEnumerable<Item> Listar()
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            var items = new List<Item>();

            try
            {
                items = nItem.Listar().ToList();
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return items;
        }
    }
}
