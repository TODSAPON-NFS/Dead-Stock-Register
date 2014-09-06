<%@ Page Language="VB" MasterPageFile="~/MasterTS.master" AutoEventWireup="false" CodeFile="add.aspx.vb" Inherits="_Default" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div id="wiz" title="Add Stock">
    <div id = "Addlbldiv">
         <asp:Label ID="lbl_add" runat="server" Text="ADD STOCK" Font-Bold="True" 
             Font-Names="Maiandra GD" Font-Size="X-Large" ForeColor="#C04E4A"></asp:Label>
     </div>
     <div style="top: 317px; left: 729px; position: absolute; height: 40px; width: 220px">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </div>
        
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" Height="514px" 
            Font-Names="Century Gothic" Font-Size="Small" 
            
            
            
            
            
            style="text-align: left; z-index: -2; margin-top: 0px; top: 34px; left: 99px; position: absolute; width: 662px;">
        <StartNavigationTemplate>
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" 
                Text="Next" />
        </StartNavigationTemplate>
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" title="Component Information">
               <p style="height: 27px; width: 180px; top: 60px; left: 234px; position: absolute; margin-bottom: 19px;">

                   


                <asp:Label ID="Label4" runat="server" Text="Department Name  : "></asp:Label>

                   

            </p>
                <p style="height: 27px; width: 146px; top: 150px; left: 234px; position: absolute; margin-bottom: 19px;">
                    <asp:Label ID="Label2" runat="server" Text="Component Name  : "></asp:Label>
                </p>
                <div style="top: 223px; left: 370px; position: absolute; width: 57px; height: 20px; background-color: #000066;">
                    <center>
                        <asp:LinkButton ID="addcmpnt" runat="server" Font-Names="Cambria" 
                            Font-Size="Small" ForeColor="White">Add</asp:LinkButton>
                    </center>
                </div>
                <div style="height: 20px; width: 61px; top: 223px; left: 235px; position: absolute; background-color: #000066; ">
                    <center style="margin-bottom: 0px">
                        <asp:LinkButton ID="rmvcmpnt" runat="server" Font-Names="Cambria" 
                            Font-Size="Small" ForeColor="White">Remove</asp:LinkButton>
                    </center>
                </div>
                <p style="height: 27px; width: 166px; top: 270px; left: 234px; position: absolute; margin-bottom: 19px;">
                    <asp:Label ID="Label1" runat="server" Text="Component Detail  : "></asp:Label>
                </p>
                <asp:TextBox ID="Component_Detail" runat="server" 
                    style="z-index: 1; left: 234px; top: 310px; position: absolute; width: 265px; height: 126px;" 
                    TabIndex="3" TextMode="MultiLine"></asp:TextBox>
                <asp:DropDownList ID="cmpnt" runat="server" AutoPostBack="True" Enabled="False" 
                    style="top: 189px; left: 234px; position: absolute; height: 23px; width: 192px" 
                    TabIndex="2">
                    <asp:ListItem>[ SELECT COMPONENT]</asp:ListItem>
                </asp:DropDownList>
                <div style="height: 22px; width: 122px; top: 105px; left: 234px; position: absolute">
                    <asp:Label ID="dept" runat="server"></asp:Label>
                </div>
                <asp:DropDownList ID="Dept_name" runat="server" AutoPostBack="True" 
                    style="top: 101px; left: 234px; position: absolute; width: 192px" TabIndex="1">
                </asp:DropDownList>
                <asp:Panel ID="Panel1" runat="server" BorderStyle="None" 
                    BorderWidth="2px" 
                    
                    style="z-index: -5; left: 464px; top: 108px; position: absolute; height: 131px; width: 351px">
                    <div style="width: 149px; top: 28px; left: 20px; position: absolute; height: 22px">
                        <asp:Label ID="Label24" runat="server" Font-Bold="True" 
                            Font-Names="Book Antiqua" ForeColor="White" Text="Component Name : " 
                            style="font-size: medium"></asp:Label>
                    </div>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        
                        style="z-index: 1; left: 180px; top: 29px; position: absolute; bottom: 80px; width: 140px;" 
                        Font-Size="Medium"></asp:TextBox>
                    <asp:Button ID="Button4" runat="server" BackColor="#C3D5FD" BorderStyle="None" 
                        Font-Bold="True" ForeColor="#003399" 
                        style="z-index: 2; left: 141px; top: 96px; position: absolute; width: 66px" 
                        Text="ADD" />
                    <asp:Button ID="Button5" runat="server" BackColor="#CC0000" BorderStyle="None" 
                        Font-Bold="True" Font-Names="Copperplate Gothic Bold" ForeColor="White" 
                        style="z-index: 1; left: 317px; top: -14px; position: absolute; width: 23px; height: 18px" 
                        Text="X" />
                    <div style="top: 66px; left: 51px; position: absolute; height: 17px; width: 259px">
                        <asp:Label ID="Label25" runat="server" Font-Bold="True" ForeColor="Red" 
                            style="font-size: medium"></asp:Label>
                    </div>
                    <div id ="back">
                    <asp:Image ID="Image15" runat="server" ImageUrl="~/msgboxbk.jpg" 
              
                            style="height: 195px; top: -44px; left: -14px; position: absolute; width: 378px; border-style: Outset; background-color: #3333FF; z-index: -2;" />
                    </div>
                </asp:Panel>
                <p>
                </p>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Supplier Details">
                <asp:TextBox ID="city" runat="server" 
                    
                    
                    style="z-index: 1; left: 352px; top: 305px; position: absolute; width: 172px; height: 22px; right: 31px; margin-bottom: 0px;" 
                    TabIndex="3"></asp:TextBox>
                <asp:TextBox ID="pincode" runat="server" 
                    
                    
                    
                    style="z-index: 1; left: 353px; top: 357px; position: absolute; width: 171px; height: 22px;" 
                    TabIndex="4"></asp:TextBox>
                <asp:TextBox ID="Supplier_Name" runat="server" 
                    
                    
                    
                    style="z-index: 1; left: 264px; top: 88px; position: absolute; width: 266px; height: 22px;" 
                    TabIndex="1"></asp:TextBox>
                <p style="height: 27px; width: 146px; top: 132px; left: 261px; position: absolute; margin-bottom: 19px;">
                    
                    &nbsp;<asp:Label ID="Label10" runat="server" Text="Supplier Address  : "></asp:Label>
                    

                </p>
                <p style="margin: 0px; height: 21px; width: 86px; top: 308px; left: 265px; position: absolute; ">
                    <asp:Label ID="Label5" runat="server" Text="City  : "></asp:Label>
                </p>
                <div id="city_val_div">
                    <asp:CustomValidator ID="cv_city" runat="server" ControlToValidate="city" 
                        ErrorMessage="Invalid city" OnServerValidate="onlyText"><img 
                        height="22px" src="ierror1.png" width="22px" /></asp:CustomValidator>
                </div>
             <div id="pin_val_div">
                    <asp:CustomValidator runat="server" ControlToValidate="pincode" 
                        ErrorMessage="Invalid pincode" ID="cv_pincode" OnServerValidate="onlyNum"><img 
                        height="22px" src="ierror1.png" width="22px" /></asp:CustomValidator>

                </div>
                <p style="height: 27px; width: 146px; top: 54px; left: 264px; position: absolute; margin-bottom: 19px; bottom: 399px;">
                    <asp:Label ID="Label6" runat="server" Text="Supplier Name  : "></asp:Label>
                </p>
                <asp:TextBox ID="Supplier_Address" runat="server" 
                    style="z-index: 1; left: 259px; top: 170px; position: absolute; width: 266px; height: 98px; bottom: 231px;" 
                    TabIndex="2" TextMode="MultiLine"></asp:TextBox>
                <p style="margin: 0px; height: 22px; width: 82px; top: 357px; left: 264px; position: absolute; bottom: 135px;">
                    <asp:Label ID="Label8" runat="server" Text="Pincode : "></asp:Label>
                </p>
               
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" Title="Cost Details">
                <p style="margin: 0px; padding: 0px; height: 22px; width: 146px; top: 196px; left: 255px; position: absolute; ">
                    <asp:Label ID="Label11" runat="server" Text="Excise Duty :"></asp:Label>
                </p>
                <p style="margin: 0px; height: 22px; width: 146px; top: 77px; left: 254px; position: absolute; ">
                    *<asp:Label ID="Label12" runat="server" Text="Rate : "></asp:Label>
                </p>
                <p align="left" 
                    style="margin: 0px; height: 22px; width: 146px; top: 138px; left: 255px; position: absolute; ">
                    <asp:Label ID="Label9" runat="server" Text="Cost : "></asp:Label>
                </p>
                <asp:TextBox ID="Excise_duty" runat="server" 
                    style="z-index: 1; left: 369px; top: 194px; position: absolute; width: 115px; height: 22px; " 
                    TabIndex="4"></asp:TextBox>
                <asp:TextBox ID="cost" runat="server" AutoCompleteType="Disabled" 
                    Enabled="False" Font-Names="Andalus" ForeColor="#CC0000" 
                    style="z-index: 1; left: 339px; top: 135px; position: absolute; width: 144px; height: 22px; bottom: 342px;" 
                    TabIndex="3"></asp:TextBox>
                <asp:TextBox ID="Sales_Tac" runat="server" 
                    style="top: 261px; left: 369px; position: absolute; height: 22px; width: 115px; z-index: 1; right: 729px;" 
                    TabIndex="5"></asp:TextBox>
                <asp:TextBox ID="Extra_Charges" runat="server" 
                    style="z-index: 1; left: 369px; top: 332px; position: absolute; width: 115px; height: 22px;" 
                    TabIndex="6"></asp:TextBox>
                <div ID="rate_val_div">
                    <asp:CustomValidator ID="cv_rate" runat="server" ControlToValidate="Rate" 
                        ErrorMessage="Invalid rate" OnServerValidate="onlyNum"><img alt="Sorry" 
                        height="22px" src="ierror1.png" width="22px" />
                    </asp:CustomValidator>
                </div>
                <div style="width: 26px; top: 78px; left: 498px; position: absolute; height: 20px">
                <asp:RequiredFieldValidator id="rfv_rate" runat="server" ControlToValidate="Rate" 
                         ErrorMessage="Rate is Mandatory" SetFocusOnError="True"><img alt="Sorry" 
                        height="22px" src="ierror1.png" width="22px" /></asp:RequiredFieldValidator>
                </div>
                <div id="quan_val_div">
                    <asp:CustomValidator id="cv_quan" runat="server" ControlToValidate="Quantity" 
                        ErrorMessage="Invalid Quantity" OnServerValidate="onlyNum"><img alt="Sorry" 
                        height="22px" src="ierror1.png" width="22px" />
                    </asp:CustomValidator>
                </div>
                <div id ="req_quan_val">
                <asp:RequiredFieldValidator id="rfv_quan" runat="server" ControlToValidate="Quantity" 
                         ErrorMessage="Quantity is Mandatory" SetFocusOnError="True"><img alt="Sorry" 
                        height="22px" src="ierror1.png" width="22px" /></asp:RequiredFieldValidator>
                </div>
                <asp:TextBox ID="Rate" runat="server" 
                    style="z-index: 1; left: 339px; top: 77px; position: absolute; width: 144px; height: 22px;" 
                    TabIndex="2"></asp:TextBox>
                <asp:TextBox ID="Total_cost" runat="server" Enabled="False" 
                    style="z-index: 1; left: 369px; top: 396px; position: absolute; width: 115px; height: 22px;" 
                    TabIndex="7"></asp:TextBox>
                <p style="margin: 0px; height: 22px; width: 146px; top: 263px; left: 254px; position: absolute; ">
                    <asp:Label ID="Label13" runat="server" Text="Sales Tax : "></asp:Label>
                </p>
                <p style="margin: 0px; height: 23px; width: 146px; top: 333px; left: 254px; position: absolute; ">
                    <asp:Label ID="Label14" runat="server" Text="Extra  Charges  : "></asp:Label>
                </p>
                <p style="margin: 0px; height: 22px; width: 146px; top: 398px; left: 253px; position: absolute; ">
                    <asp:Label ID="Label15" runat="server" Text="Total Cost : "></asp:Label>
                </p>
                <asp:TextBox ID="Quantity" runat="server" 
                    style="z-index: 1; left: 412px; top: 26px; position: absolute; width: 71px; height: 22px; margin-bottom: 8px; right: 72px;" 
                    TabIndex="1"></asp:TextBox>
                <p style="margin: 0px; height: 22px; width: 157px; top: 28px; left: 253px; position: absolute; ">
                    *<asp:Label ID="Label3" runat="server" Text="Quantity Received : "></asp:Label>
                </p>
                <div ID="stax_div" 
                    style="width: 33px; top: 263px; left: 500px; position: absolute; height: 23px">
                    <asp:CustomValidator ID="cv_Stax" runat="server" ControlToValidate="Sales_Tac" 
                        ErrorMessage="Invalid Sales Tax" OnServerValidate="onlyNum"><img 
                        alt="Sorry" height="22px" src="ierror1.png" width="22px" />
                    </asp:CustomValidator>
                </div>
                <div ID="extra_chrgs">
                    <asp:CustomValidator ID="cv_extra_charges" runat="server" 
                        ControlToValidate="Extra_Charges" ErrorMessage="Invalid Extra Charges " 
                        OnServerValidate="onlyNum"><img alt="Sorry" height="22px" src="ierror1.png" 
                        width="22px" />
                    </asp:CustomValidator>
                </div>
                <div style="width: 35px; top: 192px; left: 499px; position: absolute; height: 26px">
                    <asp:CustomValidator ID="cv_ExciseDuty" runat="server" 
                        ControlToValidate="Excise_duty" ErrorMessage="Invalid Excise Duty" 
                        OnServerValidate="onlyNum"><img alt="Sorry" height="22px" src="ierror1.png" 
                        width="22px" />
                    </asp:CustomValidator>
                </div>
                <p>
                </p>
                <p>
                </p>
                <p>
                </p>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep4" runat="server" Title="Other Details">
                <p style="margin: 0px; height: 27px; width: 149px; top: 55px; left: 218px; position: absolute; ">
                    *<asp:Label ID="Label16" runat="server" Text="Date Of Purchase  : "></asp:Label>
                    <asp:Panel ID="dat0" runat="server" 
                        
                        
                        
                        
                        
                        style="z-index: 1; left: 324px; top: 184px; height: 22px; width: 198px; position: absolute">
                        <asp:DropDownList ID="dd0" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="48px" TabIndex="5">
                        </asp:DropDownList>
                        <asp:DropDownList ID="mm0" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="46px" TabIndex="6">
                        </asp:DropDownList>
                        <asp:DropDownList ID="YYYY0" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="70px" TabIndex="7">
                        </asp:DropDownList>
                    </asp:Panel>

                    <div id="billinv_div">
                        <asp:RequiredFieldValidator id="rfv_billinv" runat="server"
                         ErrorMessage="Invoice Bill Mandatory" ControlToValidate="Invoice_Bill_no" SetFocusOnError="True">
                         <img alt="Sorry" 
                            height="22px" src="ierror1.png" width="22px" />
                         </asp:RequiredFieldValidator>
                    </div> 
                         
                    <div id="dsr" style="font-family: Arial; font-size: medium; font-weight: bold">
                        <asp:Label ID="dsr_no" runat="server"></asp:Label>
                        &nbsp; &nbsp;
                        <asp:Label ID="dsr2" runat="server" Text="-"></asp:Label>
                        &nbsp; &nbsp; &nbsp;
                        <asp:Label ID="dsr_no1" runat="server"></asp:Label>
                    </div>
                    <asp:TextBox ID="Remarks" runat="server" 
                        style="z-index: 1; left: 247px; top: 416px; position: absolute; width: 301px; height: 49px;" 
                        TabIndex="9" TextMode="MultiLine"></asp:TextBox>
                    <p style="margin: 0px; width: 264px; top: 118px; left: 219px; position: absolute; height: 20px;">
                        <asp:Label ID="Label17" runat="server" Font-Names="Californian FB" 
                            Font-Size="Medium" Text="*Invoice Bill No./Cash Memo No.  : "></asp:Label>
                    </p>
                    <asp:TextBox ID="Invoice_Bill_no" runat="server" 
                        
                        
                        style="z-index: 1; left: 483px; top: 117px; position: absolute; width: 92px; height: 22px; bottom: 680px;" 
                        TabIndex="4"></asp:TextBox>
                    <p style="margin: 0px; width: 77px; height: 16px; top: 83px; left: 426px; position: absolute;">
                        <asp:Label ID="Label23" runat="server" Font-Size="X-Small" Text="dd/mm/yyyy"></asp:Label>
                    </p>
                    <p style="margin: 0px; height: 19px; width: 75px; top: 264px; left: 219px; position: absolute; bottom: 216px;">
                        *<asp:Label ID="Label19" runat="server" Text="Dsr No. :"></asp:Label>
                    </p>
                    <p style="margin: 0px; top: 215px; left: 359px; position: absolute; height: 0px; width: 78px;">
                        <asp:Label ID="Label22" runat="server" Font-Size="X-Small" Text="dd/mm/yyyy"></asp:Label>
                    </p>
                    <p style="margin: 0px; top: 382px; left: 219px; position: absolute; height: 20px; width: 80px; right: 256px;">
                        <asp:Label ID="Label21" runat="server" Text="Remarks :"></asp:Label>
                    </p>
                    <asp:Panel ID="dat" runat="server" 
                        style="z-index: 1; left: 383px; top: 55px; height: 22px; width: 195px; position: absolute">
                        <asp:DropDownList ID="dd" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="48px" TabIndex="1">
                        </asp:DropDownList>
                        <asp:DropDownList ID="mm" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="46px" TabIndex="2">
                        </asp:DropDownList>
                        <div style="z-index: 1; left: -165px; top: 130px; height: 20px; width: 84px; position: absolute">
                            <asp:Label ID="Label26" runat="server" Text="*Bill Date"></asp:Label>
                        </div>
                        <asp:DropDownList ID="YYYY" runat="server" AutoPostBack="True" Height="22px" 
                            ToolTip="dd-mm-yyyy" Width="71px" TabIndex="3">
                        </asp:DropDownList>
                    </asp:Panel>
                    <p style="margin: 0px; top: 331px; left: 220px; position: absolute; height: 18px; width: 107px;">
                        <asp:Label ID="Label20" runat="server" Text="Location  : "></asp:Label>
                    </p>
                    <asp:TextBox ID="Location" runat="server" 
                        style="top: 328px; left: 324px; position: absolute; height: 23px; width: 148px" 
                        TabIndex="8"></asp:TextBox>
                    <p>
                    </p>
                    <p>
                    </p>
                </p>
            </asp:WizardStep>
        </WizardSteps>
        <SideBarStyle Width="200px" Wrap="True" />
    </asp:Wizard>


                        <p __designer:mapid="2e1">
                    

                            &nbsp;</p>
        </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        #wiz
        {
            top: 44px;
            left: 108px;
            position: absolute;
            height: 499px;
            width: 765px;
            right: 741px;
            z-index: -6;
        }
        #dsr
        {
            top: 263px;
            left: 324px;
            position: absolute;
            height: 22px;
            width: 213px;
        }
        .newStyle1
        {
            margin: 0px;
            padding: 0px;
        }
        #Adduserlbldiv
        {
            top: 127px;
            left: 112px;
            position: absolute;
            height: 46px;
            width: 1614px;
        }
        #pin_val
        {
            top: 359px;
            left: 532px;
            position: absolute;
            height: 22px;
            width: 45px;
        }
        #pin_val0
        {
            top: 307px;
            left: 532px;
            position: absolute;
            height: 22px;
            width: 45px;
        }
        #city_val
        {
            width: 28px;
            top: 307px;
            left: 531px;
            position: absolute;
            height: 22px;
        }
        #quan_val
        {
            width: 39px;
            top: 56px;
            left: 555px;
            position: absolute;
            height: 22px;
        }
        #quan_val0
        {
            width: 39px;
            top: 108px;
            left: 555px;
            position: absolute;
            height: 22px;
        }
        #rate_val
        {
            width: 33px;
            top: 108px;
            left: 555px;
            position: absolute;
            height: 22px;
        }
        #quan_val_div
        {
            width: 42px;
            top: 26px;
            left: 500px;
            position: absolute;
            height: 22px;
        }
        #rate_val_div
        {
            width: 42px;
            top: 77px;
            left: 499px;
            position: absolute;
            height: 22px;
            right: 14px;
        }
        #city_val_div
        {
            width: 44px;
            top: 311px;
            left: 536px;
            position: absolute;
            height: 21px;
        }
        #pin_val_div
        {
            width: 25px;
            top: 359px;
            left: 537px;
            position: absolute;
            height: 22px;
        }
        #Excise_duty_div
        {
            width: 25px;
            top: 256px;
            left: 501px;
            position: absolute;
            height: 26px;
        }
        #extra_chrgs
        {
            top: 332px;
            left: 505px;
            position: absolute;
            height: 26px;
            width: 39px;
        }
        #billinv_div
        {
            width: 36px;
            top: 117px;
            left: 589px;
            position: absolute;
        }
        #req_val
        {
            width: 28px;
            top: 27px;
            left: 500px;
            position: absolute;
            height: 22px;
        }
        #req_quan_val
        {
            width: 27px;
            top: 27px;
            left: 500px;
            position: absolute;
            height: 22px;
        }
    #Addlbldiv
    {
        width: 174px;
        top: 6px;
        left: 51px;
        position: absolute;
        height: 29px;
    }
    </style>

</asp:Content>


