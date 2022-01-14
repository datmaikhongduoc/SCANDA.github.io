<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View.aspx.cs" Inherits="WebApp.View" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Asset/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="grid-container">
        <div class="grid-item">
            <img id="my_image" src=""/>
            <div class="button-1">
                <button class="button">on</button>
                <button class="button">off</button>
            </div>
        </div>
        <div class="grid-item">2</div>
        <div class="grid-item">3</div>
        <div class="grid-item">4</div>
        <div class="grid-item">5</div>
        <div class="grid-item">6</div>
        <div class="grid-item">7</div>
        <div class="grid-item">8</div>
        <div class="grid-item">9</div>
    </div>
    </form>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script>
        DrawAll();
        function CheckStatus() {
            $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "View.aspx/GetDataError",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d == "ON") {
                            $("#my_image").attr("src", "Asset/img/PumpOn.png");
                        }
                        else {
                            $("#my_image").attr("src", "Asset/img/PumpOff.png");
                        }
                    }
                });
            });
        }

        function DrawAll() {
   
            CheckStatus();
        }
        var myVar = setInterval(function () { DrawAll(); }, 100);

    </script>
</body>
</html>
