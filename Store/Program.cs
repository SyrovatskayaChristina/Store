using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Autofac.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Store
{
	public class Program
	{
		public static async Task Main(string[] args)
		{
			var host = Host.CreateDefaultBuilder(args)
				 .UseServiceProviderFactory(new AutofacServiceProviderFactory())
				 .ConfigureWebHostDefaults(webHostBuilder => webHostBuilder.UseStartup<Startup>())
				 .Build();

			await host.RunAsync();
		}
	}
}
