using System.Data.SqlClient;
using Dapper;

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
        string sql = "DELETE FROM Deportista WHERE IdDeportista = @pIdDeportista";
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(sql, new {pIdDeportista = idDeportista});
        }
    }
    public static void VerInfoDeportes(int idDeporte)
    {
        Deporte infoDeporte = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT FROM Deportes WHERE IdDeporte = @pIdDeporte";
            infoDeporte = db.QueryFirstOrDefault<Deporte>(sql, new {pIdDeporte = idDeporte});
        }
    }
    public static void VerInfoPais(int idPais)
    {
        Deporte infoPais = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT FROM Paises WHERE IdPais = @pIdPais";
            infoPais = db.QueryFirstOrDefault<Deporte>(sql, new {pIdPais = idPais});
        }
    }
    public static void VerInfoDeportista(int idDeportista)
    {
        Deporte infoDeportista = null;
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT FROM Paises WHERE IdDeportista = @pIdDeportista";
            infoDeportista = db.QueryFirstOrDefault<Deporte>(sql, new {pIdDeportista = idDeportista});
        }
    }
}   