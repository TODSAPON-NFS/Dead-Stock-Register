<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="changepass.aspx.vb" Inherits="changepass" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .Labelfnt
        {
            font-family: Calibri;
            font-size: large;
            color: #000000;
        }
        .txtfnt
        {
            font-family: Cambria;
            font-size: medium;
            color: #000000;
        }
        #Adduserlbldiv
        {
            top: 52px;
            left: 147px;
            position: absolute;
            height: 46px;
            width: 516px;
            margin-bottom: 0px;
        }
        #all
        {
            top: 80px;
            left: 21px;
            position: absolute;
            height: 22px;
            width: 1614px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id = "Adduserlbldiv" title="Change Password">
         <asp:Label ID="lbl_chanpass" runat="server" Text="CHANGE PASSWORD" Font-Bold="True" 
             Font-Names="Maiandra GD" Font-Size="X-Large" ForeColor="#C04E4A"></asp:Label>
     </div>
<div id="all">
    <div style="height: 690px; width: 1276px; z-index: -2; top: 0px; left: 0px; position: absolute; margin-left: 40px;">
<div style="top: 189px; left: 158px; position: absolute; height: 20px; margin-bottom: 0px; z-index: 1;">
    <asp:Label ID="unamelbl" runat="server" Text="Username :" CssClass="Labelfnt"></asp:Label>
</div>
    <asp:DropDownList ID="userddl" runat="server" 
        
        
        
            
            style="top: 192px; left: 316px; position: absolute; height: 24px; width: 136px; margin-bottom: 0px; z-index: 1;" 
            AutoPostBack="True" CssClass="txtfnt">
    </asp:DropDownList>
    <div style="top: 297px; left: 157px; position: absolute; height: 24px; width: 156px">
  
    <asp:Label ID="Label1" runat="server" Text="New Password :" CssClass="Labelfnt"></asp:Label>
    </div>
    <asp:TextBox ID="newpasstxt" runat="server" 
        
        
        
            style="z-index: 1; left: 315px; top: 297px; position: absolute; height: 21px; width: 134px; right: 827px;" 
            TextMode="Password" TabIndex="2"></asp:TextBox>
        <div style="top: 298px; left: 470px; position: absolute; height: 23px; width: 168px">
        <asp:Label ID="Label2" runat="server" Text="Confirm Password :" CssClass="Labelfnt"></asp:Label>
        </div>
    <asp:TextBox ID="newpass1txt" runat="server" 
        style="z-index: 1; left: 640px; top: 299px; position: absolute; height: 21px; width: 148px;" 
            TextMode="Password" TabIndex="3"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" 
        style="z-index: 1; left: 434px; top: 364px; position: absolute; width: 133px; height: 33px;" 
            Text="Submit" TabIndex="4" />
    <asp:Panel ID="oldpasspnl" runat="server" 
        
        
            
            
            style="z-index: 1; left: 120px; top: 232px; position: absolute; height: 47px; width: 371px; margin-top: 0px;">
        <div style="height: 26px; width: 154px; top: 9px; left: 36px; position: absolute">
        <asp:Label ID="Label3" runat="server" Text="Old Password :" CssClass="Labelfnt"></asp:Label>
        </div>
        <asp:TextBox ID="oldpasstxt" runat="server" 
            
            style="z-index: 1; left: 195px; top: 11px; position: absolute; width: 131px; height: 21px;" 
            TextMode="Password" TabIndex="1"></asp:TextBox>
    </asp:Panel>
    <div style="top: 189px; left: 315px; position: absolute; height: 20px; width: 121px">
    <asp:Label ID="seluserlbl" runat="server" Text="Label" CssClass="txtfnt"></asp:Label>
    </div>
    <div style="height: 21px; width: 204px; z-index: -2; top: 374px; left: 173px; position: absolute; margin-bottom: 0px">
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="Passwords do not Match" ControlToCompare="newpass1txt" 
            ControlToValidate="newpasstxt"></asp:CompareValidator>
           </div>
           <div style="height: 34px; width: 436px; z-index: -2; top: 106px; left: 221px; position: absolute"> 
        <asp:Label ID="resultlbl" runat="server" ForeColor="Red"></asp:Label>
        </div>
        <asp:Panel ID="Panel1" runat="server" 
            
            
            
            style="z-index: 1; left: 171px; top: 189px; position: absolute; height: 180px; width: 504px" 
            BorderStyle="None">
            <div style="top: 12px; left: 67px; position: absolute; height: 20px; width: 363px">
            <asp:Label ID="Label4" runat="server" 
                    Text="[ This Activity Requires Administrative Control ]" ForeColor="White" 
                    Font-Bold="True" Font-Italic="True" Font-Names="Calibri"></asp:Label>
            </div>
            <div style="z-index: 1; left: 77px; top: 83px; position: absolute; height: 20px; width: 216px">
                <asp:TextBox ID="adminpasstxt" runat="server" 
                    style="z-index: 1; left: 218px; top: -1px; position: absolute" 
                    TextMode="Password" TabIndex="1"></asp:TextBox>
            <asp:Label ID="Label5" runat="server" Text="Enter Admin Password" ForeColor="White" 
                    CssClass="Labelfnt" Font-Bold="True"></asp:Label>
            </div>
            <asp:Button ID="Button2" runat="server" 
                style="z-index: 1; left: 203px; top: 129px; position: absolute; height: 28px; width: 97px;" 
                Text="Submit" Font-Names="Corbel" TabIndex="2" Font-Bold="True" 
                Font-Size="Medium" />
            <div style="top: 48px; left: 138px; position: absolute; height: 20px; width: 232px">
            <asp:Label ID="adresl" runat="server" Font-Bold="False" Font-Italic="True" 
                    ForeColor="White"></asp:Label>
            </div>
            <asp:Image ID="Image15" runat="server" ForeColor="White" 
                ImageUrl="~/authadmin.jpg" 
                style="z-index: -3; left: -8px; top: -26px; position: absolute; height: 205px; width: 526px; border-style: None; margin-bottom: 0px" />
        </asp:Panel>
</div>
</div>
</asp:Content>

