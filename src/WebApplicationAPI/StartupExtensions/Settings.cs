using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;

namespace WebApplicationAPI.StartupExtensions
{

    public static class Settings
    {
        public static void AddAppBuilderConfiguration(this IApplicationBuilder app)
        {
            var options = new DefaultFilesOptions();
            options.DefaultFileNames.Clear();
            options.DefaultFileNames.Add("index.html");

            app.UseCors("AllowFromAll")//always before "UseMvc"
               
                .UseMvc()
                .UseAuthentication()
                .UseDefaultFiles(options)
                .UseStaticFiles()
                .UseSwagger()
                .UseSwaggerUI(c => { c.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1"); });
        }
    }
}
