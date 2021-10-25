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
    public class DItem
    {
        Conexion conexion = new Conexion();
        SqlCommand cmd;
        SqlDataReader dr;
        DataTable dt;
        String Errores;

        public IEnumerable<Item> Listar()
        {
            var lista = new List<Item>();

            var conn = conexion.GetConexion();
            cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "ITEMS_LISTAR";
            conexion.ConexionOpen(conn);
            dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            conexion.ConexionClose(conn);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var item = new Item();
                item.Id = Convert.ToInt32(dt.Rows[i]["Id"]);
                item.Nombre = dt.Rows[i]["Nombre"].ToString();
                item.Stock = Convert.ToDouble(dt.Rows[i]["Stock"]);
                item.Estado = (Estado)Convert.ToInt32(dt.Rows[i]["Estado"]);
                item.Detalle = dt.Rows[i]["Detalle"].ToString();

                lista.Add(item);
            }

            return lista;
        }

        public Item Seleccionar(int Id)
        {
            var conn = conexion.GetConexion();
            var item = new Item();

            try
            {
                cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "ITEMS_SELECCIONAR";
                cmd.Parameters.AddWithValue("@Id", Id);
                conexion.ConexionOpen(conn);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    item.Id = Convert.ToInt32(dr["Id"]);
                    item.Nombre = dr["Nombre"].ToString();
                    item.Stock = Convert.ToDouble(dr["Stock"]);
                    item.Estado = (Estado)Convert.ToInt32(dr["Estado"]);
                    item.Detalle = dr["Detalle"].ToString();
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

        public string Registrar(Item item)
        {
            var conn = conexion.GetConexion();
            cmd = new SqlCommand("ITEMS_REGISTRAR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", item.Nombre);
            cmd.Parameters.AddWithValue("@Stock", item.Stock);
            cmd.Parameters.AddWithValue("@Detalle", item.Detalle);
            cmd.Parameters.AddWithValue("@Estado", item.Estado);
            conexion.ConexionOpen(conn);
            item.Id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            conexion.ConexionClose(conn);

            return item.Id.ToString();
        }

        public int Actualizar(Item item)
        {
            int actualizado = (int)StatusCalledDB.NoProceso;

            var conn = conexion.GetConexion();
            cmd = new SqlCommand("ITEMS_ACTUALIZAR", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Nombre", item.Nombre);
            cmd.Parameters.AddWithValue("@Stock", item.Stock);
            cmd.Parameters.AddWithValue("@Detalle", item.Detalle);
            cmd.Parameters.AddWithValue("@Estado", item.Estado);
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
                cmd = new SqlCommand("ITEMS_ELIMINAR", conn);
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
