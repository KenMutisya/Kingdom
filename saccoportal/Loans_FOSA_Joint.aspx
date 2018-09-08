<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/JointMaster.Master" CodeBehind="Loans_FOSA_Joint.aspx.cs" Inherits="SACCOPortal.Loans_FOSA_Joint" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <p></p> 
  <div class="panel panel-default">
                <div class="panel-heading">Select a Loan to View Statement</div>
                <div class="panel-body">

                    <p>Select Loan Number: <asp:DropDownList ID="ddRepaidFOSA" runat="server" CssClass="form-control"></asp:DropDownList></p>
                    <asp:Button ID="btnView" runat="server" Text="View Statement" CssClass="btn btn-primary btn-lg" OnClick="btnView_Click" />
                </div>    
            </div>

   <div class="row">
        <iframe runat="server" id="pdfLoanStat" width="100%" height="500" ></iframe>
    </div>   
 </asp:Content>
