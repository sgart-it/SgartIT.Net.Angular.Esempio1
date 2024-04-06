using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using SgartIT.Net.Angular.Esempio1.Server.Extensions;
using SgartIT.Net.Angular.Esempio1.Server.Models;


namespace SgartIT.Net.Angular.Esempio1.Server.Services;

public class PVDataService
{
    private readonly ILogger<PVDataService> _logger;
    private readonly AppSettings _appSettings;
    public PVDataService(ILogger<PVDataService> logger, IOptions<AppSettings> appSettings)
    {
        _logger = logger;
        _logger.LogTrace("injected");
        _appSettings = appSettings.Value;

    }

    public async Task<List<PuntoVendita>> Elenco(string? text)
    {
        _logger.LogTrace(Constants.LOG_BEGIN);
        List<PuntoVendita> items = [];
        try
        {
            _logger.LogDebug("text: {text}", text);


            Dictionary<string, object> parameters = new() { { "@Text", text ?? string.Empty } };

            using SqlConnection cnn = GetConnection();
            await cnn.OpenAsync();

            using SqlCommand cmd = CreateCommandStoreWithUPN(cnn, "SpuPuntiVenditaElenco", parameters);

            _logger.LogTrace("execute");

            using SqlDataReader dr = await cmd.ExecuteReaderAsync();

            _logger.LogTrace("read");

            while (await dr.ReadAsync())
            {
                PuntoVendita pv = new()
                {
                    PuntoVenditaId = dr.GetInt("PuntoVenditaId"),
                    Codice = dr.GetString("Codice"),
                    Descrizione = dr.GetString("Descrizione"),
                    Citta = dr.GetString("Citta")
                };
                items.Add(pv);
            }
            return items;
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Elenco");
            throw;
        }
        finally
        {
            _logger.LogTrace(Constants.LOG_END);
        }
    }

    public async Task<PuntoVenditaDettaglio> Dettaglio(int puntoVenditaId)
    {
        _logger.LogTrace(Constants.LOG_BEGIN);
        try
        {
            _logger.LogDebug("PV id: {id}", puntoVenditaId);

            using SqlConnection cnn = GetConnection();
            await cnn.OpenAsync();

            using SqlCommand cmd = CreateCommandStoreWithUPN(cnn, "SpuPuntiVenditaDettaglio", new Dictionary<string, object> { { "@PuntoVenditaId", puntoVenditaId } });

            _logger.LogTrace("execute");

            using SqlDataReader dr = await cmd.ExecuteReaderAsync();

            _logger.LogTrace("read");

            if (await dr.ReadAsync())
            {
                PuntoVenditaDettaglio pv = new()
                {
                    PuntoVenditaId = dr.GetInt("PuntoVenditaId"),
                    Codice = dr.GetString("Codice"),
                    Descrizione = dr.GetString("Descrizione"),
                    Email=dr.GetString("Email"),
                    Citta = dr.GetString("Citta"),

                    Telefono = dr.GetString("Telefono"),
                    Abilitato = dr.GetBoolean("Abilitato"),
                    DataUltimaModifica = dr.GetDateTime("DataUltimaModifica"),
                };

                if (await dr.NextResultAsync())
                {
                    _logger.LogTrace("read prodotti");

                    while (await dr.ReadAsync())
                    {
                        // prodotti 
                        Prodotto p = new()
                        {
                            ProdottoId = dr.GetInt("ProdottoId"),
                            Descrizione = dr.GetString("Descrizione"),
                            Modificabile = dr.GetBoolean("Modificabile"),
                            Selected = dr.GetBoolean("Selected")
                        };
                        pv.Prodotti.Add(p);
                    }
                }

                if (await dr.NextResultAsync())
                {
                    _logger.LogTrace("read servizi");

                    while (await dr.ReadAsync())
                    {
                        // servizi 
                        Servizio s = new()
                        {
                            ServizioId = dr.GetInt("ServizioId"),
                            Descrizione = dr.GetString("Descrizione"),
                            Modificabile = dr.GetBoolean("Modificabile"),
                            Selected = dr.GetBoolean("Selected")
                        };
                        pv.Servizi.Add(s);
                    }
                }
                if (await dr.NextResultAsync())
                {
                    _logger.LogTrace("read carte");

                    while (await dr.ReadAsync())
                    {
                        // carte 
                        Carta c = new()
                        {
                            CartaId = dr.GetInt("CartaId"),
                            Descrizione = dr.GetString("Descrizione"),
                            Modificabile = dr.GetBoolean("Modificabile"),
                            Selected = dr.GetBoolean("Selected")
                        };
                        pv.Carte.Add(c);
                    }
                }

                return pv;
            }
            else
            {
                _logger.LogDebug("Not found");
                return new();   // PuntoVenditaId=0
            }
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Dettaglio");
            throw;
        }
        finally
        {
            _logger.LogTrace(Constants.LOG_END);
        }

    }

    public async Task Salva(int puntoVenditaId, PuntoVenditaUpdate data)
    {
        _logger.LogTrace(Constants.LOG_BEGIN);
        try
        {
            _logger.LogDebug("PV id: {id}", puntoVenditaId);

            Dictionary<string, object> parameters = new()  {
                    { "@PuntoVenditaId", puntoVenditaId },
                    { "@JsonData", data.ToJSON() }
                };

            using SqlConnection cnn = GetConnection();
            await cnn.OpenAsync();

            using SqlCommand cmd = CreateCommandStoreWithUPN(cnn, "SpuPuntiVenditaSalva", parameters);

            _logger.LogTrace("execute");
            await cmd.ExecuteNonQueryAsync();
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Salva");
            throw;
        }
        finally
        {
            _logger.LogTrace(Constants.LOG_END);
        }

    }

    #region common

    private SqlConnection GetConnection()
    {
        return new SqlConnection(_appSettings.ConnectionString);
    }

    private SqlCommand CreateCommandStoreWithUPN(SqlConnection cnn, string storeName, Dictionary<string, object>? parameters = null)
    {
        using SqlCommand cmd = cnn.CreateCommand();
        cmd.CommandText = storeName;
        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        _logger.LogWarning("Gestire user");
        cmd.Parameters.AddWithValue("@CurrentUserUPN", "TODO"); // TODO:
        if (parameters != null)
        {
            foreach (var p in parameters)
            {
                cmd.Parameters.AddWithValue(p.Key, p.Value);
            }
        }
        return cmd;
    }

    #endregion

}
