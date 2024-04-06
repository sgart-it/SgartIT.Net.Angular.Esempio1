using Microsoft.Data.SqlClient;

namespace SgartIT.Net.Angular.Esempio1.Server.Extensions;

public static class SqlExtensions
{
    public static int GetInt(this SqlDataReader dr, string fieldName, int defaultValue = 0)
    {
        object val = dr[fieldName];
        if (val == DBNull.Value)
            return defaultValue;
        return (int)val;
    }

    public static bool GetBoolean(this SqlDataReader dr, string fieldName)
    {
        object val = dr[fieldName];
        if (val == DBNull.Value)
            return false;
        return (bool)val;
    }

    public static string GetString(this SqlDataReader dr, string fieldName, string defaultValue = "")
    {
        object val = dr[fieldName];
        if (val == DBNull.Value || string.IsNullOrWhiteSpace((string)val))
            return defaultValue;
        return (string)val;
    }

    public static DateTime GetDateTime(this SqlDataReader dr, string fieldName)
    {
        object val = dr[fieldName];
        if (val == DBNull.Value)
            return new DateTime(1970,1,1);
        return (DateTime)val;
    }
}
