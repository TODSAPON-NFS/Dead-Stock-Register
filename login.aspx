<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DSR Login</title>
    <style type="text/css">
        #username
        {
            top: 27px;
            left: 49px;
            position: absolute;
            height: 21px;

            width: 103px;

        }

        #password

        {

            top: 73px;

            left: 50px;

            position: absolute; 

            height: 21px;

                right: 226px;

        }

        #flash
        {
            top: 95px;
            left: 35px;
            position: absolute;
            height: 533px;
            width: 528px;
            bottom: -152px;
        }

        #dsr_head
        {
            top: 27px;
            left: 310px;
            position: absolute;
            height: 32px;
            width: 768px;
        }

        #credit
        {
            top: 75px;
            left: 738px;
            position: absolute;
            height: 19px;
            width: 297px;
        }

    </style>

</head>

<body bgcolor="#d9d9d9"   >

    <form id="form1" runat="server">

   

<div id="flash">
<object>
<param name="movie" value="wdsr.swf">
<embed src="wdsr.swf" width="468" height="500">
</embed>
</object>

    
</div>
<div style="top: 76px; left: 640px; position: absolute; width: 571px; height: 416px">
<asp:Image ID="logindsr" runat="server" Height="487px" ImageUrl="~/logindsr.jpg" 
        Width="533px" />
</div>
    </p>

    <div id="dsr_head">

    <asp:Label ID="Label4" runat="server" 
            Text="DEAD STOCK REGISTER MANAGEMENT" Font-Bold="True" 
            Font-Names="Maiandra GD" Font-Size="XX-Large" ForeColor="Black"></asp:Label>
    </div>

    <div id="credit">

    <p style="width: 382px; color: #000000; top: 356px; left: -63px; position: absolute; height: 215px; margin-left: 40px; font-size: x-large; font-weight: bold; font-style: normal; font-family: 'Gill Sans MT';">

    <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--&nbsp; Credits 
        --</b><br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    Ankit Gupta<br />

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Anwar Shaikh<br />

   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G.K.Sudharshan
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pratham shah</p>

    </div>

    <div id="login part" 

    

        

        
        
        
        style="border: medium none #0099FF; top: 132px; left: 716px; position: absolute; height: 217px; width: 380px; color: #0000FF;">

    

    <div id="username">

            <asp:Label ID="Label1" runat="server" Text="Username" Font-Bold="True" 

            Font-Names="Eurostile" Font-Size="X-Large" ForeColor="White"></asp:Label>

    </div>

    

    <asp:TextBox ID="txtusername" runat="server" 

        style="z-index: 1; left: 192px; top: 34px; position: absolute; height: 22px; width: 144px;" 

        Font-Bold="True" Font-Names="Eurostile" Font-Size="Large" 

        Width="148px"></asp:TextBox>

    

    <div id="password" style="width: 104px;">

        <asp:Label ID="Label2" runat="server" Text="Password" Font-Bold="True" 

            Font-Names="Eurostile" Font-Size="X-Large" ForeColor="White"></asp:Label>

    </div>

    

    <asp:TextBox ID="txtpassword" runat="server" 

            style="z-index: 1; left: 191px; top: 75px; position: absolute; width: 145px; height: 24px; bottom: 118px;" 

        TextMode="Password" Font-Size="Large"></asp:TextBox>

    

    <asp:Button ID="Button1" runat="server" 

        style="z-index: 1; left: 145px; top: 142px; position: absolute; height: 27px; width: 114px; right: 121px;" 

        Text="Login" Font-Bold="True" Font-Names="Lucida Sans Unicode" 
            Font-Size="Medium" />

        <div style="width: 338px; top: 177px; left: 28px; position: absolute; height: 19px; font-size: medium; font-weight: bold; font-style: normal; font-family: 'Arial Rounded MT Bold';">

    

    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" 

                Font-Names="Cambria" ForeColor="#FF3300" Font-Size="Medium"></asp:Label>

    </div>

    </div>

    </form>

                                                                              

</body>

</html>








