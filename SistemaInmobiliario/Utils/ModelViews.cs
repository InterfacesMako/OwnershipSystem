using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaInmobiliario.Utils
{
    public class ModelViews
    {
    }

    public class ModelViewItems : BasePage
    {
        public List<Item> Model { get; set; }
    }

    public class ModelViewUser : BasePage
    {
        public List<User> Model { get; set; }
    }

    public class ModelViewCliente : BasePage
    {
        public List<Cliente> Model { get; set; }
    }

    public class ModelViewCompany : BasePage
    {
        public List<Entidad.Company> Model { get; set; }
    }
}