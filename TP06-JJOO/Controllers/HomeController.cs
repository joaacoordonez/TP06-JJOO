using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP06_JJOO.Models;

namespace TP06_JJOO.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    public IActionResult Deportes()
    {
        ViewBag.ListarDeportes = BD.ListarDeportes();
        return View();
    }
    public IActionResult Paises()
    {
        ViewBag.ListarPaises = BD.ListarPaises();
        return View();
    }
    public IActionResult VerDetalleDeporte(int idDeporte)
    {
        ViewBag.Deporte = BD.VerInfoDeportes(idDeporte);
        ViewBag.ListaDeportistas = BD.ListarDeportistasXDeporte(idDeporte);
        return View("VerDetalleDeporte");
    }
    public IActionResult VerDetallePais(int idPais)
    {
        ViewBag.Pais = BD.VerInfoPais(idPais);
        ViewBag.ListaDeportistasXPais = BD.ListarDeportistasXPais(idPais);
        return View("VerDetallePais");
    }
    public IActionResult VerDetalleDeportista(int idDeportista)
    {
        ViewBag.Deportista = BD.VerInfoDeportista(idDeportista);
        ViewBag.Pais = BD.ListarDeportistasXPais(idDeportista);
        ViewBag.Deporte = BD.ListarDeportistasXDeporte(idDeportista);
        return View("VerDetalleDeportista");
    }
    public IActionResult AgregarDeportista(int idDeportista)
    {
        ViewBag.ListaPaises = BD.ListarPaises();
        ViewBag.ListaDeportes = BD.ListarDeportes();
        return View("AgregarDeportista");
    }
    [HttpPost] IActionResult GuardarDeportista(Deportista dep)
    {
        BD.AgregarDeportista(dep);
        return View("Index");
    }
    public IActionResult EliminarDeportista(int idCandidato)
    {
        BD.EliminarDeportista(idCandidato);
        return View("Index");
    }
    public IActionResult Creditos()
    {
        return View("Creditos");
    }
    public IActionResult Historia()
    {
        return View();
    }
}

