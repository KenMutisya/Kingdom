<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoanCalculator.aspx.cs" Inherits="FundiLimo.LoanCalculator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" runat="server" id="lblError"></div>
    <div class="row">
        <div class="col-md-2 col-lg-2"></div>
        <div class="row col-md-2 col-lg-4"> <div class=" panel panel-default">
        <div class="panel-heading"><strong style="font-family:Tahoma">APPLICATION DETAILS</strong></div>
        <div class="panel-body">
        
            <label>Choose Loan Product</label>
    <asp:DropDownList runat="server" CssClass="form-control" ID="loanProduct" OnSelectedIndexChanged="loanProduct_SelectedIndexChanged" AutoPostBack="True" 
        />
            
        
            <label>Installments</label>
    <asp:DropDownList runat="server" CssClass="form-control" ID="installments"/>
            
        
          <label>  Loan Amount</label>
    <asp:TextBox runat="server" type="number" CssClass="form-control"  ID ="loanAmount"/>
        
            
        <div class="lead pull-right"><asp:Button runat="server" CssClass="btn btn-primary pull-right" Text="Calculate" name="calculate"/></div>
           </div>   
        </div></div>
        <div class="col-md-1 col-lg-1"></div>
  <div class="row col-md-2 col-lg-4"><div class="panel panel-default">
             
                 <div class="panel-heading"><strong style="font-family:Tahoma">LOAN DETAILS</strong></div>
             <div class="panel-body">
                 <div id="details" runat="server"> 
                 </div>
                 <table class='table table-responsive table-striped table-bordered table-condensed' style="font-family:Tahoma">
                 
                     </table>
             </div>
             
         </div>
  </div>
    </div>
    <div class="col-md-1 col-lg-1"></div>
         
    <div class="row">
                 <div id="calculations" runat="server">
                     
                 </div>
                   
    </div>
</asp:Content>
