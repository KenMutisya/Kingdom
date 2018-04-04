<%@ Page Title="Dashboard" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dashboard.aspx.cs" Inherits="SACCOPortal.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="height: 20px">&nbsp;</div>
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
					<div class="info-box brown-bg">
						<i class="fa fa-suitcase"></i>
						<div class="count">KES. <asp:Label runat="server" ID="lblLoanBal"></asp:Label></div>
						<div class="title">Outstanding Loans Bal</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->	
				
				<%--<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
					<div class="info-box brown-bg">
						<i class="fa fa-suitcase"></i>
						<div class="count">KES. <%= Member.interest %></div>
						<div class="title">Interest Paid</div>						
					</div><!--/.info-box-->			
				</div><!--/.col-->--%>
				
				
				
			</div><!--/.row-->
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <%--<div class="panel-heading text-danger"><i class="fa fa-user"></i><strong style="font-family:Tahoma">Welcome, <%=Member.Name %></strong></div>--%>
                <div class="panel-body">
                    <div  class="alert alert-info fade in">
                        <h3 style="font-weight:bold; color:darkgreen; text-align:center;"><i class="glyphicon glyphicon-user"></i> &nbsp Member Information</h3>
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
                       
                    </table>
        
                    
                </div>
            </div>
        </div>
         <div class="col-md-6">

            <div class="panel panel-default">
            
                <div class="panel-body">
                    <div id="Div2" class="alert alert-info fade in">
                    <h3 style="font-weight:bold; color:darkgreen; text-align:center;"> <i class="fa fa-list"></i>&nbsp Mini Statement</h3>
                </div>
                    <asp:GridView ID="gvMinistatement" runat="server" DataFormatString = "{0:N2}" ItemStyle-HorizontalAlign = "Right" 
                        CssClass="table table-condensed table-responsive table-striped" Width="100%" GridLines="None"></asp:GridView>
                </div>
            </div>
        </div>
        
   
    </div>
    <div class="row">                       
    </div>
    <div class="row">
          <div class="col-md-4">
            <div class="panel panel-default">
               <div class="panel-heading"><i class="fa fa-bar-chart"></i><strong> Performance Summary</strong></div>
               <div class="panel-body"><div><canvas id="pie" ></canvas>
             </div>
               </div> 
            </div>
        </div>

        <div class="col-md-8">
         <div class="panel panel-default">
             <div class="panel-heading"><i class="fa fa-bar-chart"></i> <strong style="font-family:Trebuchet MS">Progress analysis</strong> </div>
            <div class="panel-body"><div> <canvas id="bar" height="200" width="450"></canvas></div></div>
          </div>
         </div>
  </div>

</asp:Content>

