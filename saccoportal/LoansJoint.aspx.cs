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
    public partial class LoansJoint : System.Web.UI.Page
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
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                LoansMultiView.SetActiveView(loansView);
                LoadLoans(nav);
                LoadLoansIssued(nav);
            }

        }

        protected void LoadLoans(NAV navData)
        {
            var objRecords = navData.LoansR.Where(r => r.Account_No == Session["usernameJ"].ToString() && r.Loan_Status == "Application").ToList();

            gvLoans.DataSource = objRecords;
            gvLoans.AutoGenerateColumns = false;
            gvLoans.DataBind();
        }

        protected void LoadLoansIssued(NAV navData)
        {
            var loansIs = navData.LoansR.Where(r => r.Account_No == Session["usernameJ"].ToString() && r.Posted == true).ToList();

            gvLoansIssued.DataSource = loansIs;
            gvLoansIssued.AutoGenerateColumns = false;
            gvLoansIssued.DataBind();

        }

        protected void gvLoans_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Loan_no"] = gvLoans.SelectedRow.Cells[1].Text;


            var loanNo = Session["Loan_no"].ToString();
            LoansMultiView.SetActiveView(gureentedLoans);
            lblLoanNo.Text = loanNo;
            viewGuarantorStatus();
        }

        protected void gvLoansIssued_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void viewGuarantorStatus()
        {
            var chkguarantorship = nav.myGuarantorsRequest.Where(n => n.Loanees_No == Session["usernameJ"].ToString() && n.Loan_No == Session["Loan_no"].ToString()).ToList();
            GridViewMyguaranteedloans.AutoGenerateColumns = false;
            GridViewMyguaranteedloans.DataSource = chkguarantorship;
            GridViewMyguaranteedloans.DataBind();
        }

        protected void btnOkay_Click(object sender, EventArgs e)
        {
            LoansMultiView.SetActiveView(loansView);
        }
    }
}