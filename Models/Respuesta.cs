public class Respuesta{
    public int IdRespuesta { get; private set; }

    public int IdPregunta { get;  set; }

    public int Opcion {get; set;}

    public string Contenido { get; set;}

    public bool Correcta {get; set;}

    public string Foto {get; set;}
}