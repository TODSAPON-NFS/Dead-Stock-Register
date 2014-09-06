<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="Adduser.aspx.vb" Inherits="Adduser" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #page
        {
            height: 598px;
        width: 1527px;
            top: 3px;
            left: 92px;
            position: absolute;
        }
        #user
        {
            top: 68px;
            left: 187px;
            position: absolute;
            height: 22px;
            width: 119px;
        }
        #seldept
        {
            top: 124px;
            left: 187px;
            position: absolute;
            bottom: 249px;
        }
        #pass1
        {
            top: 232px;
            left: 185px;
            position: absolute;
            height: 19px;
            width: 157px;
        }
        #valid1
        {
            height: 25px;
            width: 244px;
            top: 173px;
            left: 541px;
            position: absolute;
        }
    #Updtlbldiv
    {
        top: 127px;
        left: 35px;
        position: absolute;
        height: 37px;
        width: 1600px;
    }
    #Adduserlbldiv
    {
        top: 14px;
        left: 34px;
        position: absolute;
        height: 37px;
        width: 160px;
            margin-bottom: 1px;
        }
        #all
        {
            top: 91px;
            left: 75px;
            position: absolute;
            height: 470px;
            width: 1009px;
        }
        #ack_panel
        {
            top: 228px;
            left: 219px;
            position: absolute;
            height: 203px;
            width: 474px;
        }
        #main
        {
            top: 92px;
            left: 98px;
            height: 373px;
            width: 822px;
        }
    #cv_required
    {
        top: 70px;
        left: 532px;
        position: absolute;
        height: 20px;
        width: 822px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id ="page" style="z-index: 3" title="Add Users">

    
    
    <!-- ============================================================
     This is Panel for Showing the Acknowledge of Added User
    ============================================================= > </ !-->
    
    
    <asp:Panel ID="pnl_ack" runat="server" Visible="False" 
            
        
        
            
            
            style="top: 148px; left: 187px; position: absolute; width: 449px; height: 211px;">
    <div style="top: 68px; left: 92px; position: absolute; height: 52px; width: 251px">
        <asp:Label ID="lbl_uadded" runat="server" Font-Names="Arial Rounded MT Bold" 
            Text="Label"></asp:Label>
        </div>
        <asp:Button ID="btn_ok" runat="server" Text="OK" Width="89px" 
              
            style="top: 158px; left: 168px; position: absolute; height: 27px; width: 99px" />
          <asp:Image ID="Image15" runat="server" ImageUrl="~/msgboxbk.jpg" 
              
              
              
            style="height: 195px; top: 22px; left: -13px; position: absolute; width: 466px; border-style: Outset; background-color: #3333FF; z-index: -2;" />
        </asp:Panel>
    
    <!-- =================================================================
         This is new Panel for main pnl_main
         =================================================================
    ></ !-->
    
    <asp:Panel ID="pnl_main" runat="server" Height="338px" 
            style="z-index: 3; top: 69px; left: 58px; position: absolute; width: 1527px"><div id="user">
    <asp:Label ID="username" runat="server" Text="Username"></asp:Label>
<div id="pass" 
        
        
        style="top: 114px; left: 1px; position: absolute; height: 20px; width: 112px">
    <asp:Label ID="Label1" runat="server" Text="Password"></asp:Label>
  </div> 
    </div>
    <div id ="seldept">
    <asp:Label ID="Label2" runat="server" Text="Select Dept."></asp:Label>
    </div>
        <asp:TextBox ID="usertxt" runat="server" 
            
            
            
            style="z-index: 1; left: 363px; top: 69px; position: absolute; height: 22px; width: 146px" 
            AutoPostBack="True"></asp:TextBox>
        <asp:TextBox ID="passtxt" runat="server" 
            style="z-index: 1; left: 365px; top: 176px; position: absolute; height: 21px; width: 147px;" 
            TextMode="Password"></asp:TextBox>
        <asp:DropDownList ID="DEPTSEL" runat="server" 
            
            style="z-index: 1; left: 364px; top: 124px; position: absolute; width: 145px" 
            AutoPostBack="True">
        </asp:DropDownList>
        <asp:TextBox ID="pass1txt" runat="server" 
            style="z-index: 1; left: 368px; top: 231px; position: absolute; height: 20px; width: 139px;" 
            TextMode="Password"></asp:TextBox>
         <div id="pass1">   
        <asp:Label ID="pass1lbl" runat="server" Text="Confirm Password"></asp:Label></div>
        <div id="valid1">
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="passtxt" ControlToValidate="pass1txt" 
            ErrorMessage="* Retype password correctly"></asp:CompareValidator>
            </div>
        <asp:Button ID="Button1" runat="server" 
            style="z-index: 1; left: 341px; top: 296px; position: absolute; height: 27px; width: 84px; right: 1189px;" 
            Text="Submit" />
   
     <div style="top: 69px; left: 548px; position: absolute; height: 20px; width: 308px">
    <asp:Label ID="Label3" runat="server" Text="Label" ForeColor="#CC0000" 
             Visible="False"></asp:Label>
    </div>
    <div id="cv_required">
        <asp:RequiredFieldValidator ID="rv_uname" runat="server" 
            ControlToValidate="usertxt" SetFocusOnError="True">* Mandatory Field</asp:RequiredFieldValidator>
     </div>
        <div id="Adduserlbldiv">
            <asp:Label ID="lbl_adduser" runat="server" Font-Bold="True" 
                Font-Names="Maiandra GD" Font-Size="X-Large" ForeColor="#C04E4A" 
                Text="ADD USER"></asp:Label>
        </div>
    </asp:Panel>
    
    </div>
    <div id="main" style="z-index: 4">
    </div>
 

    <!-- ==============================================================
         End  of pnl_main
         =============================================================
         > < /!-->
    
</asp:Content>

