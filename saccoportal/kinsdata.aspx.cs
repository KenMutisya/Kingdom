using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using System.Configuration;
using System.Net;


namespace SACCOPortal
{
    public partial class kinsdata : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
                    new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                        ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Default");

                }
                LoadKinsData(nav);
                LoadBeneficiaryData(nav);

            }

        }
            protected void LoadKinsData(NAV navData)
        {
            var objKins = navData.KeensDetails.Where(r => r.Account_No == Session["username"].ToString() && r.Beneficiary == false).ToList();
            gvKins.DataSource = objKins;
            gvKins.AutoGenerateColumns = false;
            gvKins.DataBind();
        }
        protected void LoadBeneficiaryData(NAV navData)
        {
            var objBeneficiary = navData.KeensDetails.Where(r => r.Account_No == Session["username"].ToString() && r.Beneficiary == true).ToList();

            GvBeneficiary.DataSource = objBeneficiary;
            GvBeneficiary.AutoGenerateColumns = false;
            GvBeneficiary.DataBind();
        }


    }
}