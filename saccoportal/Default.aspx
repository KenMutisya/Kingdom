<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Defaults.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SACCOPortal._Default" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 
 <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="siteimages/kingdomlogo.ico" />
            <p id="profile-name" class="profile-name-card"></p>
            <div class="mobile-form-toggle">
			<br>
    		<div class="field-error" id="Div1">
                <div class="row">
                <div class="col-md-12"> 
                        <asp:Label ID="lblError" runat="server" ForeColor="#FBF409" CssClass="text-left hidden"></asp:Label>  
                            <span class="text-center text-danger"><small><%=lblError.Text %></small></span> 
                        <h2 class="text-center text-primary" style="font-weight:bold;"><i class="glyphicon glyphicon-lock"></i> User Login </h2>                                
                    </div>                                          
                </div>
    		</div>
	   </div> 
                <asp:Menu ID="LoginMenu" Orientation="Horizontal"  StaticMenuItemStyle-CssClass="tab" StaticSelectedStyle-CssClass="selectedtab" CssClass="tabs" runat="server" OnMenuItemClick="LoginMenu_MenuItemClick">
                    <Items>
                        <asp:MenuItem Text="Individual Member |" Value="0" Selected="true" runat="server"/>
                        <asp:MenuItem Text="Joint/Corporate" Value="1" runat="server"/>                 
                    </Items>
                </asp:Menu> 
                
                <asp:MultiView ID="MultiViewLoadLogins" runat="server"> 

                <asp:View ID="individualLogin" runat="server">
                    <div class="form-horizontal">
                        <div class="col-md-1"></div>
                        <br/>
                    <div class="input-group">
                        <label style="color:#bd202f;font-family:'Trebuchet MS'">Individual Login Panel</label>
                    </div>
                        <br/>
                    <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <asp:TextBox ID="txtStaffNo" runat="server" CssClass="form-control" placeholder="Member number"></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key"></i></span>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            <span class="pull-left"> <asp:LinkButton ID="forgotPass" runat="server" CausesValidation="false" OnClick="btnPassword_Click">Reset Password?</asp:LinkButton></span>
                         </div>
                        <div class="col-md-6">
                            <span class="pull-right"><asp:LinkButton runat="server" ID="lnkbtnCreateAcc" OnClick="lnkbtnCreateAcc_Click" CausesValidation="False">New Member</asp:LinkButton></span>
                        </div>
                    </div>
                    <br />
                    <div style="transform:scale(0.95); width: 100% !important; -webkit-transform:scale(0.95);transform-origin:0 0;-webkit-transform-origin:0 0;">
                    <cc1:CaptchaControl ID="cptCaptcha" runat="server" 
                        CaptchaBackgroundNoise="Low" CaptchaLength="5" 
                        CaptchaHeight="60" CaptchaWidth="250" 
                        CaptchaLineNoise="None" CaptchaMinTimeout="5" 
                        CaptchaMaxTimeout="240" FontColor = "#529E00" />
                    </div>
                    <br />
                    <div class="input-group">
                         <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" placeholder="Enter the above Text"></asp:TextBox>
                       <br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required!" ControlToValidate = "txtCaptcha" ForeColor="red"></asp:RequiredFieldValidator>
                    </div>
                   <%-- <div class="input-group" style="transform:scale(0.90); width: 100% !important; -webkit-transform:scale(0.90);transform-origin:0 0;-webkit-transform-origin:0 0;">                       
                       <cc1:GoogleReCaptcha ID="ctrlGoogleReCaptcha" runat="server" PublicKey="6LdK7j4UAAAAAJaWiKryMXWxVcwuDAyjEb_Kr204" PrivateKey="6LdK7j4UAAAAAC1ovoMUpMxXODnYYsWaebjMbbf0" />  
                    </div>--%>

                     <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" Visible="true" OnClick="btnLogin_Click"/>&nbsp;&nbsp;
                            <asp:Button ID="btnFirstLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" Visible="false" OnClick="btnFirstLogin_Click"/>
                        </div>
                    </div>
                    </div>                   
                </asp:View>               

                <asp:View ID="jointLogin" runat="server">
                    <div class="form-horizontal">
                        <div class="col-md-1"></div>
                        <br/>
                    <div class="input-group">
                       <label style="color:#bd202f; font-family:'Trebuchet MS'">Joint Login Panel</label>
                    </div>
                        <br/>                 
                    <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <asp:TextBox ID="TextAccountno" runat="server" CssClass="form-control" placeholder="Account number"></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-id-badge"></i></span>
                        <asp:TextBox ID="TextID" runat="server" CssClass="form-control" placeholder="ID number" ></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key"></i></span>
                        <asp:TextBox ID="TextPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />

                    <div class="row">
                        <div class="col-md-6">
                            <span class="pull-left"> <asp:LinkButton ID="LnkbtnPassJoint" runat="server" OnClick="LnkbtnPassJoint_Click">Reset Password?</asp:LinkButton></span>
                         </div>
                        <div class="col-md-6">
                            <%--<span class="pull-right"><asp:LinkButton runat="server" ID="LinkButton3" CausesValidation="False">Create an Account</asp:LinkButton></span>--%>
                        </div>
                    </div>
                    
                    <%--<label class="checkbox">
                        <input type="checkbox" value="remember-me"> First Login?
                        <span class="pull-Right"> <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnPassword_Click">Reset Password?</asp:LinkButton></span>
                    </label>&nbsp;&nbsp;&nbsp;<br />--%>

                    <%--<div style="transform:scale(0.95); width: 100% !important; -webkit-transform:scale(0.95);transform-origin:0 0;-webkit-transform-origin:0 0;">
                    <cc1:CaptchaControl ID="cptCaptcha" runat="server" 
                        CaptchaBackgroundNoise="Low" CaptchaLength="5" 
                        CaptchaHeight="60" CaptchaWidth="250" 
                        CaptchaLineNoise="None" CaptchaMinTimeout="5" 
                        CaptchaMaxTimeout="240" FontColor = "#529E00" />
                    </div>--%>
                    <br />
                    <%--<div class="input-group">
                         <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control" placeholder="Enter the above Text"></asp:TextBox>
                       <br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required!" ControlToValidate = "txtCaptcha" ForeColor="yellow"></asp:RequiredFieldValidator>
                    </div>
                    <div class="input-group" style="transform:scale(0.90); width: 100% !important; -webkit-transform:scale(0.90);transform-origin:0 0;-webkit-transform-origin:0 0;">                       
                       <cc1:GoogleReCaptcha ID="ctrlGoogleReCaptcha" runat="server" PublicKey="6LdK7j4UAAAAAJaWiKryMXWxVcwuDAyjEb_Kr204" PrivateKey="6LdK7j4UAAAAAC1ovoMUpMxXODnYYsWaebjMbbf0" />  
                    </div>--%>

                        
                    <div style="transform:scale(0.95); width: 100% !important; -webkit-transform:scale(0.95);transform-origin:0 0;-webkit-transform-origin:0 0;">
                    <cc1:CaptchaControl ID="CaptchaControl1" runat="server" 
                        CaptchaBackgroundNoise="Low" CaptchaLength="5" 
                        CaptchaHeight="60" CaptchaWidth="250" 
                        CaptchaLineNoise="None" CaptchaMinTimeout="5" 
                        CaptchaMaxTimeout="240" FontColor = "#529E00" />
                    </div>
                    <br />
                    <div class="input-group">
                         <asp:TextBox ID="txtCatchaJ" runat="server" CssClass="form-control" placeholder="Enter the above Text"></asp:TextBox>
                       <br />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required!" ControlToValidate = "txtCaptcha" ForeColor="yellow"></asp:RequiredFieldValidator>
                    </div>
                   <%-- <div class="input-group" style="transform:scale(0.90); width: 100% !important; -webkit-transform:scale(0.90);transform-origin:0 0;-webkit-transform-origin:0 0;">                       
                       <cc1:GoogleReCaptcha ID="ctrlGoogleReCaptcha" runat="server" PublicKey="6LdK7j4UAAAAAJaWiKryMXWxVcwuDAyjEb_Kr204" PrivateKey="6LdK7j4UAAAAAC1ovoMUpMxXODnYYsWaebjMbbf0" />  
                    </div>--%>

                     <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnJlogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" Visible="true" OnClick="btnJlogin_Click"/>&nbsp;&nbsp;
                             <asp:Button ID="btnFirstJlogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" Visible="false" OnClick="btnFirstJlogin_Click" />&nbsp;&nbsp;
                        </div>
                    </div>
                </div>
                </asp:View>

                <asp:View runat="server" ID="LoginTabs">
                    <asp:Label ID="InfoLbl" runat="server"><h3 style="text-align:left; font-family:'Trebuchet MS';color:#bd202f;">Please select login tab</h3></asp:Label>
                </asp:View>

                <asp:View ID="View2" runat="server">
                    <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                    <asp:TextBox ID="txtEmployeeNo" runat="server" CssClass="form-control" placeholder=" Member Number" ></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-id-badge"></i></span>
                        <asp:TextBox ID="idNo" runat="server" CssClass="form-control" placeholder="ID Number" ></asp:TextBox>                   
                    </div>
                    <br /> 
                     <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnSubmit" runat="server" Text="Reset Password" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnSubmit_Click"/>&nbsp; 
                            <asp:Button ID="btnBack" runat="server" Text="Back to Login" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnBack_Click"/>
                        </div>
                    </div>                 
                </asp:View>

               <asp:View ID="JointResetView" runat="server">
                        <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <asp:TextBox ID="txtAccountno" runat="server" CssClass="form-control" placeholder="Account Number" ></asp:TextBox>
                        </div>
                        <br />
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-id-badge"></i></span>
                            <asp:TextBox ID="txtidNo" runat="server" CssClass="form-control" placeholder="ID Number" ></asp:TextBox>                   
                        </div>
                        <br /> 
                         <div class="row">
                            <div class="col-md-12">
                                <asp:Button ID="btnResetJpass" runat="server" Text="Reset  Password" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnResetJpass_Click" />&nbsp; 
                                <asp:Button ID="btnbackJointL" runat="server" Text="Back to Login" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnbackJointL_Click" />
                            </div>
                        </div>                 
                    </asp:View>    
                
                <%--<asp:View ID="registrationtype" runat="server">
                    <asp:Label ID="registrationInfo" runat="server"><h3 style="text-align:center; font-size:16px ;font-family:'Trebuchet MS';color:#bd202f;">Click "New Member" to create a new account
                        or "Internet Banking" to register for Internet Banking</h3></asp:Label>
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Button ID="btnNmember" runat="server" Text="New Member" CssClass="btn btn-primary btn-sm btn-block " OnClick="btnNmember_Click"/>&nbsp;&nbsp;
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btnIbank" runat="server" Text="Internet Banking" CssClass="btn btn-primary btn-sm btn-block" OnClick="btnIbank_Click"/>&nbsp;&nbsp;
                        </div>
                    </div> 
                </asp:View>&nbsp;--%>

            </asp:MultiView>
              
        </div><!-- /card-container -->
    </div>
</asp:Content>
