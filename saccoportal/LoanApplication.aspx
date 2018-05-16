<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoanApplication.aspx.cs" Inherits="SACCOPortal.LoanApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-4">
        
         <table class="table table-bordered table-striped table-condensed">
             <tr><td>Loan No:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Staff No:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Member:</td><td><% =Member.No %></td></tr>
             <tr><td>Account No:</td><td><asp:DropDownList runat="server" CssClass="form-control" ID="accounts" /></td></tr>
             <tr><td>Client Name:</td><td><% =Member.Name %></td></tr>
             <tr><td>ID NO:</td><td><% =Member.Idnumber %></td></tr>
             <tr><td>Member Deposits:</td><td></td></tr>
             <tr><td>Application Date:</td><td> <asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Loan Product Type:</td><td><asp:DropDownList runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Installments:</td><td><asp:DropDownList runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Interest:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Product Currency Code:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Ammount Applied:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Recommended Amount:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Approved Amount:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Remarks</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
         </table>

    </div>
    <div class="col-lg-4">
               <table class="table table-bordered table-striped table-condensed">
             <tr><td>Repayment Method:</td><td><asp:DropDownList runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Repayment:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Loan status:</td><td><asp:DropDownList runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Approval Status:</td><td><asp:DropDownList runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Repayment Frequency:</td><td><asp:DropDownList runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Mode of Disbursement:</td><td><asp:DropDownList runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Loan Disbursement Date:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Cheque No:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Repayment Start Date:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Expected Date of Completion:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>partially Bridged:</td><td><asp:CheckBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Total TopUp Commission:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td>Rejection Remark:</td><td><asp:TextBox runat="server" CssClass="form-control" /></td></tr>
             <tr><td><asp:Button runat="server" Text="Reset" CssClass="btn btn-warning" /></td><td><asp:Button runat="server" Text="apply" CssClass="btn btn-primary"/></td></tr>
         </table>
    </div>
    <div class="panel panel-primary col-lg-4">
        <div class="panel-heading">
            Member FactBox
        </div>
        <div class="panel-body">
            <table class="table table-bordered table-striped table-condensed">
                <tr><td>Member No:</td><td><% =Member.No %></td></tr>
                <tr><td>Name:</td><td><% =Member.Name %></td></tr>
                <tr><td>Payroll/Staff No:</td><td></td></tr>
                <tr><td>ID No:</td><td><% =Member.Idnumber %></td></tr>
                <tr><td>Passport No:</td><td></td></tr>
                <tr><td>Mobile Phone No:</td><td><% =Member.MobileNo %></td></tr>
                <tr><td>Shares Retained:</td><td></td></tr>
                <tr><td>Current Shares:</td><td></td></tr>
                <tr><td>Un-allocated Funds:</td><td></td></tr>
                <tr><td>Benevolent Fund:</td><td></td></tr>
                <tr><td>Dividend Amount:</td><td></td></tr>
                <tr><td>Outstanding Balance:</td><td></td></tr>
                <tr><td>Outstanding Interest:</td><td></td></tr>
                <tr><td>FOSA Account Bal:</td><td></td></tr>
            </table>
        </div>

    </div>
</asp:Content>
