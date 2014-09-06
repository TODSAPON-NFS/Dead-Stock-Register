<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="deluser.aspx.vb" Inherits="deluser" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #page
        {
            top: 0px;
            left: 0px;
            position: absolute;
            height: 756px;
            width: 1280px;
            z-index: -3;
        }
        #Updtlbldiv
        {
            top: 312px;
            left: 37px;
            position: absolute;
            height: 37px;
            width: 1280px;
        }
        #deluserlbl_div
        {
            top: 6px;
            left: 82px;
            position: absolute;
            height: 37px;
            width: 1280px;
        }
        #all
        {
            top: 62px;
            left: 81px;
            position: absolute;
            height: 402px;
            width: 1280px;
        }
        #pnl_admin
        {
            height: 261px;
            top: 164px;
            left: 132px;
            position: absolute;
            width: 697px;
        }
        #div_shwusr
        {
            top: 292px;
            left: 186px;
            position: absolute;
            height: 201px;
            width: 551px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page" title="Delete User">
    <div id="all">
     <div id = "deluserlbl_div">
         <asp:Label ID="lbl_deluser" runat="server" Text="DELETE USER" Font-Bold="True" 
             Font-Names="Maiandra GD" Font-Size="X-Large" ForeColor="#C04E4A"></asp:Label>
     </div>  
    
  

        

    

<div style="top: 120px; left: 266px; position: absolute; height: 24px; width: 436px; z-index: 169;">
        <asp:Label ID="resultlbl" runat="server" Text="Label" ForeColor="Red" 
            Font-Bold="True" Font-Size="Large"></asp:Label>
        </div>
        <!--
        =================================================================
          THIS IS PANEL TO SHOW ADMIN AUTHEN
       ================================================================> < /!-->
        <div id="pnl_admin">
        <asp:Panel ID="pnl_admin" runat="server" Height="247px" 
                
                style="top: 5px; left: -36px; position: absolute; width: 759px; z-index: 172;">
            <div style="top: 19px; left: 71px; position: absolute; height: 19px; width: 538px; z-index: 1;">
    <asp:Label ID="Label2" runat="server" 
          Text="[ This activity requires administrative rights ]" ForeColor="Maroon" 
          Font-Italic="False" Font-Bold="True" Font-Size="Large"></asp:Label>
   </div> 
   <div style="height: 21px; width: 187px; top: 62px; left: 44px; position: absolute; z-index: 1;">
       <asp:Label ID="enterpass" runat="server" Text="Enter admin password: " 
           Font-Bold="True" ForeColor="White"></asp:Label>
   </div>

<div style="top: 141px; left: 162px; position: absolute; z-index: 1;">
    <asp:Label ID="invalidmsg" runat="server" Text="*INVALID PASSWORD" 
        ForeColor="White" Font-Italic="True" Font-Bold="True"></asp:Label>
   </div><asp:TextBox ID="TextBox1" runat="server" 
        
            
        
            style="z-index: 171; left: 294px; top: 60px; position: absolute; height: 25px; width: 145px;" 
            TextMode="Password" Font-Bold="True"></asp:TextBox>
            <asp:Button ID="submitbtn" runat="server" 
        style="z-index: 169; left: 202px; top: 99px; position: absolute; width: 93px" 
        Text="Submit" Font-Bold="True" />
            <asp:Image ID="Image15" runat="server" ImageUrl="~/authadmin.jpg" 
                
                style="top: -34px; left: -62px; position: absolute; height: 234px; width: 611px; z-index: -6;" />
        </asp:Panel>
        </div>
</div>

<!-- =====================================================================
     Panel to show user list
     ====================================================================> </!-->
        <div id="div_shwusr">
        <asp:Panel ID="pnl_showuser" runat="server" Height="199px" 
                BorderStyle="None" Visible="False" 
                style="top: -48px; left: -14px; position: absolute; width: 578px">
        <div style="height: 22px; width: 175px; top: 83px; left: 72px; position: absolute; right: 331px; z-index: 169;">
        <asp:Label ID="Label3" runat="server" Text="Select User to Delete" Font-Bold="True" 
                ForeColor="White"></asp:Label>
        </div>

        <asp:Button ID="Button1" runat="server" PostBackUrl="~/deluser.aspx" 
            style="z-index: 169; top: 134px; position: absolute; left: 226px; right: 291px; height: 29px;" 
            Text="Delete" Font-Bold="True" />
            <asp:DropDownList ID="userddl" runat="server" 
            style="z-index: 169; left: 267px; top: 83px; position: absolute; height: 23px; width: 153px" 
            AutoPostBack="True" Font-Bold="True">
        </asp:DropDownList>
            <asp:Image ID="Image16" runat="server" ImageUrl="~/msgboxbk.jpg" 
                
                style="width: 514px; top: 16px; left: 4px; position: absolute; height: 204px; z-index: -5;" />
            </asp:Panel>
        </div>
   </div>
</asp:Content>

