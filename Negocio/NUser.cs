using Datos;
using Entidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class NUser
    {
        DUser data = new DUser();

        public IEnumerable<User> Listar()
        {
            return data.Listar();
        }

        public User Seleccionar(int Id)
        {
            return data.Seleccionar(Id);
        }

        public string Registrar(User item)
        {
            return data.Registrar(item);
        }

        public int Actualizar(User item)
        {
            return data.Actualizar(item);
        }

        public int Eliminar(int Id)
        {
            return data.Eliminar(Id);
        }

        public int Login(string user, string pass)
        {
            return data.Login(user, pass);
        }
    }
}
