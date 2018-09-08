using SACCOPortal.NavOData;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class Loans_FOSA_Joint : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
           new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
               ConfigurationManager.AppSettings["DOMAIN"])
        };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usernameJ"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            Session["usernameJointBosa"] = WSConfig.ObjNav.FnJointusername(Session["usernameJ"].ToString());
            if (!IsPostBack)
            {
                LoadPostedLoans();
            }
        }

        protected void LoadPostedLoans()
        {
            var objBosaLoan = nav.LoansR.Where(n => n.Client_Code == Session["usernameJointBosa"].ToString() && n.Posted == true)
              .Select(mc => new { combined = mc.Loan_No + " - " + mc.Loan_Product_Type_Name, LoanNum = mc.Loan_No }).ToList();

            ddRepaidFOSA.DataSource = objBosaLoan;
            ddRepaidFOSA.DataTextField = "combined";
            ddRepaidFOSA.DataValueField = "LoanNum";
            ddRepaidFOSA.DataBind();
            ddRepaidFOSA.Items.Insert(0, "..select loan no..");
        }


        protected void LoadLoanStatement()
        {
            var filename = Session["usernameJ"].ToString().Replace(@"/", @"");
            var loanNumber = ddRepaidFOSA.SelectedValue;
            try
            {
                WSConfig.ObjNav.FnloansStats(Session["usernameJointBosa"].ToString(),
                    String.Format("LOAN STATEMENT_{0}.pdf", filename), loanNumber);
                pdfLoanStat.Attributes.Add("src",
                    ResolveUrl("~/Downloads/" + String.Format("LOAN STATEMENT_{0}.pdf", filename)));

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            LoadLoanStatement();
        }
    }
}