using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaInmobiliario.Utils
{
    public static class Permisos 
    {
        public static void cargarPermisos(out bool Edit)
        {
            cargarPermisos(out bool dummy, out Edit, out dummy);
        }
        public static void cargarPermisos(out bool Delete, out bool Edit, out bool Register)
        {
            User user = (User)HttpContext.Current.Session["Identity"];

            if(user is User)
            {
                switch (user.IdRol)
                {
                    case Roles.CONTROL_TOTAL:
                        Delete = true;
                        Edit = true;
                        Register = true;
                        break;
                    case Roles.EDICCION:
                        Delete = false;
                        Edit = true;
                        Register = true;
                        break;
                    case Roles.REGISTRAR:
                        Delete = false;
                        Edit = false;
                        Register = true;
                        break;
                    case Roles.SOLO_LEER:
                        Delete = false;
                        Edit = false;
                        Register = false;
                        break;
                    default:
                        Delete = false;
                        Edit = false;
                        Register = false;
                        break;
                }
            }
            else
            {
                Delete  = false;
                Edit    = false;
                Register = false;
            }
        }
    }
}