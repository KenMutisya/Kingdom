using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/Default");

            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard");
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //string userName = Session["username"].ToString();
            //string curPass= txtPasswordOld.Text.Trim();
            //var navCurPass = nav.HR_Employees.Where(r=>r.No==userName).Select(r => r.Password).ToString();

            //if (curPass != navCurPass) {
            //    HRFactory.ShowAlert("Wrong current password!!");
            //    lblError.Text = "Wrong current password!!";
            //    return;
            //}

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
                    if (WSConfig.ObjNav.FnChangePassword(Session["username"].ToString(), txtPasswordOld.Text.Trim(),
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