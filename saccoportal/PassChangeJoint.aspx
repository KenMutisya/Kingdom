<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PassChangeJoint.aspx.cs" MasterPageFile="~/MemberReg.Master" Inherits="SACCOPortal.PassChangeJoint" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <div class="panel-body" style="margin-top:50px;">
         <div class="row">
         <div class="col-md-3"></div>
             <div class="col-md-6">
                 <asp:Label ID="lblError" runat="server" ForeColor="#FF3300" CssClass="text-center hidden"></asp:Label>
            <div class="panel panel-default">
                <div class="panel-heading text-danger"><i class="fa fa-user"></i>First Change your Password</div>
                <span class="text-left text-danger"><small><%=lblError.Text %></small></span>
                <div class="form-group form-inline">
                  
                                 <table style="width: 100%;">
                                <tr>
                                    <td><small>Current Password</small></td>
                                    <td><asp:TextBox ID="txtPasswordOld" runat="server" CssClass="form-control" placeholder="enter current password" TextMode="Password"></asp:TextBox></td>
                                </tr>
                                
                                <tr>
                                    <td><small>New Password</small></td>
                                    <td><asp:TextBox ID="txtPasswordNew" runat="server" CssClass="form-control" placeholder="enter new password" TextMode="Password"></asp:TextBox></td>
                                </tr>
                                
                                <tr>
                                    <td>Confirm Password</td>
                                    <td style="margin-left: 80px"><asp:TextBox ID="txtPasswordConfirm" runat="server" CssClass="form-control" placeholder="re-enter new password" TextMode="Password"></asp:TextBox></td>
                                </tr>
                                
                                <tr>
                                    <td>&nbsp;</td>
                                    <td style="margin-left: 80px">
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" OnClick="btnSubmit_Click" Text="Submit" />
                                        <%--<asp:Button ID="btnBack" runat="server" Text="Back" CssClass="btn btn-warning btn-sm" OnClick="btnBack_Click"></asp:Button>--%>
                                    </td>
                                </tr>
                            </table>
                    </div>
                </div>
            </div>
        </div>
     </div>
    

    <script type="text/javascript">
    function myFunction() {
    var txt;
    var r = confirm("Password Changed successfully!");
    if (r == true) {
        window.location.href = "Joint_Dashboard.aspx";
    } else {
        txt = "Cancelled!";
        }
    }
    </script>

 </asp:Content>