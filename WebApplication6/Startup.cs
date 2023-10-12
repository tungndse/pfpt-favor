using Autofac;
using FFPT_Project.Service.Helpers;
using FFPT_Project.API.Helpers;
using FFPT_Project.API.Mapper;
using FFPT_Project.Data;
using FFPT_Project.Data.Context;
using FFPT_Project.Data.MakeConnection;
using FFPT_Project.Data.Repository;
using FFPT_Project.Data.UnitOfWork;

using Microsoft.AspNetCore.Mvc.ApplicationModels;

using Microsoft.OpenApi.Models;
using NetTopologySuite.Geometries;
using NetTopologySuite.IO;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using FFPT_Project.Service.Service;

using Google.Apis.Auth.OAuth2;
using Google.Apis.Auth.AspNetCore3;
using Hangfire;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Builder;
using Project.Service.Service;

namespace FFPT_Project.API
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        public static readonly string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

        // This method gets called by the runtime. Use this method to add services to the container.
#pragma warning disable CA1041 // Provide ObsoleteAttribute message

        [Obsolete]
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddAutoMapper(typeof(AutoMapperProfile).Assembly);
            services.AddCors(options =>
            {
                options.AddPolicy(MyAllowSpecificOrigins,
                    builder =>
                    {
                        builder
                        //.WithOrigins(GetDomain())
                        .AllowAnyOrigin()
                        .AllowAnyHeader()
                        .AllowAnyMethod();
                    });
            });
            services.AddControllersWithViews();
            services.AddControllers(options =>
            {
                options.Conventions.Add(new RouteTokenTransformerConvention(new SlugifyParameterTransformer()));
            });
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "FFPT Project API",
                    Version = "v1"
                });
                c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());


            });
            services.ConnectToConnectionString(Configuration);



        }

        public void ConfigureContainer(ContainerBuilder builder)
        {
            // Register your own things directly with Autofac, like:

            builder.RegisterType<UnitOfWork>().As<IUnitOfWork>();

            builder.RegisterType<CategoryService>().As<ICategoryService>();
            builder.RegisterType<CustomerService>().As<ICustomerService>();
            builder.RegisterType<MenuService>().As<IMenuService>();
            builder.RegisterType<OrderService>().As<IOrderService>();
            builder.RegisterType<ProductInMenuService>().As<IProductInMenuService>();
            builder.RegisterType<ProductServices>().As<IProductServices>();
            builder.RegisterType<SettingsService>().As<ISettingsService>();
            builder.RegisterType<BlogService>().As<IBlogService>();
            builder.RegisterType<RequestCustomerService>().As<IRequestCustomerService>();

            builder.RegisterGeneric(typeof(GenericRepository<>))
            .As(typeof(IGenericRepository<>))
            .InstancePerLifetimeScope();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app)
        {
            app.ConfigMigration<FFPT_ProjectDboContext>();
            app.UseCors(MyAllowSpecificOrigins);
            app.UseExceptionHandler("/error");
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "FFPT Api V1");
                c.DocExpansion(Swashbuckle.AspNetCore.SwaggerUI.DocExpansion.None);
            });
            app.UseRouting();
            app.UseAuthentication();
         
            app.UseDeveloperExceptionPage();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}