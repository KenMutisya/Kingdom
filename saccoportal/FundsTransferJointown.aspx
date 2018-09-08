<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/JointMaster.Master" CodeBehind="FundsTransferJointown.aspx.cs" Inherits="SACCOPortal.FundsTransferJointown" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="lblFOSAfundsTransfer" class="alert tab-bg-info fade in">
        <h3  style="font-weight:bold; color:#fff; text-align:center;">Funds Transfer to my accounts</h3>
    </div>    

        <section class="panel">
        <header class="panel-heading tab-bg-info">
            <ul class="nav nav-tabs">
                <li class="active">
                    <%--<a data-toggle="tab" href="#FundsTrans">Funds Transfers</a>--%>
                </li>
                </ul>
                </header>

            <div class="panel-body">
            <div class="tab-content">
                <div id="FundsTrans" class="tab-pane active">
                    <div class="col-md-6">
                        <br />
                        <div class="form-group">                           
                                <label class="control-label label" for="tags">Source Account: </label>
                            <%--<asp:Label runat="server" Text="Source Account"></asp:Label>--%>
                                <asp:DropDownList ID="ddFosAccounts" runat="server" CssClass="form-control" AutoPostBack="true" 
                                    AppendDataBoundItems="true" OnSelectedIndexChanged="ddFosAccounts_SelectedIndexChanged">
                                    </asp:DropDownList> 
                            </div>
                        <br />
                       
                        <div class="form-group">                           
                                <label class="control-label label" for="tags">Available Balance: </label>                            
                                 <asp:TextBox ID="txtAvailableBalance" runat="server" CssClass="money form-control" ReadOnly="True"></asp:TextBox>
                            </div>
                        <br />
                        <div class="form-group">                           
                                <label class="control-label label" for="tags">Transfer Amount: </label>                        
                                <asp:TextBox ID="txtTransferAmount" runat="server" CssClass="money form-control" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
                            </div>
                        <br />
                    </div>

                    <div class="col-md-6">
                        <br />
                        <div class="form-group">                           
                                <label class="control-label label" for="tags">Destination Account: </label>
                                    <asp:DropDownList ID="ddAccounts" runat="server" CssClass="form-control">
                                 </asp:DropDownList>
                            </div>
                        <div class="form-group">
                            <label class="control-label label">Description:</label>
                            <asp:TextBox ID="txtTransDescrp" runat="server" CssClass="form-control" placeholder="Enter Transfer description" ></asp:TextBox>
                         </div>
                        

                    <br />
                    <br />
                         <asp:Button runat="server" Text="Transfer" ID="btnTransfer" CssClass="btn btn-primary" OnClick="btnTransfer_OnClick" />  
                    <br />
                    </div>
                </div>
                </div>  
                </div>      

            <%--<asp:GridView ID="gvGuarantors" runat="server" CssClass="table table-condensed table-bordered" Width="100%"
                          EmptyDataText="No Guarantors Found!">
                <Columns>
                    <asp:BoundField DataField="Document_No" HeaderText="Transaction No" />
                    <asp:BoundField DataField="Source_Account" HeaderText="Source" />
                    <asp:BoundField DataField="Destination_Account" HeaderText="Destination" />
                    <asp:BoundField DataField="Transaction_Date" HeaderText="Transaction Date" DataFormatString="{0:d/M/y}" />
                    <asp:BoundField DataField="Transaction_Amount" HeaderText="Transaction Amount" />
                </Columns>
                <SelectedRowStyle BackColor="#259EFF" BorderColor="#FF9966" /> 
            </asp:GridView>--%>
        <%--</div>--%>
            </section>    
    <script>
        function allowOnlyNumber(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>
    <script type="text/javascript">
        function myFunction() {
        var txt;
        var r = confirm("Transfer was successful Check your Account statement to Confirm the transaction.");
        if (r == true) {
            window.location.href = "FundsTransferJointown.aspx";
        } else {
            txt = "Cancelled!";
            }
        }
    </script>
</asp:Content>
