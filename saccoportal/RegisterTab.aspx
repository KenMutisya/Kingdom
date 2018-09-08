<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterTab.aspx.cs" Inherits="SACCOPortal.RegisterTab" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="CSS/ui.tabs.css" rel="stylesheet" type="text/css" />
    <link href="CSS/ui.core.css" rel="stylesheet" type="text/css" />
    <link href="CSS/ui.theme.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.3.2.js" type="text/javascript"></script>
    <script src="Scripts/ui.core.js" type="text/javascript"></script>
    <script src="Scripts/ui.tabs.js" type="text/javascript"></script>
    
    <script type="text/javascript">
        $(document).ready(function() {
            $("#tabPanel").tabs();
            jumpToNextTab();
            var btnColl = { "Button1": "2", "Button2": "3", "Button3": "4" };
            $('.btn').click(function() {
                var tabNo = btnColl[this.id];
                $("#<%= currTab.ClientID %>").val(tabNo);
            });

        });

        function jumpToNextTab() {
            var tabid = $("#<%= currTab.ClientID %>").val();
            if (tabid !== '')
                $('#tabPanel').tabs("select", tabid);
        }

    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <asp:HiddenField ID="currTab" runat="server" />
    <asp:Panel ID="tabPanel" runat="server">
        <ul>
            <li><a href="#Panel1"><span>One</span></a></li>
            <li><a href="#Panel2"><span>Two</span></a></li>
            <li><a href="#Panel3"><span>Three</span></a></li>
            <li><a href="#Panel4"><span>Four</span></a></li>
        </ul>
        
        <asp:Panel ID="Panel1" runat="server">
            <p>Active tab when loaded:</p>
            <asp:Button ID="Button1" runat="server" Text="Submit and Jump to Next Tab" CssClass="btn" />
        </asp:Panel>
        
        <asp:Panel ID="Panel2" runat="server">
            Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet
            Lorem ipsum dolor sit amet, Lorem ipsum dolor sit amet
            <asp:Button ID="Button2" runat="server" Text="Submit and Jump to Next Tab" CssClass="btn" />
        </asp:Panel>
        
        <asp:Panel ID="Panel3" runat="server">
           tincidunt ut laoreet dolore magna aliquam erat volutpat.
           tincidunt ut laoreet dolore magna aliquam erat volutpat.
           tincidunt ut laoreet dolore magna aliquam erat volutpat.
            <asp:Button ID="Button3" runat="server" Text="Submit and Jump to Next Tab" CssClass="btn" />
        </asp:Panel>
        
       <asp:Panel ID="Panel4" runat="server">
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
            Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
            <asp:Button ID="Button4" runat="server" Text="Submit" CssClass="btn" />
        </asp:Panel>
    </asp:Panel>

    </form>
</body>
</html>
