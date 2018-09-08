using System;
using System.Configuration;
using System.Linq;
using System.Net;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using System.Diagnostics;
using System.Timers;

namespace SACCOPortal
{
    public partial class Reports : System.Web.UI.Page
    {
        public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials =
                new NetworkCredential(ConfigurationManager.AppSettings["W_USER"],
                    ConfigurationManager.AppSettings["W_PWD"],
                    ConfigurationManager.AppSettings["DOMAIN"])
        };

        public static string FosaAcno { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           
            DeleteFiles();
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                LoadLoans(nav, ddFosaAccount);
                FosaNumber();
            }
            if (Request.QueryString["r"] == "ms")
            {
                PrintMemberStatement();
            }
            if (Request.QueryString["r"] == "ds")
            {
                PrintDepositsStatement();
            }
            if (Request.QueryString["r"] == "ls")
            {
                PrintLoansStatement();
            }
            if (Request.QueryString["r"] == "lg")
            {
                PrintLoanGuranteedStatement();
            }
            if (Request.QueryString["r"] == "lo")
            {
                PrintLoanGurantortatement();
            }
            if (Request.QueryString["r"] == "fl")
            {
                PrintFosaStatement();
            }

        }


        protected void FosaNumber()
        {
            
            var fosaAcs = nav.FosaAccounts.Where(r => r.BOSA_Account_No == Session["username"].ToString()).ToList();
            foreach(var acc in fosaAcs)
            {
                FosaAcno = acc.No;
            }
        }



        public void PrintMemberStatement()
        {
            var userIs = Session["accType"].ToString();
            switch (userIs)
            {
                case "individual":
                    IndividualMstat();
                    break;
                case "jointAcc":
                    JointMstat();
                    break;
            }
        }

        protected void JointMstat() {
            btnviewguarantorsrep.Visible = false;
            btnviewloanguarantedrep.Visible = false;
            btnviewdepostat.Visible = false;
            btnviewloanstat.Visible = false;
            btnviewfosastat.Visible = false;

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
                //SACCOFactory.ShowAlert("Please select correct dates!");
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
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();

                    {
                        WSConfig.ObjNav.FnMemberStatementJ(Session["username"].ToString(),
                        String.Format("ACCOUNT STATEMENT_{0}.pdf", filename), dt1Dt2);

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("ACCOUNT STATEMENT_{0}.pdf", filename, dt1Dt2)));

                    }
                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
        }
        protected void IndividualMstat()
        {
            btnviewguarantorsrep.Visible = false;
            btnviewloanguarantedrep.Visible = false;
            btnviewdepostat.Visible = false;
            btnviewloanstat.Visible = false;
            btnviewfosastat.Visible = false;

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
                //SACCOFactory.ShowAlert("Please select correct dates!");
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
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();

                    {
                        WSConfig.ObjNav.FnMemberStatement(Session["username"].ToString(),
                        String.Format("MEMBER STATEMENT_{0}.pdf", filename), dt1Dt2);

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("MEMBER STATEMENT_{0}.pdf", filename, dt1Dt2)));

                    }
                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
                       
        }
        

        public void PrintLoansStatement()
        {
            btnviewmbstat.Visible = false;
            btnviewloanguarantedrep.Visible = false;
            btnviewdepostat.Visible = false;
            btnviewguarantorsrep.Visible = false;
            btnviewfosastat.Visible = false;

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
                //SACCOFactory.ShowAlert("Please select correct dates!");
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
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();
                    {
                        WSConfig.ObjNav.FnloanStatmt(Session["username"].ToString(),
                       String.Format("LOAN STATEMENT_{0}.pdf", filename), dt1Dt2);

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOAN STATEMENT_{0}.pdf", filename, dt1Dt2)));


                    }
                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
        }

        public void PrintFosaStatement()
        {
            btnviewmbstat.Visible = false;
            btnviewloanguarantedrep.Visible = false;
            btnviewdepostat.Visible = false;
            btnviewguarantorsrep.Visible = false;
            btnviewloanstat.Visible = false;

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
                //SACCOFactory.ShowAlert("Please select correct dates!");
            }

            if (txtSelEndD.Value == "" || txtSelStartD.Value == "")
            {
                return;
            }
            else
            {


                try
                {
                    var filename = FosaAcno.ToString().Replace(@"/", @"");
                    //var filename = Session["username"].ToString().Replace(@"/", @"");
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();
                    {
                        WSConfig.ObjNav.Fnfosaloans(FosaAcno,
                    String.Format("FLOAN STATEMENT_{0}.pdf", filename));

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("FLOAN STATEMENT_{0}.pdf", filename, dt1Dt2)));
                    }

                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
        }

        public void PrintLoanGuranteedStatement()
        {
            btnviewmbstat.Visible = false;
            btnviewguarantorsrep.Visible = false;
            btnviewdepostat.Visible = false;
            btnviewloanstat.Visible = false;
            btnviewfosastat.Visible = false;

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
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();

                    {
                        WSConfig.ObjNav.FnLoanGuranteed(Session["username"].ToString(),
                        String.Format("LOANS GUARANTEED_{0}.pdf", filename), dt1Dt2);

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOANS GUARANTEED_{0}.pdf", filename, dt1Dt2)));

                    }
                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
            
        }

        public void PrintDepositsStatement()
        {
            btnviewmbstat.Visible = false;
            btnviewguarantorsrep.Visible = false;
            btnviewloanguarantedrep.Visible = false;
            btnviewloanstat.Visible = false;
            btnviewfosastat.Visible = false;

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
                //SACCOFactory.ShowAlert("Please select correct dates!");
            }

            if (txtSelEndD.Value == "" || txtSelStartD.Value == "")
            {
                return;
            }
            else
            {
                var filename = Session["username"].ToString().Replace(@"/", @"");
                string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();
                try
                {
                    WSConfig.ObjNav.FnDepositsStatement(Session["username"].ToString(),
                        String.Format("DEPOSITS STATEMENT_{0}.pdf", filename), dt1Dt2);

                    pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("DEPOSITS STATEMENT_{0}.pdf", filename, dt1Dt2)));


                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
        }

        public void PrintLoanGurantortatement()
        {
            btnviewmbstat.Visible = false;
            btnviewloanguarantedrep.Visible = false;
            btnviewdepostat.Visible = false;
            btnviewloanstat.Visible = false;
            btnviewfosastat.Visible = false;

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
            catch (Exception ex)
            {
                //SACCOFactory.ShowAlert("Please select correct dates!");
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
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();

                    {
                        WSConfig.ObjNav.FnLoanGurantorsReport(Session["username"].ToString(),
                        String.Format("LOAN GUARANTORS_{0}.pdf", filename), dt1Dt2);

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOAN GUARANTORS_{0}.pdf", filename, dt1Dt2)));

                    }
                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            var filename = Session["username"].ToString().Replace(@"/", @"");

            try
            {
                WSConfig.ObjNav.FnLoanRepaymentShedule(ddFosaAccount.SelectedValue, 
                    String.Format("REPAYMENT SCHEDULE_{0}.pdf", filename));

                pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("REPAYMENT SCHEDULE_{0}.pdf", filename)));
               

            }
            catch (Exception exception)
            {
                exception.Data.Clear();
            }

        }

        public void LoadLoans(NAV navData, DropDownList ddlist)
        {
            var objFosaAccount = navData.LoansR
                .ToList().Where(n => n.Client_Code == Session["username"].ToString());

            ddlist.DataSource = objFosaAccount;
            ddlist.DataTextField = "Loan_No";
            ddlist.DataValueField = "Loan_No";
            ddlist.DataBind();
        }

        private void CopyFile(string fname)
        {
            try
            {

                var filename = fname;
                Process objProcess = new Process();
                objProcess.StartInfo.FileName = ConfigurationManager.AppSettings["SRC_FILE"];
                objProcess.StartInfo.Arguments = fname;
                objProcess.StartInfo.WindowStyle = ProcessWindowStyle.Hidden;
                objProcess.Start();
                objProcess.WaitForExit();
                objProcess.Dispose();

            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
        }

        protected void DeleteFiles()
        {
            string[] files = Directory.GetFiles(Server.MapPath("~/Downloads/"));
            int iCnt = 0;

            foreach (string file in files)
            {
                FileInfo info = new FileInfo(file);

                info.Refresh();

                if (info.LastWriteTime <= DateTime.Now.AddHours(-1))
                {
                    info.Delete();
                    //SACCOFactory.ShowAlert("Deleted: " + files.Length + " files");
                    iCnt += 1;
                }
            }

        }

        //protected void btnClickTimer_OnClick(object sender, EventArgs e)
        //{
        //     Session["timerDiff"] = DateTime.Now.AddSeconds(7).ToString();

        //}

        //protected void timer1_OnTick(object sender, EventArgs e)
        //{
        //    if (DateTime.Compare(DateTime.Now, DateTime.Parse(Session["timerDiff"].ToString())) < 0)
        //    {
        //        txtTimer.Text = ((Int32)DateTime.Parse(Session["timerDiff"].ToString()).Subtract(DateTime.Now).TotalSeconds).ToString();
        //    }
        //}

        protected void btnviewmbstat_Click(object sender, EventArgs e)
        {
            PrintMemberStatement();           
        }

        protected void btnviewguarantorsrep_Click(object sender, EventArgs e)
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
            catch (Exception ex)
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
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();

                    {
                        WSConfig.ObjNav.FnLoanGurantorsReport(Session["username"].ToString(),
                        String.Format("LOAN GUARANTORS_{0}.pdf", filename), dt1Dt2);

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOAN GUARANTORS_{0}.pdf", filename, dt1Dt2)));

                    }
                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }

        }

        protected void btnviewloanguarantedrep_Click(object sender, EventArgs e)
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
            catch (Exception ex)
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
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();

                    {
                        WSConfig.ObjNav.FnLoanGuranteed(Session["username"].ToString(),
                        String.Format("LOANS GUARANTEED_{0}.pdf", filename), dt1Dt2);

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOANS GUARANTEED_{0}.pdf", filename, dt1Dt2)));

                    }
                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
        }

        protected void btnviewdepostat_Click(object sender, EventArgs e)
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
                var filename = Session["username"].ToString().Replace(@"/", @"");
                string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();
                try
                {
                    WSConfig.ObjNav.FnDepositsStatement(Session["username"].ToString(),
                        String.Format("DEPOSITS STATEMENT_{0}.pdf", filename), dt1Dt2);

                    pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("DEPOSITS STATEMENT_{0}.pdf", filename, dt1Dt2)));


                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
        }

        protected void btnviewloanstat_Click(object sender, EventArgs e)
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
                    string dt1Dt2 = txtSelStartD.Value.Trim() + ".." + txtSelEndD.Value.Trim();
                    {
                        WSConfig.ObjNav.FnloanStatmt(Session["username"].ToString(),
                       String.Format("LOAN STATEMENT_{0}.pdf", filename), dt1Dt2);

                        pdfReport.Attributes.Add("src", ResolveUrl("~/Downloads/" + String.Format("LOAN STATEMENT_{0}.pdf", filename, dt1Dt2)));


                    }
                }
                catch (Exception exception)
                {
                    exception.Data.Clear();
                }
            }
        }

        protected void btnviewfosastat_Click(object sender, EventArgs e)
        {
            PrintFosaStatement();
        }
    }
}