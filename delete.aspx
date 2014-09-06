<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="delete.aspx.vb" Inherits="delete" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    #dellbldiv
    {
        top: 19px;
        left: 24px;
        position: absolute;
        height: 37px;
        width: 1600px;
    }
        #all
        {
            top: 103px;
            left: 150px;
            position: absolute;
            height: 59px;
            width: 1614px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="all" title="Delete Stock">
    <p>
   <p style="top: 79px; left: 159px; position: absolute; height: 20px; width: 458px">
       <asp:Label ID="Label1" runat="server" 
           Text="ARE YOU SURE TO DELETE THE GROUP RECORD PERMANENTLY ?" 
           Font-Names="Batang" Font-Size="Small"></asp:Label>
  </p>
     <div id = "dellbldiv">
         <asp:Label ID="updtlbl" runat="server" Text="DELETE STOCK" Font-Bold="True" 
             Font-Names="Calibri" Font-Size="XX-Large" ForeColor="#0000E1"></asp:Label>
     </div>  
    </p>
    
      <div>
            <asp:Image ID="img_del" runat="server" ImageUrl="~/del.png" 
                
              
                
                style="z-index: 4; left: 758px; top: 79px; position: absolute; height: 20px; width: 23px" />
        <asp:Button ID="btn_delete" runat="server" Text="DELETE" 
        style="left: 645px; position: absolute; height: 31px; width: 145px; top: 75px" />
        </div>
        <asp:DetailsView ID="DetailsView1" runat="server" 
           
        style="z-index: 1; left: 174px; top: 141px; position: absolute; height: 91px; width: 307px; right: 1133px;" 
        CellPadding="5" CellSpacing="5" Font-Names="Batang" Font-Size="Small">
        </asp:DetailsView>
   </div>
</asp:Content>

