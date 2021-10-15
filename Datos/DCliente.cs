using Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class DCliente
    {
        Conexion conexion = new Conexion();
        SqlCommand cmd;
        SqlDataReader dr;
        DataTable dt;
        String Errores;

        public IEnumerable<Cliente> Listar()
        {
            var lista = new List<Cliente>();
            

            var conn = conexion.GetConexion();
            cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "CLIENTES_LISTAR";
            conexion.ConexionOpen(conn);
            dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conexion.ConexionClose(conn);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var cliente = new Cliente();
                cliente.Id = Convert.ToInt32(dt.Rows[i]["Id"]);
                cliente.Nombre = dt.Rows[i]["Nombre"].ToString();
                cliente.Apellido = dt.Rows[i]["Apellido"].ToString();
                cliente.DNI = dt.Rows[i]["DNI"].ToString();
                cliente.Telefono = dt.Rows[i]["Telefono"].ToString();
                cliente.Direccion = dt.Rows[i]["Direccion"].ToString();

                lista.Add(cliente);
            }

            return lista;
        }

        public Cliente Seleccionar(int Id)
        {
            var conn = conexion.GetConexion();
            var cliente = new Cliente();

            try
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "CLIENTES_SELECCIONAR";
                cmd.Parameters.AddWithValue("@Id", Id);
                conexion.ConexionOpen(conn);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    cliente.Id = Convert.ToInt32(dr["Id"]);
                    cliente.Nombre = dr["Nombre"].ToString();
                    cliente.Apellido = dr["Apellido"].ToString();
                    cliente.DNI = dr["DNI"].ToString();
                    cliente.Telefono = dr["Telefono"].ToString();
                    cliente.Direccion = dr["Direccion"].ToString();
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                Errores = ex.Message;
            }
            finally
            {
                conexion.ConexionClose(conn);
                cmd.Dispose();
            }

            return cliente;
        }

        public string Registrar(Cliente cliente)
        {
            var conn = conexion.GetConexion();
            cmd = new SqlCommand("CLIENTES_REGISTRAR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DNI", cliente.DNI);
            cmd.Parameters.AddWithValue("@Nombre", cliente.Nombre);
            cmd.Parameters.AddWithValue("@Apellido", cliente.Apellido);
            cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono);
            cmd.Parameters.AddWithValue("@Direccion", cliente.Direccion);
            conexion.ConexionOpen(conn);
            cliente.Id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            conexion.ConexionClose(conn);

            return cliente.Id.ToString();
        }

        public int Actualizar(Cliente cliente)
        {
            int actualizado = (int)StatusCalledDB.NoProceso;

            var conn = conexion.GetConexion();
            cmd = new SqlCommand("CLIENTES_ACTUALIZAR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Id", cliente.Id);
            cmd.Parameters.AddWithValue("@DNI", cliente.DNI);
            cmd.Parameters.AddWithValue("@Nombre", cliente.Nombre);
            cmd.Parameters.AddWithValue("@Apellido", cliente.Apellido);
            cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono);
            cmd.Parameters.AddWithValue("@Direccion", cliente.Direccion);
            conexion.ConexionOpen(conn);
            int afectado = cmd.ExecuteNonQuery();
            conexion.ConexionClose(conn);

            actualizado = (int)StatusCalledDB.Proceso;
          
            return actualizado;
        }

        public int Eliminar(int Id)
        {
            int fueEliminado = (int)StatusCalledDB.NoProceso;

            try
            {
                var conn = conexion.GetConexion();
                cmd = new SqlCommand("CLIENTES_ELIMINAR", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", Id);
                conexion.ConexionOpen(conn);
                cmd.ExecuteNonQuery();
                conexion.ConexionClose(conn);

                fueEliminado = (int)StatusCalledDB.Proceso;
            }
            catch(Exception ex)
            {
                fueEliminado = (int)StatusCalledDB.NoProceso;
                Errores = ex.Message;
            }

            return fueEliminado;
        }
    }
}
