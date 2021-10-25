using Datos;
using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NItem
    {
        DItem dItem = new DItem();

        public IEnumerable<Item> Listar()
        {
            return dItem.Listar();
        }

        public Item Seleccionar(int Id)
        {
            return dItem.Seleccionar(Id);
        }

        public string Registrar(Item item)
        {
            return dItem.Registrar(item);
        }

        public int Actualizar(Item item)
        {
            return dItem.Actualizar(item);
        }

        public int Eliminar(int Id)
        {
            return dItem.Eliminar(Id);
        }
    }
}
