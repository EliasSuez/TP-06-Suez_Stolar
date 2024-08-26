public class Juego
{
    private static string? username;
    private static int puntajeActual;
    private static int cantidadPreguntasCorrectas;
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

    public static void CargarPartida(string username, int dificultad, int categoria)
    {
        preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        respuestas = BD.ObtenerRespuestas(preguntas);
    }

    public static Pregunta? ObtenerProximaPregunta()
    {
        Pregunta? p = null;
        Random rand = new Random();
        if (preguntas.Count() > 0)
            p = preguntas[rand.Next(0, preguntas.Count())];
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
}