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
    public class WebServiceCliente : System.Web.Services.WebService
    {
        NCliente nCliente = new NCliente();

        [WebMethod]
        public string Registrar(Cliente cliente)
        {
            var response = HttpContext.Current.Request;

            string resp = string.Empty;

            try
            {
                resp = nCliente.Registrar(cliente);
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return resp;
        }
        
        [WebMethod]
        public string Actualizar(Cliente cliente)
        {
            var response = HttpContext.Current.Request;

            string resp = string.Empty;

            try
            {
                if(nCliente.Actualizar(cliente) == (int)StatusCalledDB.NoProceso)
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
        public string Eliminar(int Id)
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            try
            {
                if (nCliente.Eliminar(Id) == (int)StatusCalledDB.NoProceso)
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
        public IEnumerable<Cliente> Listar()
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            var clientes = new List<Cliente>();

            try
            {
                clientes = nCliente.Listar().ToList();
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return clientes;
        }
    }
}
