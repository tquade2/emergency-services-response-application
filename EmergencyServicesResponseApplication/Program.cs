using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace EmergencyServicesResponseApplication
{
    public class Program
    {
        string connectionString = "Data Source=P137G001-LCR\\SQLEXPRESS;Initial Catalog=EmergencyServicesResponseApplication;Integrated Security=True";

        public static void Main(string[] args)
        {
            //CreateHostBuilder(args).Build().Run();
            UserInterface ui = new UserInterface();
            ui.Run();
        }

    }
}
//public static IHostBuilder CreateHostBuilder(string[] args) =>
//    Host.CreateDefaultBuilder(args)
//        .ConfigureWebHostDefaults(webBuilder =>
//        {
//            webBuilder.UseStartup<Startup>();
//        });

// Get the connection string from the appsettings.json file
//IConfigurationBuilder builder = new ConfigurationBuilder()
//    .SetBasePath(Directory.GetCurrentDirectory())
//    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);

//IConfigurationRoot configuration = builder.Build();

//string connectionString = configuration.GetConnectionString("EmployeeProjects");

//IProjectDao projectDao = new ProjectSqlDao(connectionString);
//IEmployeeDao employeeDao = new EmployeeSqlDao(connectionString);
//IDepartmentDao departmentDao = new DepartmentSqlDao(connectionString);

//EmployeeProjectsCLI application = new EmployeeProjectsCLI(employeeDao, projectDao, departmentDao);
//application.Run();
