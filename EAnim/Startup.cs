using Microsoft.Owin;
using Owin;

[assembly: OwinStartup(typeof(EAnim.Startup))]
namespace EAnim
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
