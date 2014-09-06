<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="Search.aspx.vb" Inherits="Search" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #page
        {
            height: 796px;
        top: 0px;
        left: 0px;
        position: absolute;
        width: 1280px;
    }
        .style1
        {
            height: 27px;
            width: 97px;
            top: 70px;
            left: 284px;
            position: absolute;
        }
        .style2
        {
            height: 27px;
            width: 53px;
            top: 168px;
            left: 203px;
            position: absolute;
        }
        .style4
        {
            z-index: -1;
            left: 415px;
            top: 65px;
            position: absolute;
            height: 23px;
            width: 224px;
            bottom: 445px;
        }
        .style5
        {
            height: 29px;
            width: 97px;
            top: 113px;
            left: 280px;
            position: absolute;
            margin-top: 0px;
        }
        .style6
        {
            z-index: 1;
            left: 410px;
            top: 113px;
            position: absolute;
            height: 25px;
            width: 230px;
        }
        .style7
        {
            z-index: 1;
            left: 595px;
            top: 169px;
            position: absolute;
            width: 185px;
            margin-top: 0px;
            bottom: 605px;
        }
        .style9
        {
            z-index: 1;
            left: 269px;
            top: 168px;
            position: absolute;
            height: 25px;
            width: 177px;
            bottom: 603px;
        }
        .style10
        {
            z-index: 1;
            left: 62px;
            top: 143px;
            position: absolute;
            width: 100px;
            height: 45px;
        }
        #TextArea1
        {
            z-index: 1;
            left: 311px;
            top: 0px;
            position: absolute;
            width: 208px;
        }
    #deptlbl
    {
        top: 70px;
        left: 413px;
        position: absolute;
        height: 20px;
        width: 185px;
    }
        #all
        {
            top: 141px;
            left: 67px;
            position: absolute;
            height: 539px;
            width: 1280px;
        }
        #deluserlbl_div
        {
            top: -83px;
            left: 91px;
            position: absolute;
            height: 46px;
            width: 1280px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page" title="Search">
    <div id="all">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="style7"></asp:TextBox>
    <p style="margin-top: 0px" class="style2">
        <asp:Label ID="Label4" runat="server" Text="Search"></asp:Label></p>
    <p class="style5">
        <asp:Label ID="Label2" runat="server" Text="Component"></asp:Label></p>
    <p style="margin-top: 0px; margin-bottom: 27px" class="style1">
        <asp:Label ID="Label1" runat="server" Text="Select Dept."></asp:Label>
        </p>
                <asp:DropDownList ID="searchby" runat="server" AutoPostBack="True" 
            Font-Names="Arabic Typesetting" Font-Size="Medium" CssClass="style9">
            <asp:ListItem>[ SEARCH TYPE ]</asp:ListItem>
                    <asp:ListItem>GROUP_ID</asp:ListItem>
            <asp:ListItem>DSR NO.</asp:ListItem>
            <asp:ListItem>LOCATION</asp:ListItem>
            <asp:ListItem>DATE OF PURCHASE</asp:ListItem>
            <asp:ListItem>MODEL DETAILS</asp:ListItem>
            <asp:ListItem>BILL NO.</asp:ListItem>
                    <asp:ListItem>MANUFACTURER</asp:ListItem>
                    <asp:ListItem>DATE OF UPDATED</asp:ListItem>
        </asp:DropDownList>
    
                <asp:DropDownList ID="compsel" runat="server" AutoPostBack="True" 
            Font-Names="Arabic Typesetting" Font-Size="Medium" 
            Enabled="False" CssClass="style6">
            <asp:ListItem>[ SELECT COMPONENT ]</asp:ListItem>
            <asp:ListItem>PC</asp:ListItem>
            <asp:ListItem>UPS</asp:ListItem>
            <asp:ListItem>PRINTER</asp:ListItem>
            <asp:ListItem>SCANNER</asp:ListItem>
            <asp:ListItem>MODEM</asp:ListItem>
                    <asp:ListItem>SWITCH</asp:ListItem>
                    <asp:ListItem>DYNAKIT</asp:ListItem>
                    <asp:ListItem>SOFTWARE</asp:ListItem>
        </asp:DropDownList>
    
                <asp:DropDownList ID="DEPTSEL" runat="server" AutoPostBack="True" 
            Font-Names="Arabic Typesetting" Font-Size="Medium" CssClass="style4">
        </asp:DropDownList>
        
    <p class="style1" style="margin-top: 0px; margin-bottom: 27px">
        <asp:Button ID="Button1" runat="server" 
            Text="Search" CssClass="style10" />
    </p>
    
    <asp:Panel ID="Panel1" runat="server" 
        
        
        style="z-index: 1; left: 93px; top: 333px; position: absolute; height: 159px; width: 528px" 
        Wrap="False">
        <asp:CheckBoxList ID="selecttyp" runat="server" 
        
            
            style="top: 4px; position: absolute; height: 139px; width: 503px; left: 4px" 
            RepeatColumns="3" CellSpacing="4" RepeatDirection="Horizontal">
            <asp:ListItem>Bill no.</asp:ListItem>
            <asp:ListItem>Component_details</asp:ListItem>
            <asp:ListItem>Cost</asp:ListItem>
            <asp:ListItem>Cost With Details</asp:ListItem>
            <asp:ListItem>Date of Purchase</asp:ListItem>
            <asp:ListItem>Date of Update</asp:ListItem>
            <asp:ListItem>Department</asp:ListItem>
            <asp:ListItem>Location</asp:ListItem>
            <asp:ListItem>Quantity Received</asp:ListItem>
            <asp:ListItem>Remarks</asp:ListItem>
            <asp:ListItem>Supplier Address</asp:ListItem>
            <asp:ListItem>Supplier Name</asp:ListItem>
            <asp:ListItem>Updated by</asp:ListItem>
        </asp:CheckBoxList>
    </asp:Panel>
        <p>
            &nbsp;</p>
    <div id= "deptlbl">
        <asp:Label ID="dept" runat="server" Text="Label"></asp:Label>
        </div>
        <asp:DropDownList ID="numoprtr" runat="server" 
            
            style="z-index: 1; left: 452px; top: 167px; position: absolute; height: 25px; width: 128px">
            <asp:ListItem>EQUAL TO</asp:ListItem>
            <asp:ListItem>GREATER THAN</asp:ListItem>
            <asp:ListItem>LESS THAN</asp:ListItem>
        </asp:DropDownList>
    <p>
        <asp:DropDownList ID="dtoprtr" runat="server" 
            
            style="z-index: 1; left: 452px; top: 167px; position: absolute; height: 25px; width: 128px">
            <asp:ListItem>ON</asp:ListItem>
            <asp:ListItem>AFTER</asp:ListItem>
            <asp:ListItem>BEFORE</asp:ListItem>
        </asp:DropDownList>
        <asp:RadioButtonList ID="rbl_grpind" runat="server" AutoPostBack="True" 
            Font-Names="Arial" Font-Size="X-Small" 
            style="top: 210px; left: 479px; position: absolute; height: 27px; width: 115px">
            <asp:ListItem Selected="True">GROUP</asp:ListItem>
            <asp:ListItem>INDIVIDUAL</asp:ListItem>
        </asp:RadioButtonList>
        </p>
     <div id = "deluserlbl_div">
         <asp:Label ID="lbl_deluser" runat="server" Text="SEARCH STOCK" Font-Bold="True" 
             Font-Names="Maiandra GD" Font-Size="X-Large" ForeColor="#C04E4A"></asp:Label>
     </div>  
        <asp:Panel ID="dat" runat="server" 
            
            style="z-index: 1; left: 590px; top: 171px; height: 22px; width: 229px; position: absolute">
            <asp:DropDownList ID="dd" runat="server" AutoPostBack="True" Height="22px" 
                ToolTip="dd-mm-yyyy" Width="48px">
            </asp:DropDownList>
            <asp:DropDownList ID="mm" runat="server" AutoPostBack="True" Height="22px" 
                ToolTip="dd-mm-yyyy" Width="46px">
            </asp:DropDownList>
            <asp:DropDownList ID="YYYY" runat="server" AutoPostBack="True" Height="22px" 
                ToolTip="dd-mm-yyyy" Width="70px">
            </asp:DropDownList>
        </asp:Panel>
    <p style="width: 731px; top: 275px; left: 88px; position: absolute; height: 42px; margin-bottom: 19px">
        &nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" Font-Names="Arial Black" 
            Font-Overline="False">+</asp:LinkButton>
        &nbsp;&nbsp; Advanced Show (<asp:Label ID="Label6" runat="server" Text="All"></asp:Label>
        )&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        </p>
</div>
</div>
</asp:Content>
