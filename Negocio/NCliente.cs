using Datos;
using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NCliente
    {
        DCliente dCliente = new DCliente();

        public IEnumerable<Cliente> Listar()
        {
            return dCliente.Listar();
        }

        public Cliente Seleccionar(int Id)
        {
            return dCliente.Seleccionar(Id);
        }

        public string Registrar(Cliente cliente)
        {
            return dCliente.Registrar(cliente);
        }

        public int Actualizar(Cliente cliente)
        {
            return dCliente.Actualizar(cliente);
        }

        public int Eliminar(int Id)
        {
            return dCliente.Eliminar(Id);
        }
    }
}
