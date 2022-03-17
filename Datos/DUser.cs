using Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DUser
    {
        Conexion conexion = new Conexion();
        SqlCommand cmd;
        SqlDataReader dr;
        DataTable dt;
        String Errores;

        public IEnumerable<User> Listar()
        {
            var lista = new List<User>();

            var conn = conexion.GetConexion();
            cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "USERS_LISTAR";
            conexion.ConexionOpen(conn);
            dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conexion.ConexionClose(conn);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var item = new User();
                item.Id = Convert.ToInt32(dt.Rows[i]["Id"]);
                item.DNI = dt.Rows[i]["DNI"].ToString();
                item.Nombres = dt.Rows[i]["Nombres"].ToString();
                item.Apellidos = dt.Rows[i]["Apellidos"].ToString();
                item.Telefono = dt.Rows[i]["Telefono"].ToString();
                item.Direccion = dt.Rows[i]["Direccion"].ToString();
                item.Username = dt.Rows[i]["Username"].ToString();
                item.Email = dt.Rows[i]["Email"].ToString();
                item.Password = dt.Rows[i]["Password"].ToString();
                item.IdRol = (Roles)Convert.ToInt32(dt.Rows[i]["IdRol"]);

                lista.Add(item);
            }

            return lista;
        }

        public User Seleccionar(int Id)
        {
            var conn = conexion.GetConexion();
            var item = new User();

            try
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "USERS_SELECCIONAR";
                cmd.Parameters.AddWithValue("@Id", Id);
                conexion.ConexionOpen(conn);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    item.Id = Convert.ToInt32(dr["Id"]);
                    item.DNI = dr["DNI"].ToString();
                    item.Nombres = dr["Nombres"].ToString();
                    item.Apellidos = dr["Apellidos"].ToString();
                    item.Telefono = dr["Telefono"].ToString();
                    item.Direccion = dr["Direccion"].ToString();
                    item.Username = dr["Username"].ToString();
                    item.Email = dr["Email"].ToString();
                    item.Password = dr["Password"].ToString();
                    item.IdRol = (Roles)Convert.ToInt32(dr["IdRol"]);
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

            return item;
        }

        public string Registrar(User item)
        {
            var conn = conexion.GetConexion();
            cmd = new SqlCommand("USERS_REGISTRAR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DNI", item.DNI);
            cmd.Parameters.AddWithValue("@Nombres", item.Nombres);
            cmd.Parameters.AddWithValue("@Apellidos", item.Apellidos);
            cmd.Parameters.AddWithValue("@Telefono", item.Telefono);
            cmd.Parameters.AddWithValue("@Direccion", item.Direccion);
            cmd.Parameters.AddWithValue("@Username", item.Username);
            cmd.Parameters.AddWithValue("@Email", item.Email);
            cmd.Parameters.AddWithValue("@Password", item.Password);
            cmd.Parameters.AddWithValue("@IdRol", (int)item.IdRol);
            conexion.ConexionOpen(conn);
            item.Id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            conexion.ConexionClose(conn);

            return item.Id.ToString();
        }

        public int Actualizar(User item)
        {
            int actualizado = (int)StatusCalledDB.NoProceso;

            var conn = conexion.GetConexion();
            cmd = new SqlCommand("USERS_ACTUALIZAR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DNI", item.DNI);
            cmd.Parameters.AddWithValue("@Nombres", item.Nombres);
            cmd.Parameters.AddWithValue("@Apellidos", item.Apellidos);
            cmd.Parameters.AddWithValue("@Telefono", item.Telefono);
            cmd.Parameters.AddWithValue("@Direccion", item.Direccion);
            cmd.Parameters.AddWithValue("@Username", item.Username);
            cmd.Parameters.AddWithValue("@Email", item.Email);
            cmd.Parameters.AddWithValue("@Password", item.Password);
            cmd.Parameters.AddWithValue("@Id", item.Id);
            cmd.Parameters.AddWithValue("@IdRol", (int)item.IdRol);
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
                cmd = new SqlCommand("USERS_ELIMINAR", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", Id);
                conexion.ConexionOpen(conn);
                cmd.ExecuteNonQuery();
                conexion.ConexionClose(conn);

                fueEliminado = (int)StatusCalledDB.Proceso;
            }
            catch (Exception ex)
            {
                fueEliminado = (int)StatusCalledDB.NoProceso;
                Errores = ex.Message;
            }

            return fueEliminado;
        }
    }
}
