using Datos;
using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NCompany
    {
        DCompany data = new DCompany();

        public IEnumerable<Company> Listar()
        {
            return data.Listar();
        }

        public Company Seleccionar(int Id)
        {
            return data.Seleccionar(Id);
        }

        public string Registrar(Company item)
        {
            return data.Registrar(item);
        }

        public int Actualizar(Company item)
        {
            return data.Actualizar(item);
        }

        public int Eliminar(int Id)
        {
            return data.Eliminar(Id);
        }
    }
}
