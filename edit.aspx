<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="Edit.aspx.vb" Inherits="Edit" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #page
        {
            height: 797px;
            top: 0px;
            left: 4px;
            position: absolute;
            width: 1276px;
            z-index: -2;
        }
        #dsrlbl
        {
            top: 249px;
            left: 13px;
            position: absolute;
            height: 19px;
            width: 188px;
        }
        #Updtlbldiv
        {
            top: -34px;
            left: -76px;
            position: absolute;
            height: 43px;
            width: 142px;
        }
        #typdiv
        {
            top: 192px;
            left: 14px;
            position: absolute;
            height: 20px;
            width: 40px;
        }
        #all
        {
            top: 52px;
            left: 193px;
            position: absolute;
            height: 59px;
            width: 1276px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="page" title="Update">
<div id="all">
<div style="top: 65px; left: 226px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="dop_lbl" runat="server" Text="Date of purchase"></asp:Label>
    <div style="top: 15px; left: 352px; position: relative; height: 20px; width: 400px">
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="Quantity received can take only integral values" ControlToValidate="quantity_box" 
            Operator="DataTypeCheck" SetFocusOnError="True" Type="Integer">- integers 
        only</asp:CompareValidator></div>
        <asp:Panel ID="pdat" runat="server" 
                        
        
        
        style="z-index: 1; left: 200px; top: 3px; height: 22px; width: 229px; position: absolute">
                        <asp:DropDownList ID="ddp" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="48px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="mmp" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="46px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="yyyyp" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="71px">
                        </asp:DropDownList>
                    </asp:Panel>
</div>
<div style="top: 98px; left: 225px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="quantity_lbl" runat="server" Text="Quantity Received"></asp:Label>
    <asp:TextBox ID="quantity_box" runat="server" text=""
    style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px" 
        CausesValidation="True" AutoPostBack="True"></asp:TextBox>

</div>
<div style="top: 164px; left: 224px; position: absolute; height: 26px; width: 411px">
    <asp:Label ID="details_lbl" runat="server" Text="Component details"></asp:Label>
    <asp:TextBox ID="details_box" runat="server" text=""
    style="top: -2px; left: 201px; position: absolute; height: 58px; width: 265px"></asp:TextBox>
</div>
<div style="top: 131px; left: 224px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="cmpnt_lbl0" runat="server" Text="Component Name"></asp:Label>
    <asp:DropDownList runat="server" AutoPostBack="True" Enabled="False" 
        TabIndex="2" ID="cmpnt" 
        style="top: -2px; left: 201px; position: absolute; height: 23px; width: 192px">
        <asp:ListItem>[ SELECT COMPONENT]</asp:ListItem>
    </asp:DropDownList>
</div>
<div style="top: 31px; left: 226px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="groupid_lbl" runat="server" Text="Group ID"></asp:Label>
    <asp:TextBox ID="grp_id_box" runat="server" text=""
    style="top: 0px; left: 200px; position: absolute; height: 22px; width: 117px" 
        Enabled="False" Font-Size="Large"></asp:TextBox>
</div>
<div style="top: 371px; left: 221px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="billno_lbl" runat="server" Text="Bill Number"></asp:Label>
    <asp:TextBox ID="billno_box" runat="server" text=""
    style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px"></asp:TextBox>
</div>
<div style="top: 536px; left: 221px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="salestax_lbl" runat="server" Text="Sales Tax"></asp:Label>
    <asp:TextBox ID="salestax_box" runat="server" text=""
    style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px" 
        AutoPostBack="True" CausesValidation="True"></asp:TextBox>
     
     <div style="top: 2px; left: 346px; position: absolute; height: 20px; width: 400px">
    <asp:CompareValidator ID="CompareValidator2" runat="server" 
            ErrorMessage="Sales tax is a numeric field" ControlToValidate="salestax_box" 
            Operator="DataTypeCheck" SetFocusOnError="True" Type="Double">- numeric field</asp:CompareValidator></div>
     </div> 
     <div id = "Updtlbldiv">
         <asp:Label ID="updtlbl" runat="server" Text="UPDATE " Font-Bold="True" 
             Font-Names="Maiandra GD" Font-Size="X-Large" ForeColor="#C04E4A"></asp:Label>
     </div>  
 <div id = "typdiv">
     <asp:Label ID="lbl_typ" runat="server" Text="Type"></asp:Label>
        <asp:RadioButtonList ID="rbl_grpind" runat="server" AutoPostBack="True" 
            Font-Names="Arial" Font-Size="X-Small" 
            
        
        
         style="top: -15px; left: 56px; position: absolute; height: 27px; width: 115px">
            <asp:ListItem Selected="True">GROUP</asp:ListItem>
            <asp:ListItem>INDIVIDUAL</asp:ListItem>
        </asp:RadioButtonList>
</div>
        <div id ="dsrlbl">
            <asp:Label ID="Lbl_dsr" runat="server" Text="DSR"></asp:Label>
           <asp:DropDownList ID="ddl_dsr" runat="server"   
        
                
                
                style="z-index: 1; left: 53px; top: -2px; position: absolute; height: 25px; width: 122px" 
                AutoPostBack="True">
    </asp:DropDownList>
        </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />
    

<div style="top: 438px; left: 222px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="cost_lbl" runat="server" Text="Cost"></asp:Label>
    <asp:TextBox ID="cost_box" runat="server" text=""
    style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px"></asp:TextBox>
    
    
</div>
<div style="top: 504px; left: 222px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="xtra_lbl" runat="server" Text="Extra Charges"></asp:Label>
    <asp:TextBox ID="xtra_box" runat="server" text=""
    style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px" 
        AutoPostBack="True" CausesValidation="True"></asp:TextBox>
    <div style="top: -17px; left: 346px; position: relative; height: 20px; width: 400px">
    <asp:CompareValidator ID="CompareValidator3" runat="server" 
            ErrorMessage="Extra charges is a numeric field" ControlToValidate="xtra_box" 
            Operator="DataTypeCheck" SetFocusOnError="True" Type="Double">- numeric 
        field</asp:CompareValidator></div>
</div>
<div style="top: 229px; left: 228px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="cmpny_lbl" runat="server" Text="Manufacturer Name"></asp:Label>
    <asp:TextBox ID="cmpny_box" runat="server" text=""
    style="top: 0px; left: 198px; position: absolute; height: 22px; width: 262px"></asp:TextBox>
</div>

<div style="top: 261px; left: 226px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="cmpny_add_lbl" runat="server" Text="Manufacturer Address"></asp:Label>
    <asp:TextBox ID="cmpny_add_box" runat="server" text=""
        
        
        
        style="top: 3px; left: 198px; position: absolute; height: 65px; width: 268px"></asp:TextBox>
</div>
<div style="top: 336px; left: 225px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="billdt_lbl" runat="server" Text="Bill Date"></asp:Label>
    <asp:Panel ID="dat" runat="server" 
                        
        
        
        style="z-index: 1; left: 198px; top: 0px; height: 22px; width: 229px; position: absolute">
                        <asp:DropDownList ID="dd" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="48px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="mm" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="46px">
                        </asp:DropDownList>
                        <asp:DropDownList ID="YYYY" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="71px">
                        </asp:DropDownList>
                    </asp:Panel>
</div>
<div style="top: 405px; left: 222px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="rate_lbl" runat="server" Text="Rate"></asp:Label>
    <asp:TextBox ID="rate_box" runat="server" text=""
        style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px" 
        AutoPostBack="True" CausesValidation="True"></asp:TextBox>
    <div style="top: -17px; left: 346px; position: relative; height: 20px; width: 400px">
    <asp:CompareValidator ID="CompareValidator4" runat="server" 
            ErrorMessage="Rate is a numeric field" ControlToValidate="rate_box" 
            Operator="DataTypeCheck" SetFocusOnError="True" Type="Double">- numeric 
        field</asp:CompareValidator></div>
</div>
<div style="top: 471px; left: 222px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="excise_lbl" runat="server" Text="Excise Duty"></asp:Label>
    <asp:TextBox ID="excise_box" runat="server" text=""    
    style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px" 
        AutoPostBack="True" CausesValidation="True"></asp:TextBox>
    <div style="top: -17px; left: 346px; position: relative; height: 20px; width: 400px">
    <asp:CompareValidator ID="CompareValidator5" runat="server" 
            ErrorMessage="Excise duty is a numeric field" ControlToValidate="excise_box" 
            Operator="DataTypeCheck" SetFocusOnError="True" Type="Double">- numeric 
        field</asp:CompareValidator></div>
</div>
<div style="top: 570px; left: 222px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="total_lbl" runat="server" Text="Total Cost"></asp:Label>
    <asp:TextBox ID="total_box" runat="server" text=""
        style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px"></asp:TextBox>
</div>
<div style="top: 603px; left: 222px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="loctn_lbl" runat="server" Text="Location"></asp:Label>
    <asp:TextBox ID="loctn_box" runat="server" text=""
        style="top: 0px; left: 200px; position: absolute; height: 22px; width: 128px"></asp:TextBox>
</div>
<div style="top: 669px; left: 223px; position: absolute; height: 26px; width: 400px">
    <asp:Label ID="rmrks_lbl" runat="server" Text="Remarks"></asp:Label>
    <asp:TextBox ID="rmrks_box" runat="server" text=""
        
        style="top: 0px; left: 200px; position: absolute; height: 42px; width: 177px" 
        TextMode="MultiLine"></asp:TextBox>
</div>
<div style="top: 636px; left: 222px; position: absolute; height: 26px; width: 400px">

    <asp:Label ID="dept_lbl" runat="server" Text="Department"></asp:Label>
<asp:DropDownList runat="server" AutoPostBack="True" TabIndex="1" 
        ID="Dept_name" 
        style="top: 2px; left: 201px; position: absolute; width: 192px">
    </asp:DropDownList>
    
    <div style="height: 22px; width: 122px; top: 3px; left: 200px; position: absolute">
        <asp:Label runat="server" ID="dept"></asp:Label>
    </div>
    
</div>
    <asp:Button ID="updt_btn" runat="server" 
        style="z-index: 1; left: 32px; top: 304px; position: absolute; height: 63px; width: 124px; right: 1120px;" 
        Text="Update" />
</div>
</div>
</div>
</asp:Content>

