using Microsoft.AspNetCore.Mvc;
using SgartIT.Net.Angular.Esempio1.Server.Extensions;
using SgartIT.Net.Angular.Esempio1.Server.Models;
using SgartIT.Net.Angular.Esempio1.Server.Services;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SgartIT.Net.Angular.Esempio1.Server.Controllers;

[ApiController]
[Route("api/[controller]")]
public class PuntiVenditaController : ControllerBase
{
    private readonly ILogger<PuntiVenditaController> _logger;
    private readonly PVDataService _pvService;

    public PuntiVenditaController(ILogger<PuntiVenditaController> logger, PVDataService pvService)
    {
        _logger = logger;
        _logger.LogTrace("injected");
        _pvService = pvService;

    }
    // GET: api/PuntiVendita
    [HttpGet]
    public async Task<ResponseList<PuntoVendita>> Get(string? text)
    {
        _logger.LogTrace(Constants.LOG_BEGIN);
        ResponseList<PuntoVendita> result = new();

        try
        {
            IEnumerable<PuntoVendita> items = await _pvService.Elenco(text);

            result.Data = items;
        }
        catch (Exception ex)
        {
            //_logger.LogError(ex, "items");
            result.AddError(ex, _logger);
        }
        finally
        {
            _logger.LogTrace(Constants.LOG_END);
        }
        return result;
    }

    // GET api/PuntiVendita/5
    [HttpGet("{puntoVenditaId}")]
    public async Task<ResponseData<PuntoVenditaDettaglio>> Get(int puntoVenditaId)
    {
        _logger.LogTrace(Constants.LOG_BEGIN);
        ResponseData<PuntoVenditaDettaglio> result = new();

        try
        {
            PuntoVenditaDettaglio item = await _pvService.Dettaglio(puntoVenditaId);

            result.Data = item;
        }
        catch (Exception ex)
        {
            //_logger.LogError(ex, "item");
            result.AddError(ex, _logger);
        }
        finally
        {
            _logger.LogTrace(Constants.LOG_END);
        }
        return result;
    }


    // PUT api/PuntiVendita/5
    [HttpPut("{puntoVenditaId}")]
    public async Task<ResponseBase> Put(int puntoVenditaId, [FromBody] PuntoVenditaUpdate data)
    {
        _logger.LogTrace(Constants.LOG_BEGIN);
        ResponseBase result = new();
        try
        {
            await _pvService.Salva(puntoVenditaId, data);
        }
        catch (Exception ex)
        {
            //_logger.LogError(ex, "salva");
            result.AddError(ex, _logger);
        }
        finally
        {
            _logger.LogTrace(Constants.LOG_END);
        }
        return result;

    }

}
