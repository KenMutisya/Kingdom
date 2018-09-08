using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using SACCOPortal.NAVWS;
using Microsoft.VisualBasic;
using SACCOPortal;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace SACCOPortal
{
    public partial class _Default : Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
               new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                   ConfigurationManager.AppSettings["DOMAIN"])
        };
        public string strSQLConn = @"Server=" + ConfigurationManager.AppSettings["DB_INSTANCE"] + ";Database=" +
                                 ConfigurationManager.AppSettings["DB_NAME"] + "; User ID=" +
                                 ConfigurationManager.AppSettings["DB_USER"] + "; Password=" +
                                 ConfigurationManager.AppSettings["DB_PWD"] + "; MultipleActiveResultSets=true";

        protected void Page_Load(object sender, EventArgs e)
        {
            MultiViewLoadLogins.SetActiveView(LoginTabs);
            btnBack.Visible = false;
            btnSubmit.Visible = false;
            if (!IsPostBack)
            {
                NAV nav = new Config().ReturnNav();

            }
        }

        //protected override void CreateChildControls()
        //{
        //    base.CreateChildControls();
        //    ctrlGoogleReCaptcha.PublicKey = "6LdK7j4UAAAAAJaWiKryMXWxVcwuDAyjEb_Kr204";
        //    ctrlGoogleReCaptcha.PrivateKey = "6LdK7j4UAAAAAC1ovoMUpMxXODnYYsWaebjMbbf0";
        // }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //cptCaptcha.ValidateCaptcha(txtCaptcha.Text.Trim());
            //if (cptCaptcha.UserValidated)
            //{
            string userName = txtStaffNo.Text.Trim().Replace("'", "");
            string userPassword = txtPassword.Text.Trim().Replace("'", "");

            string mypassencrypt = EncryptP(userPassword);

            try
            {
                if (string.IsNullOrWhiteSpace(userPassword))
                {
                    lblError.Text = "Password Empty!";
                    SACCOFactory.ShowAlert("Password Empty!");
                    return;
                }

                if (MyValidationFunction(userName, mypassencrypt))
                {
                    Session["username"] = userName;
                    Session["pwd"] = mypassencrypt;
                    Session["accType"] = "individual";
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    lblError.Text = "Authentication failed!";
                    SACCOFactory.ShowAlert("Authentication failed!, Try Again");
                }
            }
            catch (Exception exception)
            {
                lblError.Text = exception.Message;
                return;
            }
            //}
            //else
            //{
            //    lblError.Text = "Invalid Captcha.Try again!!";
            //}

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


        protected void btnPassword_Click(object sender, EventArgs e)
        {
            //btnSignup.Visible = false;
            btnLogin.Visible = false;
            MultiViewLoadLogins.SetActiveView(View2);

            btnSubmit.Visible = true;
            btnBack.Visible = true;
            lblError.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            btnSubmit.Visible = false;
            btnBack.Visible = false;

            MultiViewLoadLogins.SetActiveView(individualLogin);
            //btnSignup.Visible = true;
            btnLogin.Visible = false;
            btnFirstLogin.Visible = true;
            lblError.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string userName = txtEmployeeNo.Text.Trim().Replace("'", "");
            string userPassword = idNo.Text.Trim().Replace("'", "");


            var idcheck = nav.MemberList.Where(r => r.No == userName).Select(k => k.ID_No).FirstOrDefault();
            var emalcheck = nav.MemberList.Where(r => r.No == userName).Select(k => k.E_Mail).FirstOrDefault();
            var phonecheck = nav.MemberList.Where(r => r.No == userName).Select(k => k.Phone_No).FirstOrDefault();

            if (string.IsNullOrEmpty(userPassword) && string.IsNullOrEmpty(userName))
            {
                lblError.Text = "Member No or National ID Empty!";
                btnSubmit.Visible = true;
                btnBack.Visible = true;
                //btnSignup.Visible = false;
                btnLogin.Visible = false;
                MultiViewLoadLogins.SetActiveView(View2);
                return;

            }
            else
            {
                try
                {
                    var nPassword = NewPassword();
                    var CompEmail = WSConfig.ObjNav.FnUpdatePassword(txtEmployeeNo.Text.Trim(), idNo.Text.Trim(), EncryptP(nPassword));
                    if (WSConfig.MailFunction(string.Format("Dear Sacco Member,\n Your New password is: {0}", nPassword), CompEmail,
                        "Portal password reset successful") && !String.IsNullOrEmpty(CompEmail))
                    {
                        SACCOFactory.ShowAlert(
                            "A New Password has been generated and sent to your Personal mail and Mobile Phone. Kindly use to it to login to your Member portal");
                        btnSubmit.Visible = false;
                        txtEmployeeNo.Enabled = false;
                        idNo.Enabled = false;
                        btnBack.Visible = false;
                        //MultiView1.SetActiveView(View1);
                        //btnSignup.Visible = true;
                        btnLogin.Visible = true;
                        lblError.Text = "";
                    }
                    else if (idcheck != EncryptP(userPassword))
                    {
                        SACCOFactory.ShowAlert(
                           "Your Password could not be reset. Member number does not match your ID number!");
                        btnSubmit.Visible = true;
                        btnBack.Visible = true;
                        //btnSignup.Visible = false;
                        btnLogin.Visible = false;
                        MultiViewLoadLogins.SetActiveView(View2);
                    }
                    else if (string.IsNullOrEmpty(emalcheck) && phonecheck != null)
                    {
                        SACCOFactory.ShowAlert(
                          "Your Password was send to your Phone Number");
                        btnSubmit.Visible = false;
                        txtEmployeeNo.Enabled = false;
                        idNo.Enabled = false;
                        btnBack.Visible = false;
                        //  MultiView1.SetActiveView(View1);
                        //btnSignup.Visible = true;
                        btnLogin.Visible = true;
                        lblError.Text = "";
                    }

                }
                catch (Exception exception)
                {
                    SACCOFactory.ShowAlert(exception.Message);
                }
            }
            btnSubmit.Visible = true;
            btnBack.Visible = true;
            //btnSignup.Visible = false;
            btnLogin.Visible = false;
            MultiViewLoadLogins.SetActiveView(View2);

        }


        protected string NewPassword()
        {
            var nPwd = "";
            var rdmNumber = new Random();
            nPwd = rdmNumber.Next(1000, 1999).ToString();
            return nPwd;
        }


        protected void btnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("#");
        }

        private bool MyJointValidationFunction(string myusername, string myId, string mypassword)
        {
            bool boolReturnValue = false;
            string SQLRQST = @"select [Account_No], [ID_No], Password from [Kingdom Sacco Ltd_$FOSA Account Sign. Details]";
            SqlConnection con = new SqlConnection(strSQLConn);
            SqlCommand command = new SqlCommand(SQLRQST, con);
            SqlDataReader Dr;
            try
            {
                con.Open();
                Dr = command.ExecuteReader();
                while (Dr.Read())
                {
                    if ((myusername == Dr["Account_No"].ToString()) && (myId == Dr["ID_No"].ToString()) && (mypassword == Dr["Password"].ToString()))
                    {
                        boolReturnValue = true;
                        break;
                    }
                    if (string.IsNullOrWhiteSpace(Dr["Password"].ToString()))
                    {
                        boolReturnValue = false;
                    }
                    if (string.IsNullOrWhiteSpace(Dr["ID_No"].ToString()))
                    {
                        boolReturnValue = false;
                    }
                }
                Dr.Close();
            }
            catch (SqlException ex)
            {
                SACCOFactory.ShowAlert("Authentication failed!" + ex.Message);

            }
            return boolReturnValue;

        }


        private bool MyValidationFunction(string myusername, string mypassword)
        {
            bool boolReturnValue = false;
            string SQLRQST = @"select [No_], Password from [Kingdom Sacco Ltd_$Members Register]";
            SqlConnection con = new SqlConnection(strSQLConn);
            SqlCommand command = new SqlCommand(SQLRQST, con);
            SqlDataReader Dr;
            try
            {
                con.Open();
                Dr = command.ExecuteReader();
                while (Dr.Read())
                {
                    if ((myusername == Dr["No_"].ToString()) && (mypassword == Dr["Password"].ToString()))
                    {
                        boolReturnValue = true;
                        break;
                    }
                    if (string.IsNullOrWhiteSpace(Dr["Password"].ToString()))
                    {
                        boolReturnValue = false;
                    }
                }
                Dr.Close();
            }
            catch (SqlException ex)
            {
                SACCOFactory.ShowAlert("Authentication failed!" + ex.Message);

            }
            return boolReturnValue;
        }

        protected void notregistered_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegisterMemberForm.aspx");
        }

        protected void LoginMenu_MenuItemClick(object sender, MenuEventArgs e)
        {

            int index = Int32.Parse(e.Item.Value);

            MultiViewLoadLogins.ActiveViewIndex = index;
        }

        protected void btnNmember_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationForm.aspx");
        }

        protected void btnIbank_Click(object sender, EventArgs e)
        {
            //Response.Redirect("RegisterMemberForm.aspx");

            //btnSignup.Visible = false;
            btnLogin.Visible = false;
            MultiViewLoadLogins.SetActiveView(View2);

            btnSubmit.Visible = true;
            btnBack.Visible = true;
            lblError.Text = "";
        }

        protected void lnkbtnCreateAcc_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationForm.aspx");

        }

        protected void LnkbtnPassJoint_Click(object sender, EventArgs e)
        {
            //btnSignup.Visible = false;
            btnLogin.Visible = false;
            MultiViewLoadLogins.SetActiveView(JointResetView);

            btnSubmit.Visible = false;
            btnResetJpass.Visible = true;
            btnBack.Visible = true;
            lblError.Text = "";
        }

        protected void btnJlogin_Click(object sender, EventArgs e)
        {
            //cptCaptcha.ValidateCaptcha(txtCaptcha.Text.Trim());
            //if (cptCaptcha.UserValidated)
            //{

            //try
            //{

            string userNameJ = TextAccountno.Text.Trim().Replace("'", "");
            string userIdnoJ = TextID.Text.Trim().Replace("'", "");
            string userPasswordJ = TextPassword.Text.Trim().Replace("'", "");

            string mypassencryptJ = EncryptP(userPasswordJ);


            if (string.IsNullOrEmpty(userPasswordJ) && string.IsNullOrEmpty(userIdnoJ) && string.IsNullOrEmpty(userNameJ))
            {
                lblError.Text = "Username or Idno or Password Empty!";
                return;
            }

            //if (MyJointValidationFunction(userNameJ,userIdnoJ, mypassencryptJ))
            //{
            //    Session["username"] = userNameJ;
            //    Session["idno"] = userIdnoJ;
            //    Session["pwd"] = mypassencryptJ;                
            //    Response.Redirect("Joint_Dashboard.aspx");
            //}

            if (nav.JointAccountLogin.Where(r => r.Account_No == userNameJ && r.ID_No == userIdnoJ && r.Password == mypassencryptJ) != null)
            {

                //var bsno = nav.JointMemberList.Where(bs => bs.No == userNameJ).Select(bn => bn.BOSA_Account_No).SingleOrDefault();

                Session["usernameJ"] = userNameJ;
                Session["idnoJ"] = userIdnoJ;
                Session["pwd"] = mypassencryptJ;
                //Session["accType"] = "jointAcc";
                Response.Redirect("Joint_Dashboard.aspx");

            }
            else
            {
                lblError.Text = "Authentication failed!";
                return;
            }
            //}
            //catch (Exception exception)
            //{
            //    lblError.Text = exception.Message;
            //    return;
            //}
            //}
            //            else
            //            {
            //                lblError.Text = "Invalid Captcha. Try again!";
            //            }
        }

        protected void PasswordExpiry(string username)
        {
            var passDt = nav.MemberList.ToList().Where(r => r.No == username);
            var pdT = passDt.Select(r => r.Password_Reset_Date).SingleOrDefault();

            switch (pdT.ToString())
            {
                case null:
                    Response.Redirect("Default.aspx");
                    break;

                default:
                    DateTime pexpires = Convert.ToDateTime(pdT);
                    var expTm = DateTime.Now;

                    int timeEp = (expTm - pexpires).Minutes;

                    if (timeEp > 2)
                    {
                        SACCOFactory.ShowAlert("Sorry, your OTP Code has expired, please reset first");
                        //ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "alert('Sorry, your OTP Code has expired, please reset first')", true);
                        //Response.Redirect("Default.aspx");                                            
                    }

                    break;
            }
        }

        protected void btnFirstLogin_Click(object sender, EventArgs e)
        {
            //cptCaptcha.ValidateCaptcha(txtCaptcha.Text.Trim());
            //if (cptCaptcha.UserValidated)
            //{


            string userName = txtStaffNo.Text.Trim().Replace("'", "");
            string userPassword = txtPassword.Text.Trim().Replace("'", "");

            string mypassencrypt = EncryptP(userPassword);

            //passwordExpiry(userName);


            var passDt = nav.MemberList.ToList().Where(r => r.No == userName);
            var pdT = passDt.Select(r => r.Password_Reset_Date).SingleOrDefault();

            DateTime pexpires = Convert.ToDateTime(pdT);
            var expTm = DateTime.Now;

            int timeEp = (expTm - pexpires).Minutes;

            if (timeEp > 10)
            {
                SACCOFactory.ShowAlert("Sorry, your one time password has expired, please reset first!");
                lblError.Text = "Sorry, your one time password has expired, please reset first!";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "alert('Sorry, your OTP Code has expired, please reset first')", true);
                //Response.Redirect("Default.aspx");
                return;
            }
            else
            {
                try
                {
                    if (string.IsNullOrWhiteSpace(userPassword))
                    {
                        lblError.Text = "Password Empty!";
                        SACCOFactory.ShowAlert("Password Empty!");
                        return;
                    }

                    if (MyValidationFunction(userName, mypassencrypt))
                    {
                        Session["username"] = userName;
                        Session["pwd"] = mypassencrypt;
                        Session["accType"] = "individual";

                        Response.Redirect("PassChange.aspx");
                        //Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        lblError.Text = "Authentication failed!";
                        SACCOFactory.ShowAlert("Authentication failed!, Try Again");
                    }
                }
                catch (Exception exception)
                {
                    lblError.Text = exception.Message;
                    return;
                }
                //}
                //else
                //{
                //    lblError.Text = "Invalid Captcha.Try again!!";
                //}
            }


        }

        protected void btnFirstJlogin_Click(object sender, EventArgs e)
        {

            ////cptCaptcha.ValidateCaptcha(txtCaptcha.Text.Trim());
            ////if (cptCaptcha.UserValidated)
            ////{

            string userNameJ = TextAccountno.Text.Trim().Replace("'", "");
            string userIdnoJ = TextID.Text.Trim().Replace("'", "");
            string userPasswordJ = TextPassword.Text.Trim().Replace("'", "");


            string mypassencryptJ = EncryptP(userPasswordJ);



            var passDt = nav.JointAccountLogin.ToList().Where(r => r.Account_No == userNameJ && r.ID_No == userIdnoJ);
            var pdT = passDt.Select(r => r.Password_Reset_Date).SingleOrDefault();

            DateTime pexpires = Convert.ToDateTime(pdT);
            var expTm = DateTime.Now;

            int timeEp = (expTm - pexpires).Minutes;

            if (timeEp > 10)
            {
                SACCOFactory.ShowAlert("Sorry, your one time password has expired, please reset first!");
                lblError.Text = "Sorry, your one time password has expired, please reset first!";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "alert('Sorry, your OTP Code has expired, please reset first')", true);
                //Response.Redirect("Default.aspx");
                return;
            }
            else
            {
                try
                {
                    if (string.IsNullOrEmpty(userPasswordJ) && string.IsNullOrEmpty(userIdnoJ) && string.IsNullOrEmpty(userNameJ))
                    {
                        lblError.Text = "Username or Idno or Password Empty!";
                        return;
                    }

                    if (nav.JointAccountLogin.Where(r => r.Account_No == userNameJ && r.ID_No == userIdnoJ && r.Password == mypassencryptJ).FirstOrDefault() != null)
                    {

                        //var bsno = nav.JointMemberList.Where(bs => bs.No == userNameJ).Select(bn => bn.BOSA_Account_No).SingleOrDefault();

                        Session["usernameJ"] = userNameJ;
                        Session["idnoJ"] = userIdnoJ;
                        Session["pwd"] = mypassencryptJ;
                        Session["accType"] = "jointAcc";
                        Response.Redirect("PassChangeJoint.aspx");
                    }
                    else
                    {
                        lblError.Text = "Authentication failed!";
                        return;
                    }

                }
                catch (Exception exception)
                {
                    lblError.Text = exception.Message;
                    return;
                }
            }
            ////}
            ////            else
            ////            {
            ////                lblError.Text = "Invalid Captcha. Try again!";
            ////            }
        }

        protected void btnResetJpass_Click(object sender, EventArgs e)
        {
            string userName = txtAccountno.Text.Trim().Replace("'", "");
            string userPassword = txtidNo.Text.Trim().Replace("'", "");



            var idcheck = WSConfig.ObjNav.FnGetSignatoryId(userName, userPassword);
            var emalcheck = WSConfig.ObjNav.FnGetSignatoryEmail(userName, userPassword);
            var phonecheck = WSConfig.ObjNav.FnGetSignatoryPhone(userName, userPassword);

            //var idcheck = nav.JointAccountLogin.Where(r => r.Account_No == userName).Select(k => k.ID_No).SingleOrDefault();
            //var emalcheck = nav.JointAccountLogin.Where(r => r.Account_No == userName).Select(k => k.Email_Address).SingleOrDefault();
            //var phonecheck = nav.JointAccountLogin.Where(r => r.Account_No == userName).Select(k => k.Mobile_Phone_No).SingleOrDefault();

            if (string.IsNullOrEmpty(userPassword) && string.IsNullOrEmpty(userName))
            {
                lblError.Text = "Member No or National ID Empty!";
                btnResetJpass.Visible = true;
                btnBack.Visible = true;
                //btnSignup.Visible = false;
                btnJlogin.Visible = false;
                MultiViewLoadLogins.SetActiveView(JointResetView);
                return;

            }
            else
            {
                try
                {
                    var nPassword = NewPassword();
                    var CompEmail = WSConfig.ObjNav.FnUpdatePasswordJointAccount(txtAccountno.Text.Trim(), txtidNo.Text.Trim(), EncryptP(nPassword));
                    if (WSConfig.MailFunction(string.Format("Dear Sacco Member,\n Your New password is: {0}", nPassword), CompEmail,
                        "Portal password reset successful") && !String.IsNullOrEmpty(CompEmail))
                    {
                        SACCOFactory.ShowAlert(
                            "A New Password has been generated and sent to your Personal mail and Mobile Phone.Kindly use to it to login to your Member portal");
                        btnResetJpass.Visible = false;
                        //txtAccountno.Enabled = false;
                        //txtidNo.Enabled = false;
                        btnBack.Visible = false;
                        //MultiView1.SetActiveView(View1);
                        //btnSignup.Visible = true;
                        btnJlogin.Visible = true;
                        lblError.Text = "";
                    }
                    else if (idcheck != userPassword)
                    {
                        SACCOFactory.ShowAlert(
                           "Your Password could not be reset. Account number does not match your ID number!");
                        btnSubmit.Visible = true;
                        btnBack.Visible = true;
                        //btnSignup.Visible = false;
                        btnJlogin.Visible = false;
                        MultiViewLoadLogins.SetActiveView(JointResetView);
                    }
                    else if (string.IsNullOrEmpty(emalcheck) && phonecheck != null)
                    {
                        SACCOFactory.ShowAlert(
                          "Your Password was send to your Phone Number");
                        btnSubmit.Visible = false;
                        txtEmployeeNo.Enabled = false;
                        idNo.Enabled = false;
                        btnBack.Visible = false;
                        //  MultiView1.SetActiveView(View1);
                        //btnSignup.Visible = true;
                        btnJlogin.Visible = true;
                        lblError.Text = "";
                    }

                }
                catch (Exception exception)
                {
                    SACCOFactory.ShowAlert(exception.Message);
                }
            }
            btnResetJpass.Visible = true;
            btnBack.Visible = true;
            //btnSignup.Visible = false;
            btnJlogin.Visible = false;
            MultiViewLoadLogins.SetActiveView(JointResetView);
        }

        protected void btnbackJointL_Click(object sender, EventArgs e)
        {
            btnResetJpass.Visible = false;
            btnBack.Visible = false;

            MultiViewLoadLogins.SetActiveView(jointLogin);
            //btnSignup.Visible = true;
            btnJlogin.Visible = false;
            btnFirstJlogin.Visible = true;
            lblError.Text = "";
        }
    }
}

