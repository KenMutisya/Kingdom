<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="Site.Master" CodeBehind="Loans.aspx.cs" Inherits="SACCOPortal.Loans" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p></p>
     <div class="row">
     <asp:MultiView ID="LoansMultiView" runat="server">
       
          <asp:View ID="loansView" runat="server">
   
                <div class="col-md-10">
                         <div class="panel panel-default">
                                <div class="panel-heading text-danger"><i class="fa fa-user"></i> Pending Loans</div>
                                <div class="panel-body">
                    <asp:GridView ID="gvLoans" runat="server" CssClass="table table-condensed" OnSelectedIndexChanged="gvLoans_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Loan_No" HeaderText="Loan No" />
                            <asp:BoundField DataField="Application_Date" HeaderText="Application Date" DataFormatString="{0:dd/MM/yy}" />          
                            <asp:BoundField DataField="Requested_Amount" HeaderText="Requested Amount" DataFormatString="{0:N}" />
                            <asp:BoundField DataField="Approved_Amount" HeaderText="Approved Amount" DataFormatString="{0:N}" />
                            <asp:BoundField DataField="Interest" HeaderText="Interest" />
                            <asp:BoundField DataField="Loan_Status" HeaderText="Status" />
                            <asp:BoundField DataField="Loan_Product_Type_Name" HeaderText="Loan Type" />
                            <asp:BoundField DataField="Outstanding_Balance" HeaderText="Balance" DataFormatString="{0:N}" />
                        </Columns>
                                         <SelectedRowStyle BackColor="#3366CC" ForeColor="White" />
                    </asp:GridView>
                                </div>
                            </div>
                </div>
    

            <div class="col-md-10">
             <div class="panel panel-default">
                    <div class="panel-heading text-danger"><i class="fa fa-user"></i> Running Loans</div>
                    <div class="panel-body">
                         <asp:GridView ID="gvLoansIssued" runat="server" CssClass="table table-condensed" OnSelectedIndexChanged="gvLoansIssued_SelectedIndexChanged" >
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="Loan_No" HeaderText="Loan No" />
                                <asp:BoundField DataField="Application_Date" HeaderText="Application Date" DataFormatString="{0:dd/MM/yy}" />          
                                <asp:BoundField DataField="Requested_Amount" HeaderText="Requested Amount" DataFormatString="{0:N}" />
                                <asp:BoundField DataField="Approved_Amount" HeaderText="Approved Amount" DataFormatString="{0:N}" />
                                <asp:BoundField DataField="Interest" HeaderText="Interest" />
                                <asp:BoundField DataField="Loan_Status" HeaderText="Status" />
                                <asp:BoundField DataField="Loan_Product_Type_Name" HeaderText="Loan Type" />
                                <asp:BoundField DataField="Outstanding_Balance" HeaderText="Balance" DataFormatString="{0:N}" />
                            </Columns>
                             <%--<SelectedRowStyle BackColor="#3366CC" ForeColor="White" />--%>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </asp:View>

        <asp:View ID="gureentedLoans"  runat="server">
             <div class="col-md-10">
                         <div class="panel panel-default">
                                <div class="panel-heading text-danger"><i class="fa fa-user"></i> My Loan Guarantors</div>
                                <div class="panel-body">               
                    <asp:Label ID="txtF" runat="server">Loan No:  </asp:Label><asp:Label ID="lblLoanNo" runat="server"></asp:Label>

                        <asp:GridView ID="GridViewMyguaranteedloans" runat="server" CssClass="table table-striped table-advance table-hover" 
                            GridLines="None" AutoGenerateSelectButton="False" EmptyDataText="No guaranteed loans found!" >
                        <Columns>
                            <asp:BoundField DataField="Loan_No" HeaderText="Loan Number"/>
                            <asp:BoundField DataField="Requested_Amount" HeaderText="Loan Amount" />
                            <asp:BoundField DataField="Name" HeaderText="Member Name" />
                            <asp:BoundField DataField="Loan_Product_Type_Name" HeaderText="Loan Product Name" />
                            <asp:BoundField DataField="LoanPurpose" HeaderText="Loan Purpose" />
                            <asp:BoundField DataField="Acceptance_Status" HeaderText="Acceptance Status" />
                            <asp:BoundField DataField="Loan_Application_Date" HeaderText="Loan Application Date" DataFormatString="{0:dd/MM/yyyy}" />
                        </Columns>
                    </asp:GridView>

                                    <asp:Button ID="btnOkay" Text="OK" runat="server" CssClass="btn btn-primary btn-sm" OnClick="btnOkay_Click" />
                    </div>
                </div>
            </div>
            </asp:View> 
         </asp:MultiView> 
        </div> 
     
</asp:Content>
