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
        public ModelViewCliente Listar(Paginator paginator, FilterCliente filters)
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            ModelViewCliente modelViewItems = new ModelViewCliente();

            try
            {
                var clientes = new List<Cliente>();
                clientes = nCliente.Listar()
                    .Where(x => $"{x.Apellido} {x.Nombre}".Contains(filters.Search.Trim()) 
                                && x.Telefono.Contains(filters.Telefono)
                                && x.DNI.Contains(filters.DNI))
                    .ToList();

                int CantItemsTot = clientes.Count();
                int ItemsPerPage = paginator.ItemsPerPage;
                int PagesTot = Helper.GetPageTotalsModelViews(CantItemsTot, ItemsPerPage);

                modelViewItems.ActualPage = paginator.ActualPage;
                modelViewItems.PagesTot = PagesTot;
                modelViewItems.Model = clientes.OrderBy(x => x.Id)
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
