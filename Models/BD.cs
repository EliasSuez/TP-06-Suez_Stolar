using System.Data.SqlClient;
using Dapper;


public class BD
{
    private static string _connectionString = @"Server=localhost\SQLEXPRESS; DataBase=PreguntadOrt; Trusted_Connection=True;";

    public static List<Categoria> ObtenerCategorias()
    {
        string query = "SELECT * FROM Categorias";
        List<Categoria> resultado;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            resultado = db.Query<Categoria>(query).ToList();
        }
        return resultado;
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        string query = "SELECT * FROM Dificultades";
        List<Dificultad> resultado;
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            resultado = db.Query<Dificultad>(query).ToList();
        }
        return resultado;
    }

    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        List<Pregunta> resultado;
        string query = "EXEC SP_ObtenerPreguntas @idDif, @idCat";
        using (SqlConnection db = new SqlConnection(_connectionString))
            resultado = db.Query<Pregunta>(query, new { idDif = dificultad, idCat = categoria }).ToList();
        return resultado;
    }

    public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
    {

        List<Respuesta> r;
        string query = "SELECT * FROM Respuestas WHERE";
        foreach (Pregunta p in preguntas)
            query += $" IdPregunta = {p.IdPregunta} OR";
        query = query.Substring(0, query.Length - 3) + ";";
        using (SqlConnection db = new SqlConnection(_connectionString))
            r = db.Query<Respuesta>(query).ToList();
        return r;
    }
}