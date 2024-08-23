using System.Data.SqlClient;
using Dapper;


public class BD{
    private static string _connectionString = @"Server=localhost; DataBase=PreguntadOrt; Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias(){
        string query = "SELECT * FROM Categorias";
        List<Categoria> resultado = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            resultado = db.Query<Categoria>(query).ToList();
        }
        return resultado;
    }

    public static List<Dificultad> ObtenerDificultades(){
        string query = "SELECT * FROM Dificultades";
        List<Dificultad> resultado = null;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            resultado = db.Query<Dificultad>(query).ToList();
        }
        return resultado;
    }

    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria){
        List<Pregunta> resultado = null;
        string query = "";
        if(dificultad != -1 && categoria != -1){
            query = "SELECT * FROM Preguntas WHERE IdDificultad = @Ddificultad AND IdCategoria = @Ccategoria";
        }
        else if(dificultad != -1&&categoria == -1 ){
            query = "SELECT * FROM Preguntas WHERE IdDificultad = @Ddificultad";
        }
        else if(dificultad == -1&&categoria != -1 ){
            query = "SELECT * FROM Preguntas WHERE IdCategoria = @Ccategoria";
        }
        else{
            query = "SELECT * FROM Preguntas";
        }
        
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            resultado = db.Query<Pregunta>(query, new { Ddificultad = dificultad, Ccategoria = categoria}).ToList();
        }
        return resultado;
    }

    public static List<Respuesta> ObtenerRespuestas(List <Pregunta> preguntas){

        List<Respuesta> FullRespuestas = null;
        string query = "SELECT * FROM Respuestas WHERE Idpregunta = @Ppregunta";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            foreach(Pregunta pregunta in preguntas){
                List<Respuesta> resultado = db.Query<Respuesta>(query, new { Ppregunta = pregunta.IdPregunta }).ToList();

                FullRespuestas.AddRange(resultado);
            }
        }
        return FullRespuestas;
    }
}