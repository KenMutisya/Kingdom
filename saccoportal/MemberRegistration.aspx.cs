using SACCOPortal.NavOData;
using SACCOPortal.NAVWS;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SACCOPortal
{
    public partial class MemberRegistration : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                 ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                loadPostalCodes();
                loadRelnship();
                loadBankCodes();
                loadEmployers();
                
            }
   
        }

        protected void loadPostalCodes() {
            //var records = nav.postalcodes.Select(r => r).ToList();
            //ddlPostal.DataSource = records;
            //ddlPostal.DataTextField = "Code";
            //ddlPostal.DataValueField = "Code";
            //ddlPostal.DataBind();
            //ddlPostal.Items.Insert(0, "--Select Postal Code--");
        }

        protected void ddlPostal_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string selText = ddlPostal.SelectedItem.Text;            
            //var PName = nav.postalcodes.ToList().Where(r => r.Code== selText);
            //txtTown.Text = PName.Select(r => r.City).FirstOrDefault().ToString();
            //SACCOFactory.ShowAlert("selected:" + selText);

        }

        protected void loadRelnship() {
            //var rel = nav.relationships.Select(r => r).ToList();
            //ddlrlnshipTypes.DataSource = rel;
            //ddlrlnshipTypes.DataTextField = "Description";
            //ddlrlnshipTypes.DataValueField = "code";
            //ddlrlnshipTypes.DataBind();
            //ddlrlnshipTypes.Items.Insert(0, "--Select Relationship--");
        }

        protected void loadBankCodes()
        {
            //var bnkc = nav.branchdetails.Select(r =>r).ToList();
            //ddlBankCode.DataSource = bnkc;
            //ddlBankCode.DataTextField = "Code";
            //ddlBankCode.DataValueField = "Code";
            //ddlBankCode.DataBind();
            //ddlBankCode.Items.Insert(0, "--Select Branch code--");

        }
        protected void ddlBankCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            //string selText = ddlBankCode.SelectedItem.Text;
            //var bName = nav.branchdetails.ToList().Where(r => r.Branch_No==selText);
            //txtBranchName.Text = bName.Select(r => r.Branch_Name).FirstOrDefault().ToString();
            //SACCOFactory.ShowAlert("selected:" + selText);
        }


        //protected void registerMember()
        //{

        //   // string acCate = ddlACcat.SelectedItem.Text;
        //    int acCategory = 0;
        //    //if (acCate.Equals("Individual"))
        //    {
        //        acCategory = 0;
        //    }
        //    else
        //    {
        //        acCategory = 1;
        //    }


        //    string apCate = ddlAPPCat.SelectedItem.Text;
        //    int apType = 0;
        //    if (apCate.Equals("New Application"))
        //    {
        //        apType = 0;
        //    }
        //    else if (apCate.Equals("Rejoining"))
        //    {
        //        apType = 1;
        //    }
        //    else
        //    {
        //        apType = 2;
        //    }
        //    string gender = lstGender.SelectedItem.Text;
        //    int gen;
        //    if (gender.Equals("Male"))
        //    {
        //        gen = 0;
        //    }
        //    else
        //    {
        //        gen = 1;
        //    }

        //    string marital = ddlMarital.SelectedItem.Text;
        //    int marstat = 0;
        //    if (marital.Equals("Single"))
        //    {
        //        marstat = 1;
        //    }
        //    else if (marital.Equals("Married"))
        //    {
        //        marstat = 2;
        //    }
        //    else if (marital.Equals("Devorced"))
        //    {
        //        marstat = 3;
        //    }
        //    else if (marital.Equals("Widow"))
        //    {
        //        marstat = 4;
        //    }
        //    else if (marital.Equals("Widower"))
        //    {
        //        marstat = 5;
        //    }
            
            //var MobileString = txtPhoneNo.Text.Trim();            
            //var mobileBuilder = new StringBuilder(MobileString);
           // mobileBuilder.Remove(0, 1); //Trim one character from position 1
            //mobileBuilder.Insert(0, "+254"); // replace position 0 with +254
           // MobileString = mobileBuilder.ToString();

            //var MobileKin = txtKinPhone.Text.Trim();
            //var kinTrimer = new StringBuilder(MobileKin);
            //kinTrimer.Remove(0,1);
            //kinTrimer.Insert(0, "+254");
           // MobileKin = kinTrimer.ToString();

            //string memberGrp = ddlCustGrp.SelectedItem.Text;
            //string fname = txtfNname.Text.Trim();
            //string mname = txtMname.Text.Trim();
            //string lname = txtLname.Text.Trim();
            //string boxoffice = txtAddress.Text.Trim();
            //string residence = txtResidence.Text.Trim();
            //string pocode = ddlPostal.SelectedItem.Text;
            //string town = txtTown.Text.Trim();            
            //string email = txtEmail.Text.Trim();
            //string idno = txtIDNo.Text.Trim();
            //string dateofbirth = DooooB.Text.Trim();
            //DateTime dtoB = Convert.ToDateTime(dateofbirth);
            //string branchcode = ddlBankCode.SelectedItem.Text;
            //string branchname = txtBranchName.Text.Trim();
            //string kinname = kinfullNames.Text.Trim();
            //string rel = ddlrlnshipTypes.SelectedItem.Text;
            //string kinID = txtKinIDNO.Text.Trim();           
            //string kinAdd = txtKinAddress.Text.Trim();
            //string empname = ddlEmpName.SelectedItem.Text.Trim();
            //string banlACNo = txtACNo.Text.Trim();


        //    if (string.IsNullOrEmpty(fname) || string.IsNullOrEmpty(lname) || string.IsNullOrEmpty(MobileString)
        //        || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(idno) || string.IsNullOrEmpty(dateofbirth) || string.IsNullOrEmpty(branchcode)
        //        || string.IsNullOrEmpty(branchname) || string.IsNullOrEmpty(kinname) || string.IsNullOrEmpty(kinAdd) || string.IsNullOrEmpty(banlACNo))
        //    {
        //        lblError.Text = "Please fill all the empty required fields!";
        //        return;
        //    }
        //    else
        //    {
        //        try
        //        {
        //            var credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"]);
        //            Portals sup = new Portals();
        //            sup.Credentials = credentials;
        //            sup.PreAuthenticate = true;
        //            sup.FnMemberApply(fname, mname, lname, boxoffice, residence, pocode, town, MobileString,
        //                              email, idno, branchcode, branchname, banlACNo, gen, marstat, acCategory, apType,
        //                              memberGrp, empname, dtoB);
        //            sup.FnRegisterKin(kinname, rel, kinID, MobileKin, kinAdd, idno);
        //            SACCOFactory.ShowAlert("Your data succcessfully saved");
        //            Response.Redirect("MemberRegistration");
        //        }
        //        catch (Exception ex) {
        //            lblError.Text = ex.Message;
        //            return;
        //        }
        //    }
        //}

        //protected void btnReg_Click(object sender, EventArgs e)
        //{
        //    if (Page.IsValid)
        //    {
        //        registerMember();
        //    }
        //    else
        //    {
        //        lblError.Text = "Invalid Captcha";
        //    }
            

        //}

        protected void loadEmployers()
        {
            //var employers = nav.employerlist.Select(r => r).ToList();
            //ddlEmpName.DataSource = employers;
            //ddlEmpName.DataTextField = "Description";
            //ddlEmpName.DataValueField = "Code";
            //ddlEmpName.DataBind();
            //ddlEmpName.Items.Insert(0, "--Select Employer--");
        }

        protected void tesClick()
        {
            //var MobileString = txtPhoneNo.Text.Trim();
            //var mobileBuilder = new StringBuilder(MobileString);
            //mobileBuilder.Remove(0, 1);
            //mobileBuilder.Insert(0, "+254");
            //MobileString = mobileBuilder.ToString();
            //SACCOFactory.ShowAlert("Phone:" + MobileString);
        }

        //protected void loadDepartments() {
        //    var dpt = nav.departments.Select(r => r).ToList();
        //    ddlEmpName.DataSource = dpt;
        //    ddlEmpName.DataTextField = "Department";
        //    ddlEmpName.DataValueField = "No";
        //    ddlEmpName.DataBind();
        //    ddlEmpName.Items.Insert(0, "--Select Departments--");
        //}


    }
}