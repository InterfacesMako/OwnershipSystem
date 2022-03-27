using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace SistemaInmobiliario
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    public class ServiciosSession : System.Web.Services.WebService
    {
        [WebMethod(EnableSession = true)]
        public bool KeepActiveSession()
        {
            if (HttpContext.Current.Session["identity"] != null)
                return true;
            else
                return false;
        }
    }
}
