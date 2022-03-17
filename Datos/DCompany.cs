using Entidad;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Datos
{
    public class DCompany
    {
        Conexion conexion = new Conexion();
        SqlCommand cmd;
        SqlDataReader dr;
        DataTable dt;
        String Errores;

        public IEnumerable<Company> Listar()
        {
            var lista = new List<Company>();

            var conn = conexion.GetConexion();
            cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "EMPRESAS_LISTAR";
            conexion.ConexionOpen(conn);
            dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conexion.ConexionClose(conn);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var item = new Company();
                item.Id = Convert.ToInt32(dt.Rows[i]["Id"]);
                item.Nombre = dt.Rows[i]["Nombre"].ToString();
                item.Correo = dt.Rows[i]["Correo"].ToString();
                item.Telefono = dt.Rows[i]["Telefono"].ToString();
                item.Direccion = dt.Rows[i]["Direccion"].ToString();

                lista.Add(item);
            }

            return lista;
        }

        public Company Seleccionar(int Id)
        {
            var conn = conexion.GetConexion();
            var item = new Company();

            try
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "EMPRESAS_SELECCIONAR";
                cmd.Parameters.AddWithValue("@Id", Id);
                conexion.ConexionOpen(conn);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    item.Id = Convert.ToInt32(dr["Id"]);
                    item.Nombre = dr["Nombre"].ToString();
                    item.Correo = dr["Correo"].ToString();
                    item.Telefono = dr["Telefono"].ToString();
                    item.Direccion = dr["Direccion"].ToString();
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

        public string Registrar(Company item)
        {
            var conn = conexion.GetConexion();
            cmd = new SqlCommand("EMPRESAS_REGISTRAR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", item.Nombre);
            cmd.Parameters.AddWithValue("@Correo", item.Correo);
            cmd.Parameters.AddWithValue("@Telefono", item.Telefono);
            cmd.Parameters.AddWithValue("@Direccion", item.Direccion);
            conexion.ConexionOpen(conn);
            item.Id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            conexion.ConexionClose(conn);

            return item.Id.ToString();
        }

        public int Actualizar(Company item)
        {
            int actualizado = (int)StatusCalledDB.NoProceso;

            var conn = conexion.GetConexion();
            cmd = new SqlCommand("EMPRESAS_ACTUALIZAR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", item.Nombre);
            cmd.Parameters.AddWithValue("@Correo", item.Correo);
            cmd.Parameters.AddWithValue("@Telefono", item.Telefono);
            cmd.Parameters.AddWithValue("@Direccion", item.Direccion);
            cmd.Parameters.AddWithValue("@Id", item.Id);
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
                cmd = new SqlCommand("EMPRESAS_ELIMINAR", conn);
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
