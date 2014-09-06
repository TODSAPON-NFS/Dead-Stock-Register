<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="Welcome.aspx.vb" Inherits="_Default" title="Welcome to DSR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        #welcome
        {
            top: 3px;
            left: 0px;
            position: absolute;
            height: 20px;
            width: 1280px;
        }
        #kkk<a href="Welcome.aspx" > Welcome.aspx< /
        a >{{top:53px;left:4px;position:absolute;height:20px;width:758px;}
        #welcometxt
        {
            top: 60px;
            left: 55px;
            position: absolute;
            height: 24px;
            width: 1163px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <p style="top: 128px; left: 156px; position: absolute; height: 33px; width: 841px" 
        title="Welcome">
  
   &nbsp;<asp:Label ID="lbl_msg" runat="server" Font-Bold="True" 
            Font-Names="Maiandra GD" Font-Size="X-Large" Font-Underline="False"></asp:Label>
    
 </p>
 <div style="top: 243px; left: 209px; position: absolute; height: 340px; width: 834px">
 <H3>D.S.R. (Dead Stock Register) Overview</H3>
     Dead stock register of an institution holds the records of all the stock purchased under any department for e.g. it stores the details of each PC, printer, UPS etc. that the institution has purchased.  Earlier, management of such records meant maintenance of a number of registers which further implied that the responsible person would have to sit down turning pages of the book to find the details of a particular stock. Moreover, the backup of such a register would mean an unnecessary and tiring job of maintaining another register with exactly same contents.
     <br /><br />
     <h3>So, what is this project all about?</h3>
     We aim at providing an easy way out to maintain the D.S.R. which would provide a faster search, a backup of the database and at the same time keep the database safe by authorization. We hereby provide the users with an asp.net website that can be accessed from any computer connected in the intranet.
</div>
</asp:Content>

