﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidad
{
    public class User
    {
        public int Id { get; set; }
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
}
