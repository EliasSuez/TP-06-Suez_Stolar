using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP07.Models;

namespace TP07.Controllers;

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
    public IActionResult Wheel()
    {
        return View();
    }

    public IActionResult ConfigurarJuego()
    {
        Juego.InicializarJuego();
        ViewBag.categoria = BD.ObtenerCategorias();
        ViewBag.dificultad = BD.ObtenerDificultades();
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        Juego.CargarPartida(username, dificultad, categoria);
        if (Juego.preguntas.Count() == 0)
            return RedirectToAction("ConfigurarJuego");
        return RedirectToAction("Jugar");
    }

    public IActionResult Jugar()
    {
        Pregunta? p = Juego.ObtenerProximaPregunta();
        if (p == null)
            return View("Fin");
        ViewBag.pregunta = p;
        ViewBag.respuestas = Juego.ObtenerProximasRespuestas(p.IdPregunta);
        return View();
    }

    [HttpPost]
    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        ViewBag.correcta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return View("Respuesta");
    }
}
