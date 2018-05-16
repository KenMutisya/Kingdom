<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.Master" CodeBehind="Loans.aspx.cs" Inherits="SACCOPortal.Loans" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
    <div class="row">
        <div class="col-md-8">
         <div class="panel panel-default">
                <div class="panel-heading text-danger"><i class="fa fa-user"></i> Loans List</div>
                <div class="panel-body">
                     <asp:GridView ID="gvLoans" runat="server" CssClass="table table-condensed" OnSelectedIndexChanged="gvLoans_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Loan_No" HeaderText="Loan No" />
            <asp:BoundField DataField="Application_Date" HeaderText="Application Date" DataFormatString="{0:dd/MM/yy}" />
            <asp:BoundField DataField="Approved_Amount" HeaderText="Approved Amount" DataFormatString="{0:N}" />
            <asp:BoundField DataField="Interest" HeaderText="Interest" />
            <asp:BoundField DataField="Approval_Status" HeaderText="Status" />
            <asp:BoundField DataField="Loan_Product_Type_Name" HeaderText="Loan Type" />
            <asp:BoundField DataField="Totals_Loan_Outstanding" HeaderText="Balance" DataFormatString="{0:N}" />
        </Columns>
                         <SelectedRowStyle BackColor="#3366CC" ForeColor="White" />
    </asp:GridView>
                </div>
            </div>
        </div>
        <p></p>
        <div class="col-md-4">
            <div class="panel panel-default">
                <div class="panel-heading text-danger"><i class="fa fa-user"></i>  Loan Statistics</div>
                <div class="panel-body">
                     <asp:GridView ID="GridView1" runat="server" CssClass="table table-condensed">
        <Columns>
            <asp:BoundField DataField="Loan_No" HeaderText="Loan No" />
         </Columns>
    </asp:GridView>
        </div>
    </div>
            </div>
        </div>
   
</asp:Content>
