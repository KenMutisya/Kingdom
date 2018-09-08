<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FosaStatement.aspx.cs" MasterPageFile="Site.Master" Inherits="SACCOPortal.FosaStatement" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">

        <div class="panel panel-default">
        <div class="panel-heading">Fosa Accounts:</div>
        <div class="panel-body">
            
         <asp:MultiView ID="FosaMultiview" runat="server">

         <asp:View ID="viewFosaStats" runat="server">
               <asp:GridView ID="tblFosaAccs" runat="server" CssClass="table table-condensed" Width="100%" AutoGenerateSelectButton="true" 
                 EmptyDataText="No Accounts Found!" OnSelectedIndexChanged="tblFosaAccs_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="No" HeaderText="FOSA No:" />
                    <asp:BoundField DataField="Name" HeaderText="Account Name:" />
                    <asp:BoundField DataField="Account_Type" HeaderText="Account Type:" />                    
                    <%--<asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                           <asp:LinkButton runat="server" ID="lnkViewStats" OnClick="lnkViewStats_Click" >View
                           </asp:LinkButton>
                        </ItemTemplate>                        
                    </asp:TemplateField>--%>
                </Columns>
                <SelectedRowStyle BackColor="#259EFF" BorderColor="#FF9966" /> 
                 </asp:GridView>
             </asp:View>

            <asp:View ID ="viewStatement" runat="server">
                <asp:Label ID="txtF" runat="server">Fosa Account:  </asp:Label><asp:Label ID="lblFosaAc" runat="server"></asp:Label>
                 <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <asp:Timer ID="timer1" runat="server" Interval="1000" OnTick="timer1_OnTick"></asp:Timer>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger controlid="timer1" eventname="Tick" />
                        </Triggers>
                        <ContentTemplate>
                                <asp:TextBox runat="server" ID="txtTimer" ReadOnly="True"></asp:TextBox>
                        </ContentTemplate>
                </asp:UpdatePanel>--%>
                <table style="width:100%" class="table table-condensed table-bordered">
                <tr><td>Date From:
                       <div class="input-group date">
                           <input type="text" id="txtSelStartD" runat="server" class="form-control" placeholder="From which date?"/><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                       </div> 
                    </td>
                    <td>To:
                         <div class="input-group date">
                           <input type="text" id="txtSelEndD" runat="server" class="form-control" placeholder="To which date?" /><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                       </div> 
                       </td>
                    <td><asp:Button ID="btnViewFState" runat="server" Text="View Statement" CssClass="btn btn-primary btn-sm" OnClick="btnViewFState_Click"/></td>
                </tr>

            </table>
                <div class="row">
                    <iframe runat="server" id="pdfReport" width="100%" height="500" ></iframe>
                </div>
        </asp:View>

             </asp:MultiView>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

