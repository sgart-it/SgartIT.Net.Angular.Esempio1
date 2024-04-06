using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Options;
using SgartIT.Net.Angular.Esempio1.Server.Extensions;
using SgartIT.Net.Angular.Esempio1.Server.Models;


namespace SgartIT.Net.Angular.Esempio1.Server.Services;

public class UserService
{
    private readonly ILogger<UserService> _logger;
    public UserService(ILogger<UserService> logger)
    {
        _logger = logger;
        _logger.LogTrace("injected");
    }

    public async Task<AppUser> Current()
    {
        _logger.LogTrace(Constants.LOG_BEGIN);
        try
        {
            _logger.LogWarning("TODO");

            return new AppUser()
            {
                DisplayName = "Prova user",
                LoginName = "TODO"
            };
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Current user");
            throw;
        }
        finally
        {
            _logger.LogTrace(Constants.LOG_END);
        }
    }

}
