<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/JointMaster.Master" CodeBehind="FeedbackJoint.aspx.cs" Inherits="SACCOPortal.FeedbackJoint" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 
    <div class="panel-body">
      <div class="form-horizontal">
        <h4>Enter your Feedback</h4>
        <hr />
      <div class="form-group">
          <asp:TextBox ID="txtfeedback" runat="server" placeholder="Enter your Feedback" TextMode="MultiLine" CssClass="form-control"></asp:TextBox> 
      </div>
      <div class="form-group">
          <asp:Button ID="btnsendback" runat="server" Text="Send FeedBack" CssClass="btn btn-warning btn-sm" Enabled="true" OnClick="btnsendback_Click" />
          <asp:Button ID="bntviewfeed" runat="server" Text="   Refresh  " CssClass="btn btn-warning btn-sm" OnClick="bntviewfeed_Click" />    
      </div>
      </div>
        <br />
        <br />

        <div class="row">
            <div class="col-sm-8">
               <div class="panel panel-default">            
                <div class="panel-body">
                    <div id="Div2" class="alert alert-info fade in">
                    <h3 style="font-weight:bold; color:darkgreen; text-align:center;"> <i class="fa fa-list"></i>&nbsp Chat History</h3>
                </div>
                    <asp:GridView ID="gvMinistatement" runat="server" DataFormatString = "{0:N2}" ItemStyle-HorizontalAlign = "Right" 
                        CssClass="table table-condensed table-responsive table-striped" Width="100%" GridLines="None"></asp:GridView>
                </div>
            </div> 
            </div>             
        </div>         
         
    </div>
    <script>
        //$('#btnsendback').on('click', function () {
        //    $(this).val('Please wait ...')
        //      .attr('disabled', 'disabled');
        //    $('#theform').submit();
        //});

        //$('#theform').submit(function () {
        //    $("input[type='submit']", this)
        //      .val("Please Wait...")
        //      .attr('disabled', 'disabled');

        //    return true;
        //});

        $("#btnsendback").attr("disabled", true);
    </script>

     <script type="text/javascript">
        function myFunction() {
        var txt;
        var r = confirm("Feedback send succcessfully");
        if (r == true) {
            window.location.href = "FeedbackJoint.aspx";
        } else {
            txt = "Cancelled!";
            }
        }
    </script>

</asp:Content>

