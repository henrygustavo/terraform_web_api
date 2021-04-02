using Microsoft.Extensions.DependencyInjection;

namespace WebApplicationAPI.StartupExtensions
{
    public static class Mvc
    {
        public static void AddMvcConfiguration(this IServiceCollection services)
        {
            services.AddMvc(options => options.EnableEndpointRouting = false);
        }
    }
}
