using FitFlow.API.Data;
using Microsoft.EntityFrameworkCore;

namespace FitFlow.API.Extensions
{
    public static class ServiceCollectionExtensions
    {
        public static IServiceCollection AddDatabase(this IServiceCollection services, IConfiguration config, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                services.AddDbContext<AppDbContext>(options =>
                    options.UseInMemoryDatabase("FitFlowDb"));
            }
            else
            {
                services.AddDbContext<AppDbContext>(options =>
                    options.UseCosmos(
                        config.GetConnectionString("CosmosConnection"),
                        databaseName: "FitFlowDb"));
            }
            return services;
        }
    }
}