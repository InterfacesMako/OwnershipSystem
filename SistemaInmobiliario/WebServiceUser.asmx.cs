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
    public class WebServiceUser : System.Web.Services.WebService
    {

        NUser nUser = new NUser();

        [WebMethod]
        public string Registrar(User user)
        {
            var response = HttpContext.Current.Request;

            string resp = string.Empty;

            try
            {
                resp = nUser.Registrar(user);
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return resp;
        }

        [WebMethod]
        public string Actualizar(User user)
        {
            var response = HttpContext.Current.Request;

            string resp = string.Empty;

            try
            {
                if (nUser.Actualizar(user) == (int)StatusCalledDB.NoProceso)
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
                if (nUser.Eliminar(Id) == (int)StatusCalledDB.NoProceso)
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
        public IEnumerable<User> Listar()
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            var users = new List<User>();

            try
            {
                users = nUser.Listar().ToList();
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return users;
        }
    }
}
