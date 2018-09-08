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
    public partial class TransferApprovalsJoint : System.Web.UI.Page
    {
        public NAV Nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
        {
            Credentials = new NetworkCredential(ConfigurationManager.AppSettings["W_USER"], ConfigurationManager.AppSettings["W_PWD"],
         ConfigurationManager.AppSettings["DOMAIN"])
        };
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usernameJ"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            if (!IsPostBack)
            {
                ApprovalMultiview.SetActiveView(approvalsView);
                LoadApprovalRequests();
                //ViewApprovalStatus();
            }
        }

        protected void lnkAccept_Click(object sender, EventArgs e)
        {
            string transno = (sender as LinkButton).CommandArgument;
            if (WSConfig.ObjNav.FnAcceptApprovalRequest(transno, Session["idnoJ"].ToString()) == true)
            {
                SACCOFactory.ShowAlert("You have Successfully Approved this transaction");
                LoadApprovalRequests();
            }
            else
            {
                SACCOFactory.ShowAlert("Approval Unsuccessfull");
            }

        }
        protected void LoadApprovalRequests()
        {
            var viewrequests = Nav.JointSignatoryApprovals.ToList().Where(n => n.ID_Number == Session["idnoJ"].ToString() && n.Status == "Pending");
            gridMyRequests.DataSource = viewrequests;
            gridMyRequests.AutoGenerateColumns = false;
            gridMyRequests.DataBind();

        }
        //protected void ViewApprovalStatus()
        //{
        //    var chkapproverequests = nav.JointSignatoryApprovals.Where(n => n.ID_Number == Session["idnoJ"].ToString()).ToList();
        //    GridViewMyguaranteedloans.AutoGenerateColumns = false;
        //    GridViewMyguaranteedloans.DataSource = chkapproverequests;
        //    GridViewMyguaranteedloans.DataBind();
        //}

        protected void lnkDecline_Click(object sender, EventArgs e)
        {
            string transno = (sender as LinkButton).CommandArgument;

            var chkstatus = Nav.JointSignatoryApprovals.ToList().Where(n => n.ID_Number == Session["idnoJ"].ToString()
            && n.Transaction_No == transno).Select(s => s.Status).SingleOrDefault();
            switch (chkstatus)
            {
                case "Approved":
                    SACCOFactory.ShowAlert("Sorry you have already Approved this request");
                    break;
                default:
                    if (WSConfig.ObjNav.FnDeclineApprovalRequest(transno, Session["idnoJ"].ToString()) == true)
                    {
                        SACCOFactory.ShowAlert("Approval Decline Completed Successfully");
                        LoadApprovalRequests();
                    }
                    else
                    {
                        SACCOFactory.ShowAlert("Approval Decline Unsuccessful");
                    }
                    break;

            }

        }
       

        protected void signatoryApprovals_OnMenuItemClick(object sender, MenuEventArgs e)
        {
            int index = Int32.Parse(e.Item.Value);
            ApprovalMultiview.ActiveViewIndex = index;
        }
    }
}