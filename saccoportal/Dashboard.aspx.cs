using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using System.Data;
using System.Drawing;
using SACCOPortal.NAVWS;

namespace SACCOPortal
{
    public partial class Dashboard : System.Web.UI.Page
    {

        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
             new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                 ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
          if(!IsPostBack){ 
            if (Session["username"] == null)
            {
                Response.Redirect("~/Default");

            }  
            ReturnMember();
            LoadMinistatement();
            totalLoansBal();
          }
        }

        protected Member ReturnMember()
        {

            return new Member(Session["username"].ToString());
        }
        
        protected void LoadMinistatement()
        {
            var finalList = new List<Statement>();
            foreach (var item in MiniStatement())
            {
                string[] ministmtArray = item.Split(new string[] { ":::" }, StringSplitOptions.None);
                finalList.Add(new Statement { Date = ministmtArray[0], Description = ministmtArray[1], Amount = ministmtArray[2] });
            }
            gvMinistatement.DataSource = finalList;
            gvMinistatement.AutoGenerateColumns = true;
            gvMinistatement.DataBind();
        }

        public List<string> MiniStatement()
        {
            var ministmtList = new List<string>();
            try
            {
                string ministmt = WSConfig.ObjNav.MiniStatement(Session["username"].ToString());
                string[] ministmtArray = ministmt.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);
                ministmtList = ministmtArray.ToList();
                
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return ministmtList;
        }

        protected void totalLoansBal()
        {
            decimal loanBal = WSConfig.ObjNav.Fnloanbalances(Session["username"].ToString());
            lblLoanBal.Text = loanBal.ToString("N2");
        }

        //protected void dispLoans_DataBound(object sender, EventArgs e)
        //{
        //    for (int i = subTotalRowIndex; i < dispLoans.Rows.Count; i++)
        //    {
        //        total += Convert.ToDecimal(dispLoans.Rows[i].Cells[2].Text);
        //    }
        // this.AddTotalRow("Sub Total", subTotal.ToString("N2"));
        //    this.AddTotalRow("<h4><font color=black>Total Outstanding Balance:</font></h4>", total.ToString("N2"));
        //}

        //private void AddTotalRow(string labelText, string value)
        //{
        //    GridViewRow row = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Normal);
        //    row.BackColor = ColorTranslator.FromHtml("#F9F9F9");
        //    row.Cells.AddRange(new TableCell[3] { new TableCell (), //Empty Cell
        //                       new TableCell { Text = labelText, HorizontalAlign = HorizontalAlign.Right},
        //                       new TableCell { Text = value, HorizontalAlign = HorizontalAlign.Right } });
        //    dispLoans.Controls[0].Controls.Add(row);
        //}

       protected void changePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("Settings");
        }
    }

    class Statement
    {
        public string Date { get; set; }
        public string Description { get; set; }
        public string Amount { get; set; }
        //public string currentShares { get; set; }
    }
}