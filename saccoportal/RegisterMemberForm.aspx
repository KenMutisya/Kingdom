<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterMemberForm.aspx.cs" Inherits="SACCOPortal.RegisterMemberForm" MasterPageFile="~/Registration.Master" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="panel-body" style="margin-top:50px;" >
        <div class="row">
            <div id="lblFOSAfundsTransfer" class="alert tab-bg-info fade in">
                <h3  style="font-weight:bold; color:#fff; text-align:center;">MEMBER REGISTRATION FORM</h3>
            </div>
            <asp:Label ID="lblError" runat="server" ForeColor="#FF3300" CssClass="text-left hidden"></asp:Label>
            <span class="text-center text-danger"><small><%=lblError.Text %></small></span>
        </div>
        <div id="wizard">
            <!-- Tabstrip -->
         <ul class="nav nav-tabs" role="tablist">
             <li role="presentation" class="active">
                 <a href="#personalDetails" role="tab" data-toggle="tab">Personal Details</a>
             </li>             
             <li role="presentation">
                 <a href="#accountDetails" role="tab" data-toggle="tab">Account Details</a>
             </li>
             <li role="presentation">
                 <a href="#nextOfKinDetails" role="tab" data-toggle="tab">Next of Kin</a>
             </li>
             
             <%--<li>
                 <div class="input-group pull-right">                       
                       <cc1:GoogleReCaptcha ID="ctrlGoogleReCaptcha" runat="server" PublicKey="6LepKTMUAAAAAKYxLEnF__jw9uTLPtrnmSDtycuA" PrivateKey="6LepKTMUAAAAAF51X3qs6-0Tc8sLri9etwfSgopA" />  
                    </div>
             </li>--%>
             <li class="pull-right">
                <%--<asp:Button ID="regMbrBack" runat="server" Text="<<< back" CssClass="btn btn-warning btn-lg" Onclick="regMbrBack_Click"/>--%>           
                <asp:Button ID="btnReg" runat="server" Text="Register" CssClass="btn btn-success btn-lg"/>           
             </li>
          </ul>
        </div>

        <!-- Tab panes -->
         <div class="tab-content">
             <div role="tabpanel" class="tab-pane active" id="personalDetails">
                 <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i> Full Name:</span>
                                        <asp:TextBox ID="txtFullnames" runat="server" CssClass="form-control" ></asp:TextBox>
                                 </div>
                                    <br />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i> Phone No:</span>
                                        <asp:TextBox ID="txtINo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i> Email Address:</span>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <br />
             </div>

             <div role="tabpanel" class="tab-pane" id="accountDetails">
                  <span>Select your Account Category</span><br />
                                        <%--<label for="rdbtn1">
                                            <input type="radio" id="rdbtn1" runat="server" name="chkDetails" onclick="ShowHideDivBOSA()" checked="checked"/>
                                            Individual Deposists (BOSA)
                                        </label>
                                        <br />
                                        <br />
                                        <label for="rdbtn2">
                                            <input type="radio" id="rdbtn2" runat="server" name="chkDetails" onclick="ShowHideDivFOSA()" checked="false" />
                                            KSA Individual (FOSA)
                                        </label>
                                        <hr />
                                        <div id="dvAllWhatiKnow" style="display: none">
                                            <textarea rows="5" cols="50" id="txtAreaBOSA" readonly>This is a long term savings accounts where deposists are accumulated through monthly savings that are refundable upon account closure. The savings can be used as collateral for credit services offered by the sacco. The registration fee for this account is Ksh 550.</textarea>
                                            <%--<input type="text" id="txtBOSA" value="Ndumia ni ya mavali"/>--%>
                                        </div>
                                        <div id="dvAllWhatiThought" style="display: none">
                                            <textarea rows="5" cols="50" id="txtAreaFOSA" readonly>This is a transactional account for individual members where salary or business income can be managed from. Funds can be accessed viaMobile Banking, ATM and Cheque Books. Loans can also be advanced based on activity of this account. This account has a minimum balance of Ksh 100.</textarea>
                                            <%--<input type="text" id="txtBOSA" value="Ndumia ni ya mavali"/>--%>
                                        </div>
                                        <br />--%>
             </div>


         </div>

    </div>


</asp:Content>

