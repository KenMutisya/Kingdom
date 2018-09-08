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
    public partial class RepaymentScheduleJoint : System.Web.UI.Page
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
                if (Session["usernameJ"] == null)
                {
                    Response.Redirect("~/Default.aspx");

                }
                else {
                    LoadPostedLoans();
                }

            }
        }
        protected void LoadPostedLoans()
        {

            var objBosaLoan = nav.LoansR.Where(n => n.Account_No == Session["usernameJ"].ToString() && n.Posted == true)
               .Select(mc => new { combined = mc.Loan_No + " - " + mc.Loan_Product_Type_Name, LoanNum = mc.Loan_No }).ToList();

            ddlRepaidSchedule.DataSource = objBosaLoan;
            ddlRepaidSchedule.DataTextField = "combined";
            ddlRepaidSchedule.DataValueField = "LoanNum";
            ddlRepaidSchedule.DataBind();
            ddlRepaidSchedule.Items.Insert(0, "..select loan no..");
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            var filename = Session["username"].ToString().Replace(@"/", @"");
            try
            {
                WSConfig.ObjNav.FnLoanRepaymentShedule(ddlRepaidSchedule.SelectedValue, String.Format("LOAN REPAYMENT SCHEDULE_{0}.pdf", filename));
                //CopyFile(ConfigurationManager.AppSettings["SRC_FILE"] + String.Format("PAYSLIP{0}.pdf", filename), ConfigurationManager.AppSettings["DEST_FILE"] + String.Format("PAYSLIP{0}.pdf", filename));
                pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOAN REPAYMENT SCHEDULE_{0}.pdf", filename)));

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }
    }
}