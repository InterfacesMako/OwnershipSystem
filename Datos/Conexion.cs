using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class Conexion
    {
        SqlConnection conexion = new SqlConnection(ConfigurationManager.ConnectionStrings["conexion"].ConnectionString);

        public SqlConnection GetConexion()
        {
            return this.conexion;
        }

        public void ConexionClose(SqlConnection connection)
        {
            if (connection.State == System.Data.ConnectionState.Open)
                connection.Close();
        }

        public void ConexionOpen(SqlConnection connection)
        {
            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
        }
    }
}
