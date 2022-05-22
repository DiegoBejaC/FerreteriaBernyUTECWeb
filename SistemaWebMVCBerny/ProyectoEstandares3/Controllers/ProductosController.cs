using ProyectoEstandares3.Datos;
using ProyectoEstandares3.Models;
using Rotativa;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoEstandares3.Controllers
{
    public class ProductosController : Controller
    {
        ProductosAdmin usu = new ProductosAdmin();
        KardexAdmin kar = new KardexAdmin();
        AlmacenesAdmin alma = new AlmacenesAdmin();
        // GET: Inventario
        public ActionResult Index()
        {
            IEnumerable<Productos> lista = usu.Consultar();
            return View(lista);
        }

        // GET: Kardex

        //Método para mostrar los detalles del Kardex del producto seleccionado.
        public ActionResult MostrarKardex(int id = 0)
        {
            IEnumerable<int> lista = kar.ConsultarIDS(id);
            ICollection<Kardex> listadoKar = new List<Kardex>();
            Productos mInv = usu.ConsultaDetalle(id);
            int IdInv = mInv.Id;
            ViewBag.IDProd = IdInv;
            string nombreInv = mInv.Nombre;
            ViewBag.Producto = nombreInv;
            int StoMin = mInv.StockMinimo;
            ViewBag.StockMin = StoMin;
            int StoMax = mInv.StockMaximo;
            ViewBag.StockMax = StoMax;
            int Cantid = mInv.Existencia;
            ViewBag.Existencia = Cantid;
            double PrecioUnitario = (double)mInv.PrecioUnitario;
            ViewBag.PrecioUni = PrecioUnitario;
            string nombreAl = "";
            string elTipo = "";
            foreach (int dato in lista) {
                Kardex mKar = kar.ConsultaDetalle(dato);

                int idEg = mKar.Id_Venta;
                int idComp = mKar.Id_Compra;

                if (idEg == 0)
                {
                    elTipo = "ENTRADA (DOC-" + idComp + ")";
                }
                else {
                    elTipo = "SALIDA (VEN-" + idEg + ")";
                }
                
                Almacenes mAl = alma.ConsultaDetalle(mKar.Id_almacen);
                nombreAl = mAl.Nombre;

                Kardex modeloKar = new Kardex()
                {
                    Id_Kardex = mKar.Id_Kardex,
                    Tipo = elTipo,
                    Almacen = nombreAl,
                    Cantidad = mKar.Cantidad,
                    Precio = mKar.Precio,
                    PrecioTotal = mKar.PrecioTotal,
                    Fecha = mKar.Fecha,
                    CantidadNueva = mKar.CantidadNueva,
                    PrecioNuevo = mKar.Precio,
                    PrecioTotalNuevo = mKar.CantidadNueva * mKar.Precio
                };
                listadoKar.Add(modeloKar);
            }
            return View(listadoKar);
        }

        //Similar al método "MostrarKardex", pero este va dirigido a la GENERACIÓN DEL REPORTE que luego
        //se guardará como PDF. Esta vista no será accesible por ningun usuario, sino que servirá de plantilla
        //para crear el archivo del reporte.
        public ActionResult ReporteKardex(int id = 0)
        {
            IEnumerable<int> lista = kar.ConsultarIDS(id);
            ICollection<Kardex> listadoKar = new List<Kardex>();
            Productos mInv = usu.ConsultaDetalle(id);
            int IdInv = mInv.Id;
            ViewBag.IDProd = IdInv;
            string nombreInv = mInv.Nombre;
            ViewBag.Producto = nombreInv;
            int StoMin = mInv.StockMinimo;
            ViewBag.StockMin = StoMin;
            int StoMax = mInv.StockMaximo;
            ViewBag.StockMax = StoMax;
            int Cantid = mInv.Existencia;
            ViewBag.Existencia = Cantid;
            double PrecioUnitario = (double)mInv.PrecioUnitario;
            ViewBag.PrecioUni = PrecioUnitario;
            string nombreAl = "";
            string elTipo = "";
            foreach (int dato in lista)
            {
                Kardex mKar = kar.ConsultaDetalle(dato);

                int idEg = mKar.Id_Compra;
                int idComp = mKar.Id_Venta;

                if (idEg == 0)
                {
                    elTipo = "SALIDA (Egreso #" + idComp + ")";
                }
                else
                {
                    elTipo = "ENTRADA (DOC-" + idEg + ")";
                }

                Almacenes mAl = alma.ConsultaDetalle(mKar.Id_almacen);
                nombreAl = mAl.Nombre;

                Kardex modeloKar = new Kardex()
                {
                    Id_Kardex = mKar.Id_Kardex,
                    Tipo = elTipo,
                    Almacen = nombreAl,
                    Cantidad = mKar.Cantidad,
                    Precio = mKar.Precio,
                    PrecioTotal = mKar.PrecioTotal,
                    Fecha = mKar.Fecha,
                    CantidadNueva = mKar.CantidadNueva,
                    PrecioNuevo = mKar.Precio,
                    PrecioTotalNuevo = mKar.CantidadNueva * mKar.Precio
                };
                listadoKar.Add(modeloKar);
            }
            return View(listadoKar);
        }

        //Con este método se crea el reporte y se descarga el archivo PDF resultante con el nombre especificado en FileName
        public ActionResult ImprimirKardex(int elID = 0) {
            return new ActionAsPdf("ReporteKardex", new { id = elID }) {
                FileName = "KarReport-" + System.DateTime.Today
            };
        }
    }
}