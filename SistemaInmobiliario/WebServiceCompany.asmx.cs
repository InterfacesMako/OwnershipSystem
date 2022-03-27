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
        public ModelViewCompany Listar(Paginator paginator, BaseFilter filters)
        {
            var response = HttpContext.Current.Request;
            string resp = string.Empty;

            ModelViewCompany modelViewCompany = new ModelViewCompany();

            try
            {
                var company = new List<Entidad.Company>();
                company = nCompany.Listar()
                     .Where(x => x.Nombre.Contains(filters.Search.Trim()))
                     .ToList();

                int CantItemsTot = company.Count();
                int ItemsPerPage = paginator.ItemsPerPage;
                int PagesTot = Helper.GetPageTotalsModelViews(CantItemsTot, ItemsPerPage);

                modelViewCompany.ActualPage = paginator.ActualPage;
                modelViewCompany.PagesTot = PagesTot;
                modelViewCompany.Model = company.OrderBy(x => x.Id)
                    .Skip((paginator.ActualPage - 1) * ItemsPerPage)
                    .Take(ItemsPerPage)
                    .ToList();
            }
            catch (Exception ex)
            {
                resp = ex.Message;
            }

            return modelViewCompany;
        }
    }
}
