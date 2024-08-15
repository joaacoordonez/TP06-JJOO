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
}
