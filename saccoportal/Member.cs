using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Web;
using SACCOPortal.NavOData;
using SACCOPortal;

public class Member
{
    public static string No { get; set; }
    public static string Name { get; set; }
    public static string PersonalNumber { get; set; }
    public static string Accountcategory { get; set; }
    public static string Idnumber { get; set; }
    public static string MobileNo { get; set; }
    public static string BankAccount { get; set; }
    public static string Email { get; set; }
    public static string Password { get; set; }
    public static string Share { get; set; }
    public static Decimal Share_d { get; set; }
    public static string currentshare { get; set; }
    public static Decimal currentshare_d { get; set; }
    public static string currentsavings { get; set; }
    public static string Benevolent { get; set; }
    public static string Dividend { get; set; }
    public static string Oustandandingbal { get; set; }
    public static Decimal Oustandandingbal_d { get; set; }
    public static string FOSAbal { get; set; }
    public static string FOSAloan { get; set; }
    public static decimal FOSAloan_d { get; set; }
    public static string interest { get; set; }
    public static string FosaACNO { get; set; }
    public static string TotalRepayments { get; set; }
    public static string GroupACNO { get; set; }
    public int NoOfLoansGuaranteed { get; set; }
    public static string currentshares12 { get; set; }
    public static string currentshares13 { get; set; }
    public static string currentshares15 { get; set; }
    public static string currentshares14 { get; set; }
    public static string currentshares16 { get; set; }
    public static string currentshares17 { get; set; }
    public static Decimal totaldeposits12 { get; set; }
    public static Decimal totaldeposits13 { get; set; }
    public static Decimal totaldeposits14 { get; set; }
    public static Decimal totaldeposits15 { get; set; }
    public static Decimal totaldeposits16 { get; set; }
    public static Decimal totaldeposits17 { get; set; }
    public static string Monthlycontribution { get; set; }
    public static string fosabbal { get; set; }
    public static string CurrrentLoan { get;  set; }
    public static string totalloansoutstanding { get;  set; }
    public static decimal totalLoans ;

    public NAV nav = new NAV(new Uri(ConfigurationManager.AppSettings["ODATA_URI"]))
    {
        Credentials =
                new NetworkCredential(ConfigurationManager.AppSettings["W_USER"],
                    ConfigurationManager.AppSettings["W_PWD"], ConfigurationManager.AppSettings["DOMAIN"])
    };

    public Member(string user)
    {
        string year12 = Convert.ToString(2012).ToString();
        string year13 = Convert.ToString(2013).ToString();
        string year14 = Convert.ToString(2014).ToString();
        string year15 = Convert.ToString(2015).ToString();
        string year16 = Convert.ToString(2016).ToString();
        string year17 = Convert.ToString(2017).ToString();

        var fosaloan = nav.LoansR.Where(r=>r.BOSA_No == user);
        foreach (var fsbal in fosaloan) {
          FOSAloan = Convert.ToDecimal(fsbal.Loan_Amount).ToString("n");
            if (FOSAloan.StartsWith("-"))
            {
                FOSAloan_d = (-1* Convert.ToDecimal(fsbal.Loan_Amount));
            }
        }
         totalLoans = FOSAloan_d + Oustandandingbal_d;

        var objMembers = nav.MemberList.Where(r => r.No == user);
        foreach (var objMember in objMembers)
        {
            No = objMember.No;
            Name = objMember.Name;
            PersonalNumber = objMember.Personal_No;
            Accountcategory = objMember.Account_Category;
            Idnumber = objMember.ID_No;
            MobileNo = objMember.Mobile_Phone_No;
            BankAccount = objMember.Bank_Account_No;         
            FosaACNO = objMember.FOSA_Account_No;
            CurrrentLoan = Convert.ToDecimal(objMember.Current_Loan).ToString("N");
            Email = objMember.E_Mail;
            Password = objMember.Password;
            Share = Convert.ToDecimal(objMember.Shares_Retained).ToString("N");
            if (Share.StartsWith("-"))
            {
                Share = (-1*Convert.ToDecimal(objMember.Shares_Retained)).ToString("N2");
                Share_d = (-1 * Convert.ToDecimal(objMember.Shares_Retained));
            }
            currentshare = (-1 * Convert.ToDecimal(objMember.Current_Shares)).ToString("N");
            if (currentshare.StartsWith("-"))
            {
                currentshare = (-1 * Convert.ToDecimal(objMember.Current_Shares)).ToString("N");
            }
            currentshare_d =  Convert.ToDecimal(objMember.Current_Shares);
            currentsavings = Convert.ToDecimal(objMember.Current_Savings).ToString("N2");
            if (currentsavings.StartsWith("-"))
            {
                currentsavings = (-1*Convert.ToDecimal(objMember.Current_Savings)).ToString("N2");
            }
            // Monthlycontribution = Convert.ToDecimal(objMember.Monthly_Contribution).ToString("N");
            FOSAbal = (-1 * Convert.ToDecimal(objMember.FOSA_Account_Bal)).ToString("N");

            Oustandandingbal = Convert.ToDecimal(objMember.Outstanding_Balance).ToString("N");
            Oustandandingbal_d = Convert.ToDecimal(objMember.Outstanding_Balance);
            interest = Convert.ToDecimal(objMember.Outstanding_Interest).ToString("n");
            if (interest.StartsWith("-"))
            {
                interest = (-1*Convert.ToDecimal(objMember.Outstanding_Interest)).ToString("n");
            }
            totalloansoutstanding = Convert.ToDecimal(objMember.Total_Loans_Outstanding).ToString("N");
            if (totalloansoutstanding.StartsWith("-"))
            {
                totalloansoutstanding = (-1 * Convert.ToDecimal(objMember.Total_Loans_Outstanding)).ToString("N");
            }

            currentshares12 = (WSConfig.ObjNav.FnCurrentShareGraph(user, year12)).ToString();
            currentshares13 = (WSConfig.ObjNav.FnCurrentShareGraph(user, year13)).ToString();
            currentshares14 = (WSConfig.ObjNav.FnCurrentShareGraph(user, year14)).ToString();
            currentshares15 = (WSConfig.ObjNav.FnCurrentShareGraph(user, year15)).ToString();
            currentshares16 = (WSConfig.ObjNav.FnCurrentShareGraph(user, year16)).ToString();
            currentshares17 = (WSConfig.ObjNav.FnCurrentShareGraph(user, year17)).ToString();
     
            totaldeposits12 = (Convert.ToDecimal(WSConfig.ObjNav.FnTotalDepositsGraph(user, year12)));
            totaldeposits13 = (Convert.ToDecimal(WSConfig.ObjNav.FnTotalDepositsGraph(user, year13)));
            totaldeposits14 = (Convert.ToDecimal(WSConfig.ObjNav.FnTotalDepositsGraph(user, year14)));
            totaldeposits15 = (Convert.ToDecimal(WSConfig.ObjNav.FnTotalDepositsGraph(user, year15)));
            totaldeposits16 = (Convert.ToDecimal(WSConfig.ObjNav.FnTotalDepositsGraph(user, year16)));
            totaldeposits17 = (Convert.ToDecimal(WSConfig.ObjNav.FnTotalDepositsGraph(user, year17)));
        }

    }
  
}
