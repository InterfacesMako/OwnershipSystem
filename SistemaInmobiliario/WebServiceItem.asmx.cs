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
        public string Eliminar(int Id)
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            try
            {
                if (nItem.Eliminar(Id) == (int)StatusCalledDB.NoProceso)
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
        public ModelViewItems Listar(Paginator paginator, FilterItem filters)
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            ModelViewItems modelViewItems = new ModelViewItems();

            try
            {
                var items = new List<Item>();
                items = nItem.Listar()
                    .Where(x => x.Nombre.Contains(filters.Search.Trim()))
                    .ToList();

                int CantItemsTot = items.Count();
                int ItemsPerPage = paginator.ItemsPerPage;
                int PagesTot = Helper.GetPageTotalsModelViews(CantItemsTot, ItemsPerPage);

                modelViewItems.ActualPage = paginator.ActualPage;
                modelViewItems.PagesTot = PagesTot;
                modelViewItems.Model = items.OrderBy(x => x.Id)
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
