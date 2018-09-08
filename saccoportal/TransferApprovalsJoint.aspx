<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/JointMaster.Master" CodeBehind="TransferApprovalsJoint.aspx.cs" Inherits="SACCOPortal.TransferApprovalsJoint" %>

<asp:Content ID="JointTransferApprovals" ContentPlaceHolderID="MainContent" runat="server">
    <div id="lblLoanApplicationsr" class="alert tab-bg-info fade in">
        <h3  style="font-weight:bold; color:#fff; text-align:center;">VIEW APPROVAL REQUESTS</h3>
    </div>
    <section class="panel">
    <div class="panel panel-primary"> 

        <header class="panel-heading tab-bg-info">
        <asp:Menu ID="signatoryApprovals" Orientation="Horizontal"  StaticMenuItemStyle-CssClass="tab" StaticSelectedStyle-CssClass="selectedtab" CssClass="tabs" runat="server" OnMenuItemClick="signatoryApprovals_OnMenuItemClick">
            <Items>
                <asp:MenuItem Text="My Approval Requests" Value="0" Selected="true" runat="server"/>
            </Items>
        </asp:Menu>
        </header>

            <div class="panel-body">
                <div class="tab-content">
                <div class="row">                    
                       <asp:Label ID="lblErrMsg" runat="server" CssClass="text-left hidden"></asp:Label> 
                       <span class="text-center form-control text-danger"><small><%=lblErrMsg.Text %></small></span> 
                   
                   </div>
                    <br/>
                    
                    <asp:MultiView ID="ApprovalMultiview" runat="server" ActiveViewIndex="0">
                     
                      <asp:View runat="server" ID="approvalsView">                                
                                <div class="row">
                                    <asp:GridView ID="gridMyRequests" runat="server" CssClass="table table-striped table-advance table-hover" 
                                        GridLines="None" AutoGenerateSelectButton="False" EmptyDataText="No approval requests found!" DataKeyNames="Transaction_No">
                                    <Columns>
                                        <asp:BoundField DataField="Transaction_No" HeaderText="Transaction Number"/>
                                        <asp:TemplateField  HeaderText="Source Account">
                                                <ItemTemplate>
                                                    <div><%#Eval("Source_Account")%>-<%#Eval("Source_Account_Type")%></div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:TemplateField  HeaderText="Destination Account">
                                                <ItemTemplate>
                                                    <div><%#Eval("Destination_Account")%>-<%#Eval("Destination_Account_Name")%></div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                         <%--<asp:BoundField DataField="Destination_Account" HeaderText="Destination Account" />--%>
                                        <%--<asp:BoundField DataField="<%# DataBinder.Eval(Container.DataItem, "FirstName")%>+ ' ' + <%# DataBinder.Eval(Container.DataItem, "LastName")%>" HeaderText="Status" SortExpression="info"/>--%>
                                        <asp:BoundField DataField="Transaction_Amount" HeaderText="Transaction Amount" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" />
                                        <asp:BoundField DataField="Transaction_Date" HeaderText="Transaction Date"  DataFormatString="{0:dd/MM/yyyy}"/> 
                                        
                                        <asp:TemplateField HeaderText="Approve">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkAccept" Text="Approve" CommandArgument='<%# Eval("Transaction_No")%>' CommandName="lnkAccept" runat="server" OnClick="lnkAccept_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Decline">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDecline" Text="Decline" CommandArgument='<%# Eval("Transaction_No")%>' CommandName="lnkDecline" runat="server" OnClick="lnkDecline_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField> 
                                    </Columns>
                                </asp:GridView>
                                </div>
                           </asp:View>
                        <%--<asp:View ID="gureentedLoans" runat="server">
                            <div class="row">
                                    <asp:GridView ID="GridViewMyguaranteedloans" runat="server" CssClass="table table-striped table-advance table-hover" 
                                        GridLines="None" AutoGenerateSelectButton="False" EmptyDataText="No guaranteed loans found!" >
                                    <Columns>
                                        <asp:BoundField DataField="Loan_No" HeaderText="Loan Number"/>
                                        <asp:BoundField DataField="Amont_Guaranteed" HeaderText="Amount Guaranteed" />
                                        <asp:BoundField DataField="Name" HeaderText="Member Name" />
                                        <asp:BoundField DataField="Acceptance_Status" HeaderText="Acceptance Status" />
                                        <asp:BoundField DataField="Loan_Application_Date" HeaderText="Loan Application Date" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>
                                </asp:GridView>
                                </div>
                        </asp:View>--%> 
                     </asp:MultiView>
                     </div>
                
                    </div>
              </div>
       
     </section>
        <script>
            function allowOnlyNumber(evt) {
                var charCode = (evt.which) ? evt.which : event.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            }
        </script>
    
</asp:Content>