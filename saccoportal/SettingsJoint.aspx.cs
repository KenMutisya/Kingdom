using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;

namespace SACCOPortal
{
    public partial class SettingsJoint : System.Web.UI.Page
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
        }


        static string EncryptP(string mypass)
        {
            //encryptpassword:
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(mypass));
                return Convert.ToBase64String(data);
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Joint_Dashboard.aspx");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string userName = Session["usernameJ"].ToString();
            string userId = Session["idnoJ"].ToString();
            string curPass = txtPasswordOld.Text.Trim();
            var navCurPass = nav.JointAccountLogin.Where(r => r.Account_No == userName && r.ID_No == userId).Select(r => r.Password).ToString();

            if (curPass != navCurPass)
            {
                SACCOFactory.ShowAlert("Wrong current password!!");
                lblError.Text = "Wrong current password!!";
                return;
            }

            string passEncrypt = EncryptP(txtPasswordConfirm.Text);

            if (String.IsNullOrEmpty(txtPasswordOld.Text.Trim()) && String.IsNullOrEmpty(txtPasswordNew.Text.Trim()) &&
                String.IsNullOrEmpty(txtPasswordConfirm.Text))
            {
                SACCOFactory.ShowAlert("You must fill-in all the fields to continue");
                return;
            }
            if (String.IsNullOrEmpty(txtPasswordNew.Text.Trim()) != String.IsNullOrEmpty(txtPasswordConfirm.Text))
            {
                SACCOFactory.ShowAlert("New password is not matching the confirmed password field");
                return;
            }
            if (txtPasswordNew.Text.Trim() != txtPasswordConfirm.Text.Trim())
            {
                SACCOFactory.ShowAlert("Password mismatch");
                lblError.Text = "Password Mismatch, please try again!";
                return;
            }
            else
            {
                try
                {
                    if (WSConfig.ObjNav.FnChangePasswordJointAccount(Session["usernameJ"].ToString(), txtPasswordOld.Text.Trim(),
                        txtPasswordConfirm.Text.Trim()))
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "myFunction();", true);
                    }
                    else
                    {
                        SACCOFactory.ShowAlert("Password could not be changed, kindly contact ICT Admin for assistance");
                    }
                }
                catch (Exception exception)
                {
                    SACCOFactory.ShowAlert(exception.Message);
                }
            }
        }
    }
}