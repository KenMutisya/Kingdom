using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SACCOPortal.Startup))]
namespace SACCOPortal
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
