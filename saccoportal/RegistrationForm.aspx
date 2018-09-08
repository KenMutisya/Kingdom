<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="SACCOPortal.RegistrationForm" MasterPageFile="~/MemberReg.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    

     <div class="panel-body" style="margin-top:50px;">

    <div class="container-fluid"></div>
         <div class="col-md-3"></div>
             <div class="col-md-6">
                <%-- <div class="home-form-container">--%>                    
                     <div class="panel panel-default">                  
                        <div class="panel-heading">
                         <div class="row">
                             <h3  style="font-weight:bold; color:#0094ff; text-align:left;">KINGDOM SACCO MEMBER REGISTRATION FORM</h3>
                            <%-- <asp:Label ID="Lbl" runat="server">KINGDOM SACCO MEMBER REGISTRATION</asp:Label>--%>
                             <div class="mobile-form-toggle">
                                 <div class="field-error">
                                     <div class="row">
                                         <div class="col-md-12">
                                             <asp:Label ID="LblError" runat="server" ForeColor="Red" CssClass="text-left hidden"></asp:Label>
                                             <span class="text-center text-danger"><small><%=LblError.Text %></small></span>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                        </div>


                         <div class="panel-body panel-form">
                             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         <div id="vue-container">
                         <div class="row">
                              <asp:MultiView ID="registerMultiView" runat="server">
                
                               <asp:View ID="verifystageView" runat="server">                  
                                <br />  
                                   <div class="col-md-12">                             
                                <div class="row">
                                    
                                    <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-key"></i>ID/Passport No:</span>
                                                <asp:TextBox ID="TextIDPassP" runat="server" CssClass="form-control" placeholder="ID /Passport number" required="true" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvIDtype" runat="server" ControlToValidate="TextIDPassP" />
                                            </div>
                                        </div>                               

                                    <div class="col-md-6">
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
                                        </div>
                                    </div>
                                <br />
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i>Phone No:   </span>
                                    <asp:TextBox ID="TextPhoneno" runat="server" CssClass="form-control" placeholder="Phone number" required="true" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="TextPhoneno"/>
                                </div>
                                <br />
                                 <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-key"></i>Email Address:</span>
                                    <asp:TextBox ID="TextEmail" runat="server" CssClass="form-control" placeholder="Enter Email" TextMode="Email"></asp:TextBox>
                                </div>
                                   <br />                                                                                                
                                 
                                <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-sm-12 text-right">
                                                <asp:Button ID="Verify" runat="server" Text="Verify" CssClass="btn btn-primary btn-sm btn-success" OnClick="Verify_Click" />&nbsp;&nbsp;                                                
                                            </div>
                                        </div>
                                </div>
                                       </div>

                                                                   
                                </asp:View>

                                    <asp:View ID="verifiedInfoView" runat="server">                  
                                    <br />
                                    <div class="col-md-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i> Full Name:</span>
                                        <asp:TextBox ID="txtFullnames" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
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
                                     
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-sm-12 text-right">
                                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm btn-succes" OnClick="btnCancel_Click" />&nbsp;&nbsp;   
                                                <asp:Button ID="btnProceed" runat="server" Text="Proceed" CssClass="btn btn-primary btn-sm btn-sucess" OnClick ="btnProceed_Click" />&nbsp;&nbsp;                                           
                                            </div>
                                        </div>
                                    </div>
                                   </div>                                                            
                               </asp:View>
                                                                 

                                    <asp:View ID="selectAccount" runat="server">                  
                                    <br />
                                    <div class="col-md-12">
                                    <span>Select your Account Category</span>
                                     <br />
                                        
                                       <asp:RadioButtonList ID="AccType" runat="server" OnSelectedIndexChanged="AccType_SelectedIndexChanged" AutoPostBack="true">
                                               <asp:ListItem Value="Individual Deposists (BOSA)" Text="Individual Deposists (BOSA)" />                                                   
                                              <asp:ListItem Value="KSA Individual (FOSA)" Text="KSA Individual (FOSA)"/> 
                                       </asp:RadioButtonList>
                                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="Please select account type. <br />"
                                            ControlToValidate="AccType" runat="server" ForeColor="Red" Display="Dynamic" />--%>
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
                                </asp:View>                              
                                                          
                                <asp:View ID="nextofkin" runat="server">  
                                    <div class="col-md-12">                                       
                                                                              
                                            <div class="inline_collectionR">
                                                <asp:CheckBox ID="Optional_NextofKin__c" runat="server"  Text="Next of Kin is Minor (Under 18 Years)" OnCheckedChanged="Optional_NextofKin__c_CheckedChanged" AutoPostBack="true"/>
                                                <%--<input type="checkbox" runat="server" value="Next of Kin" id="Optional_NextofKin__c" onclick="ShowNextofkin()" />--%>
                                                <%--<label class="inline" for="Optional_NextofKin__c">Next of Kin is Minor (Under 18 Years)</label>--%>
                                            </div> 
                                        <br />  
                                        

                                            <div id="myNextofKin">
                                                <br /> 
                                              <div class="row">
                                                     <div class="col-md-6">
                                                             <div class="input-group">
                                                                <span class="input-group-addon"><i  class="fa fa-id-card"></i> Kin ID No:</span>
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

                                                <div class="form-group">                                                     
                                                         <asp:label ID="lblrelkin" runat="server" CssClass="col-md-2">Relationship:</asp:label>                                                 
                                                        <%--<span class="input-group-addon"><i class="fa fa-id-card"></i> Relationship:</span>--%>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                     <ContentTemplate>
                                                         <div class="col-md-10">
                                                            <asp:DropDownList ID="ddlKinrelation" runat="server" Cssclass="form-control" AppendDataBoundItems="true" AutoPostBack="true"></asp:DropDownList>
                                                         </div>
                                                      </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <br />
                                                 </div> 
                                                <br />
                                                                                            
                                                <br />                                           
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="fa fa-user"></i> Kin Phone No:</span>
                                                    <asp:TextBox ID="TextKinPhone" runat="server" CssClass="form-control" placeholder="Kin Phone number" TextMode="Number"></asp:TextBox>
                                                   <%-- <asp:RequiredFieldValidator ID="rfvKinPhone" runat="server" ControlToValidate="TextKinPhone"/>--%>
                                                </div>
                                                <br />                                            
                                        </div>
                                    
                                            <div id="minorNxtofKin" style="display:none"> 
                                                <div class="input-group">
                                                <span class="input-group-addon"><i class="fa fa-user"></i> Name of Kin:</span>
                                                <asp:TextBox ID="TxtKinMinorname" runat="server" CssClass="form-control" placeholder="Kin Full Name"></asp:TextBox>
                                                </div>
                                                <br />

                                                 <div class="input-group date" id="dpcker">
                                                    <span class="input-group-addon"><i class="fa fa-id-card"></i>Date of Birth:</span>
                                                    <input type="text" id="kindob" runat="server" class="form-control" placeholder="Kin Date of Birth"/><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                                <br />                                             
                                                                                    
                                                <div class="form-group">                                                     
                                                         <asp:label ID="lblrel" runat="server" CssClass="col-md-2">Relationship:</asp:label>                                                 
                                                        <%--<span class="input-group-addon"><i class="fa fa-id-card"></i> Relationship:</span>--%>
                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                     <ContentTemplate>
                                                         <div class="col-md-10">
                                                            <asp:DropDownList ID="ddlKinminorrelation" runat="server" Cssclass="form-control" AppendDataBoundItems="true" AutoPostBack="true"></asp:DropDownList>
                                                         </div>
                                                      </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <br />
                                                 </div>                                       
                                                <br /> 
                                                
                                                <br />                                              

                                                <div class="row">
                                                     <div class="col-md-7">
                                                         <div class="input-group">
                                                            <span class="input-group-addon"><i class="fa fa-id-card"></i>Kin's Guardian ID No:</span>
                                                            <asp:TextBox ID="TextGIdno" runat="server" CssClass="form-control" placeholder="Kin's Guardian ID number" TextMode="Number"></asp:TextBox>
                                                          </div>
                                                    </div>

                                                    <div class="col-md-5">
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
                                                    
                                                 <%--<div class="panel-footer">
                                                    <div class="row">
                                                        <div class="col-sm-12 text-right">
                                                            <asp:Button ID="btnKinMinorB" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="btnKinMinorB_Click"/>&nbsp;&nbsp;   
                                                            <asp:Button ID="btKinMinorN" runat="server" Text="Next" CssClass="btn btn-primary btn-sm btn-success" OnClick="btKinMinorN_Click" />
                                                        </div>
                                                    </div>
                                                </div>--%>                                        
                                            </div>

                                        <div class="panel-footer">
                                                    <div class="row">                                                                                                          
                                                    <%--<asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="True">
                                                    <ContentTemplate>--%>
                                                            <div class="col-sm-12 text-right">
                                                                 <asp:Button ID="btnkmajorbak" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="btnkmajorbak_Click"/>&nbsp;&nbsp; 
                                                                <asp:Button ID="btnkinmajnxt" runat="server" Text="Next" CssClass="btn btn-primary btn-sm btn-success" OnClick="btnkinmajnxt_Click"/>&nbsp;&nbsp;                                                         
                                                           </div>
                                                        <%--</ContentTemplate>
                                                       <Triggers>
                                                          <asp:PostBackTrigger ControlID = "btnkinmajnxt" />
                                                       </Triggers>
                                                    </asp:UpdatePanel>--%>                                                             
                                                        </div>                                                   
                                        </div>
                                      </div>
                                 </asp:View>

                                <asp:View ID="refereedetails" runat="server">
                                    <br />
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
                                             <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
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
                                </asp:View>
                                 

                                  <asp:View ID="fillresidencedetails" runat="server">
                                   <br />
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
                                        
                                           <span><label class="inline" for="checkAgreed">I AGREE WITH THE TERMS AND CONDITIONS OF THE SERVICE.</label>&nbsp;&nbsp;<asp:LinkButton ID="lnkbtnterms" runat="server" OnClick="lnkbtnterms_Click">Click Here</asp:LinkButton></span>
                                        </div>
                                      <br />
                                          <div id="dvTerms" style="display:none">
                                              <%--<textarea rows="10" cols="50" id="txtAreaterms"  class="form-control" readonly></textarea>--%>
                                              <iframe runat="server" id="terms" height="200" width="600" src="terms/kingdomterms.pdf"></iframe>
                                          </div>
                                          <br />

                                          <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-sm-12 text-right">
                                                    <asp:Button ID="btncanclprv" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="btncanclprv_Click"/>&nbsp;&nbsp;
                                                    <asp:Button ID="btnPreview" runat="server" Text="Preview" CssClass="btn btn-primary btn-sm btn-success" Enabled="false" OnClick="btnPreview_Click"/>&nbsp;&nbsp;
                                                </div>
                                            </div>
                                        </div>      
                                    </div>
                                  </asp:View> 

                                  <asp:View ID="previewDetails" runat="server">
                                      <br /> 
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
                                          <asp:Label ID="Labedts" runat="server"><p><b>Personal Information</b></p></asp:Label>
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
                                          <asp:Label ID="lblaccounts" runat="server"><p><b>Selected Account/s</b></p></asp:Label>
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
                                          <asp:Label ID="Lblnok" runat="server"><p><b>Next of Kin Details</b></p></asp:Label>
                                      </div>
                                      </div>
                                       <div id="myNextofKinmajor" runat="server">
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
                                                    <asp:TextBox ID="TxtKnameMajor" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                            
                                                </div>                                                
                                            </div>
                                           </div>                                            
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
                                                    <asp:TextBox ID="txtPrphone" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                            
                                                </div>                                                
                                            </div>
                                            </div>                                                                                
                                        </div>
                                          <br />


                                    <div id="NxtofKinminor" runat="server">
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
                                                    <asp:TextBox ID="TxtGname" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                            
                                                </div>                                                
                                            </div>
                                           </div>                                       
                                        <br />
                                        <div class="row">
                                          <div class="form-group" style="display:none">
                                            <asp:Label ID="lblguardian" runat="server"  CssClass="col-md-4">Guardian Date of Birth:</asp:Label>
                                                <div class="col-md-8">
                                                    <asp:TextBox ID="TxtGdob" runat="server" CssClass="form-control"></asp:TextBox>                                             
                                                </div>  
                                           </div>
                                          </div>                                           
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

                                     
                                     <div id="Refereedetailspr">
                                         <div class="row">
                                                  <div class="col-md-12">
                                                  <asp:Label ID="lblprevref" runat="server"><p><b>Referee Details</b></p></asp:Label>
                                              </div>
                                              </div>
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
                                                    <asp:Label class="lblrefname" runat="server"  CssClass="col-md-4">Referee Full Name:</asp:Label>
                                                     <div class="col-md-8">
                                                        <asp:TextBox ID="textrefName" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>                                                                                               
                                                     </div>                                           
                                                </div>
                                               </div>
                                        </div>
                               
                                      <br />
                                     
                                      <div class="row">
                                          <div class="col-md-12">
                                          <asp:Label ID="LblRdetails" runat="server"><p><b>Residence Details</b></p></asp:Label>
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
                                                    <asp:Button ID="prebtnback" runat="server" Text="Back" CssClass="btn btn-primary btn-sm btn-success" OnClick="prebtnback_Click" />&nbsp;&nbsp;
                                                    <asp:Button ID="prebtnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-sm btn-success" OnClick="prebtnSubmit_Click" Visible="false"/>&nbsp;&nbsp;  
                                                    <asp:Button ID="prebtnSubmitminor" runat="server" Text="Submit" CssClass="btn btn-primary btn-sm btn-success" OnClick="prebtnSubmitminor_Click" Visible="false"/>&nbsp;&nbsp; 
                                                </div>
                                            </div>
                                    </div>
                                </div>
                                </asp:View>
                                  
                                  <asp:View ID="PaymentView" runat="server">
                                      <div class="col-md-12">
                                        <div class="form-group">
                                            <asp:Label ID="Label5" runat="server"><b>PAYMENT PAGE</b></asp:Label>                                 
                                        </div>
                                          <br/>
                               
                                            <img class="media-object thumbnail pull-left" src="siteimages/mpesa.jpg" alt="" style="margin-right:10px; width:65px;">
                                            <div class="clearfix"></div>
                                            <div id="MpesaStatus">
                                                <p class="alert alert-success m0" style="padding:20px; color:000; border-radius:5px; background:fff; border: 1px solidg 428bca">To Pay for your registration (KES. 550.00) via MPESA. Follow the Steps Below. Once you receive a successful reply from Mpesa. Enter the details and Click the complete button bellow.</p>
                                            </div>
                                            <ol class="mt10">
                                                <li>Go to M-PESA on your phone</li>
                                                <li>Select Pay Bill option</li>
                                                <li>Enter Business no. <span style="font-size:12px; font-weight: bold;">206206</span></li>
                                                <li>Enter Account no. <span style="font-size:12px; font-weight: bold;">PCEKAHD</span></li>
                                                <li>Enter the Amount. KES 550.00</li>
                                                <li>Enter your M-PESA PIN and Send</li>z
                                                <li>You will receive a confirmation SMS from MPESA</li>
                                            </ol>
                                          <br/>
                                           <div class="row">
                                                <div class="form-group">
                                                    <asp:Label class="lblmaphone" runat="server"  CssClass="col-md-4">Phone No:</asp:Label>
                                                    <div class="col-md-8"> 
                                                         <asp:TextBox ID="txtmaphone" runat="server" CssClass="form-control" placeholder="Enter Mobile Number You used to pay"></asp:TextBox>                                                                                              
                                                    </div>                                       
                                                </div>
                                            </div>
                                            <%--<input style="display: block" type="text" id="maphone" placeholder="Enter Mobile Number You used to pay" class="form-control mb20 mt10" name="ref">--%>
                                          <br/>
                                          <div class="row">
                                                <div class="form-group">
                                                    <asp:Label class="lblmaphone" runat="server"  CssClass="col-md-4">Reference No:</asp:Label>
                                                    <div class="col-md-8"> 
                                                         <asp:TextBox ID="txtmaref" runat="server" CssClass="form-control" placeholder="Enter Mpesa Reference"></asp:TextBox>                                                                                              
                                                    </div>                                       
                                                </div>
                                            </div>
                                            <%--<input style="display: block" type="text" id="maref" placeholder="Enter Mpesa Reference" class="form-control mb20 mt10" name="ref">--%>
                                          <br/>
                                           
                                          <div class="panel-footer">
                                            <div class="row">
                                                <div class="col-sm-12 text-right">
                                                    <asp:Button ID="btnComplete" runat="server" Text="Complete" CssClass="btn btn-primary btn-sm btn-success" />
                                                    <asp:Button ID="btnCancelPay" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm btn-success" />  
                                                     <%--<button class="btn btn-success" onclick="PayMpesa('https://pesaflow.ecitizen.go.ke/PaymentAPI/Gateway.php', '19', 'PCEKAHD', '3Q4PL5', '150.00', 'https://brs.ecitizen.go.ke/payments/3Q4PL5/callback/success')">Complete</button>--%>
                                                    </div>
                                                </div>
                                              </div>
                                        </div>
                                  </asp:View> 
                                                                                                                                   
                                                                                                   
                              </asp:MultiView>
                         </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    
    
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

        function prevNxtMino() {
            var checkBox = document.getElementById('<%=Optional_NextofKin__c.ClientID%>');

            var minor = document.getElementById("NxtofKinminor");

            if (checkBox.checked == true) {
                minor.style.display = "block";
                //idDiv.style.display = "none";
            }
            else if (checkBox.checked == false) {
                minor.style.display = "none";
                //idDiv.style.display = "block";
            }
                   
        
        }

         function prevNxtMajor() {
             var checkBox = document.getElementById('<%=Optional_NextofKin__c.ClientID%>');

            document.getElementById("myNextofKinmajor").style.display = "block";
        }

        function ShowNextofkin() {
            var checkBox = document.getElementById('<%=Optional_NextofKin__c.ClientID%>');
                       
            var idMinor = document.getElementById("minorNxtofKin");
            var idDiv = document.getElementById("myNextofKin");            

            if (checkBox.checked == true) {
                idMinor.style.display = "block";
                idDiv.style.display = "none";                
            }
            else if (checkBox.checked == false) {
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

         function ShowTermsDiV() {
             var county = document.getElementById("dvTerms");
             county.style.display = "block";
         }
         function HideTermsDiV() {
             var county = document.getElementById("dvTerms");
             county.style.display = "none";
         }

         function refreshkin() {
             alert('Logical Error, you cant be born after today');
             minorNxtofKin();
         }

    </script>   

  <script type="text/javascript"></script>

</asp:Content>

 


            