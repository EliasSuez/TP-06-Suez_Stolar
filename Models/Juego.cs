public class Juego{
    private static string username;
    private static int puntajeActual;
    private static int cantidadPreguntasCorrectas;
    private static List<Pregunta> preguntas;
    private static List<Respuesta> respuestas;

    public static void InicializarJuego(){
        username = string.Empty;
        puntajeActual = 0;
        cantidadPreguntasCorrectas = 0;
    }

    public static List<string> ObtenerCategorias() {
        return Categoria.Nombre.ToList();
    }

    public static List<string> ObtenerDificultades() {
         return Dificultad.Nombre.ToList();
    }
    
    public static void CargarPartida(string username, int dificultad, int categoria){
        username = username;
    }
}