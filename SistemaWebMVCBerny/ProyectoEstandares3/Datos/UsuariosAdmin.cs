using ProyectoEstandares3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ProyectoEstandares3.Datos
{
    public class UsuariosAdmin
    {
        /// <summary>
        /// Consulta todos los usuarios
        /// </summary>
        /// <returns></returns>
        public IEnumerable<Usuarios> Consultar()
        {
            using (FerreSoriano17Entities contexto = new FerreSoriano17Entities())
            {
                return contexto.Usuarios.AsNoTracking().ToList();
            }
        }

        /// <summary>
        /// Para consultar un único registro de la tabla
        /// </summary>
        /// <param name="usuario"></param>
        /// <returns></returns>
        public Usuarios ConsultaDetalle(int ID)
        {
            using (FerreSoriano17Entities contexto = new FerreSoriano17Entities())
            {
                return contexto.Usuarios.FirstOrDefault(u => u.Id == ID);
            }
        }
    }
}