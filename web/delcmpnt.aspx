<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="delcmpnt.aspx.vb" Inherits="delcmpnt" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #Adduserlbldiv
        {
            top: 65px;
            left: 146px;
            position: absolute;
            height: 35px;
            width: 1614px;
        }
        #all
        {
            top: 86px;
            left: 84px;
            position: absolute;
            height: 379px;
            width: 647px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id ="page" style="height: 595px" title="Delete Component">
 <div id = "Adduserlbldiv">
         <asp:Label ID="lbl_chanpass" runat="server" Text="DELETE COMPONENT" Font-Bold="True" 
             Font-Names="Maiandra GD" Font-Size="X-Large" ForeColor="#C04E4A"></asp:Label>
     </div>
 
 <div id="all">
     <asp:DropDownList ID="cmpntddl" runat="server" 
         
         
         style="z-index: 1; left: 417px; top: 230px; position: absolute; width: 175px; height: 22px;" 
         AutoPostBack="True">
     </asp:DropDownList>
     <div style="left: 147px; position: absolute; height: 20px; width: 233px; z-index: 1; bottom: 125px">
     <asp:Label ID="selcmpntlbl" runat="server" Text="Select Component to Delete"></asp:Label>
     </div>
     <asp:Button ID="delbtn" runat="server" 
         style="z-index: 1; left: 324px; top: 302px; position: absolute; width: 120px; right: 203px; " 
         Text="Delete" />
         <div style="top: 176px; left: 150px; position: absolute; height: 23px; width: 207px">
     <asp:Label ID="Label1" runat="server" Text="Select Department"></asp:Label>
     </div>
     <asp:DropDownList ID="deptddl" runat="server" AutoPostBack="True" 
         
         style="z-index: 1; left: 417px; top: 174px; position: absolute; height: 22px; width: 175px">
     </asp:DropDownList>
     <div style="top: 120px; left: 150px; position: absolute; width: 444px">
     <asp:Label ID="resullbl" runat="server" Font-Bold="True" Font-Italic="False" 
             Font-Names="Cambria" Font-Size="Medium" ForeColor="#CC0000"></asp:Label>
     </div>
 </div>
 </div>
 </asp:Content>

