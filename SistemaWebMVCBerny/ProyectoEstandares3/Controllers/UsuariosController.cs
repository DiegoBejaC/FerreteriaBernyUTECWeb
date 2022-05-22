using ProyectoEstandares3.Datos;
using ProyectoEstandares3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoEstandares3.Controllers
{
    public class UsuariosController : Controller
    {
        UsuariosAdmin usu = new UsuariosAdmin();
        // GET: Usuarios
        public ActionResult Index()
        {
            IEnumerable<Usuarios> lista = usu.Consultar();
            return View(lista);
        }
    }
}