using System;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;

namespace SACCOPortal
{
	public partial class Atm : System.Web.UI.Page
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
                Response.Redirect("~/Default");

            }


            if (!IsPostBack)
            {
                LoadFosaAccounts(nav,ddFosaAccount);
                LoadFosaAccounts(nav,ddFosaAccount_);
                ATMstatusData(nav);
                
            }

        }

        protected void atmApplication__Click(object sender, EventArgs e)
        {
            try
            {
                WSConfig.ObjNav.FnAtmApplications(account: ddFosaAccount_.SelectedValue);
                SACCOFactory.ShowAlert("Atm Application for account: " + ddFosaAccount_.SelectedValue + "has been successfuly received");
            }
            catch (Exception exception)
            {
                SACCOFactory.ShowAlert(exception.Message);
                return;
            }
        }

        protected void ReasonForBlocking_Click(object sender, EventArgs e)
        {
            try
            {
                WSConfig.ObjNav.FnAtmBlocking(ddFosaAccount.SelectedValue, txtreasonforblocking.Text.Trim());
                SACCOFactory.ShowAlert("Blocking for account " + ddFosaAccount.SelectedValue + "request send succesfully");
            }
            catch (Exception exception)
            {
                SACCOFactory.ShowAlert(exception.Message);
            }
        }

        protected void ATMstatusData(NAV navData)
        {
            //var objAtm = navData.UpdateAtmStatus.Where(r => r.Account_No == ddFosaAccount_.SelectedValue).ToList();
            //AtmStatus.DataSource = objAtm;
            //AtmStatus.AutoGenerateColumns = false;
            //AtmStatus.AutoGenerateEditButton = false;
            //AtmStatus.AutoGenerateSelectButton = false;
            //AtmStatus.DataBind();
     
        }

        protected void LoadFosaAccounts(NAV navData,DropDownList ddList)
        {
            var objFosaAccount =
                navData.FosaAccounts.Where(r => r.BOSA_Account_No == Session["username"].ToString() && r.Account_Type=="SAVINGS").ToList();
            ddList.DataSource = objFosaAccount;
            ddList.DataTextField = "No";
            ddList.DataValueField = "No";
            ddList.DataBind();
        }
    }
}