using System.Data.SqlClient;
using Dapper;

namespace TP06_JJOO.Models;
public static class BD
{
    private static string _connectionString = "@Server=localhost;DataBase=JJOO;Trusted_Connection=True;";
    public static void AgregarDeportista(Deportista deportista)
    {
        string sql = "INSERT INTO Deportistas(IdDeportista, Apellido, Nombre, FechaNacimiento, Foto, IdPais, IdDeporte) VALUES (@pIdDeportista, @pApellido, @pNombre, @pFechaNacimiento, @pFoto, @pIdPais, @pIdDeporte)";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new {pIdDeportista = deportista.IdDeportista, pApellido = deportista.Apellido, pFechaNacimiento = deportista.FechaNacimiento, pFoto = deportista.Foto, pIdPais = deportista.IdPais, pIdDeporte = deportista.IdDeporte});
        }
    }
    public static void EliminarDeportista(int idDeportista)
    {
        string sql = "DELETE * FROM Deportista WHERE IdDeportista = @pIdDeportista"; 
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new {pIdDeportista = idDeportista});
        }
    }
    public static Deporte VerInfoDeportes(int idDeporte)
    {
        Deporte infoDeporte = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportes WHERE IdDeporte = @pIdDeporte";
            infoDeporte = db.QueryFirstOrDefault<Deporte>(sql, new {pIdDeporte = idDeporte});
        }
        return infoDeporte;
    }
    public static Pais VerInfoPais(int idPais)
    {
        Pais infoPais = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Paises WHERE IdPais = @pIdPais";
            infoPais = db.QueryFirstOrDefault<Pais>(sql, new {pIdPais = idPais});
        }
        return infoPais;
    }
    public static Deportista VerInfoDeportista(int idDeportista)
    {
        Deportista infoDeportista = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportistas WHERE IdDeportista = @pIdDeportista";
            infoDeportista = db.QueryFirstOrDefault<Deportista>(sql, new {pIdDeportista = idDeportista});
        }
        return infoDeportista;
    }
    public static List<Pais> ListarPaises()
    {
        List<Pais> ListaPaises = new List<Pais>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Paises";
            ListaPaises = db.Query<Pais>(sql).ToList();
        }
        return ListaPaises;
    }
    public static List<Deportista> ListarDeportistasXDeporte(int idDeporte)
    {
        List<Deportista> ListaDeportista = new List<Deportista>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportistas WHERE IdDeporte = @pIdDeporte";
            ListaDeportista = db.Query<Deportista>(sql, new {pIdDeporte = idDeporte}).ToList();
        }
        return ListaDeportista;
    }
    public static List<Deportista> ListarDeportistasXPais(int idPais)
    {
        List<Deportista> ListaDeportistaXPais = new List<Deportista>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportistas WHERE IdPais = @pIdPais";
            ListaDeportistaXPais = db.Query<Deportista>(sql, new {pIdPais = idPais}).ToList();
        }
        return ListaDeportistaXPais;
    }
    public static List<Deporte> ListarDeportes()
    {
        List<Deporte> ListaDeportes = new List<Deporte>();
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Deportes";
            ListaDeportes = db.Query<Deporte>(sql).ToList();
        }
        return ListaDeportes;
    }
}   