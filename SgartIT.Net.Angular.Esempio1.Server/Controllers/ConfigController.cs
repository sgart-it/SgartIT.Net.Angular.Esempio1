using Microsoft.AspNetCore.Mvc;
using SgartIT.Net.Angular.Esempio1.Server.Models;
using SgartIT.Net.Angular.Esempio1.Server.Services;

namespace SgartIT.Net.Angular.Esempio1.Server.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ConfigController : ControllerBase
{
    private readonly ILogger<ConfigController> _logger;
    private readonly UserService _userService;

    public ConfigController(ILogger<ConfigController> logger, UserService userService)
    {
        _logger = logger;
        _logger.LogTrace("injected");
        _userService = userService;

    }
    // GET: api/config
    [HttpGet()]
    public async Task<ResponseData<AppConfig>> Get()
    {
        _logger.LogTrace(Constants.LOG_BEGIN);
        ResponseData<AppConfig> result = new();

        try
        {
            result.Data = new()
            {
                Version = Constants.VERSION,
                AppTitle = "Demo PV",
                CurrentUser = await _userService.Current()
            };
        }
        catch (Exception ex)
        {
            //_logger.LogError(ex, "GetCurrent");
            result.AddError(ex, _logger);
        }
        finally
        {
            _logger.LogTrace(Constants.LOG_END);
        }
        return result;
    }
}
