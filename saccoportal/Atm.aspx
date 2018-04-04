<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Atm.aspx.cs" MasterPageFile="Site.Master" Inherits="SACCOPortal.Atm" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" style="height: 40px"></div>
    <div class="row">

        <div class="col-md-6">
            
            <div class="panel panel-default">
                <div class="panel-heading">Request New ATM Card</div>
                <div class="panel-body">
                    Select Fosa Account <asp:DropDownList ID="ddFosaAccount_" runat="server" AppendDataBoundItems="true"></asp:DropDownList>

                    <asp:Button ID="atmApplications" runat="server" Text="Send" CssClass="btn btn-info btn-sm" OnClick="atmApplication__Click" />
                    <p></p>
                 <asp:GridView ID="AtmStatus" runat="server" CssClass="table table-condensed table-responsive table-striped" Width="100%">
                <Columns>
                    <asp:BoundField DataField="Account_No" HeaderText="Account No" />
                    <asp:BoundField DataField="Card_No" HeaderText="ATM No"/>
                    <asp:BoundField DataField="Date_Issued" HeaderText="Date issued"  DataFormatString="{0:dd/MM/yy}"/>
                    <asp:BoundField DataField="ATM_Expiry_Date" HeaderText="Expiry Date" DataFormatString="{0:dd/MM/yy}"/>
                    <asp:BoundField DataField="Card_Status" HeaderText="Status" />
                </Columns>
                </asp:GridView>
                </div>
               
            </div>

        </div>

        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">Block ATM Card</div>
                <div class="panel-body">
                    Select Fosa Account <asp:DropDownList ID="ddFosaAccount" runat="server"></asp:DropDownList>
                    <p></p>
                    <asp:TextBox ID="txtreasonforblocking" runat="server"  Height="87px" TextMode="MultiLine" Width="416px" CssClass="form-control resize_d"></asp:TextBox>
                    <p></p>
                    <asp:Button ID="ReasonForBlocking" runat="server" Text="Block ATM" CssClass="btn btn-info btn-lg" OnClick="ReasonForBlocking_Click" />
                </div>
            </div>
        </div>

    </div>
    

</asp:Content>
