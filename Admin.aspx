<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApp.Admin" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css"/>
    <title>SCADA</title>
</head>
<body>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Josefin+Sans&display=swap');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
}

body{
   background-color: #f3f5f9;
}

.wrapper{
  display: flex;
  position: relative;
}

.wrapper .sidebar{
  width: 200px;
  height: 100%;
  background: #4b4276;
  padding: 30px 0px;
  position: fixed;
}

.wrapper .sidebar h2{
  color: #fff;
  text-transform: uppercase;
  text-align: center;
  margin-bottom: 30px;
}

.wrapper .sidebar ul li{
  padding: 15px;
  border-bottom: 1px solid #bdb8d7;
  border-bottom: 1px solid rgba(0,0,0,0.05);
  border-top: 1px solid rgba(255,255,255,0.05);
}    

.wrapper .sidebar ul li a{
  color: #bdb8d7;
  display: block;
}

.wrapper .sidebar ul li a .fas{
  width: 25px;
}

.wrapper .sidebar ul li:hover{
  background-color: #594f8d;
}
    
.wrapper .sidebar ul li:hover a{
  color: #fff;
}
 
.wrapper .sidebar .social_media{
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
}

.wrapper .sidebar .social_media a{
  display: block;
  width: 40px;
  background: #594f8d;
  height: 40px;
  line-height: 45px;
  text-align: center;
  margin: 0 5px;
  color: #bdb8d7;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}

.wrapper .main_content{
  width: 100%;
  margin-left: 200px;
}

.wrapper .main_content .header{
  padding: 20px;
  background: #fff;
  color: #717171;
  border-bottom: 1px solid #e0e4e8;
}

.wrapper .main_content .info{
  margin: 20px;
  color: #717171;
  line-height: 25px;
}

.wrapper .main_content .info div{
  margin-bottom: 20px;
}

.icon, .icon_nav{
  font-size: 2rem;
}
.icon_nav{
  padding-right: 1rem;
  padding-top: 1rem;
}
.header{
  text-align: center;
}
.container{
  padding: 3rem;
}
.item{
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  
  column-gap: 2rem;
  
}
.cb{
  background-color: rgb(212, 219, 221);
  border-radius: 10px;
  width: 380px;
  height: 350px;
  padding: 1rem;
}
.chart{
  border:solid;
  width: 350px;
  height: auto;
}
#chart-1,#chart-2,#chart-3{
    width: auto;
    height:auto;
}
.grid{
  display: grid;
  grid-template-columns: repeat(6, 1fr);
  gap: 2rem;
  column-gap: 3rem;
}
.name_CB{
  padding: 1rem 0;
}
.dev{
  background: linear-gradient(rgb(206, 209, 49),rgb(188, 216, 121));
  width: 120px;
  height: 100px;
  position: relative;
  bottom: 50px;
  text-align: center;
  padding-top: 40px;
}
.small{
  background-color: #c3c1ce;
  width: 220px;
  height: max-content;
  padding: 0.5rem;
  display: flex;
}
.name_{
  padding: 0.5rem 1rem ;
}
.gridview{
  background-color: #594f8d;
}
.control{
  background-color: #FFF;
}
.waring{
  background-color: yellowgreen;
}
#Precipi{

    border : solid #fff;
    border-radius : 10px;
    width:max-content;
    height:max-content;
    padding: 0.5rem;
    bottom : 5rem;
 }
#Humidity{

    border : solid #fff;
    border-radius : 10px;
    width:max-content;
    height:max-content;
    padding: 0.5rem;
    bottom : 5rem;
    
}
#Airspeed{
    border : solid #fff;
    border-radius : 10px;
    width:max-content;
    height:max-content;
    padding: 0.5rem;
    bottom : 5rem;
    
}

#ChipLevel{
    border : solid #fff;
    border-radius : 10px;
    width:max-content;
    height:max-content;
    padding: 0.5rem;
    bottom : 5rem;
    
}
.control{
    text-align: left;
}
.button{
    margin: 2rem;
    padding: 0.5rem;
    border : double;
    border-radius:8px;
}
.button-tpt{
    margin: 0.5rem;
    padding:0.5rem;
    border : double;
    border-radius:8px;
}
.gridview_{
    padding: 2rem 0;
}
.manual{
  display: grid;
  grid-template-columns: auto auto auto ;
  gap: 40px;
  justify-content: center;
  column-gap: 40px;
  
  
}


.fix_{
  background-color: #fff;
  text-align: center;
  padding: 1rem;
  border-radius: 10px;
  border: double;
  box-shadow: 10px 10px  rgb(212, 219, 221);
}
.buttonn{
  padding: 0.5rem 1rem;
  margin: 5px 0;
  border-radius: 5px;
  background-color: white;
}

.gray:hover{
  background-color: green;
}

.black:hover{
 background-color: red;
}
.img_toggle{
  width: 250px;
  height: 250px;
  margin-left: auto;
  margin-right: auto;
 
}
.text-box{
    padding: .5rem;
    width: 100px;
    border: solid;
     border-radius: 10px;
}
.none_icon{
    display:none;
}
#Label11{
    display:none;
}
.error_fix{
    width: 100px;
    height: 50px;
}
#Error{
    color:red;
    font-size:20px;
}
   </style>
 <form id="form1" runat="server">
                      <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="wrapper">
      <div class="sidebar">
          <h2>Sidebar</h2>
          <ul>
              <li><a href="#giamsat"><i class="uil uil-airplay icon_nav"></i>Giám Sát</a></li>
              <li><a href="#baocao"><i class="uil uil-bag icon_nav"></i>Dữ liệu-Xuất Báo Cáo</a></li>
              <li><a href="#control"><i class="uil uil-wifi-router icon_nav"></i>Điều Khiển</a></li>
              <li> <a href="#canhbao"><i id="Error" ></i></a></li>
              
          </ul> 
          <div class="social_media">
            
            <asp:Button ID="LogOut" runat="server" CssClass="uil uil-align-justify icon_nav" Text="Logout" BorderStyle="None" BackColor="Transparent" OnClick="LogOut_Click" />
            
        </div>
      </div>
    
            <div class="main_content">
                <div class="header"> HE THONG TEAM 8 </div>  
                <%-- giam sat --%>
                <div class="container item" id="giamsat">
                <div class="CB1 cb">
                  <div class="chart">
                       <div id="Chart-1"></div>
                  </div>
                  <h3 class="name_CB">Temperature 01</h3>
                </div>
                <div class="CB2 cb">
                  <div class="chart">
                       <div id="Chart-2"></div>
                  </div>
                  <h3 class="name_CB">Temperature 02</h3>
                  
                </div>
               
                <div class="CB3 cb">
                  <div class="chart">
                       <div id="Chart-3"></div>
                  </div>
                  <h3 class="name_CB">Temperature 03</h3>
                </div>
            </div>
          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
              
              <ContentTemplate>
                                        <%-- bao cao --%>
               <div class="container grid" id="baocao">
                <div class="presure small">
                  <div class="dev">
                      <span id="Precipi">cc</span>
                  </div>
                  <h3 class="name_">Precipi</h3>
                </div>
                <div class="airflow small">
                  <div class="dev">
                      <span id="Humidity">cc</span>
                      
                  </div>
                  <h3 class="name_">Humidity</h3>
                </div>
                <div class="airspeed small">
                  <div class="dev">
                      <span id="Airspeed">cc</span>
                  </div>
                  <h3 class="name_">Airspeed</h3>
                </div>
                <div class="chipLevel small">
                  <div class="dev">
                      <span id="ChipLevel">cc</span>
                  </div>
                  <h3 class="name_" >Chip Level</h3>
                </div>
              </div>
              </ContentTemplate>
          </asp:UpdatePanel>
           
          

        
                                        <%-- du lieu  --%><%--                  <div class="gridview container" id="dulieu">
                <h3>Data Log</h3>

                      <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                          <ContentTemplate>
                  <div class="gridview_">
                      <asp:GridView ID="GvData" runat="server" AutoGenerateColumns="False">
                      </asp:GridView>
                  </div>

                          </ContentTemplate>
                      </asp:UpdatePanel>

             
                      </div>--%><%-- canh bao --%>
                  <div class="container waring " id="canhbao">
                      <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                          <ContentTemplate>

                    
                <h3>CANH BAO LOI<asp:Button ID="btnRefresh" CssClass="buttonn gray" runat="server" OnClick="btnRefresh_Click" Text="Refresh" />
                      </h3>
      </ContentTemplate>
                      </asp:UpdatePanel>

                      <asp:GridView ID="GvError" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" Height="100%" Width="100%" style="text-align: center">
                          <Columns>
                              <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" />
                              <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                              <asp:BoundField DataField="Error" HeaderText="Error" SortExpression="Error" />
                              <asp:BoundField DataField="TimeError" HeaderText="TimeError" SortExpression="TimeError" />
                          </Columns>
                          <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                          <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                          <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                          <RowStyle BackColor="White" ForeColor="#330099" />
                          <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                          <SortedAscendingCellStyle BackColor="#FEFCEB" />
                          <SortedAscendingHeaderStyle BackColor="#AF0101" />
                          <SortedDescendingCellStyle BackColor="#F6F0C0" />
                          <SortedDescendingHeaderStyle BackColor="#7E0000" />
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Data_SensorConnectionString %>" SelectCommand="SELECT * FROM [Alert] ORDER BY [TimeError] DESC"></asp:SqlDataSource>
              </div>
                <%-- control--%>
                  <div class="control container" id="dieukhien">
            <h3 class="tieude">DIEU KHIEN</h3>
            <div class="control-grid">
              <div class="manual">
                <div class="item_1 fix_">
                  <h3>TEM 01</h3>
                    <div class="img_toggle">
                        <img id="Pump1" src="" />
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:Button ID="OnPump1" CssClass="buttonn gray" runat="server" Text="ON" OnClick="OnPump1_Click" />
                            <asp:Button ID="OffPump1" CssClass="buttonn black" runat="server" Text="OFF" OnClick="OffPump1_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>

                <div class="item_2 fix_">
                  <h3>TEM 02</h3>
                  <div class="img_toggle" >
                        <img id="Pump2" src="" />
                      
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                    <asp:Button ID="OnPump2" CssClass="buttonn gray" runat="server" Text="ON" OnClick="OnPump2_Click" />
                    <asp:Button ID="OffPump2" CssClass="buttonn black" runat="server" Text="OFF" OnClick="OffPump2_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>

                <div class="item_3 fix_">
                  <h3>TEM 03</h3>
                  <div class="img_toggle" >
                        <img id="Pump3" src="" />
                      
                  </div>
                    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                        <ContentTemplate>
                    <asp:Button ID="OnPump3" CssClass="buttonn gray" runat="server" Text="ON" OnClick="OnPump3_Click" />
                    <asp:Button ID="OffPump3" CssClass="buttonn black" runat="server" Text="OFF" OnClick="OffPump3_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>

                <div class="item_4 fix_">
                  <h3>PRE 01</h3>
                  <div class="img_toggle">
                        <img id="Pump4" src="" />                      
                  </div>
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                    <asp:Button ID="OnFan1" CssClass="buttonn gray" runat="server" Text="ON" OnClick="OnFan1_Click" />
                    <asp:Button ID="OffFan1" CssClass="buttonn black" runat="server" Text="OFF" OnClick="OffFan1_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <div class="item_5 fix_">
                  <h3>AIR F11</h3>
                  <div class="img_toggle">
                        <img id="Pump5" src="" />
                      
                  </div>
                    <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                        <ContentTemplate>
                    <asp:Button ID="OnFan2" CssClass="buttonn gray" runat="server" Text="ON" OnClick="OnFan2_Click" />
                    <asp:Button ID="OffFan2" CssClass="buttonn black" runat="server" Text="OFF" OnClick="OffFan2_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>

              <div class="item_6 fix_">
                  <h3>AIR S111</h3>
                  <div class="img_toggle" >
                        <img id="Pump6" src="" />
                      
                  </div>
                    <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                        <ContentTemplate>
                    <asp:Button ID="OnFan3" CssClass="buttonn gray" runat="server" Text="ON" OnClick="OnFan3_Click" />
                    <asp:Button ID="OffFan3" CssClass="buttonn black" runat="server" Text="OFF" OnClick="OffFan3_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>

                 
                </div>

   
                                          <div class="item_7 fix_">
                  <h3>Autooto</h3>
                  <div class="img_toggle"  id ="imgToggle7">
                      <img src="Asset/img/Leveltransmitter-1.png" />
                  </div>
                                 <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                      <ContentTemplate>
                    <asp:Button ID="SetValue1" CssClass="buttonn gray" runat="server" Text="SET" OnClick="SetValue1_Click" />
                 
                    <asp:TextBox ID="txtValue1" CssClass="text-box" runat="server" Text="Value"></asp:TextBox>
                                        <asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
                                        </ContentTemplate>
                  </asp:UpdatePanel>
                </div>


                            
               <div class="item_8 fix_">
                  <h3>CHIP L</h3>
                  <div class="img_toggle"  id="imgToggle8">
                      <img src="Asset/img/Leveltransmitter-1.png" />

                      
                  </div>


<asp:UpdatePanel ID="UpdatePanel9" runat="server">
    <ContentTemplate>
                            <asp:Button ID="SetValue2" CssClass="buttonn gray" runat="server" Text="SET" OnClick="SetValue2_Click" />
     
                    <asp:TextBox ID="txtvalue2" CssClass="text-box" runat="server" Text="Value"></asp:TextBox>
                            <asp:Label ID="Label11" runat="server" Text="Label"></asp:Label>
                            <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
    </ContentTemplate>
</asp:UpdatePanel>

                  
                  
                </div>
                            
                  <div class="item_9 fix_">
                  <h3>CHIP L</h3>
                  <div class="img_toggle"  id="imgToggle9">
                      <img src="Asset/img/Leveltransmitter-1.png" />

                  </div><asp:UpdatePanel ID="UpdatePanel10" runat="server">
                      <ContentTemplate>
                                              <asp:Button ID="SetValue3" CssClass="buttonn gray" runat="server" Text="SET" OnClick="SetValue3_Click" />
                 
                    <asp:TextBox ID="txtValue3" CssClass="text-box" runat="server" Text="Value"></asp:TextBox>
                                              <asp:Label ID="Label13" runat="server" Text="Label"></asp:Label>
                      </ContentTemplate>
                        </asp:UpdatePanel>

                  </div>
 


              </div>
                </div>
                </div>
                <%--report--%>

                  <div class="container report " id="report">
                <h3>DU LIEU-XUAT FILE </h3>
                    <div class="gridview_ Report" > 
                    <asp:Label ID="Label9" runat="server" Text="Ex: 12/10/2021 12: 50: 20"></asp:Label>
                    <asp:TextBox ID="TimeStart" runat="server" >Time Start</asp:TextBox>
                    <asp:TextBox ID="TimeStop" runat="server">Time Stop</asp:TextBox>
                    <asp:Label ID="lbStatus" runat="server"></asp:Label>
                                  <asp:UpdatePanel ID="UpdatePanel15" runat="server">
              <ContentTemplate>

                               <asp:Button ID="Button19" runat="server" Text="Data" OnClick="Button19_Click"/>
                               <asp:Button ID="Button26" runat="server" OnClick="Button26_Click" Text="Clear" />
                        <rsweb:ReportViewer ID="Rp" runat="server" Height="100%" Width="100%" style="text-align: center"></rsweb:ReportViewer>
                  </div>
              </ContentTemplate>
          </asp:UpdatePanel>
              
                  <style>
                      .Report{
                          height: auto;
                      }
                      .uil-exclamation-triangle {
                          text-align: left;
                      }
                  </style>
              </div>
          


        </div> 
       
            </div>
          
        </form>
 
          
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://cdn.lordicon.com/libs/mssddfmo/lord-icon-2.1.0.js"></script>
      <script>
          function error_noHope() {
              document.querySelector('lord-icon').classList.remove('none_icon');
          }
      </script>
         <script type="text/javascript">
             var LineData1;
             var dataLine1

             var LineData2;
             var dataLine2

             var LineData3;
             var dataLine3;

             var LineData4;
             var dataLine4;
         google.load("visualization", "1", {packages: ["corechart"] });
         DrawAll();

         function ReadData1(path, vitri) {
                 $(document).ready(function () {
                     $.ajax({
                         url: path,
                         data: "",
                         dataType: "json",
                         type: "POST",
                         contentType: "application/json; chartset=utf-8",
                         success: function (data) {
                             dataLine1 = data.d;
                         }
                     }).done(function () {

                         if (LineData1 == null)
                             LineData1 = dataLine1;
                         else {
                             dataLine1.shift();
                             LineData1 = LineData1.concat(dataLine1);
                             if (LineData1.length > 500)
                                 LineData1.splice(1, 1);
                         }
                         console.log(LineData1);
                         drawLineChart1(vitri);
                     });

                 });
         }

         function drawLineChart1(vitri) {
             var data = google.visualization.arrayToDataTable(LineData1);
             var options = {
                 title: 'Line Chart',
                 hAxis: {title: 'Time' },
                 vAxis: {title: 'Value' },
                 legend: 'none'
             };
             var LineChart1 = new google.visualization.LineChart(document.getElementById(vitri));
             LineChart1.draw(data, options);
         }

         function ReadData2(path, vitri) {
                 $(document).ready(function () {
                     $.ajax({
                         url: path,
                         data: "",
                         dataType: "json",
                         type: "POST",
                         contentType: "application/json; chartset=utf-8",
                         success: function (data) {
                             dataLine2 = data.d;
                         }
                     }).done(function () {

                         if (LineData2 == null)
                             LineData2 = dataLine2;
                         else {
                             dataLine2.shift();
                             LineData2 = LineData2.concat(dataLine2);
                             if (LineData2.length > 500)
                                 LineData2.splice(1, 1);
                         }
                         console.log(LineData2);
                         drawLineChart2(vitri);
                     });

                 });
         }

         function drawLineChart2(vitri) {
             var data = google.visualization.arrayToDataTable(LineData2);
             var options = {
                 title: 'Line Chart',
                 hAxis: {title: 'Time' },
                 vAxis: {title: 'Value' },
                 legend: 'none'
             };
             var LineChart2 = new google.visualization.LineChart(document.getElementById(vitri));
             LineChart2.draw(data, options);
         }

         function ReadData3(path, vitri) {
                 $(document).ready(function () {
                     $.ajax({
                         url: path,
                         data: "",
                         dataType: "json",
                         type: "POST",
                         contentType: "application/json; chartset=utf-8",
                         success: function (data) {
                             dataLine3 = data.d;
                         }
                     }).done(function () {

                         if (LineData3 == null)
                             LineData3 = dataLine3;
                         else {
                             dataLine3.shift();
                             LineData3 = LineData3.concat(dataLine3);
                             if (LineData3.length > 500)
                                 LineData3.splice(1, 1);
                         }
                         console.log(LineData3);
                         drawLineChart3(vitri);
                     });

                 });
         }

         function drawLineChart3(vitri) {
             var data = google.visualization.arrayToDataTable(LineData3);
             var options = {
                 title: 'Line Chart',
                 hAxis: {title: 'Time' },
                 vAxis: {title: 'Value' },
                 legend: 'none'
             };
             var LineChart3 = new google.visualization.LineChart(document.getElementById(vitri));
             LineChart3.draw(data, options);
             }

         function ReadDataPrecipi() {
             $(document).ready(function () {
                $.ajax({
                    type: "POST",
                    url: "Admin.aspx/GetDataPrecipi",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        $("#Precipi").text(response.d);
                    }
                });
             });
             }

         function ReadDataHumidity() {
             $(document).ready(function () {
                $.ajax({
                     type: "POST",
                     url: "Admin.aspx/GetDataHumidity",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                       $("#Humidity").text(response.d);
                     }
                });
             });
         }

         function ReadDataAirspeed() {
             $(document).ready(function () {
                $.ajax({
                     type: "POST",
                     url: "Admin.aspx/GetDataAirspeed",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     success: function (response) {
                         $("#Airspeed").text(response.d);
                     }
                });
             });
         }

         function ReadDataChipLevel() {
             $(document).ready(function () {
                $.ajax({
                      type: "POST",
                      url: "Admin.aspx/GetDataChipLevel",
                      contentType: "application/json; charset=utf-8",
                      dataType: "json",
                      success: function (response) {
                         $("#ChipLevel").text(response.d);
                      }
                });
             });
         }

         function ReadError() {
              $(document).ready(function () {
                 $.ajax({
                       type: "POST",
                     url: "Admin.aspx/GetStatusError",
                       contentType: "application/json; charset=utf-8",
                       dataType: "json",
                       success: function (response) {
                         $("#Error").text(response.d);
                       }
                 });
              });
         }


         function CheckStatusPump1() {
                 $(document).ready(function () {
                     $.ajax({
                         type: "POST",
                         url: "Admin.aspx/GetStatusPump1",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == "ON") {
                                 $("#Pump1").attr("src", "Asset/img/PumpOn.png");
                             }
                             else {
                                 $("#Pump1").attr("src", "Asset/img/PumpOff.png");
                             }
                         }
                     });
                 });
             }


             function CheckStatusPump2() {
                 $(document).ready(function () {
                     $.ajax({
                         type: "POST",
                         url: "Admin.aspx/GetStatusPump2",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == "ON") {
                                 $("#Pump2").attr("src", "Asset/img/PumpOn.png");
                             }
                             else {
                                 $("#Pump2").attr("src", "Asset/img/PumpOff.png");
                             }
                         }
                     });
                 });
             }



             function CheckStatusPump3() {
                 $(document).ready(function () {
                     $.ajax({
                         type: "POST",
                         url: "Admin.aspx/GetStatusPump3",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == "ON") {
                                 $("#Pump3").attr("src", "Asset/img/PumpOn.png");
                             }
                             else {
                                 $("#Pump3").attr("src", "Asset/img/PumpOff.png");
                             }
                         }
                     });
                 });
             }

             function CheckStatusFan1() {
                 $(document).ready(function () {
                     $.ajax({
                         type: "POST",
                         url: "Admin.aspx/GetStatusPump4",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == "ON") {
                                 $("#Pump4").attr("src", "Asset/img/PumpOn.png");
                             }
                             else {
                                 $("#Pump4").attr("src", "Asset/img/PumpOff.png");
                             }
                         }
                     });
                 });
             }

             function CheckStatusFan2() {
                 $(document).ready(function () {
                     $.ajax({
                         type: "POST",
                         url: "Admin.aspx/GetStatusPump5",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == "ON") {
                                 $("#Pump5").attr("src", "Asset/img/PumpOn.png");
                             }
                             else {
                                 $("#Pump5").attr("src", "Asset/img/PumpOff.png");
                             }
                         }
                     });
                 });
             }




             function CheckStatusFan3() {
                 $(document).ready(function () {
                     $.ajax({
                         type: "POST",
                         url: "Admin.aspx/GetStatusPump6",
                         contentType: "application/json; charset=utf-8",
                         dataType: "json",
                         success: function (response) {
                             if (response.d == "ON") {
                                 $("#Pump6").attr("src", "Asset/img/PumpOn.png");
                             }
                             else {
                                 $("#Pump6").attr("src", "Asset/img/PumpOff.png");
                             }
                         }
                     });
                 });
             }


             function DrawAll() {
                ReadError();
                ReadData1('Admin.aspx/Getdata1', 'Chart-1');
                ReadData2('Admin.aspx/Getdata2', 'Chart-2');
                ReadData3('Admin.aspx/Getdata3', 'Chart-3');
                ReadDataPrecipi();
                ReadDataHumidity();
                ReadDataAirspeed();
                ReadDataChipLevel();
                CheckStatusPump1();
                CheckStatusPump2();
                CheckStatusPump3();
                CheckStatusFan1();
                CheckStatusFan2();
                CheckStatusFan3();

 
             }

         var myVar = setInterval(function () { DrawAll(); }, 100);

             function clickButton(e, buttonid) {

                 var evt = e ? e : window.event;

                 var bt = document.getElementById(buttonid);



                 if (bt) {

                     if (evt.keyCode == 13) {

                         bt.click();

                         return false;

                     }

                 }

             }



         </script> 
     
</body>
</html>
