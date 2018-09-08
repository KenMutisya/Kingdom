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
    public partial class FeedbackJoint : System.Web.UI.Page
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
            Session["usernameJointBosa"] = WSConfig.ObjNav.FnJointusername(Session["usernameJ"].ToString());

            if (!IsPostBack)
            {
                //viewfeedback();
                Loadfeedback();
            }

        }

        protected void btnsendback_Click(object sender, EventArgs e)
        {
            // sendFeedBack();
            string memberno = Session["usernameJ"].ToString();
            string messagetext = txtfeedback.Text.Trim();

            try
            {
                var credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"]);
                Portals sup = new Portals();
                sup.Credentials = credentials;
                sup.PreAuthenticate = true;
                if (sup.FnFeedback(memberno, messagetext) == true)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "myFunction();", true);
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "text", "alert('Feedback send succcessfully')", true);
                    Loadfeedback();
                }

            }
            catch (Exception ex)
            {
                //lblError.Text = ex.Message;               
                SACCOFactory.ShowAlert(ex.Message);
                return;
            }
        }


        protected void Viewfeedback()
        {
            var chkfeedback = nav.Feedback.Where(n => n.Member_No == Session["usernameJ"].ToString()).ToList();
            //GridViewFeedback.AutoGenerateColumns = false;
            //GridViewFeedback.DataSource = chkfeedback;
            //GridViewFeedback.DataBind();
        }

        protected void bntviewfeed_Click(object sender, EventArgs e)
        {
            //viewfeedback();
            Loadfeedback();
        }
        protected void Loadfeedback()
        {
            var finalList = new List<feed>();
            foreach (var item in Feedbackstring())
            {
                string[] feedbackArray = item.Split(new string[] { ":::" }, StringSplitOptions.None);
                finalList.Add(new feed { Date = feedbackArray[0], Sender = feedbackArray[1], Message = feedbackArray[2] });
            }
            gvMinistatement.DataSource = finalList;
            gvMinistatement.AutoGenerateColumns = true;
            gvMinistatement.DataBind();
        }

        public List<string> Feedbackstring()
        {
            var feedbacklist = new List<string>();
            try
            {
                string response = WSConfig.ObjNav.FnGetResponseJoint(Session["usernameJ"].ToString(), Session["idnoJ"].ToString());
                string[] feedbackArray = response.Split(new string[] { "::::" }, StringSplitOptions.RemoveEmptyEntries);
                feedbacklist = feedbackArray.ToList();

            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return feedbacklist;
        }

        class feed
        {
            public string Sender { get; set; }
            public string Message { get; set; }
            public string Date { get; set; }

        }
    }
}