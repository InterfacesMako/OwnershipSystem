using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class User : BaseModel
    {
        public User()
        {
            DNI = string.Empty;
            Nombres = string.Empty;
            Apellidos = string.Empty;
            Telefono = string.Empty;
            Direccion = string.Empty;
            IdRol = Roles.SOLO_LEER;
        }

        public string DNI { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Username { get; set; }
        public string Correo { get; set; }
        public string Password { get; set; }
        public Roles IdRol { get; set; }
    }

    public class FilterUser : BaseFilter
    {

    }
}
