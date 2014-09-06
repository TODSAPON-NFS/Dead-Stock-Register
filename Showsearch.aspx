<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="Showsearch.aspx.vb" Inherits="Showsearch" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    #page
    {
        height: 0px;
            z-index: -2;
        }
</style>
</asp:Content>
  
  

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <script type="text/javascript">
  function CallPrint(strid)
  {
      var prtContent = document.getElementById(strid);
      var WinPrint = window.open('','','letf=0,top=0,width=400,height=400,toolbar=0,scrollbars=0,status=0');
      WinPrint.document.write(prtContent.innerHTML);
      //WinPrint.document.designMode=true;
      WinPrint.document.close();
      WinPrint.focus();
      WinPrint.print();
      WinPrint.close();
     
}
  </script>

   
        <div id="divprint" style="width: 1598px; height: 778px">
        <asp:GridView ID="dtgrd" runat="server" 
        
              style="z-index: 1; left: 95px; top: 161px; position: absolute; height: 133px; width: 178px; bottom: 332px; right: 1287px;" 
              AutoGenerateSelectButton="True" BackColor="White" 
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" AllowPaging="True" 
            AllowSorting="True" Font-Names="Calibri" Font-Size="Small" 
                HorizontalAlign="Center">
            <PagerSettings FirstPageText="" LastPageText="" NextPageText="" />
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <RowStyle ForeColor="#000066" HorizontalAlign="Center" 
                VerticalAlign="Middle" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" 
                Font-Names="Calibri" VerticalAlign="Middle" />
        <SelectedRowStyle Font-Names="Calibri" BackColor="#669999" Font-Bold="True" 
            ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BorderColor="White" />
    </asp:GridView>
            <div style="top: 127px; left: 370px; position: absolute; height: 21px; width: 305px; color: #FF0000; font-size: small;">
            <asp:Label ID="nodata" runat="server" Font-Bold="True" Font-Names="Arial" 
                    ForeColor="Black"></asp:Label>
            </div>
            <div style="top: 92px; left: 311px; position: absolute; height: 21px; width: 305px; color: #FF0000; font-size: small;">
            <asp:Label ID="lbl_err" runat="server"></asp:Label>
            </div>
            <asp:Image ID="img_updt" runat="server" ImageUrl="~/refresh.png" 
                
                style="z-index: 2; left: 487px; top: 28px; position: absolute; height: 21px; width: 23px" />
            <asp:Image ID="img_del0" runat="server" ImageUrl="~/print.png" 
                
                
                style="z-index: 4; left: 625px; top: 27px; position: absolute; height: 20px; width: 23px" />
            <asp:Image ID="img_del" runat="server" ImageUrl="~/ierror1.png" 
                
                style="z-index: 4; left: 345px; top: 27px; position: absolute; height: 20px; width: 23px" />
    
    <div id="page" title="Search Results">
<div>
    
        <asp:Button ID="btn_del" runat="server" 
            style="z-index: 2; left: 252px; top: 22px; position: absolute; height: 31px; width: 121px; right: 1241px" 
            Text="DELETE" />
</div>
<p>
        <asp:Button ID="btn_prnt" runat="server" 
            style="z-index: 1; left: 536px; top: 22px; position: absolute; width: 121px; height: 31px" 
            Text="PRINT" 
             />
 </p>
    <asp:Button ID="btn_updt" runat="server" 
        style="z-index: 1; left: 393px; top: 23px; position: absolute; height: 31px; width: 121px; right: 1100px;" 
        Text="UPDATE" />
        
</div>
    </div>
    
    </asp:Content>

