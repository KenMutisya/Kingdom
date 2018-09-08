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
                LoansMultiView.SetActiveView(loansView);
                LoadLoans(nav);
                LoadLoansIssued(nav);
            }

        }

        protected void LoadLoans(NAV navData)
        {
            var objRecords = navData.LoansR.Where(r => r.Client_Code == Session["username"].ToString() && r.Posted == false).ToList();
            
            gvLoans.DataSource = objRecords;
            gvLoans.AutoGenerateColumns = false;
            gvLoans.DataBind();
        }

        protected void LoadLoansIssued(NAV navData)
        {
            var loansIs = navData.LoansR.Where(r => r.Client_Code == Session["username"].ToString() && r.Posted == true && r.Outstanding_Balance >0).ToList();

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
            ViewGuarantorStatus();
        }

        protected void gvLoansIssued_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ViewGuarantorStatus()
        {
            var chkguarantorship = nav.myGuarantorsRequest.Where(n => n.Loanees_No == Session["username"].ToString() && n.Loan_No== Session["Loan_no"].ToString()).ToList();
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