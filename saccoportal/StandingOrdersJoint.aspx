<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StandingOrdersJoint.aspx.cs" MasterPageFile="~/JointMaster.Master" Inherits="SACCOPortal.StandingOrdersJoint" %>

<asp:Content ID="StandingOrdersContent" ContentPlaceHolderID="MainContent" runat="server">
     <div id="lblFOSAfundsTransfer" class="alert tab-bg-info fade in">
        <h3  style="font-weight:bold; color:#fff; text-align:center;">Create and View Standing Orders</h3>
    </div>
     <!--tab nav start-->
    <section class="panel">
        <header class="panel-heading tab-bg-info">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a data-toggle="tab" href="#newStos">New Standing Order</a>
                </li>
                <li >
                    <a data-toggle="tab" href="#currentStos">Open Standing Orders</a>
                </li>
                
                <li>
                    <a data-toggle="tab" href="#approvedStos">Approved STOs</a>
                </li>
            </ul>
        </header>
        <div class="panel-body">
            <div class="tab-content">                
                <div id="newStos" class="tab-pane active">
                    <div class="field-error" id="Div1">
                            <div class="row">
                                <div class="col-md-12"> 
                                    <asp:Label ID="lblError" runat="server" ForeColor="#fc0a0a" CssClass="text-left hidden"></asp:Label>  
                                        <span class="text-center text-danger"><small><%=lblError.Text %></small></span> 
                                </div>                                          
                            </div>
                        </div>
                    <h3>Apply for an STO</h3>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="control-label label">STO NO: </label>
                            <asp:TextBox runat="server" ID="lblSTONo" Enabled="False"></asp:TextBox>
                        </div>
                        <br />
                        <div class="form-group">
                           
                            <label class="control-label label">Source Account No: </label> 
                            <asp:DropDownList ID="ddlSourceAcc" runat="server" AutoPostBack="true" CssClass="form-control" AppendDataBoundItems="true" 
                                Enabled="True" OnSelectedIndexChanged="ddlSourceAcc_SelectedIndexChanged">
                                    <%--<asp:ListItem >-Select Account -</asp:ListItem>--%>
                            </asp:DropDownList>  
                           <%-- <asp:TextBox ID="txtsource" runat="server" CssClass="form-control" placeholder="Enter the account number" Visible="false"></asp:TextBox>                           
                                <asp:TextBox ID="txtsrcAcc" runat="server"  CssClass="form-control" Visible="False" Enabled="false"></asp:TextBox>--%>
                        </div>
                        <br />
                    
                    <div class="form-group">
                        <label class="control-label label">Frequency: </label>
                            <asp:DropDownList ID="ddlFrequency" runat="server" AutoPostBack="true" CssClass="form-control">
                                <asp:ListItem Value="">--Select Frequency--</asp:ListItem>
                                <asp:ListItem Value="1D">Daily</asp:ListItem>
                                <asp:ListItem Value="1W">Weekly</asp:ListItem>
                                <asp:ListItem Value="1M">Monthly</asp:ListItem>
                            </asp:DropDownList> 
                    </div>                                             
                   
                        <br />
                             
                    <div class="form-group">
                        <label class="control-label label">Destination Account Type:</label>
                                                   
                            <asp:DropDownList ID="ddlDestAccTy" runat="server" AutoPostBack="true" CssClass="form-control" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlDestAccTy_SelectedIndexChanged">
                                <asp:ListItem Value="">--Select Destination Account Type--</asp:ListItem>
                                <asp:ListItem Value="1D">Inter Savings</asp:ListItem>
                                <asp:ListItem Value="1W">BOSA</asp:ListItem>
                                <asp:ListItem Value="1M">Other Account</asp:ListItem>                                    
                            </asp:DropDownList>                           
                    </div>
                        <br />
                        
                    <div id="destaccIntersavings" runat="server" class="form-group" Visible="False">
                        <label class="control-label label">Destination Account No:</label>                                                   
                            <asp:DropDownList ID="ddlDestAccName" runat="server" AutoPostBack="true" CssClass="form-control" 
                                AppendDataBoundItems="true" Enabled="True" OnSelectedIndexChanged="ddlDestAccName_SelectedIndexChanged">                                    
                            </asp:DropDownList>   
                        <asp:TextBox ID="txtdest" runat="server"  CssClass="form-control" Visible="False" Enabled="false"></asp:TextBox>                          
                    </div>

                    <div id="dvOtherAccs" runat="server" Visible="False">
                        <div class="form-group">
                            <label class="control-label label" for="tags">Destination Account No:</label>
                                <asp:TextBox ID="txtDestAccOther" runat="server" CssClass="form-control" Enabled="True" placeholder="Enter Bosa Account Number"></asp:TextBox>
                            </div>
                        <br />                          
                    </div>

                     <div id="dvBosa" runat="server" Visible="False">                             
                              <div class="form-group">
                                <label class="control-label label">Loan No:</label>                                                   
                                    <asp:DropDownList ID="ddlLoanNo" runat="server" AutoPostBack="true" CssClass="form-control" AppendDataBoundItems="true" 
                                       Enabled="True" OnSelectedIndexChanged="ddlLoanNo_SelectedIndexChanged">                                    
                                    </asp:DropDownList>                                    
                            </div>
                         </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                        <label class="control-label label" for="tags">Amount</label>
                            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="Enter Amount" MaxLength="7" onkeypress="return allowOnlyNumber(event);" ></asp:TextBox>
                        </div>
                        <br />

                        <div class="form-group">
                            <label class="control-label label">Standing Order Description</label>
                            <asp:TextBox ID="txtstoDescrp" runat="server" CssClass="form-control" placeholder="Enter Standing order description" ></asp:TextBox>
                         </div>
                        <br />
                        
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label" for="tags">Start Date</label>
                                </div>                                
                                <div class="input-group date">
                                    <%--<label class="control-label" for="tags">Start Date</label> --%>                                   
                                    <input type="text" id="txtstrtDate" runat="server" class="form-control" placeholder="Select Start Date"/><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div>                                                            
                            </div>  
                        </div>
                        <br />
                         <div class="form-group">
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label" for="tags">End Date</label>
                                </div>                                    
                                <div class="input-group date">
                                        <%--<label class="control-label" for="tags">Start Date</label> --%>                                   
                                        <input type="text" id="txtendate" runat="server" class="form-control" placeholder="Select End Date"/><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                </div> 
                            </div>  
                        </div>
                        <br />

                    </div>
                    <asp:Button ID="stadingOrderbtn" runat="server" Text="SUBMIT" CssClass="btn btn-primary" OnClick="stadingOrderbtn_Click" Visible="false" />
                    <asp:Button ID="btnstandingOrderBosa" runat="server" Text="SUBMIT" CssClass="btn btn-primary" OnClick="btnstandingOrderBosa_Click" Visible="false"/>
                    <asp:Button ID="btnstandingOrderOther" runat="server" Text="SUBMIT" CssClass="btn btn-primary" OnClick="btnstandingOrderOther_Click" Visible="false"/>
                    <asp:Button ID="btnupdtstndOd" runat="server" Text="UPDATE" CssClass="btn btn-primary" OnClick="btnupdtstndOd_OnClick" />
                </div>

                <div id="currentStos" class="tab-pane">
                 
                   
                    <asp:GridView ID="grdViewStandingOrders" runat="server" CssClass="table table-striped table-advance table-hover" GridLines="None" 
                        OnSelectedIndexChanged="grdViewStandingOrders_OnSelectedIndexChanged" AutoGenerateSelectButton="True" DataKeyNames="No">
                        <Columns>
                            <asp:BoundField DataField="No" HeaderText="STO No." />
                            <asp:BoundField DataField="Source_Account_No" HeaderText="Source Account No." />
                            <%-- <asp:BoundField DataField="Account_Name" HeaderText="Source Account Name" />--%>
                            <asp:BoundField DataField="Destination_Account_Type" HeaderText="Destination Acc. Type" />
                            <asp:BoundField DataField="Destination_Account_No" HeaderText="Destination Acc No." />
                            <%-- <asp:BoundField DataField="Destination_Account_Name" HeaderText="Destination Acc Name." />--%>
                            <asp:BoundField DataField="Effective_Start_Date" HeaderText="Effective Start Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="End_Date" HeaderText="End Date" DataFormatString="{0:dd/MM/yyyy}" />                           
                            <asp:BoundField DataField="Standing_Order_Description" HeaderText="Description" />
                            <asp:BoundField DataField="Frequency" HeaderText="Frequecy" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                            <asp:TemplateField HeaderText="Cancel">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkCancel" Text="Cancel" CommandArgument='<%# Eval("No")%>' CommandName="lnkCancel" runat="server" OnClick="lnkCancel_OnClick"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>
                    </asp:GridView> 
                </div>
                
                <div id="approvedStos" class="tab-pane">
                    <asp:GridView ID="gridapproavedSTOs" runat="server" CssClass="table table-striped table-advance table-hover" >
                        <Columns>
                            <asp:BoundField DataField="No" HeaderText="STO No." />
                            <asp:BoundField DataField="Source_Account_No" HeaderText="Source Account No." />
                            <%-- <asp:BoundField DataField="Account_Name" HeaderText="Source Account Name" />--%>
                            <%--<asp:BoundField DataField="Destination_Account_Type" HeaderText="Destination Acc. Type" />--%>
                            <asp:BoundField DataField="Destination_Account_No" HeaderText="Destination Acc No." />
                            <%-- <asp:BoundField DataField="Destination_Account_Name" HeaderText="Destination Acc Name." />--%>
                            <asp:BoundField DataField="Effective_Start_Date" HeaderText="Effective Start Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="End_Date" HeaderText="End Date" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="Standing_Order_Description" HeaderText="Description" />
                            <asp:BoundField DataField="Frequency" HeaderText="Frequecy" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView> 
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
    <script type="text/javascript">
        function ShownBosaDIV() {
            var bosaAcc = document.getElementById("dvBosa");
            bosaAcc.style.display = "block";
        }

        function HideBosaDIV() {
            var bosaAcc = document.getElementById("dvBosa");
            bosaAcc.style.display = "none";
        }

        function ShownDestaccDIV() {
            var bosaAcc = document.getElementById("destaccIntersavings");
            bosaAcc.style.display = "block";
        }

        function ShownDestaccOtherDIV() {
            var bosaAcc = document.getElementById("dvOtherAccs");
            bosaAcc.style.display = "block";
        }

        function HideDestaccOtherDIV() {
            var bosaAcc = document.getElementById("dvOtherAccs");
            bosaAcc.style.display = "block";
        }

        function HideDestaccDIV() {
            var bosaAcc = document.getElementById("destaccIntersavings");
            bosaAcc.style.display = "block";
        }
   </script>
    <script type="text/javascript">
        function myFunction() {
        var txt;
        var r = confirm("Standing Order Created successfully!");
        if (r == true) {
            window.location.href = "StandingOrdersJoint.aspx";
        } else {
            txt = "Cancelled!";
            }
        }
    </script>
    <script type="text/javascript">
        function deleteSto() {
        var txt;
        var r = confirm("Standing Order Cancelled successfully.");
        if (r == true) {
            window.location.href = "StandingOrdersJoint.aspx";
        } else {
            txt = "Cancelled!";
            }
        }
    </script>
    </asp:Content>
