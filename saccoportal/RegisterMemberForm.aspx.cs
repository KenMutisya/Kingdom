using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Globalization;
using SACCOPortal.NavOData;
using System.Configuration;
using SACCOPortal.NAVWS;
using System.Text;
namespace SACCOPortal
{
    public partial class RegisterMemberForm : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
                ConfigurationManager.AppSettings["DOMAIN"])
        };

        string KGid, Gname, Gdob = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                loadAllcountries();
                registerMultiView.SetActiveView(verifystageView);
                DeactivateThings();
                loadSession();
                AccType.Items[0].Selected = false;
                AccType.Items[1].Selected = false;
            }
        }

        protected void Verify_Click(object sender, EventArgs e)
        {
            var idNo = TextIDPassP.Text;
            var idType = ddlIDorPASS.SelectedItem.Text;

            //string checkid = WSConfig.ObjNav.FnCheckId(idNo).ToString();

            //if (WSConfig.ObjNav.FnFeedback(idNo, idType) == true)
            //{
            //    //SACCOFactory.ShowAlert("Feedback send succcessfully");
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "alert('Feedback send succcessfully')", true);
            //    //viewfeedback()
            //}
            //else
            //{

            //}


            GetIPRSData(idType, idNo, 0);
            registerMultiView.SetActiveView(verifiedInfoView);
            //previewdatanow
            loadSession();
            pretxtPhoneno.Text = Session["phonenumber"].ToString();
            pretxtEmail.Text = Session["emailaddress"].ToString();
            pretxtIdtype.Text = Session["idtype"].ToString();
            TextIdno.Text = Session["id/passport"].ToString();
        }

        protected void btnProceed_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(selectAccount);
            loadSession();
            //SACCOFactory.ShowAlert( Session["kinlstname"].ToString());

            //Previewdatanow
            TextFname.Text = Session["fullname"].ToString();

        }

        protected void ButtonNext_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(nextofkin);
            //registerMultiView.SetActiveView(fillresidencedetails);
            //registerMultiView.SetActiveView(refereedetails);
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "UnhideNxtofKin()", true);
            // registerMultiView.SetActiveView(not18yrs);
            loadSession();
            TextAcct.Text = Session["accounttype"].ToString();


        }

        public void GetIPRSData(string IDorPassport, string IDNumber, int number)
        {
            try
            {

                using (var client = new WebClient())
                {

                    string SendDetails = IDorPassport + ":::ID:::" + IDNumber;

                    //= WSConfig.ObjNav.GnSendIdDetails();///DFGHJKL
                    string[] DetailsArray;

                    DetailsArray = SendDetails.Split(new string[] { ":::" }, StringSplitOptions.RemoveEmptyEntries);
                    if (DetailsArray[2].Length > 6)
                    {
                        EnableTrustedHosts();

                        client.Headers.Add("Content-Type", "application/json");

                        var vm = new { idDoc = DetailsArray[0], type = DetailsArray[1], number = DetailsArray[2], appName = "Navision" };

                        var dataString = JsonConvert.SerializeObject(vm);
                        string result = string.Empty;
                        try
                        {
                            result = client.UploadString("https://192.168.0.55:16357/iprs", "POST", dataString);
                            string photo = null;
                            // IEnumerable< memberinfo> IprsDetails = JsonConvert.DeserializeObject< IEnumerable < memberinfo > >(result);
                            memberinfo IprsDetails = null;
                            memberinfopassport iprsPassport = null;
                            if (DetailsArray[0].Equals("NATIONAL_ID"))
                            {
                                IprsDetails = JsonConvert.DeserializeObject<memberinfo>(result);
                                if (IprsDetails.errorCode == "")
                                {
                                    photo = IprsDetails.photo;

                                    byte[] buffer = Convert.FromBase64String(photo);
                                    FileStream file = File.Create(Properties.Settings.Default.IPRS_Photo_File + IprsDetails.idNumber + ".jpg");
                                    file.Write(buffer, 0, buffer.Length);
                                    file.Close();

                                    byte[] buffersign = Convert.FromBase64String(IprsDetails.signature);
                                    FileStream filesign = File.Create(Properties.Settings.Default.IPRS_Signature_File + IprsDetails.idNumber + ".jpg");
                                    filesign.Write(buffersign, 0, buffersign.Length);
                                    filesign.Close();

                                    //member details
                                    if (number == 0)
                                    {
                                        txtFullnames.Text = IprsDetails.firstName + " " + IprsDetails.otherName + " " + IprsDetails.surname;
                                        Textgnd.Text = IprsDetails.gender;
                                        TextDob.Text = IprsDetails.dateOfBirth;
                                        TextPin.Text = IprsDetails.pin;
                                    }
                                    //referee details
                                    else if (number == 1)
                                    {
                                        textrefName.Text = IprsDetails.firstName + " " + IprsDetails.otherName + " " + IprsDetails.surname;
                                        pretxtRId.Text = IprsDetails.idNumber;
                                    }
                                    //kin details
                                    else if (number == 2)
                                    {
                                        TxtKnameMajor.Text = IprsDetails.firstName + " " + IprsDetails.otherName + " " + IprsDetails.surname;
                                        txtPrkinId.Text = IprsDetails.idNumber;
                                        TxtKdot.Text = IprsDetails.dateOfBirth;
                                    }
                                    //Guardian details
                                    else if (number == 3)
                                    {
                                        //TxtGname.Text = IprsDetails.firstName + " " + IprsDetails.otherName + " " + IprsDetails.surname;
                                        Gname = IprsDetails.firstName + " " + IprsDetails.otherName + " " + IprsDetails.surname;
                                        //pretxtKGid.Text = IprsDetails.idNumber;
                                        KGid = IprsDetails.idNumber;
                                        //TxtGdob.Text = IprsDetails.dateOfBirth;
                                        Gdob = IprsDetails.dateOfBirth;
                                    }

                                    //WSConfig.ObjNav.FnGetIprsDetails(
                                    //    IprsDetails.dateOfBirth,
                                    //    IprsDetails.firstName,
                                    //    IprsDetails.otherName,
                                    //    IprsDetails.surname,
                                    //    IprsDetails.idNumber,
                                    //    IprsDetails.gender,
                                    //IprsDetails.pin);
                                }
                                else
                                {
                                    //  WSConfig.ObjNav.GetErrorCodes(IprsDetails.errorCode, DetailsArray[2], IprsDetails.errorDesc);                                                                     
                                }
                            }
                            else
                            {
                                iprsPassport = JsonConvert.DeserializeObject<memberinfopassport>(result);
                            }
                        }
                        catch (Exception e)
                        {
                            SACCOFactory.ShowAlert(e.Message);
                            //  WSConfig.ObjNav.GetErrorCodes("500", DetailsArray[2], e.Message);

                        }
                    }
                }
            }
            catch (Exception e)
            {
                SACCOFactory.ShowAlert(e.Message);
            }

        }

        private static bool ValidateRemoteCertificate(object sender, X509Certificate cert, X509Chain chain, SslPolicyErrors policyErrors)
        {
            bool result = false;
            result = true;
            return result;
        }
        public static void EnableTrustedHosts()
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback =
                 ((sender, certificate, chain, sslPolicyErrors) => true);
        }
        public partial class memberinfo
        {
            public string citizenship { get; set; }
            public string clan { get; set; }
            public string dateOfBirth { get; set; }
            public string dateOfDeath { get; set; }
            public string dateOfIssue { get; set; }
            public string ethnicGroup { get; set; }
            public string family { get; set; }
            public string fingerprint { get; set; }
            public string firstName { get; set; }
            public string otherName { get; set; }
            public string surname { get; set; }
            public string gender { get; set; }
            public string idNumber { get; set; }
            public string occupation { get; set; }
            public string photo { get; set; }
            public string pin { get; set; }
            public string placeOfBirth { get; set; }
            public string regOffice { get; set; }
            public string serialNumber { get; set; }
            public string signature { get; set; }
            public string errorCode { get; set; }
            public string errorDesc { get; set; }



        }
        public partial class memberinfopassport
        {
            public string citizenship { get; set; }
            public string clan { get; set; }
            public string dateOfBirth { get; set; }
            public string dateOfDeath { get; set; }
            public string dateOfIssue { get; set; }
            public string ethnicGroup { get; set; }
            public string family { get; set; }
            public string fingerprint { get; set; }
            public string firstName { get; set; }
            public string otherName { get; set; }
            public string surname { get; set; }
            public string gender { get; set; }
            public string idNumber { get; set; }
            public string occupation { get; set; }
            public string photo { get; set; }
            public string pin { get; set; }
            public string placeOfBirth { get; set; }
            public string regOffice { get; set; }
            public string serialNumber { get; set; }
            public string signature { get; set; }
            public string errorCode { get; set; }
            public string errorDesc { get; set; }
        }

        //protected void btnNext2_Click(object sender, EventArgs e)
        //{
        //    registerMultiView.SetActiveView(refereedetails);
        //    DeactivateThings();
        //    loadSession();         
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "minorNxtofKin()", true);
        //    //SACCOFactory.ShowAlert(Session["kinlstname"].ToString());

        //    //Previewdatanow
        //    txtPrkinId.Text = Session["kinID"].ToString();
        //    pretxtKname.Text = Session["kinname"].ToString();
        //    pretxtKGid.Text = Session["kguardianid"].ToString();
        //    pretxtGphone.Text = Session["guardianphone"].ToString();
        //    pretxtRId.Text = Session["refIDminor"].ToString();
        //}      

        protected void loadAllcountries()
        {
            var myList = CultureInfo.GetCultures(CultureTypes.SpecificCultures)
                .Select(c => new RegionInfo(c.Name).EnglishName)
                .Distinct().OrderBy(s => s).ToList();
            ddlCountry.DataSource = myList;
            ddlCountry.DataBind();
            ddlCountry.Items.Insert(0, "--Select Country of residence--");
        }
        protected void DeactivateThings()
        {
            // ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "DisableMyAss()", true);
            int selIndex = Convert.ToInt32(ddlCountry.SelectedIndex);
            switch (selIndex)
            {
                case 0:
                    TxtBoxcity.Enabled = false;
                    break;
                default:
                    TxtBoxcity.Enabled = true;
                    break;
            }
        }
        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            DeactivateThings();
            var myCountry = ddlCountry.SelectedItem.Text;

            switch (myCountry)
            {
                case "Kenya":
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "ShowmyCountyDiV()", true);
                    loadmyCounty();
                    break;
                default:
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "HidemyCountyDiV()", true);
                    break;
            }

        }

        protected void loadmyCounty()
        {
            var county = nav.myCountyIs.ToList();

            ddlCounty.DataSource = county;
            ddlCounty.DataTextField = "County_Name";
            ddlCounty.DataValueField = "County_Name";
            ddlCounty.DataBind();
            ddlCounty.Items.Insert(0, "--Select County--");
        }

        protected void btnPreview_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(previewDetails);
            //SACCOFactory.ShowAlert(Session["fullname"].ToString());
            //fillPreviewdiv();
            loadSession();
            DeactivateThings();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "ClickMeYoh()", true);
            //SACCOFactory.ShowAlert(Session["kinlstname"].ToString());

            //Previewdatanow            
            pretxtcountry.Text = Session["countryname"].ToString();
            pretxttown.Text = Session["townofresidence"].ToString();
            pretcounty.Text = Session["countynm"].ToString();
        }
        protected void loadSession()
        {
            //set preview data to session

            Session["fullname"] = txtFullnames.Text;
            Session["kinID"] = txtPrkinId.Text;
            Session["Kinfullname"] = TxtKnameMajor.Text;
            Session["kinPhone"] = TextKinPhone.Text;
            Session["KinDot"] = TxtKdot.Text;
            Session["countryname"] = ddlCountry.Text;
            Session["countynm"] = ddlCounty.Text;
            Session["townofresidence"] = TxtBoxcity.Text;
            Session["phonenumber"] = TextPhoneno.Text;
            Session["emailaddress"] = TextEmail.Text;
            Session["idtype"] = ddlIDorPASS.Text;
            //Session["guardianid"] = pretxtKGid.Text;
            //Session["guardianname"] = TxtGname.Text;
            // Session["guardianDOB"] = TxtGdob.Text;
            Session["GuardianPhone"] = TextGphone.Text;
            Session["KinMinorName"] = TxtKinMinorname.Text;
            Session["accounttype"] = AccType.SelectedValue;
            Session["id/passport"] = TextIDPassP.Text;
            Session["countynm"] = ddlCounty.Text;
            Session["gender"] = Textgnd.Text;
            Session["reffullname"] = textrefName.Text;
            //Session["refid"] = TextRefIDno.Text;
            Session["refereeid"] = pretxtRId.Text;
            //Session["refphone"] = Textrefphone.Text;            
        }


        protected void AccType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "GetSelectedItem()", true);
            ButtonNext.Enabled = true;
        }

        //protected void amChecked()
        //{
        //    var amichecked = Optional_NextofKin__c.Checked;
        //    SACCOFactory.ShowAlert("Look what they did" + amichecked);
        //    if (amichecked==true)
        //    {
        //        SACCOFactory.ShowAlert("Look what they did");
        //    }
        //    else
        //    {
        //        SACCOFactory.ShowAlert("Not checked");
        //    }
        //   // ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "AmReallyChecked()", true);

        //}

        protected void prebtnSubmit_Click(object sender, EventArgs e)
        {

            string fullname = TextFname.Text.Trim();
            string idno = TextIdno.Text.Trim();
            string phoneno = pretxtPhoneno.Text.Trim();
            string email = pretxtEmail.Text.Trim();
            string countryr = pretxtcountry.Text.Trim();
            string town = pretxttown.Text.Trim();
            string pin = TextPin.Text.Trim();
            string county = pretcounty.Text.Trim();
            string reffullname = textrefName.Text.Trim();

            string refidno = pretxtRId.Text.Trim();
            //string refphone = Textrefphone.Text.Trim(); 

            string kinname = TxtKnameMajor.Text.Trim();
            string kinID = txtPrkinId.Text.Trim();
            string KinPhone = txtPrphone.Text.Trim();

            //string Guardianname = TxtGname.Text.Trim();
            //string GuardianID = pretxtKGid.Text.Trim();
            string GuardianPhone = TextGphone.Text.Trim();

            string KinMinorname = TxtKinMinorname.Text.Trim();


            var MobileString = pretxtPhoneno.Text.Trim();
            var mobileBuilder = new StringBuilder(MobileString);
            mobileBuilder.Remove(0, 1); //Trim one character from position 1
            mobileBuilder.Insert(0, "254"); // replace position 0 with 254
            MobileString = mobileBuilder.ToString();

            int actype = 0;
            int idDocs = 0;
            int gen = 0;
            string acctype = TextAcct.Text.Trim();
            switch (acctype)
            {
                case "Individual Deposists (BOSA)":
                    actype = 0;
                    break;
                case "KSA Individual (FOSA)":
                    actype = 1;
                    break;
            }
            string iddoc = pretxtIdtype.Text.Trim();
            switch (iddoc)
            {
                case "NATIONAL_ID":
                    idDocs = 0;
                    break;
                case "ID":
                    idDocs = 1;
                    break;
            }
            string gender = Textgnd.Text.Trim();
            switch (gender)
            {
                case "M":
                    gen = 1;
                    break;
                case "F":
                    gen = 2;
                    break;
            }

            string dob = TextDob.Text;
            DateTime dt = Convert.ToDateTime(dob);


            string kindot = TxtKdot.Text;
            DateTime kindt = Convert.ToDateTime(kindot);


            //string Guardiandob = TxtGdob.Text;

            //DateTime Gdt = Convert.ToDateTime(Gdob);




            if (string.IsNullOrEmpty(fullname) || string.IsNullOrEmpty(iddoc) || string.IsNullOrEmpty(idno)
                || string.IsNullOrEmpty(phoneno) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(acctype) || string.IsNullOrEmpty(countryr) || string.IsNullOrEmpty(town))
            {
                SACCOFactory.ShowAlert("Please fill all the empty required fields!");
                return;
            }
            else
            {
                try
                {
                    var credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"]);
                    Portals sup = new Portals();
                    sup.Credentials = credentials;
                    sup.PreAuthenticate = true;
                    sup.FnMemberApply(fullname, phoneno, email, idno, gen, pin, actype, dt, idDocs, countryr, county, town, refidno, reffullname);


                    //sup.FnRegisterKin(KinMinorname, "", "", DateTime.Now, idno, "MINOR");


                    var checkedkin = Optional_NextofKin__c.Checked;

                    switch (checkedkin)
                    {
                        case true:
                           // sup.FnRegisterKinMinor(KinMinorname, DateTime.Now, idno);
                            //sup.FnRegisterKin(Gname, KGid, GuardianPhone, dt, idno, "GUARD");

                            break;
                        case false:
                            //sup.FnRegisterKin(kinname, kinID, KinPhone, kindt, idno, "MAJOR");
                            break;
                    }
                    SACCOFactory.ShowAlert("Your data succcessfully saved");
                    //Your membership application submitted successfully. You will receive your Account details via SMS once approved. Thank you for choosing Kingdom sacco.

                }
                catch (Exception ex)
                {
                    SACCOFactory.ShowAlert(ex.Message);
                    //lblError.Text = ex.Message;
                    return;
                }
            }
        }

        protected void Btnrefnext_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(fillresidencedetails);
            var idNoref = TextRefIDno.Text;
            var idTyperef = ddlrefIDorPASS.SelectedItem.Text;
            GetIPRSData(idTyperef, idNoref, 1);

            //previewdaanow
            Session["reffullname"] = textrefName.Text;
            Session["refereeid"] = pretxtRId.Text;
            //Textrefphone.Text = Session["refphone"].ToString();
            // TextRefIDno.Text = Session["refID"].ToString();
            //pretxtRId.Text = Session["refid"].ToString();
        }

        protected void Btnrefback_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(nextofkin);
            DeactivateThings();
            loadSession();
        }

        protected void btnkmajorbak_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(selectAccount);
        }

        protected void btnkinmajnxt_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(refereedetails);
            DeactivateThings();
            loadSession();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "myNextofKin()", true);
            //SACCOFactory.ShowAlert(Session["kinlstname"].ToString());

            var idNokin = TextKinID.Text;
            var idTypekin = ddlkinIDorPass.SelectedItem.Text;
            GetIPRSData(idTypekin, idNokin, 2);

            //previewdatanow
            Session["kinID"] = txtPrkinId.Text;
            Session["Kinfullname"] = TxtKnameMajor.Text;
            Session["KinDot"] = TxtKdot.Text;
            txtPrphone.Text = Session["kinPhone"].ToString();


        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(verifiedInfoView);
        }

        protected void btncanclprv_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(refereedetails);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void ddlRelationship_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnKinMinorB_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(selectAccount);
        }

        protected void btKinMinorN_Click(object sender, EventArgs e)
        {
            registerMultiView.SetActiveView(refereedetails);
            DeactivateThings();
            loadSession();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "minorNxtofKin()", true);
            //SACCOFactory.ShowAlert(Session["kinlstname"].ToString());

            var idNokinGuard = TextGIdno.Text;
            var idTypekinG = ddlkinIDorPass.SelectedItem.Text;
            GetIPRSData(idTypekinG, idNokinGuard, 3);

            //previewdatanow
            //KGid, Gname, Gdob
            Session["guardianid"] = KGid;
            Session["guardianname"] = Gname;
            Session["guardianDOB"] = Gdob;
            //pretxtGphone.Text = Session["GuardianPhone"].ToString();
            //pretxtKMinorname.Text = Session["KinMinorName"].ToString();
            Session["GuardianPhone"] = TextGphone.Text;
            Session["KinMinorName"] = TxtKinMinorname.Text;

        }
    }
}