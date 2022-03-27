using Entidad;
using Negocio;
using SistemaInmobiliario.Utils;
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
        public ModelViewUser Listar(Paginator paginator, FilterUser filters)
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            ModelViewUser modelViewItems = new ModelViewUser();

            try
            {
                var users = new List<User>();
                users = nUser.Listar()
                     .Where(x => x.Username.Contains(filters.Search.Trim()))
                     .ToList();

                int CantItemsTot = users.Count();
                int ItemsPerPage = paginator.ItemsPerPage;
                int PagesTot = Helper.GetPageTotalsModelViews(CantItemsTot, ItemsPerPage);

                modelViewItems.ActualPage = paginator.ActualPage;
                modelViewItems.PagesTot = PagesTot;
                modelViewItems.Model = users.OrderBy(x => x.Id)
                    .Skip((paginator.ActualPage - 1) * ItemsPerPage)
                    .Take(ItemsPerPage)
                    .ToList();
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return modelViewItems;
        }
    }
}
