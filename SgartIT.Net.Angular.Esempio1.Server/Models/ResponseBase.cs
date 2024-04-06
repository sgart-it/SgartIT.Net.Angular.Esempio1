namespace SgartIT.Net.Angular.Esempio1.Server.Models;

public class ResponseBase
{
    public string CorrelationId { get; private set; } = System.Diagnostics.Activity.Current?.Id ?? Guid.NewGuid().ToString();
    public List<string>? Errors { get; private set; }

    private void AddError(string message)
    {
        Errors ??= [];
        Errors.Add(message);
    }

    public void AddError(string message, ILogger logger)
    {
        logger.LogError(message);
        AddError(message);
    }

    public void AddError(Exception ex, ILogger logger)
    {
        logger.LogError(ex, "custom error");

        if (ex is Microsoft.Data.SqlClient.SqlException exSql)
        {
            if (exSql.Number == 2)
            {
                AddError("Database connection error");
            }
            else
            {
                AddError("Unknow Database error");
            }
        }
        else
        {
            AddError("Unknow errors");
        }
    }
}

public class ResponseData<T> : ResponseBase
{
    public T? Data { get; set; }
}

public class ResponseList<T> : ResponseBase
{
    public IEnumerable<T>? Data { get; set; }
}