using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class LoanApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Default");

            }
            ReturnMember();

        }
        protected Member ReturnMember()
        {

            return new Member(Session["username"].ToString());
        }
    }
}