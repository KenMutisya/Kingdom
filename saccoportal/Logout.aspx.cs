using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                
                    Session.Remove("username");
                    Session.Clear();
                    Session.Abandon();

                    Response.Redirect("~/");
                
            }
            catch (Exception ex)
            {
                //
                ex.Data.Clear();
            }

        }
    }
}