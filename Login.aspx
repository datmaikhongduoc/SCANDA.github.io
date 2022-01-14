<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApp.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="main/CSS/login.css" rel="stylesheet" />
    <title>Login</title>
</head>
<body>
    <div>
        <canvas id="canvas">
        </canvas>
        
        
        <div class="login-box">
            <h2>Login</h2>
          <form id="form1" runat="server">
           
                <div class="user-box">
                    <asp:TextBox ID="txtuser" runat="server" BackColor="Transparent"></asp:TextBox>
                    <label>Username</label>
                </div>
                <div class="user-box">
                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" BackColor="Transparent"></asp:TextBox>
                    <label>Password</label>
                </div>
                    <a id="press" onclick="clickMe()" onkeydown="enter()">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
 
                        <asp:Button ID="Button1" runat="server" Text="Submit" Height="100%" Width="100%" CssClass="aaa" BackColor="Transparent" BorderStyle="None" Font-Bold="True" Font-Size="20px" OnClick="Button1_Click" BorderColor="Black"/>
                    </a>
                    </form>
                    </div>
        </div>
        <script src="main/Script/login.js"></script>
    
</body>
</html>