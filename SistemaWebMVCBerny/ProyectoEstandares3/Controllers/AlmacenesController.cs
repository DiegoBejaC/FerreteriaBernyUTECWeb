using ProyectoEstandares3.Datos;
using ProyectoEstandares3.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoEstandares3.Controllers
{
    public class AlmacenesController : Controller
    {
        AlmacenesAdmin usu = new AlmacenesAdmin();
        // GET: Almacenes
        public ActionResult Index()
        {
            IEnumerable<Almacenes> lista = usu.Consultar();
            return View(lista);
        }
    }
}