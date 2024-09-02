public class Juego
{
    public static string? username { get; private set; }
    public static int puntajeActual { get; private set; }
    public static int cantidadPreguntasCorrectas { get; private set; }
    public static List<Pregunta> preguntas { get; private set; }
    private static List<Respuesta> respuestas;

    public static void InicializarJuego()
    {
        username = string.Empty;
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }

    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }

    public static void CargarPartida(string user, int dificultad, int categoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        respuestas = BD.ObtenerRespuestas(preguntas);
        username = user;
    }

    public static Pregunta ObtenerProximaPregunta()
    {
        Random rand = new Random();
        Pregunta p = preguntas[rand.Next(0, preguntas.Count())];
        return p;
    }

    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        return respuestas.FindAll(re => re.IdPregunta == idPregunta);
    }

    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool r = respuestas.Find(re => re.IdRespuesta == idRespuesta).Correcta;
        if (r)
        {
            puntajeActual += 10;
            cantidadPreguntasCorrectas++;
        }
        preguntas.Remove(preguntas.Find(p => p.IdPregunta == idPregunta));
        return r;
    }

    public static int ObtenerRespuestaCorrecta(int idPregunta)
    {
        int idCorrecta = respuestas.Find(re => re.Correcta == true && re.IdPregunta == idPregunta).IdRespuesta;
        return idCorrecta;
    }
}