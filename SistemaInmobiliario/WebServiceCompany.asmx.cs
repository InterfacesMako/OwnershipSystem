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
    public class WebServiceCompany : System.Web.Services.WebService
    {

        NCompany nCompany = new NCompany();

        [WebMethod]
        public string Registrar(Entidad.Company company)
        {
            var response = HttpContext.Current.Request;

            string resp = string.Empty;

            try
            {
                resp = nCompany.Registrar(company);
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return resp;
        }

        [WebMethod]
        public string Actualizar(Entidad.Company company)
        {
            var response = HttpContext.Current.Request;

            string resp = string.Empty;

            try
            {
                if (nCompany.Actualizar(company) == (int)StatusCalledDB.NoProceso)
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
                if (nCompany.Eliminar(Id) == (int)StatusCalledDB.NoProceso)
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
        public IEnumerable<Entidad.Company> Listar()
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            var users = new List<Entidad.Company>();

            try
            {
                users = nCompany.Listar().ToList();
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return users;
        }
    }
}
