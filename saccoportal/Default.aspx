<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Defaults.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SACCOPortal._Default" %>
<%@ Register Assembly="GoogleReCaptcha" Namespace="GoogleReCaptcha" TagPrefix="cc1" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 <div class="container-fluid">
 <div class="row row-eq-height">					                    
            
<div class="col-md-4"></div>
<div class="col-md-4">
    <div class="home-form-container">

	<div class="section">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-4">
                <img class="img img-circle login-img" style="background-color:#fff;" src="siteimages/kingdomlogo.ico" />
            </div>
            <div class="col-md-4"></div>
        </div>
		<div class="mobile-form-toggle">
			<br>
    		<div class="field-error" id="Div1">
                <div class="row">
                <div class="col-md-12"> 
                        <asp:Label ID="lblError" runat="server" ForeColor="#FBF409" CssClass="text-left hidden"></asp:Label>  
                            <span class="text-center text-danger"><small><%=lblError.Text %></small></span>                                                        
                        <h2 class="text-center text-primary" style="font-weight:bold;">User Login </h2>                                
                    </div>                                          
                </div>
    		</div>
	   </div>
        <br />
       <div class="row">
            <div class="col-md-6">
              <div class="form-horizontal">
                <div class="form-group">
                    <asp:Label runat="server"  CssClass="col-md-4 control-label">Login As:</asp:Label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="ddlUserType" runat="server"  class="selectpicker form-control" data-live-search-style="begins"
                                    data-live-search="true" AppendDataBoundItems="true" OnSelectedIndexChanged ="ddlUserType_SelectedIndexChanged"  AutoPostBack="True">
                                <asp:ListItem Selected="True">..Select Account Type..</asp:ListItem>
                                <asp:ListItem>Individual</asp:ListItem>
                                <asp:ListItem>Joint/Corporate</asp:ListItem>
                            </asp:DropDownList>
                    </div> 
                </div>
              </div>
              <br/>
            </div>
             <div class="col-md-6">
                 <span class="pull-right"><asp:LinkButton runat="server" ID="lnkBtnSign" OnClick="lnkBtnSign_Click" CausesValidation="False">Create an Account</asp:LinkButton></span>
             </div>
          </div>

                     
      <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="individualLogin" runat="server">
                    <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i> Member No:</span>
                    <asp:TextBox ID="txtStaffNo" runat="server" CssClass="form-control" placeholder="Member number"></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key"></i> Password:</span>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    
                    <label class="checkbox">
                        <input type="checkbox" value="remember-me"> First Login?
                        <span class="pull-Right"> <asp:LinkButton ID="forgotPass" runat="server" OnClick="btnPassword_Click">Reset Password?</asp:LinkButton></span>
                    </label>
                    &nbsp;&nbsp;&nbsp;<br />
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

                     <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnLogin_Click"/>&nbsp;&nbsp;
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i> Member  No:</span>
                    <asp:TextBox ID="txtEmployeeNo" runat="server" CssClass="form-control" placeholder="Enter Member Number" ></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-id-card"></i> National ID:</span>
                        <asp:TextBox ID="idNo" runat="server" CssClass="form-control" placeholder="Enter ID Number" ></asp:TextBox>
                    </div>
                </asp:View>

                <asp:View ID="jointLogin" runat="server">
                    <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-user"></i> Member No:</span>
                    <asp:TextBox ID="TextMemberno" runat="server" CssClass="form-control" placeholder="Member number"></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key"></i> ID No:</span>
                        <asp:TextBox ID="TextID" runat="server" CssClass="form-control" placeholder="Enter ID number" ></asp:TextBox>
                    </div>
                    <br />
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key"></i> Password:</span>
                        <asp:TextBox ID="TextPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                    </div>
                    <br />
                    
                    <label class="checkbox">
                        <input type="checkbox" value="remember-me"> First Login?
                        <span class="pull-Right"> <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnPassword_Click">Reset Password?</asp:LinkButton></span>
                    </label>
                    &nbsp;&nbsp;&nbsp;<br />
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

                     <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnLogin_Click"/>&nbsp;&nbsp;
                        </div>
                    </div>

                </asp:View>

            </asp:MultiView>
           
       
        <div class="row">
            <div class="col-md-12">
                <%--<asp:Button ID="btnSignup" runat="server" Text="Signup" CssClass="btn btn-info btn-lg btn-block" OnClick="btnSignup_Click"/>--%>
                <asp:Button ID="btnBack" runat="server" Text="Back to Login" CssClass="btn btn-primary btn-lg btn-block" OnClick="btnBack_Click"/>
                <span class="pull-Right"> <asp:LinkButton ID="notregistered" runat="server" OnClick ="notregistered_Click" >New User Sign Up</asp:LinkButton></span>
            </div>
        </div>

	</div>

</div>

</div>
     <div class="col-md-4"></div>
                                                       
</div>

</div>
  
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="mymodal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                            <h4 class="modal-title">Loan Payment Schedule</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div id="calculations" runat="server">
                     
                                </div>
                   
                            </div>
                                                  
                                <%--<asp:Button ID="btnBOSATransfer" CssClass="btn btn-primary" runat="server" Text="Transfer" OnClick="btnBOSATransfer_click" />--%>
                                             
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
