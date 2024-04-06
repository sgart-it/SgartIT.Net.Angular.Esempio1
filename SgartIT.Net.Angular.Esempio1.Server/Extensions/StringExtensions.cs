using System.Text.Json;

namespace SgartIT.Net.Angular.Esempio1.Server.Extensions;

public static class StringExtensions
{
    private static readonly JsonSerializerOptions _jsonOptions = new()  { 
        WriteIndented = false ,
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    };
    public static string ToJSON(this object obj)
    {
        return JsonSerializer.Serialize(obj, _jsonOptions);
    }
}
