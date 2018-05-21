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
           //btnSubmit.Visible = false;
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

                try
                {
                    if (string.IsNullOrWhiteSpace(userPassword))
                    {
                        lblError.Text = "Password Empty!";
                        SACCOFactory.ShowAlert("Password Empty!");
                        return;
                    }

                    if (MyValidationFunction(userName, userPassword))
                    {
                        Session["username"] = userName;
                        Session["pwd"] = userPassword;
                        Response.Redirect("Dashboard");
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
        protected void btnPassword_Click(object sender, EventArgs e)
        {
            //btnSignup.Visible = false;
            btnLogin.Visible = false;
            MultiViewLoadLogins.SetActiveView(View2);
           
           //btnSubmit.Visible = true;
            btnBack.Visible = true;
            lblError.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            //btnSubmit.Visible = false;
            btnBack.Visible = false;
           
            //MultiView1.SetActiveView(View1);
            //btnSignup.Visible = true;
            btnLogin.Visible = true;
            lblError.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string userName = txtEmployeeNo.Text.Trim().Replace("'", "");
            string userPassword = idNo.Text.Trim().Replace("'", "");

            var idcheck = nav.MemberList.Where(r => r.No == userName).Select(k=>k.ID_No).FirstOrDefault();
            var emalcheck = nav.MemberList.Where(r => r.No == userName).Select(k => k.E_Mail).FirstOrDefault();
            var phonecheck = nav.MemberList.Where(r => r.No == userName).Select(k => k.Phone_No).FirstOrDefault();

            if (string.IsNullOrEmpty(userPassword) && string.IsNullOrEmpty(userName))
            {
                lblError.Text = "Member No or National ID Empty!";
                //btnSubmit.Visible = true;
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
                    var CompEmail = WSConfig.ObjNav.FnUpdatePassword(txtEmployeeNo.Text.Trim(), idNo.Text.Trim(), nPassword);
                    if (WSConfig.MailFunction(string.Format("Dear Sacco Member,\n Your New password is: {0}", nPassword), CompEmail,
                        "Portal password reset successful") && !String.IsNullOrEmpty(CompEmail))
                    {
                        SACCOFactory.ShowAlert(
                            "A New Password has been generated and sent to your Personal mail and Mobile Phone.Kindly use to it to login to your Member portal");
                        //btnSubmit.Visible = false;
                        txtEmployeeNo.Enabled = false;
                        idNo.Enabled = false;
                        btnBack.Visible = false;
                        //MultiView1.SetActiveView(View1);
                        //btnSignup.Visible = true;
                        btnLogin.Visible = true;
                        lblError.Text = "";
                    }
                    else if (idcheck != userPassword)
                    {
                        SACCOFactory.ShowAlert(
                           "Your Password could not be reset. Member number does not match your ID number!");
                      //  btnSubmit.Visible = true;
                        btnBack.Visible = true;
                        //btnSignup.Visible = false;
                        btnLogin.Visible = false;
                        MultiViewLoadLogins.SetActiveView(View2);
                    }
                    else if (string.IsNullOrEmpty(emalcheck) && phonecheck!=null)
                    {
                        SACCOFactory.ShowAlert(
                          "Your Password was send to your Phone Number");
                      // btnSubmit.Visible = false;
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
            //btnSubmit.Visible = true;
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
    
        public void Calculate(String newRepaymentMethod, Double newLoanAmount, Double newIntrestRate, Double newInstallments)
        {
            int count = 1;
            Double pmt = 0;
            DateTime date = DateTime.Now;
            date = date.AddMonths(1);
            Double interest = newIntrestRate / 100;
            Double intrest2 = 0;
            Double totalIntrest = 0;
            Double loanRepayment = 0, loanBalance = 0;

            String html = " <table class='table table-responsive table-striped table-bordered table-condensed'><tr><th>Period</th><th>Month-Year</th><th>Principle</th><th>Loan Repayment</th><th>Intrest</th><th>Total deduction</th><th>Loan Balance</th></tr>";
            if (newRepaymentMethod == "Amortised")
            {

                //  pmt = Financial.Pmt(interest, newInstallments, -newLoanAmount, 0, DueDate.EndOfPeriod);

                for (int p = 0; p < newInstallments; p++)
                {
                    intrest2 = pmt * interest;
                    totalIntrest += intrest2;
                    loanRepayment = pmt - (interest * newLoanAmount);
                    loanBalance = newLoanAmount - loanRepayment;

                    if (loanBalance < 1)
                    {
                        loanBalance = 0;
                    }
                    html += "<tr><td>" + count++ + "</td><td>" +
                            String.Format("{0}-{1}", new DateTimeFormatInfo().GetAbbreviatedMonthName(date.Month),
                                date.Year) +
                            "</td><td>" + String.Format("{0:n}", newLoanAmount) + "</td><td>" + String.Format("{0:n}", loanRepayment) + "</td><td>" + String.Format("{0:n}", (interest * newLoanAmount)) + "</td><td>" + String.Format("{0:n}", (loanRepayment + (interest * newLoanAmount))) + "</td><td>" + String.Format("{0:n}", loanBalance) + "</td></tr>";
                    date = date.AddMonths(1);
                    newLoanAmount -= loanRepayment;

                }
            }
            else
            {
                pmt = newLoanAmount / newInstallments;
                intrest2 = pmt * interest;
                totalIntrest += intrest2;
                for (int p = 0; p < newInstallments; p++)
                {
                    intrest2 = pmt * interest;
                    totalIntrest += intrest2;
                    loanRepayment = pmt + intrest2;
                    loanBalance = newLoanAmount - pmt;

                    if (loanBalance < 1)
                    {
                        loanBalance = 0;
                    }

                    html += "<tr><td>" + count++ + "</td><td>" +
                            String.Format("{0}-{1}", new DateTimeFormatInfo().GetAbbreviatedMonthName(date.Month),
                                date.Year) +
                            "</td><td>" + String.Format("{0:n}", newLoanAmount) + "</td><td>" + String.Format("{0:n}", loanRepayment) + "</td><td>" + String.Format("{0:n}", (interest * newLoanAmount)) + "</td><td>" + String.Format("{0:n}", (loanRepayment + (interest * newLoanAmount))) + "</td><td>" + String.Format("{0:n}", loanBalance) + "</td></tr>";


                    date = date.AddMonths(1);
                    newLoanAmount -= pmt;

                }

            }

            html = html + "</table>";
            calculations.InnerHtml = html;

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

        //protected void ddlUserType_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string usertype = ddlUserType.SelectedItem.Text;
        //    switch (usertype)
        //    {
        //        case "Individual":
        //            MultiViewLoadLogins.SetActiveView(individualLogin);             
        //            break;
        //        case "Joint/Corporate":
        //            MultiViewLoadLogins.SetActiveView(jointLogin);
        //            break;
        //    }
        //}

        protected void lnkBtnSign_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrationForm.aspx");
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
    }
}