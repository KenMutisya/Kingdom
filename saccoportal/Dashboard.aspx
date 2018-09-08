<%@ Page Title="Dashboard" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="SACCOPortal.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="height: 20px">&nbsp;</div>
    <div class="form-group">
        <style>
        /* Icon when the collapsible content is shown */
        .btn:after {
        font-family: "Glyphicons Halflings";
        content: "\e114";
        float: right;
        margin-left: 15px;
        }
        /* Icon when the collapsible content is hidden */
        .btn.collapsed:after {
        content: "\e080";
        }
        </style>
       <button type="button" class="btn btn-lg btn-info collapsed" data-toggle="collapse" data-target="#AccountBal">Click to View Account Balances</button>   
     </div>
    <br />
    <div id="AccountBal" class="collapse">
    <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box green-bg">
						<i class="fa fa-dollar"></i>
						<div class="count">KES. <%=Member.Share %></div>
						<div class="title">Share Capital</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box blue-bg">
						<i class="fa fa-bank"></i>
						<div class="count">KES. <%=Member.currentsavings %></div>
						<div class="title">Deposit Contributions</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box red-bg">
						<i class="fa fa-suitcase"></i>
						<div class="count">KES. <%=Member.totalloansoutstanding%></div>
						<div class="title">Outstanding Loans</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->	
				
				<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box brown-bg">
						<i class="fa fa-info-circle"></i>
						<div class="count">KES. <%= Member.interest%></div>
						<div class="title">Outstanding Interest</div>						
					</div>		
				</div>
			</div>
        </div>
    <br />

    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading text-danger"><i class="fa fa-user"></i><strong style="font-family:Tahoma">Welcome, <%=Member.Name %></strong></div>
                <div class="panel-body">
                    <div  class="alert alert-info fade in">
                        <h3 style="font-weight:bold; color:darkgreen; text-align:center;"><i class="glyphicon glyphicon-user"></i> Member Information</h3>
                    </div>
                    <table class="table table-responsive table-striped table-advance table-hover">
                        
                        <tr>
                            <td>Member Number:</td>
                            <td><%=Member.No %></td>
                        </tr>
                        <tr>
                            <td>Name: </td>
                            <td><%=Member.Name %></td>
                        </tr>
                       <%-- <tr>
                            <td>Staff Number:</td>
                            <td><%=Member.PersonalNumber %></td>
                        </tr>--%>
                        <tr>
                            <td>Account Category: </td>
                            <td><%=Member.Accountcategory %></td>
                        </tr>
                        <tr>
                            <td>Email Address: </td>
                            <td><%=Member.Email %></td>
                        </tr> 
                        <tr>
                            <td>Phone Number:</td>
                            <td><%=Member.MobileNo %></td>
                        </tr>                      
                       
                    </table>
        
                    
                </div>
            </div>
        </div>
         <div class="col-md-6">
              <div class="col-md-8">
         <div class="panel panel-default">
             <div class="panel-heading"><i class="fa fa-bar-chart"></i> <strong style="font-family:Trebuchet MS"> Progress analysis</strong> </div>
            <div class="panel-body"><div> <canvas id="bar" height="200" width="450"></canvas></div></div>
          </div>
         </div>

            <%--<div class="panel panel-default">
            
                <div class="panel-body">
                    <div id="Div2" class="alert alert-info fade in">
                    <h3 style="font-weight:bold; color:darkgreen; text-align:center;"> <i class="fa fa-list"></i> Mini Statement</h3>
                </div>
                    <asp:GridView ID="gvMinistatement" runat="server" DataFormatString = "{0:N2}" ItemStyle-HorizontalAlign = "Right" 
                        CssClass="table table-condensed table-responsive table-striped" Width="100%" GridLines="None"></asp:GridView>
                </div>
            </div>--%>
        </div>
        
   
    </div>
    <div class="row">                       
    </div>
    <div class="row">
          <%--<div class="col-md-4">
            <div class="panel panel-default">
               <div class="panel-heading"><i class="fa fa-bar-chart"></i><strong> Performance Summary</strong></div>
               <div class="panel-body"><div><canvas id="pie" ></canvas>
             </div>
               </div> 
            </div>
        </div>--%>

       <%-- <div class="col-md-8">
         <div class="panel panel-default">
             <div class="panel-heading"><i class="fa fa-bar-chart"></i> <strong style="font-family:Trebuchet MS">Progress analysis</strong> </div>
            <div class="panel-body"><div> <canvas id="bar" height="200" width="450"></canvas></div></div>
          </div>
         </div>--%>
  </div>

</asp:Content>

