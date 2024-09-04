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
        ViewBag.categorias = BD.ObtenerCategorias();
        ViewBag.dificultades = BD.ObtenerDificultades();
        return View();
    }

    public IActionResult Comenzar(string username, int dif, int cat)
    {
        if (dif == 0)
            dif = -1;
        if (cat == 0)
            cat = -1;
        Console.WriteLine(username);
        Console.WriteLine(dif);
        Console.WriteLine(cat);
        Juego.CargarPartida(username, dif, cat);
        if (Juego.preguntas.Count() == 0)
            return RedirectToAction("ConfigurarJuego");
        return RedirectToAction("Jugar");
    }

    public IActionResult Jugar()
    {
        if (Juego.preguntas.Count() == 0)
            return RedirectToAction("Fin");
        Pregunta p = Juego.ObtenerProximaPregunta();
        ViewBag.username = Juego.username;
        ViewBag.puntaje = Juego.puntajeActual;
        ViewBag.pregunta = p;
        ViewBag.respuestas = Juego.ObtenerProximasRespuestas(p.IdPregunta);
        return View();
    }

    // [HttpPost]
    public JsonResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        int idCorrecta = Juego.ObtenerRespuestaCorrecta(idPregunta);
        bool correcta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
        return new JsonResult(new { correcta = correcta, rCorrecta = idCorrecta });
    }

    public IActionResult Fin()
    {
        Juego.GuardarPuntajes();
        ViewBag.username = Juego.username;
        ViewBag.puntaje = Juego.puntajeActual;
        return View();
    }

    public IActionResult HighScores()
    {
        ViewBag.puntajes = BD.ObtenerPuntajes();
        return View();
    }
}
