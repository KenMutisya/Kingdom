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
    public partial class FundsTransferJointown : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
                new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                    ConfigurationManager.AppSettings["DOMAIN"])
        };
        public Decimal AccountBalance = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usernameJ"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            Session["usernameJointBosa"] = WSConfig.ObjNav.FnJointusername(Session["usernameJ"].ToString());

            if (!IsPostBack)
            {
                FnLoadFosaAccountSource();
                //LoadRecords();


            }

        }

        protected void FnLoadFosaAccountSource()
        {
            try
            {
                var sacc = new List<string>();
                string[] sdetails;

                string fosadesc = WSConfig.ObjNav.FnMemberAccunts(Session["usernameJointBosa"].ToString());

                sdetails = fosadesc.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);

                for (int i = 0; i < sdetails.Length; i++)
                {
                    sacc.Add(sdetails[i]);
                }

                ddFosAccounts.DataSource = sacc;
                ddFosAccounts.DataBind();

                ddFosAccounts.Items.Insert(0, "--select account--");
            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }
        protected void FnLoadFosaAccountsDestination()
        {
            try
            {
                ddAccounts.Items.Clear();

                string[] sourceAcc = ddFosAccounts.SelectedValue.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
                string accNo = sourceAcc[0];

                var dacc = new List<string>();
                string[] ddetails;

                string fosadesc = WSConfig.ObjNav.FnMemberAccuntsdest(Session["usernameJointBosa"].ToString(), accNo);

                ddetails = fosadesc.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);

                for (int i = 0; i < ddetails.Length; i++)
                {
                    dacc.Add(ddetails[i]);
                }

                ddAccounts.DataSource = dacc;
                ddAccounts.DataBind();

                ddAccounts.Items.Insert(0, "--select account--");
            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }
        }

        protected string RandomDocNumber()
        {
            var docNo = "";
            var rdmNumber = new Random();
            docNo = rdmNumber.Next(10000000, 99999999).ToString();
            return docNo;
        }

        protected void btnTransfer_OnClick(object sender, EventArgs e)
        {
            string[] sdetails = ddFosAccounts.SelectedValue.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
            string accNo = sdetails[0];


            string[] ddetails = ddAccounts.SelectedValue.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
            string destacNo = ddetails[0];

            string descrption = txtTransDescrp.Text;
            string idnumber = Session["idnoJ"].ToString();

            var docno = RandomDocNumber();


            if (Convert.ToDecimal(txtAvailableBalance.Text.Trim()) - Convert.ToDecimal(txtTransferAmount.Text.Trim()) <
                0)
            {
                SACCOFactory.ShowAlert(
                    "Transfer not Allowed. Source A/c Balance Must be greator OR equal to 0 after the transfer.");
                return;
            }
            else
            {
                string result = WSConfig.ObjNav.FundsTransferFOSAJoint(accNo, destacNo, docno, Convert.ToDecimal(txtTransferAmount.Text.Trim()), descrption, idnumber, 1);
                if (result == "TRUE")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "myFunction();", true);
                }
                else
                {
                    SACCOFactory.ShowAlert("REFERENCE NUMBER EXISTS!");
                }
            }
        }

        protected void ddFosAccounts_SelectedIndexChanged(object sender, EventArgs e)
        {

            try
            {
                string[] sourceAcc = ddFosAccounts.SelectedValue.Split(new string[] { "-" }, StringSplitOptions.RemoveEmptyEntries);
                string accNo = sourceAcc[0];


                var accountBalance = WSConfig.ObjNav.FnAccountBalances(accNo);

                decimal bal = Convert.ToDecimal(accountBalance);
                txtAvailableBalance.Text = bal.ToString("N2");

                //txtAvailableBalance.Text = string.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:N2}", accountBalance);

                FnLoadFosaAccountsDestination();

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }

        }
    }
}
