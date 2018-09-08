using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SACCOPortal.NavOData;
using SACCOPortal.NAVWS;
using Microsoft.VisualBasic;
using SACCOPortal;


namespace FundiLimo
{
    public partial class LoanCalculator : System.Web.UI.Page
    {
        //Double minimumAmount = 0, maximumAmount = 0, intrestRate = 0, myInstallments = 0, myLoanAmount=0;
        //String repaymentMethod = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            ValidateSession();
            //try
            //{
            //    if (!(Boolean)Session["changedPassword"])
            //    {
            //        Response.Redirect("~/Default");
            //    }
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("~/Dashboard");
            //}
            //try
            //{
            //    if (!(Boolean)Session["updatedProfile"])
            //    {
            //        Response.Redirect("~/Default");
            //    }
            //}
            //catch (Exception)
            //{
            //    Response.Redirect("~/Dashboard");
            //}
            if (!IsPostBack)
            {
                //this.loanProduct.Items.Clear();
                //NAV nav = new Config().ReturnNav();
                //var loans = nav.LoansProductSetUp;
                //loanProduct.DataSource = loans;
                //loanProduct.DataTextField = "Product_Description";
                //loanProduct.DataValueField = "Code";
                //loanProduct.DataBind();
                //loanProduct.SelectedIndex = 1;
                //ChangeInstallment(loanProduct.SelectedValue);
                //UpdateDetails(loanProduct.SelectedValue);
            }

        }

        protected void loanProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            //ChangeInstallment(loanProduct.SelectedValue);
            //UpdateDetails(loanProduct.SelectedValue);
        }

        public void ChangeInstallment(String mycode)
        {
            NAV nav = new Config().ReturnNav();
            //var maxPeriod = nav.LoansProductSetUp.Where(r=>r.Code==mycode);
            //this.installments.Items.Clear();
            //foreach (var period in maxPeriod)
            //{
            //    var seq = Enumerable.Range(1, Convert.ToInt32(period.No_of_Installment)).Reverse();
            //    installments.DataSource=seq;
            //    installments.DataBind();
            //}
          
        }

        //public void UpdateDetails(String loan)
        //{
        //    NAV nav = new Config().ReturnNav();
        //    var loanDetails = nav.LoansProductSetUp.Where(r => r.Code == loan);
        //    foreach (var loandetail in loanDetails)
        //    {
        //        String loanLimit = String.Format("{0:n}", Convert.ToDouble(loandetail.Max_Loan_Amount));
        //        details.InnerHtml = "<tr><td>Loan Product</td><td>" + loandetail.Product_Description + "</td></tr>" +
        //                            "<tr><td>Intrest Rate</td><td>" + loandetail.Interest_rate + "</td></tr>" +
        //                            "<tr><td>Minimum Loan 11 Amount</td><td>" + loandetail.Min_Loan_Amount + "</td></tr>" +
        //                            "<tr><td>Maximum Installments</td><td>" + loandetail.No_of_Installment + "</td></tr>" +
        //                            "<tr><td>Maximum Loan Amount</td><td>" + loanLimit + "</td></tr>" +
        //                            "<tr><td>Repayment Method</td><td>" + loandetail.Repayment_Method + "</td></tr>" +
        //                            "<tr><td>Repayment Frequency</td><td>" + loandetail.Repayment_Frequency + "</td></tr>" +
        //                            "<tr><td>Source</td><td>" + loandetail.Source + "</td></tr>" +
        //                            "<tr><td>Recovery Mode</td><td>" + loandetail.Recovery_Mode + "</td></tr>";
        //                           // "<tr><td>Max Shares Cap</td><td>" + loandetail.Max_Share_Cap+"</td></tr>" +
        //                           // "<tr><td>Bank Commission %</td><td>" + loandetail.Bank_Comm+"</td></tr>" ;
        //    }
        //}

        //protected void Unnamed2_Click(object sender, EventArgs e)
        //{
        //    String myLoanProduct = loanProduct.SelectedValue;
        //    NAV nav = new Config().ReturnNav();
        //    var loanDetails = nav.LoansProductSetUp.Where(r => r.Code == myLoanProduct);
        //    foreach (var loandetail in loanDetails)
        //    {
        //       minimumAmount=Convert.ToDouble(loandetail.Min_Loan_Amount);
        //       maximumAmount = Convert.ToDouble(loandetail.Max_Loan_Amount);

        //       intrestRate = Convert.ToDouble(loandetail.Interest_rate);//interest rate

        //       repaymentMethod = loandetail.Repayment_Method;
        //    }
        //    myInstallments = Convert.ToDouble(installments.SelectedValue);//period or time

        //    myLoanAmount = Convert.ToDouble(loanAmount.Text.Trim()); //loan amount/principle

        //    lblError.InnerHtml = "";
        //    calculations.InnerHtml = "";
        //    if (minimumAmount < 1 && maximumAmount<1 )//no validation required
        //    {
        //        Calculate(repaymentMethod, myLoanAmount, intrestRate,  myInstallments);
        //    }else if (myLoanAmount < minimumAmount)
        //    {
        //        lblError.InnerHtml = "<div class='alert alert-danger'>The amount you entered is less than the minimum Amount<button class='close' data-dismiss='alert' type='button'>&times;</button></div>";
        //    }
        //    else if (myLoanAmount > maximumAmount)
        //    {
        //        lblError.InnerHtml = "<div class='alert alert-danger'>The amount you entered is more than the maximum Amount<button class='close' data-dismiss='alert' type='button'>&times;</button></div>";
        //    }
        //    else
        //    {
        //        Calculate(repaymentMethod, myLoanAmount, intrestRate,  myInstallments);
        //    }
            
        //}

 

        //public void Calculate(String newRepaymentMethod, Double newLoanAmount, Double newIntrestRate,  Double newInstallments)
        //{
        //    int count = 1;
        //    Double pmt = 0;
        //    DateTime date = DateTime.Now;
        //    date = date.AddMonths(1);
        //    Double interest = myLoanAmount * intrestRate*1/200* myInstallments; /*newIntrestRate / 200;*/
        //    Double intrest2 = 0;
        //    Double totalIntrest = 0;
        //    Double loanRepayment = 0, loanBalance=0;

        //    String html = " <table class='table table-responsive table-striped table-bordered table-condensed'><tr><th>Period</th><th>Month-Year</th><th>Principle</th><th>Loan Repayment</th><th>Intrest</th><th>Total deduction</th><th>Loan Balance</th></tr>";
        //   if (newRepaymentMethod != "Amortised")
        //   {
              
        //      //  pmt = Financial.Pmt(interest, newInstallments, -newLoanAmount, 0, DueDate.EndOfPeriod);
              
        //        for (int p = 0; p < newInstallments; p++)
        //        {
        //            intrest2 = 300;
        //            totalIntrest += intrest2;
        //            loanRepayment = 3000;// pmt - (interest * newLoanAmount);
        //             loanBalance = newLoanAmount - loanRepayment;
                   
        //            if (loanBalance < 1)
        //            {
        //                loanBalance = 0;
        //            }
        //            html += "<tr><td>" + count++ + "</td><td>" +
        //                    String.Format("{0}-{1}", new DateTimeFormatInfo().GetAbbreviatedMonthName(date.Month),
        //                        date.Year) +
        //                    "</td><td>"+ String.Format("{0:n}", newLoanAmount) +"</td><td>" + String.Format("{0:n}", loanRepayment) + "</td><td>" + String.Format("{0:n}", intrest2) + "</td><td>"+ String.Format("{0:n}", (loanRepayment+ (interest * newLoanAmount))) +"</td><td>" + String.Format("{0:n}", loanBalance) + "</td></tr>";
        //            date = date.AddMonths(1);
        //            newLoanAmount -= loanRepayment;

        //        }
        //    }
        //    else
        //    {
        //        pmt = newLoanAmount / newInstallments;
        //        intrest2 = pmt * interest;
        //        totalIntrest += intrest2;
        //      for (int p=0;p<newInstallments;p++)
        //        {
        //            intrest2 = pmt * interest;
        //            totalIntrest += intrest2;
        //            loanRepayment = pmt + intrest2;
        //            loanBalance = newLoanAmount - pmt;
                    
        //            if (loanBalance < 1)
        //            {
        //                loanBalance = 0;
        //            }

        //            html += "<tr><td>" + count++ + "</td><td>" +
        //                    String.Format("{0}-{1}", new DateTimeFormatInfo().GetAbbreviatedMonthName(date.Month),
        //                        date.Year) +
        //                    "</td><td>" + String.Format("{0:n}", newLoanAmount) + "</td><td>" + String.Format("{0:n}", loanRepayment) +"</td><td>"+ String.Format("{0:n}", (interest * newLoanAmount)) + "</td><td>" + String.Format("{0:n}", (loanRepayment + (interest * newLoanAmount))) + "</td><td>" + String.Format("{0:n}", loanBalance) +"</td></tr>";
              
                   
        //           date= date.AddMonths(1);
        //            newLoanAmount -= pmt;

        //        }

        //    }

        //    html = html + "</table>";
        //    //calculations.InnerHtml = html;

        //}
        public void ValidateSession()
        {
            //try
            //{
            //    //check that the user is logged in
            //    String memberNo = Convert.ToString(Session["memberNo"]);
            //    String memberName = Convert.ToString(Session["memberName"]);
            //    if (memberName == "" || memberName == null)
            //    {
            //        Response.Redirect("/Default");
            //    }
            //    if (memberNo == "" || memberNo == null)
            //    {
            //        Response.Redirect("/Default");
            //    }

            //    //check that maximum idle time not exceeded
            //    //update session time  
            //}
            //catch (Exception e)
            //{
            //    Response.Redirect("/Default");
            //}
            try
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("~/Default");

                }
            }
            catch (Exception )
            {
                Response.Redirect("~/Default");
            }




           
        }
    }
}