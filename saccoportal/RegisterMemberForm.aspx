<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterMemberForm.aspx.cs" Inherits="SACCOPortal.RegisterMemberForm" MasterPageFile="~/MemberReg.Master" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <div class="panel-body" style="margin-top:50px;" >
        
    <div class="container-fluid"></div>
         <div class="col-md-2"></div>
             <div class="col-md-10">
                 <%--<div class="home-form-container" style="color:saddlebrown;">--%>
                     <div class="panel panel-default">                  
                     <div class="panel-heading">                       
                                <%--<div id="lblMbreg" class="alert tab-bg-info fade in">--%>
                                    <h3  style="font-weight:bold; color:#0094ff; text-align:left;">MEMBER REGISTRATION FORM</h3>
                               <%-- </div>--%>
                                <asp:Label ID="Label5" runat="server" ForeColor="#FF3300" CssClass="text-left hidden"></asp:Label>
                                <%--<span class="text-center text-danger"><small><%=lblError.Text %></small></span>--%>
                    </div>                  
                     <div class="panel-body panel-form" runat="server">
                     <asp:HiddenField ID="currTab" runat="server" />
                         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         <div id="vue-container">
                                 <!-- Tabstrip -->
                             <%--<div class="panel panel-steps">
                                 <div class="panel-body padding-0">
                                     ::before
                                     <div class="steps-container">
                                         <a href="/accounts/1950578/register-business/983720?step=1" class="steps active">
                                             <p class="step_title">Step 1</p> 
                                             <p class="info_title hidden-xs hidden-sm">Nature Of Business</p>
                                             ::after
                                         </a> 
                                         <a href="/accounts/1950578/register-business/983720?step=2" class="steps ">
                                             <p class="step_title">Step 2</p> 
                                             <p class="info_title hidden-xs hidden-sm">Registered Office Addresses</p>
                                              ::after
                                         </a> 
                                         <a href="/accounts/1950578/register-business/983720?step=4" class="steps ">
                                             <p class="step_title">Step 3</p> 
                                             <p class="info_title hidden-xs hidden-sm">Ownership Information</p>
                                              ::after
                                         </a> 
                                         <a disabled="disabled" href="javascript:;" class="steps ">
                                             <p class="step_title">Step 4</p>
                                              <p class="info_title hidden-xs hidden-sm">Application Documents</p>
                                              ::after
                                         </a>
                                     </div>
                                      ::after
                                 </div>
                             </div>--%>
                             <header class="panel-heading tab-bg-info">

                                  <ul class="nav nav-tabs" role="tablist">
                                     <li role="presentation" class="active">
                                         <a href="#personalDetails" role="tab" data-toggle="tab">Personal Details</a>
                                     </li>
                                     <li role="presentation" class="inactive">
                                         <a href="#VerifiedDetails" role="tab" data-toggle="tab">Verified Details</a>
                                     </li>
                                     <li role="presentation">
                                         <a href="#accountDetails" role="tab" data-toggle="tab">Account Details</a>
                                     </li>
                                     <li role="presentation">
                                         <a href="#nextOfKinDetails" role="tab" data-toggle="tab">Next of Kin</a>
                                     </li>
                                 <li role="presentation">
                                     <a href="#RefereDetails" role="tab" data-toggle="tab">Referee Details</a>
                                 </li>
                                  <li role="presentation">
                                     <a href="#ResidenceDetails" role="tab" data-toggle="tab">Residence Details</a>
                                 </li>
                                 <li role="presentation">
                                        <a href="#Preview" role="tab" data-toggle="tab">Preview</a>
                                 </li>
             
                                     <%--<li>
                                         <div class="input-group pull-right">                       
                                               <cc1:GoogleReCaptcha ID="ctrlGoogleReCaptcha" runat="server" PublicKey="6LepKTMUAAAAAKYxLEnF__jw9uTLPtrnmSDtycuA" PrivateKey="6LepKTMUAAAAAF51X3qs6-0Tc8sLri9etwfSgopA" />  
                                            </div>
                                     </li>--%>
                                    <%-- <li class="pull-right">
                                        <asp:Button ID="regMbrBack" runat="server" Text="<<< back" CssClass="btn btn-warning btn-lg" Onclick="regMbrBack_Click"/>           
                                           <asp:Button ID="btnReg" runat="server" Text="Register" CssClass="btn btn-success btn-lg" OnClick="btnReg_Click" />   
                                     </li>--%>
                             </ul>
                         </header>
                             <br />
                            
                     <div class="tab-content" id="tabPanel" runat="server">
                     <div role="tabpanel" class="tab-pane active" id="personalDetails">
                         <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key"></i> ID/Passport No:</span>
                                    <asp:TextBox ID="TextIDPassP" runat="server" CssClass="form-control" placeholder="ID /Passport number" required="true" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvIDtype" runat="server" ControlToValidate="TextIDPassP"/>
                                </div>
                                <br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i> Phone No:</span>
                                    <asp:TextBox ID="TextPhoneno" runat="server" CssClass="form-control" placeholder="Phone number" required="true" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="TextPhoneno"/>
                                </div>
                                <br />
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key"></i> Email Address:</span>
                                    <asp:TextBox ID="TextEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
                                </div>
                                   <br />

                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate> 
                                                 <div class="input-group">
                                                 <asp:DropDownList ID="ddlIDorPASS" runat="server"  class="selectpicker form-control" data-live-search-style="begins"
                                                    data-live-search="true" AppendDataBoundItems="true"  AutoPostBack="True" required="true">
                                                <asp:ListItem Selected="True">..Identification Document..</asp:ListItem>
                                                <asp:ListItem>NATIONAL_ID</asp:ListItem>
                                                <asp:ListItem>PASSPORT</asp:ListItem>
                                             </asp:DropDownList>
                                           </div>  
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                                          
                                <br />                                                                 
                                 
                                <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-sm-12 text-right">
                                                <asp:Button ID="Verify" runat="server" Text="Verify" CssClass="btn btn-primary btn-sm btn-success" OnClick="Verify_Click" />&nbsp;&nbsp;                                                
                                            </div>
                                        </div>
                                </div>
                     </div>
                          <div role="tabpanel" class="tab-pane" id="VerifiedDetails">
                            <!-- Input fields -->
                             <div class="form-horizontal"> 
                                  <div class="input-group"> 
                                        <span class="input-group-addon"><i class="fa fa-key"></i> Full Name:</span>
                                        <asp:TextBox ID="txtFullnames" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <br />

                                    <%--<div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i> Phone No:</span>
                                        <asp:TextBox ID="txtINo" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <br />--%>
                                    <%--<div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i> Email Address:</span>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
                                    </div>--%>
                                    <br />
                                     
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-sm-12 text-right">
                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm btn-succes" OnClick="btnCancel_Click" />&nbsp;&nbsp;   
                                                <asp:Button ID="btnProceed" runat="server" Text="Proceed" CssClass="btn btn-primary btn-sm btn-sucess" OnClick ="btnProceed_Click" />&nbsp;&nbsp;                                           
                                            </div>
                                        </div>
                                    </div>                         
                            </div>
                          </div>

                         <div role="tabpanel" class="tab-pane" id="accountDetails">
                            <!-- Input fields -->
                            <div class="form-horizontal"> 
                                <div class="col-md-12">
                                    <span>Select your Account Category</span>
                                     <br />
                                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate> 
                                               <asp:RadioButtonList ID="AccType" runat="server" OnSelectedIndexChanged="AccType_SelectedIndexChanged" AutoPostBack="true">
                                                       <asp:ListItem Value="Individual Deposists (BOSA)" Text="Individual Deposists (BOSA)" />                                                   
                                                      <asp:ListItem Value="KSA Individual (FOSA)" Text="KSA Individual (FOSA)"/> 
                                               </asp:RadioButtonList>
                                                <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Please select account type. <br />"
                                                    ControlToValidate="AccType" runat="server" ForeColor="Red" Display="Dynamic" />--%>
                                             </ContentTemplate>
                                        </asp:UpdatePanel>
                                        <br />
                                                                                    
                                        <div id="dvAllWhatiKnow" style="display: none">
                                            <textarea rows="5" cols="50" id="txtAreaBOSA" class="form-control" readonly>This is a long term savings accounts where deposists are accumulated through monthly savings that are refundable upon account closure. The savings can be used as collateral for credit services offered by the sacco. The registration fee for this account is Ksh 550.</textarea>
                                            <%--<input type="text" id="txtBOSA" value="Ndumia ni ya mavali"/>--%>
                                        </div>
                                        <div id="dvAllWhatiThought" style="display: none">
                                            <textarea rows="5" cols="50" id="txtAreaFOSA" class="form-control" readonly>This is a transactional account for individual members where salary or business income can be managed from. Funds can be accessed viaMobile Banking, ATM and Cheque Books. Loans can also be advanced based on activity of this account. This account has a minimum balance of Ksh 100.</textarea>
                                            <%--<input type="text" id="txtBOSA" value="Ndumia ni ya mavali"/>--%>
                                        </div>
                                        <br />       
                                        
                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-sm-12 text-right">
                                                     <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="btnBack_Click"/>&nbsp;&nbsp;                                       
                                                <asp:Button ID="ButtonNext" runat="server" Text="Next" CssClass="btn btn-primary btn-sm btn-success" OnClick="ButtonNext_Click" Enabled="false"/>&nbsp;&nbsp;                                          
                                                </div>
                                            </div>
                                        </div>
                                         
                                    </div>                     
                            </div> 
                        </div> 

                         <div role="tabpanel" class="tab-pane" id="nextOfKinDetails">
                            <!-- Input fields -->
                            <div class="form-horizontal">
                                <div class="col-md-12">
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate> 
                                            <div class="inline_collectionR">
                                                <input type="checkbox" runat="server" value="Next of Kin" id="Optional_NextofKin__c" onclick="ShowNextofkin()">
                                                <label class="inline" for="Optional_NextofKin__c">Next of Kin is Minor (Under 18 Years)</label>
                                            </div>
                                        </ContentTemplate>
                                     </asp:UpdatePanel>
                                            <br /> 

                                            <div id="myNextofKin">
                                                <br /> 
                                              <div class="row">
                                                     <div class="col-md-6">
                                                             <div class="input-group">
                                                                <span class="input-group-addon"><i class="fa fa-id-card"></i> Kin ID No:</span>
                                                                <asp:TextBox ID="TextKinID" runat="server" CssClass="form-control" placeholder="Kin ID number" TextMode="Number"></asp:TextBox>
                                                    
                                                            </div>
                                                        </div>


                                                      <div class="col-md-6">
                                                          <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate> 
                                                                <asp:DropDownList ID="ddlkinIDorPass" runat="server"  class="selectpicker form-control" data-live-search-style="begins"
                                                                data-live-search="true" AppendDataBoundItems="true"  AutoPostBack="True" required="true">
                                                                <asp:ListItem Selected="True">..Identification Document..</asp:ListItem>
                                                                <asp:ListItem>NATIONAL_ID</asp:ListItem>
                                                                <asp:ListItem>PASSPORT</asp:ListItem>
                                                                </asp:DropDownList>
                                                                </ContentTemplate>
                                                              </asp:UpdatePanel>
                                                     </div>                                             
                                                 </div>                                 
                                                    <br />

                                                <div class="input-group">
                                                   <%-- <asp:Label ID="Label6" runat="server"  CssClass="col-md-4">Relationship:</asp:Label>                                          
                                                    <div class="col-md-8"> --%> 
                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>                                           
                                                    <span class="input-group-addon"><i class="fa fa-id-card"></i> Relationship:</span>                            
                                                    <asp:DropDownList ID="ddlKinrelation" runat="server" AppendDataBoundItems="true" AutoPostBack="true" CssClass="btn" >                                               
                                                    </asp:DropDownList>
                                                            </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                            
                                                </div>
                                                <br />
                                           
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i> Kin Phone No:</span>
                                                    <asp:TextBox ID="TextKinPhone" runat="server" CssClass="form-control" placeholder="Kin Phone number" TextMode="Number"></asp:TextBox>
                                                   <%-- <asp:RequiredFieldValidator ID="rfvKinPhone" runat="server" ControlToValidate="TextKinPhone"/>--%>
                                                </div>
                                                <br />  

                                                <div class="panel-footer">
                                                    <div class="row">
                                                        <div class="col-sm-12 text-right">
                                                             <asp:Button ID="btnkmajorbak" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="btnkmajorbak_Click"/>&nbsp;&nbsp;                                                   
                                                        <asp:Button ID="btnkinmajnxt" runat="server" Text="Next" CssClass="btn btn-primary btn-sm btn-success" OnClick="btnkinmajnxt_Click"/>&nbsp;&nbsp;                                          
                                                        </div>
                                                    </div>
                                                </div>
                                           </div> 
                                    
                                            <div id="minorNxtofKin" style="display:none"> 
                                                <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user"></i> Name of Kin:</span>
                                                <asp:TextBox ID="TxtKinMinorname" runat="server" CssClass="form-control" placeholder="Kin Full Name"></asp:TextBox>
                                                </div>
                                                <br />

                                                 <div class="input-group date">
                                                    <span class="input-group-addon"><i class="fa fa-id-card"></i>Date of Birth:</span>
                                                    <input type="text" id="kindob" runat="server" class="form-control" placeholder="Kin Date of Birth"/><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                                                                    
                                                <div class="input-group"> 
                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                     <ContentTemplate>                                                 
                                                        <span class="input-group-addon"><i class="fa fa-id-card"></i> Relationship:</span>                            
                                                        <asp:DropDownList ID="ddlKinminorrelation" runat="server" Cssclass="form-control" AppendDataBoundItems="true" AutoPostBack="true"></asp:DropDownList>
                                                      </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                 </div>                                       
                                                <br />

                                                <div class="row">
                                                     <div class="col-md-6">
                                                         <div class="input-group">
                                                            <span class="input-group-addon"><i class="fa fa-id-card"></i>Kin's Guardian ID No:</span>
                                                            <asp:TextBox ID="TextGIdno" runat="server" CssClass="form-control" placeholder="Kin's Guardian ID number" TextMode="Number"></asp:TextBox>
                                                          </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate> 
                                                               <asp:DropDownList ID="ddlguardianIdPas" runat="server"  class="selectpicker form-control" data-live-search-style="begins"
                                                                data-live-search="true" AppendDataBoundItems="true"  AutoPostBack="true" required="true">
                                                                <asp:ListItem Selected="True">..Identification Document..</asp:ListItem>
                                                                <asp:ListItem>NATIONAL_ID</asp:ListItem>
                                                                <asp:ListItem>PASSPORT</asp:ListItem>
                                                                </asp:DropDownList>  
                                                             </ContentTemplate>
                                                            </asp:UpdatePanel>                                               
                                                        </div> 
                                                </div>
                                                <br />                                        
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-address-book"></i> Guardian Phone No:</span>
                                                    <asp:TextBox ID="TextGphone" runat="server" CssClass="form-control" placeholder="Guardian Phone number" TextMode="Number"></asp:TextBox>
                                                </div>
                                                <br />  
                                                    
                                                 <div class="panel-footer">
                                                    <div class="row">
                                                        <div class="col-sm-12 text-right">
                                                            <asp:Button ID="btnKinMinorB" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="btnKinMinorB_Click"/>&nbsp;&nbsp;                                                   
                                                        <asp:Button ID="btKinMinorN" runat="server" Text="Next" CssClass="btn btn-primary btn-sm btn-success" OnClick="btKinMinorN_Click"/>&nbsp;&nbsp;                                 
                                                        </div>
                                                    </div>
                                                </div>                                        
                                            </div>

                                      </div>
                            </div>
                        </div>

                         <div role="tabpanel" class="tab-pane" id="RefereDetails">
                            <!-- Input fields -->
                            <div class="form-horizontal">
                                 <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:Label ID="lblref" runat="server">REFEREE DETAILS</asp:Label>                                 
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-key"></i> Referee ID No:</span>
                                            <asp:TextBox ID="TextRefIDno" runat="server" CssClass="form-control" placeholder="Referee ID No" TextMode="Number"></asp:TextBox>
                                        </div>
                                        </div>
                                         <div class="col-md-6">
                                             <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                                 <ContentTemplate> 
                                                    <asp:DropDownList ID="ddlrefIDorPASS" runat="server"  class="selectpicker form-control" data-live-search-style="begins"
                                                    data-live-search="true" AppendDataBoundItems="true"  AutoPostBack="True" required="true">
                                                    <asp:ListItem Selected="True">..Identification Document..</asp:ListItem>
                                                    <asp:ListItem>NATIONAL_ID</asp:ListItem>
                                                    <asp:ListItem>PASSPORT</asp:ListItem>
                                                    </asp:DropDownList>
                                                     </ContentTemplate>
                                                 </asp:UpdatePanel>
                                           </div>                
                                    </div>                                     
                                    <br />                   
                                     <%-- <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-key"></i> Referee Phone No:</span>
                                            <asp:TextBox ID="Textrefphone" runat="server" CssClass="form-control" placeholder="Referee phone No" TextMode="Number"></asp:TextBox>
                                        </div>
                                    <br />--%>                                    

                                        <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-sm-12 text-right">
                                                    <asp:Button ID="Btnrefback" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="Btnrefback_Click"/>&nbsp;&nbsp;                                       
                                                    <asp:Button ID="Btnrefnext" runat="server" Text="Next" CssClass="btn btn-primary btn-sm btn-success" OnClick="Btnrefnext_Click"/>&nbsp;&nbsp;
                                                </div>
                                            </div>
                                        </div>       
                                </div>
                            </div>
                        </div>

                         <div role="tabpanel" class="tab-pane" id="ResidenceDetails">
                            <!-- Input fields -->
                            <div class="form-horizontal">
                                <div class="col-md-12">
                                      <div class="form-group">
                                        <asp:Label ID="Lblresid" runat="server"><b>RESIDENCE DETAILS</b></asp:Label>
                                      </div>
                                        <br />
                                      <div class="row">
                                           <div id="mycountryID">
                                              <div class="form-group">
                                                <asp:Label ID="Label1" runat="server"  CssClass="col-md-4">Country of Residence:</asp:Label>                                        
                                                     <div class="col-md-8">                                                          
                                                                <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" ng-options="s.name for s in sample" ng-model="selitem" AutoPostBack="true">
                                                             </asp:DropDownList>                                                                  
                                                 </div>
                                              <br />
                                            </div>
                                          </div>
                                      </div>
                                      <br />

                                       <div class="row">
                                        <div id="mycountyID">
                                            <div class="form-group">
                                            <asp:Label ID="Label2" runat="server"  CssClass="col-md-4">County of Residence:</asp:Label>
                                                <div class="col-md-8">                                                                                                                                                                       
                                                        <asp:DropDownList ID="ddlCounty" CssClass="form-control"  runat="server" AutoPostBack="true"></asp:DropDownList>  
                                                          
                                                </div>  
                                            </div>                                        
                                          </div>
                                      </div> 
                                      <br />
                                      <div class="row">
                                             <div id="mycityID">
                                            <div class="form-group">
                                            <asp:Label ID="Label3" runat="server"  CssClass="col-md-4">Town/City of Residence:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="TxtBoxcity" runat="server" CssClass="form-control" placeholder="City/Town of Residence" Enabled="false" ></asp:TextBox>                                             
                                                </div>  
                                            </div>                                        
                                          </div>
                                      </div> 
                                      <br />
                                       <div class="inline_collectionP">
                                        <input type="checkbox" class="" value="terms and conditions" id="checkAgreed" onclick="ClickMeYoh()">
                                        
                                           <span class="pull-left"><label class="inline" for="checkAgreed">I agree with the terms and conditions of the service</label> <asp:LinkButton ID="lnkbtnterms" runat="server">Reset Password?</asp:LinkButton></span>
                                        </div>
                                      <br />
                                          <div id="dvTerms" style="display:none">
                                              <textarea rows="10" cols="50" id="txtAreaterms"  class="form-control" readonly></textarea>
                                          </div>

                                          <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-sm-12 text-right">
                                                    <asp:Button ID="btncanclprv" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="btncanclprv_Click"/>&nbsp;&nbsp;
                                                    <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="btn btn-primary btn-sm btn-success" Enabled="false" OnClick="btnPreview_Click"/>&nbsp;&nbsp;
                                                </div>
                                            </div>
                                        </div>      
                                    </div>
                            </div>
                        </div>

                          <div role="tabpanel" class="tab-pane" id="Preview">
                            <!-- Input fields -->
                            <div class="form-horizontal">
                                <div class="col-md-12">                               
                                      <div class="row">
                                           <div class="col-md-12">
                                      <div class="form-group">
                                        <asp:Label ID="Label4" runat="server"><b>PREVIEW DETAILS</b></asp:Label>
                                      </div>
                                      </div> 
                                      </div>                                                                         
                                      <br />
                                      <div class="row">
                                          <div class="col-md-12">
                                          <asp:Label ID="Labedts" runat="server"><p>Personal information</p></asp:Label>
                                      </div>
                                      </div>
                                      <div class="row">
                                          <div class="form-group">
                                            <asp:Label ID="LblFname" runat="server"  CssClass="col-md-4">Full Name:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="TextFname" runat="server" CssClass="form-control"  Enabled="false" ></asp:TextBox>                                             
                                                </div>  
                                        </div> 
                                      </div>                                       
                                      <br />
                                      <div class="row">
                                          <div class="form-group">
                                            <asp:Label ID="lblIdtype" runat="server"  CssClass="col-md-4">Identification Document:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="pretxtIdtype" runat="server" CssClass="form-control"  Enabled="false" ></asp:TextBox>                                             
                                                </div>                                      
                                      </div>
                                      </div>                                      
                                      <br />
                                      <div class="row">
                                          <div class="form-group">
                                            <asp:Label ID="LblIdno" runat="server"  CssClass="col-md-4">ID No/Passport:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="TextIdno" runat="server" CssClass="form-control"  Enabled="false" ></asp:TextBox>                                             
                                                </div>                                      
                                      </div>
                                      </div>                                      
                                      <br />
                                      <div class="row">
                                          <div class="form-group">
                                            <asp:Label ID="lblPhoneno" runat="server"  CssClass="col-md-4">Phone No:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="pretxtPhoneno" runat="server" CssClass="form-control"  Enabled="false" ></asp:TextBox>                                             
                                                </div>                                      
                                      </div>
                                      </div>                                      
                                      <br />
                                      <div class="row">
                                          <div class="form-group">
                                            <asp:Label ID="lblEmail" runat="server"  CssClass="col-md-4">Email Address:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="pretxtEmail" runat="server" CssClass="form-control"  Enabled="false" ></asp:TextBox>                                             
                                                </div>                                      
                                      </div>
                                      </div>                                      
                                      <br /> 
                                       <div id="iprsdtailshiden" style="display:none">
                                            <div class="row">
                                          <div class="form-group">
                                            <asp:Label ID="LblDob" runat="server"  CssClass="col-md-4">Date of Birth:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="TextDob" runat="server" CssClass="form-control"></asp:TextBox>                                             
                                                </div>  
                                           </div>
                                          </div>                                      
                                          <br />
                                          <div class="row">
                                              <div class="form-group">
                                                <asp:Label ID="Lblgnd" runat="server"  CssClass="col-md-4">Gender:</asp:Label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="Textgnd" runat="server" CssClass="form-control"></asp:TextBox>                                             
                                                    </div>  
                                           </div> 
                                          </div>                                      
                                          <br />
                                          <div class="row">
                                              <div class="form-group">
                                                <asp:Label ID="LblPin" runat="server"  CssClass="col-md-4">Pin:</asp:Label>
                                                    <div class="col-md-8">
                                                        <asp:TextBox ID="TextPin" runat="server" CssClass="form-control"></asp:TextBox>                                             
                                                    </div>  
                                           </div>
                                          </div>
                                    </div> 
                                     
                                      <div class="row">
                                          <div class="col-md-12">
                                          <asp:Label ID="lblaccounts" runat="server"><p>Selected Account/s</p></asp:Label>
                                      </div>
                                      </div>
                                      <div class="row">
                                          <div class="form-group">
                                            <asp:Label ID="LblAcct" runat="server"  CssClass="col-md-4">Account Type:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="TextAcct" runat="server" CssClass="form-control"  Enabled="false" ></asp:TextBox>                                             
                                                </div>  
                                       </div>
                                      </div>                                      
                                      <br />
                                                                           
                                      <div class="row">
                                          <div class="col-md-12">
                                          <asp:Label ID="Lblnok" runat="server"><p>Next of Kin</p></asp:Label>
                                      </div>
                                      </div>
                                       <div id="myNextofKinmajor">
                                            <div class="row">
                                                <div class="form-group">
                                            <asp:Label class="lblprkinid" runat="server"  CssClass="col-md-4">Kin ID No:</asp:Label>
                                                <div class="col-md-8"> 
                                                     <asp:TextBox ID="txtPrkinId" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                              
                                                </div>                                           
                                            </div>
                                            </div>
                                           <br />
                                           <div class="row">
                                               <div class="form-group">
                                                <asp:Label class="lblKinname" runat="server"  CssClass="col-md-4">Kin Name:</asp:Label>
                                                <div class="col-md-8">   
                                                    <asp:TextBox ID="TxtKnameMajor" runat="server" CssClass="form-control"></asp:TextBox>                                                                                            
                                                </div>                                                
                                            </div>
                                           </div>
                                            <br />
                                           <div class="row">
                                          <div class="form-group" style="display:none">
                                            <asp:Label ID="lblKdot" runat="server"  CssClass="col-md-4">Kin Date of Birth:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="TxtKdot" runat="server" CssClass="form-control"></asp:TextBox>                                             
                                                </div>  
                                           </div>
                                          </div>
                                           <br />
                                            <div class="row">
                                                <div class="form-group">
                                                <asp:Label class="lblprphone" runat="server"  CssClass="col-md-4">Kin Phone No:</asp:Label>
                                                <div class="col-md-8">   
                                                    <asp:TextBox ID="txtPrphone" runat="server" CssClass="form-control"></asp:TextBox>                                                                                            
                                                </div>                                                
                                            </div>
                                            </div>                                                                                
                                        </div>

                                    <div id="NxtofKinminor" style="display:block">
                                        <div class="row">
                                            <div class="form-group">
                                        <asp:Label class="lblprkname" runat="server"  CssClass="col-md-4">Name of Kin:</asp:Label>
                                                <div class="col-md-8">  
                                                    <asp:TextBox ID="pretxtKMinorname" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                             
                                                </div>                                        
                                        </div>
                                        </div>                                        
                                        <br />
                                        <div class="row">
                                        <div class="form-group">
                                        <asp:Label class="lblprkgid" runat="server"  CssClass="col-md-4">Guardian ID No:</asp:Label>
                                            <div class="col-md-8"> 
                                                 <asp:TextBox ID="pretxtKGid" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                              
                                            </div>                                       
                                        </div>
                                        </div> 
                                        <br />
                                        <div class="row">
                                               <div class="form-group">
                                                <asp:Label class="lblGname" runat="server"  CssClass="col-md-4">Guardian Name:</asp:Label>
                                                <div class="col-md-8">   
                                                    <asp:TextBox ID="TxtGname" runat="server" CssClass="form-control"></asp:TextBox>                                                                                            
                                                </div>                                                
                                            </div>
                                           </div>                                       
                                        <br />
                                        <div class="row">
                                          <div class="form-group">
                                            <asp:Label ID="lblguardian" runat="server"  CssClass="col-md-4">Guardian Date of Birth:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="TxtGdob" runat="server" CssClass="form-control"></asp:TextBox>                                             
                                                </div>  
                                           </div>
                                          </div>
                                           <br />
                                        <div class="row">
                                            <div class="form-group">
                                            <asp:Label class="lblprgphone" runat="server"  CssClass="col-md-4">Guardian Phone No:</asp:Label>
                                                <div class="col-md-8">
                                                     <asp:TextBox ID="pretxtGphone" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                               
                                                </div>                                           
                                        </div>
                                        </div>     
                                    </div> 
                                      <br />
                                     
                                     <div id="Refereedetails">
                                               <div class="row">
                                                  <div class="form-group">
                                                        <asp:Label class="lblprrid" runat="server"  CssClass="col-md-4">Referee ID No:</asp:Label>
                                                        <div class="col-md-8">
                                                           <asp:TextBox ID="pretxtRId" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                               
                                                        </div>                                           
                                                    </div>
                                                </div>            
                                              <br />
                                               <div class="row">
                                                   <div class="form-group">
                                                    <asp:Label class="lblrefname" runat="server"  CssClass="col-md-4">Referee Full Name</asp:Label>
                                                     <div class="col-md-8">
                                                        <asp:TextBox ID="textrefName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                               
                                                     </div>                                           
                                                </div>
                                               </div>
                                        </div>
                               
                                      <br />
                                     
                                      <div class="row">
                                          <div class="col-md-12">
                                          <asp:Label ID="LblRdetails" runat="server"><p>Residence Details</p></asp:Label>
                                      </div>
                                      </div>
                                      <div id="Placeofresidence" runat ="server">
                                         <div class="row">
                                             <div class="form-group">
                                        <asp:Label class="lblprcountry" runat="server"  CssClass="col-md-4">Country of Residence:</asp:Label>
                                             <div class="col-md-8"> 
                                                 <asp:TextBox ID="pretxtcountry" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                              
                                             </div>                                        
                                        </div>
                                         </div>
                                        <br />
                                          <div class="row">
                                            <div class="form-group">
                                        <asp:Label class="lblprcotny" runat="server"  CssClass="col-md-4">County:</asp:Label>
                                            <div class="col-md-8"> 
                                                 <asp:TextBox ID="pretcounty" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                              
                                            </div>                                       
                                        </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="form-group">
                                        <asp:Label class="lblprtown" runat="server"  CssClass="col-md-4">Town/City of Residence:</asp:Label>
                                            <div class="col-md-8"> 
                                                 <asp:TextBox ID="pretxttown" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                              
                                            </div>                                       
                                        </div>
                                        </div>
                                        <br />
                                      </div>
                                       
                                     <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-sm-12 text-right">
                                                    <asp:Button ID="prebtnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-lg btn-success" OnClick="prebtnSubmit_Click"/>&nbsp;&nbsp;                                          
                                                </div>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                     </div>  
             </div> 
         </div>                
                

                         <div class="row">
                              <asp:MultiView ID="registerMultiView" runat="server">
                
                               <asp:View ID="verifystageView" runat="server">                  
                                <br />
                                </asp:View>

                                    <asp:View ID="verifiedInfoView" runat="server">                  
                                    <br />
                                </asp:View>
                                                                 

                                    <asp:View ID="selectAccount" runat="server">                  
                                    <br />  
                                </asp:View>                              
                                                          
                                  <asp:View ID="nextofkin" runat="server">
                                      <br/>
                                </asp:View>

                                <asp:View ID="refereedetails" runat="server">
                                    <br />
                                </asp:View>
                                 

                                  <asp:View ID="fillresidencedetails" runat="server">
                                   <br /> 
                                  </asp:View> 

                                  <asp:View ID="previewDetails" runat="server">
                                      <br />    
                                </asp:View>                                                                                                  
                                                                                                   
                              </asp:MultiView>
                         </div>
                     </div>
                     </div>
            </div>
<%--        </div>--%> 
    <div class="col-md-3"></div>

     <script type="text/javascript">
        function ShowHideDivBOSA() {
               var rdbtn1 = document.getElementById("dvAllWhatiKnow");
                rdbtn1.style.display = "block";
                var rdbtn2 = document.getElementById("dvAllWhatiThought");
                rdbtn2.style.display = "none";
            }
        function ShowHideDivFOSA() {
            var rdbtn1 = document.getElementById("dvAllWhatiKnow");
            rdbtn1.style.display = "none";
            var rdbtn2 = document.getElementById("dvAllWhatiThought");
            rdbtn2.style.display = "block";
           <%-- var rdbtn2 = document.getElementById('<%=dvAllWhatiThought.ClientID%>');--%>
        }
        
        function UnhideNxtofKin() {
            var idDiv = document.getElementById("myNextofKin");
            var idMinor = document.getElementById("minorNxtofKin");            
            idDiv.style.display = "block";
            idMinor.style.display = "none";            
        }
        function ShowNextofkin() {
            var checkBox = document.getElementById('<%=Optional_NextofKin__c.ClientID%>');
                       
            var idMinor = document.getElementById("minorNxtofKin");
            var idDiv = document.getElementById("myNextofKin");            
            if (checkBox.checked === true) {
                idMinor.style.display = "block";
                idDiv.style.display = "none";
               
            } else {
                idMinor.style.display = "none";
                idDiv.style.display = "block";             
            }
                        
        }

        function ShowCountryDiV() {
            var cntry = document.getElementById("mycountryID");
            cntry.style.display = "block";
            var county = document.getElementById("mycountyID");
            county.style.display = "none";
        }

        function ShowmyCountyDiV() {           
            var county = document.getElementById("mycountyID");
            county.style.display = "block";
        }
        function HidemyCountyDiV() {
            var county = document.getElementById("mycountyID");
            county.style.display = "none";
        }

        function ClickMeYoh() {
            var chk2 = document.getElementById("checkAgreed");        
            
            if (chk2.checked == true) {               
                 document.getElementById('<%=btnPreview.ClientID%>').disabled=false;
            } else {
                 document.getElementById('<%=btnPreview.ClientID%>').disabled=true;
            }
        }
         function DisableMyAss() {           
           document.getElementById('<%=btnPreview.ClientID%>').disabled=true;
         }
               

        function GetSelectedItem() {
            var rb = document.getElementById('<%=AccType.ClientID%>');
           
            var radio = rb.getElementsByTagName("input");
            var label = rb.getElementsByTagName("label");
            for (var i = 0; i < radio.length; i++) {
                if (radio[i].checked) {

                    var fosaORBosa = label[i].innerHTML;

                    switch (fosaORBosa) {
                        case "Individual Deposists (BOSA)":
                            var rdbtn1 = document.getElementById("dvAllWhatiKnow");
                            rdbtn1.style.display = "block";
                            var rdbtn2 = document.getElementById("dvAllWhatiThought");
                            rdbtn2.style.display = "none";
                            //alert(fosaORBosa);
                            break;

                        case "KSA Individual (FOSA)":
                            var rdbtn1 = document.getElementById("dvAllWhatiKnow");
                            rdbtn1.style.display = "none";
                            var rdbtn2 = document.getElementById("dvAllWhatiThought");
                            rdbtn2.style.display = "block";
                            //alert(fosaORBosa);
                            break;
                    }

                    //alert("SelectedText: " + label[i].innerHTML
                    //    + "\nSelectedValue: " + radio[i].value);
                    
                    //var rdbtn1 = document.getElementById("dvAllWhatiKnow");
                    //rdbtn1.style.display = "block";
                    //var rdbtn2 = document.getElementById("dvAllWhatiThought");
                    //rdbtn2.style.display = "none";
                    break;
                }
            }
              return false;
            }    
    </script>
    <script>
        $(".inline_collection :checkbox").click(function () {
            //var hiddenVar = ".area" + this.value;
            //if (this.checked) $(hiddenVar).show();
            //else $(hiddenVar).hide();
            var idMinor = document.getElementById("minorNxtofKin");
            var idDiv = document.getElementById("myNextofKin");
            idMinor.style.display = "block";
            idDiv.style.display = "none";
        });      
    </script>  

    <script>
        var nextofkinHidden = document.getElementById('<%=Optional_NextofKin__c.ClientID%>');

           if (!isNaN(nextofkinHidden))
            {
                   document.getElementById('myNextofKinmajor').style.display = "block";
                   document.getElementById('NxtofKinminor').style.display = "none";
            }
            else
            {
              document.getElementById('myNextofKinmajor').style.display = "none";
              document.getElementById('NxtofKinminor').style.display = "block";
            }
     </script>


    <script>
        <%-- function AmReallyChecked() {
             var checkBoxed = document.getElementById('<%=Optional_NextofKin__c.ClientID%>');
             if (checkBoxed.checked == true) {                
              <%
         //Session["amchecked"] = "They Checked my ass";
         SACCOPortal.SACCOFactory.ShowAlert("checked");

               %>
               
             } if (checkBoxed.checked == false) {<%
         //Session["amchecked"] = "They did not Check my ass";
         SACCOPortal.SACCOFactory.ShowAlert("not checked");
                 %>
            }
         }--%>
    </script>
<%--</div> --%>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#tabpanel").tabs();
            jumpToNextTab();
            var btnColl = { "Verify": "2", "btnProceed": "3", "ButtonNext": "4" };
            $('.btn').click(function() {
                var tabNo = btnColl[this.id];
                $("#<%= currTab.ClientID %>").val(tabNo);
            });

        });

        function jumpToNextTab() {
            var tabid = $("#<%= currTab.ClientID %>").val();
            if (tabid != '')
                $('#tabpanel').tabs("select", tabid);
        }

    </script>
  
</asp:Content>