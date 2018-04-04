using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;

namespace SACCOPortal
{
    public partial class Loans : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
             new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                 ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                LoadApprovedLoans(nav);
            }

        }

        protected void LoadApprovedLoans(NAV navData)
        {
            var objRecords = navData.LoansR.Where(r=>r.Client_Code==Session["username"].ToString()).ToList();
            gvLoans.DataSource = objRecords;
            gvLoans.AutoGenerateColumns = false;
            gvLoans.DataBind();


        }

        protected void gvLoans_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}