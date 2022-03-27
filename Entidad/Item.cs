using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class Item : BaseModel
    {
        public string Nombre { get; set; }
        public double Stock { get; set; }
        public Estado Estado { get; set; }
        public string Detalle { get; set; }
    }

    public class FilterItem : BaseFilter
    {

    }
}
