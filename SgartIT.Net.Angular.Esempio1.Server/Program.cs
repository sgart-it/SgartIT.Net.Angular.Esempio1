using NLog;
using NLog.Web;
using SgartIT.Net.Angular.Esempio1.Server;
using SgartIT.Net.Angular.Esempio1.Server.Models;
using SgartIT.Net.Angular.Esempio1.Server.Services;

// Early init of NLog to allow startup and exception logging, before host is built
var logger = NLog.LogManager
    .Setup()
    .LoadConfigurationFromAppSettings()
    .GetCurrentClassLogger();

logger.Info("Program START v. {0}", Constants.VERSION);
try
{
    var builder = WebApplication.CreateBuilder(args);

    //NLog.Web.LayoutRenderers.AspNetLayoutRendererBase.Register("myCorrelationId",
    //  (logEventInfo, httpContext, loggingConfiguration)
    //       => httpContext.Request);

    // Add services to the container.

    builder.Services.AddControllers();
    // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
    builder.Services.AddEndpointsApiExplorer();
    builder.Services.AddSwaggerGen();


    builder.Services.Configure<AppSettings>(builder.Configuration);

    builder.Services.AddScoped<PVDataService>();
    builder.Services.AddScoped<UserService>();

    builder.Logging.ClearProviders();
    builder.Logging.SetMinimumLevel(Microsoft.Extensions.Logging.LogLevel.Trace);
    builder.Host.UseNLog();

    var app = builder.Build();

    app.UseDefaultFiles();
    app.UseStaticFiles();

    // Configure the HTTP request pipeline.
    if (app.Environment.IsDevelopment())
    {
        app.UseSwagger();
        app.UseSwaggerUI();
    }

    app.UseHttpsRedirection();

    app.UseAuthorization();

    app.MapControllers();

    app.MapFallbackToFile("/index.html");

    app.Run();
}
catch (Exception exception)
{
    // NLog: catch setup errors
    logger.Error(exception, "Stopped program because of exception");
    throw;
}
finally
{
    logger.Info("Program STOP");
    // Ensure to flush and stop internal timers/threads before application-exit (Avoid segmentation fault on Linux)
    NLog.LogManager.Shutdown();
}