<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MemberReg.Master" CodeBehind="MemberRegistration.aspx.cs" Inherits="SACCOPortal.MemberRegistration" %>
<%@ Register Assembly="GoogleReCaptcha" Namespace="GoogleReCaptcha" TagPrefix="cc1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
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
             <%--<li role="presentation">
                 <a href="#contactDetails" role="tab" data-toggle="tab">Contact/Address Details</a>
             </li>--%>
             <li role="presentation">
                 <a href="#accountDetails" role="tab" data-toggle="tab">Account Details</a>
             </li>
             <li role="presentation">
                 <a href="#nextOfKinDetails" role="tab" data-toggle="tab">Next of Kin</a>
             </li>
             
             <li>
                 <div class="input-group pull-right">                       
                       <cc1:GoogleReCaptcha ID="ctrlGoogleReCaptcha" runat="server" PublicKey="6LepKTMUAAAAAKYxLEnF__jw9uTLPtrnmSDtycuA" PrivateKey="6LepKTMUAAAAAF51X3qs6-0Tc8sLri9etwfSgopA" />  
                    </div>
             </li>
             <li class="pull-right">
                <%--<asp:Button ID="regMbrBack" runat="server" Text="<<< back" CssClass="btn btn-warning btn-lg" Onclick="regMbrBack_Click"/>--%>           
                <asp:Button ID="btnReg" runat="server" Text="Register" CssClass="btn btn-success btn-lg" OnClick="btnReg_Click" />           
             </li>
          </ul>
 
         <!-- Tab panes -->
         <div class="tab-content">
             <div role="tabpanel" class="tab-pane active" id="personalDetails">
                <!-- Input fields -->
              <div class="form-group">
                  <br />
                  <br />
                  <br />
                <asp:Label ID="Label4" runat="server" CssClass="col-md-3 control-label">ID/Passport Number:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control" required="True" TextMode="Number" onkeypress="return this.value.length<=15"/>              
                </div> 
                </div>
             
             <div class="form-group">
                <asp:Label ID="Label6" runat="server" CssClass="col-md-3 control-label">Mobile Number:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="TextBox3" CssClass="form-control" required="True" TextMode="Number" onkeypress="return this.value.length<=20"/>              
            <%--   <asp:Button ID="Button1" runat="server" Text="Test Number" CssClass="btn btn-warning btn-sm" OnClick="Button1_Click"/>--%>
                </div> 
                </div> 
             <div class="form-group">
                <asp:Label ID="Label5" runat="server" CssClass="col-md-3 control-label">Email Address:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" required="True" TextMode="Email" />              
                </div> 
                </div>
            </div>
             <%--<div role="tabpanel" class="tab-pane" id="contactDetails">
                <!-- Input fields -->
                 <div class="form-horizontal">
                <div class="form-group">
                <asp:Label ID="Label11" runat="server" CssClass="col-md-3 control-label">Mobile Number:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtPhoneNo" CssClass="form-control" required="True" TextMode="Number" onkeypress="return this.value.length<=20"/>              
               <asp:Button ID="Button1" runat="server" Text="Test Number" CssClass="btn btn-warning btn-sm" OnClick="Button1_Click"/>
                </div> 
                </div> 
          
                <div class="form-group">
                <asp:Label ID="Label12" runat="server" CssClass="col-md-3 control-label">Email:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" required="True" TextMode="Email" />              
                </div> 
                </div>
                
                <div class="form-group">
                <asp:Label ID="Label7" runat="server"  CssClass="col-md-3 control-label">Residence:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtResidence" CssClass="form-control" style="text-transform:uppercase" />              
                </div> 
                </div>
          
                <div class="form-group">
                <asp:Label ID="Label8" runat="server"  CssClass="col-md-3 control-label">P.O Box:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" style="text-transform:uppercase" TextMode="Number" onkeypress="return this.value.length<=15" />              
                </div> 
                </div>           
           
          
                <div class="form-group">
                <asp:Label ID="Label9" runat="server" CssClass="col-md-3 control-label">Postal Code:</asp:Label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlPostal" runat="server" CssClass="form-control" AutoPostBack="True" ViewStateMode="Enabled" DropDownStyle ="DropDownList" OnSelectedIndexChanged="ddlPostal_SelectedIndexChanged"></asp:DropDownList>              
                </div> 
                </div> 

                <div class="form-group">
                <asp:Label ID="Label10" runat="server" CssClass="col-md-3 control-label">Town:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtTown" CssClass="form-control" required="True" style="text-transform:uppercase" AutoPostBack="true" ReadOnly="true"/>              
                </div> 
                </div>
                </div>
             </div>--%>
             <div role="tabpanel" class="tab-pane" id="accountDetails">
                <!-- Input fields -->
                <div class="form-horizontal">
                <div class="form-group">             
                <asp:Label ID="Label1" runat="server"  CssClass="col-md-3 control-label">Account Category:</asp:Label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlACcat" runat="server" CssClass="form-control" AutoPostBack="true">
                        <asp:ListItem>Individual Deposits (BOSA)</asp:ListItem>
                        <asp:ListItem>KSA Individual (FOSA)</asp:ListItem>
                    </asp:DropDownList>              
                </div> 
                </div> 

               <%-- <div class="form-group">
                <asp:Label ID="Label2" runat="server"  CssClass="col-md-3 control-label">Application Category:</asp:Label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlAPPCat" runat="server" CssClass="form-control" AutoPostBack="true">
                        <asp:ListItem>New Application</asp:ListItem>
                        <asp:ListItem>Rejoining</asp:ListItem>
                        <asp:ListItem>Transfer</asp:ListItem>
                    </asp:DropDownList>              
                </div> 
                </div> --%>

               <%-- <div class="form-group">
                <asp:Label ID="Label3" runat="server" CssClass="col-md-3 control-label">Customer Group:</asp:Label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlCustGrp" runat="server" CssClass="form-control" AutoPostBack="true">
                        <asp:ListItem>Member</asp:ListItem>
                        <asp:ListItem>Employer</asp:ListItem>
                        <asp:ListItem>Staff</asp:ListItem>
                    </asp:DropDownList>              
                </div> 
                </div>--%>
                <%--<div class="form-group">
                <asp:Label ID="Label14" runat="server" CssClass="col-md-3 control-label">ID/Passport Number:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtIDNo" CssClass="form-control" required="True" TextMode="Number" onkeypress="return this.value.length<=15"/>              
                </div> 
                </div>--%>

                <%--<div class="form-group">
                <asp:Label ID="Label15" runat="server" CssClass="col-md-3 control-label">Bank Branch Code:</asp:Label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlBankCode" runat="server" CssClass="form-control" AutoPostBack="True" ViewStateMode="Enabled" DropDownStyle ="DropDownList" OnSelectedIndexChanged="ddlBankCode_SelectedIndexChanged"></asp:DropDownList>             
                </div> 
                </div>  --%>
          
                <%--<div class="form-group">
                <asp:Label ID="Label16" runat="server" CssClass="col-md-3 control-label">Bank Branch Name:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtBranchName" CssClass="form-control" required="True" style="text-transform:uppercase" AutoPostBack="true" ReadOnly="True" />              
                </div> 
                </div>--%>
          
                <%--<div class="form-group">
                <asp:Label ID="Label17" runat="server" CssClass="col-md-3 control-label">Bank A/C Number:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtACNo" CssClass="form-control" required="True" TextMode="Number"/>              
                </div> 
                </div>--%>
               <%-- <div class="form-group">
                <asp:Label ID="Label19" runat="server" CssClass="col-md-3 control-label">Employer Name:</asp:Label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlEmpName" runat="server" CssClass="form-control" AutoPostBack="true">
                 
                    </asp:DropDownList>              
                </div> 
                </div>--%>
             </div>
            </div>
             <div role="tabpanel" class="tab-pane" id="nextOfKinDetails">
                <!-- Input fields -->
                <div class="form-horizontal">
                <div class="form-group">
                <asp:Label ID="Label21" runat="server" AssociatedControlID="kinfullNames" CssClass="col-md-3 control-label">Full Names:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="kinfullNames" CssClass="form-control" style="text-transform:uppercase" />  
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="kinfullNames"
                        CssClass="text-danger" ErrorMessage="Full Names field is required." onkeypress="return this.value.length<=100" />             
                </div>
                </div>

                <div class="form-group">
                <asp:Label ID="Label22" runat="server" CssClass="col-md-3 control-label">Relationship:</asp:Label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlrlnshipTypes" runat="server" CssClass="form-control" AutoPostBack="true">
                        <asp:ListItem>Son</asp:ListItem>
                        <asp:ListItem>Daughter</asp:ListItem>
                    </asp:DropDownList>              
                </div> 
                </div>

                <div class="form-group">
                <asp:Label ID="Label23" runat="server" CssClass="col-md-3 control-label">ID/Passport Number:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtKinIDNO" CssClass="form-control" TextMode="Number" onkeypress="return this.value.length<=15"/>              
                </div> 
                </div>

                <div class="form-group">
                <asp:Label ID="Label24" runat="server" CssClass="col-md-3 control-label">Phone Contact:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtKinPhone" CssClass="form-control"  TextMode="Number" onkeypress="return this.value.length<=10"/>              
                </div> 
                </div>

                <div class="form-group">
                <asp:Label ID="Label25" runat="server" CssClass="col-md-3 control-label">Residence:</asp:Label>
                <div class="col-md-6">
                    <asp:TextBox runat="server" ID="txtKinAddress" CssClass="form-control" style="text-transform:uppercase" />              
                </div> 
                </div>
                </div>
                </div>
             </div>
         </div>
     </div>
        
</asp:Content>

