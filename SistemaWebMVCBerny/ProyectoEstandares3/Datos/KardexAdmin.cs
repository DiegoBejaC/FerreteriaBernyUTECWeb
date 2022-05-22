using ProyectoEstandares3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoEstandares3.Datos
{
    public class KardexAdmin
    {
        /// Guardar un registro en la base de datos
        public void Guardar(Kardex modelo)
        {
            using (FerreSoriano17Entities contexto = new FerreSoriano17Entities())
            {
                contexto.Kardex.Add(modelo);
                contexto.SaveChanges();
            }
        }
        //Método para buscar un único registro de la tabla.
        public Kardex ConsultaEspecifica(int idHoja, int idInv, int idComp, int idAl, int Cantidad)
        {
            using (FerreSoriano17Entities contexto = new FerreSoriano17Entities())
            {
                return contexto.Kardex.FirstOrDefault(p => p.Id_Venta == idHoja && p.Id_Producto == idInv && p.Id_Compra == idComp && p.Id_almacen == idAl && p.Cantidad == Cantidad);
            }
        }

        //Metodo para consultar todos los datos

        public IEnumerable<Kardex> Consultar(int id)
        {
            using (FerreSoriano17Entities contexto = new FerreSoriano17Entities())
            {
                return contexto.Kardex.Where(c => c.Id_Producto == id).ToList();
            }
        }

        //Metodo para consultar todos los datos

        public IEnumerable<int> ConsultarIDS(int id)
        {
            using (FerreSoriano17Entities contexto = new FerreSoriano17Entities())
            {
                return contexto.Kardex.Where(c => c.Id_Producto == id).Select(c => c.Id_Kardex).ToList();
            }
        }

        //Método para buscar un registro sólo con el ID
        public Kardex ConsultaDetalle(int ID)
        {
            using (FerreSoriano17Entities contexto = new FerreSoriano17Entities())
            {
                return contexto.Kardex.FirstOrDefault(p => p.Id_Kardex == ID);
            }
        }

    }
}