using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using System.Drawing;
using System.ServiceModel.Security;
using SACCOPortal.NAVWS;

namespace SACCOPortal
{
    public partial class FosaStatement : System.Web.UI.Page
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
                Response.Redirect("~/Default.aspx");
            }

            if (!IsPostBack)
            {
                FosaMultiview.SetActiveView(viewFosaStats);
                LoadFosaAccounts();

            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            //Session["account"] = ddFosaAccount.SelectedValue;
            //Response.Redirect("Reports?r=fs");
        }

        protected void LoadFosaAccounts()
        {
           
            try
            {
                var fosaAcs = nav.FosaAccounts.Where(r => r.BOSA_Account_No==Session["username"].ToString() ).ToList();
                tblFosaAccs.AutoGenerateColumns = false;
                tblFosaAccs.DataSource = fosaAcs;
                tblFosaAccs.DataBind();
               // SACCOFactory.ShowAlert(Session["username"].ToString());

            }
            catch (Exception exception)
            {
              exception.Data.Clear();// && r.Account_Type=="SAVINGS"
            }




        }

        protected void tblFosaAccs_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["Fosa_no"] = tblFosaAccs.SelectedRow.Cells[1].Text;

                       
            var fosaNo = Session["Fosa_no"].ToString();
            FosaMultiview.SetActiveView(viewStatement);
            lblFosaAc.Text = fosaNo;
            
        }

        protected void btnCal_Click(object sender, EventArgs e)
        {
          //  viewStartDate.Visible = true;
        }

        protected void btnCal2_Click(object sender, EventArgs e)
        {
          //  viewEndDate.Visible = true;
        }

        //protected void lnkViewStats_Click(object sender, EventArgs e)
        //{

        //    try
        //    {
        //        var fosaNO = Session["Fosa_no"].ToString();
        //        FosaMultiview.SetActiveView(viewStatement);
        //        lblFosaAc.Text = fosaNO;
        //    }
        //    catch (Exception ex)
        //    {
        //        SACCOFactory.ShowAlert("Nothing selected!");
        //        return;
        //    }

        //}

        protected void viewStartDate_DayRender(object sender, DayRenderEventArgs e)
        {

            if (e.Day.IsToday)
            {
                e.Cell.BackColor = Color.Green;
                e.Cell.BorderStyle = BorderStyle.Groove;
            }
            else if (e.Day.IsWeekend)
            {
                e.Cell.BackColor = Color.LightBlue;
            }
            else if (e.Day.IsSelected)
            {
                e.Cell.BackColor = Color.Blue;
            }
        }

        protected void viewEndDate_DayRender(object sender, DayRenderEventArgs e)
        {

        }

        protected void viewStartDate_SelectionChanged(object sender, EventArgs e)
        {
            //txtSelStartDT.Text = viewStartDate.SelectedDate.ToString("mm/dd/yy");
            //DateTime dTe = Convert.ToDateTime(txtSelStartDT.Text);
            //viewStartDate.Visible = false;
        }

        protected void viewEndDate_SelectionChanged(object sender, EventArgs e)
        {

          //  DateTime dTOne = Convert.ToDateTime(txtSelStartDT.Text);

          //  txtSelEndDT.Text = viewEndDate.SelectedDate.ToString("mm/dd/yy");
        //    DateTime dTe = Convert.ToDateTime(txtSelEndDT.Text);
          //  viewEndDate.Visible = false;

          //  if (dTe<dTOne) {
               // SACCOFactory.ShowAlert("Select a date GREATER than start date");
              ///  txtSelEndDT.Text = "";
            //    return;
           // }

        }

        protected void btnViewFState_Click(object sender, EventArgs e)
        {
            try
            {
                var dt01 = txtSelStartD.Value.Trim();
                DateTime dTOne = Convert.ToDateTime(dt01);

                var dt02 = txtSelEndD.Value.Trim();
                DateTime dTe = Convert.ToDateTime(dt02);

                if (dTe < dTOne)
                {
                    SACCOFactory.ShowAlert("Select a date GREATER than start date");
                    txtSelEndD.Value = "";
                    txtSelStartD.Value = "";
                    return;
                }
            }
            catch (Exception ec)
            {
                SACCOFactory.ShowAlert("Please select correct dates!");
            }
           
           if (txtSelEndD.Value == "" || txtSelStartD.Value == "")
            {
               return;
            }
           else
            {
                try
                {
                    var filename = Session["username"].ToString().Replace(@"/", @"");

                    string dt1dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();

                    WSConfig.ObjNav.FnFosaStatement(lblFosaAc.Text, String.Format("FOSA STATEMENT_{0}.pdf", filename), dt1dt2);

                    pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("FOSA STATEMENT_{0}.pdf", filename, dt1dt2)));
                }
                catch (Exception ex)
                {
                    SACCOFactory.ShowAlert("An Error Occured, please contact System Administrator!");
                }
            }
           
        }

        protected void btnClickTimer_OnClick(object sender, EventArgs e)
        {
            //  Session["timerDiff"] = DateTime.Now.AddSeconds(7).ToString();

        }
    }
}