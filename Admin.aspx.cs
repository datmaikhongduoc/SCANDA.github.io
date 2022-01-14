using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Timers;
using System.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using System.Data;
using System.Threading.Tasks;
using MQTTnet.Extensions.ManagedClient;
using Newtonsoft.Json;
using System.Threading;

namespace WebApp
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Name"]==null)
            {
                Response.Redirect("~/Login.aspx");
            }   
            else
            {

                if (!IsPostBack)

                {

                    txtValue1.Attributes.Add("onkeypress", "return clickButton(event,'" + SetValue1.ClientID + "')");
                    txtvalue2.Attributes.Add("onkeypress", "return clickButton(event,'" + SetValue2.ClientID + "')");
                    txtValue3.Attributes.Add("onkeypress", "return clickButton(event,'" + SetValue3.ClientID + "')");
                    TimeStart.Attributes.Add("onkeypress", "return clickButton(event,'" + Button26.ClientID + "')");
                    TimeStop.Attributes.Add("onkeypress", "return clickButton(event,'" + Button26.ClientID + "')");

                }
            }
        }
        protected void Button19_Click(object sender, EventArgs e)
        {
            lbStatus.Text = "";
            try
            {
                string tStart = TimeStart.Text;
                string tStop = TimeStop.Text;
                SqlConnection sql_conn;
                string sqlName = "Data Source=WINDOWS-10;Initial Catalog=Data_Sensor;Persist Security Info=True;User ID=sa;Password=khanhvinh";
                sql_conn = new SqlConnection(sqlName);
                sql_conn.Open();
                string sqlSelect = "select *from Data where " +
                            "TimeUpdate > CONVERT(datetime, N'" + tStart + "', 103)" +
                            "and TimeUpdate < CONVERT(datetime, N'" + tStop + "', 103); ";
                DataTable table = new DataTable();
                SqlDataAdapter dtAdapter = new SqlDataAdapter(sqlSelect, sql_conn);
                table.Locale = System.Globalization.CultureInfo.InvariantCulture;
                dtAdapter.Fill(table);
                Rp.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", table));
                Rp.LocalReport.ReportPath = Server.MapPath("~/Report/Report.rdlc");
                Rp.LocalReport.EnableHyperlinks = true;
                sql_conn.Close();
            }
            catch 
            { 
            
                lbStatus.Text = "Vui Lòng kiểm tra lại!";
            }

        }
        protected void Button26_Click(object sender, EventArgs e)
        {
            Rp.LocalReport.DataSources.Clear();

        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session["Name"] = null;
            Response.Redirect("~/Login.aspx");
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object[] Getdata1()
        {
            var DataChart1 = new object[2];
            DataChart1[0] = new object[]{
                "Thời gian",
                "Sersor 1",

            };

            try
            {
                DataChart1[1] = new object[]
                {
                    DateTime.Now.ToString("t"),
                    Convert.ToDouble(MBRead.Instance().temp01_State),
                };
            }
            catch { }

            return DataChart1;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object[] Getdata2()
        {
            var DataChart2 = new object[2];
            DataChart2[0] = new object[]{
                "Thời gian",
                "Sensor 2",

            };

            try
            {
                DataChart2[1] = new object[]
                {
                    DateTime.Now.ToString("t"),
                    Convert.ToDouble(MBRead.Instance().temp02_State),
                };
            }
            catch { }

            return DataChart2;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static object[] Getdata3()
        {
            var DataChart3 = new object[2];
            DataChart3[0] = new object[]{
                "Thời gian",
                "Sensor 3",

            };
            string _tag3 = null;
            try
            {
                DataChart3[1] = new object[]
                {
                    DateTime.Now.ToString("t"),
                    Convert.ToDouble(MBRead.Instance().temp03_State),
                };
            }
            catch { }

            return DataChart3;
        }
        [WebMethod]
        public static string GetDataPrecipi()
        {
            return MBRead.Instance().chipTank_State ;
        }
        [WebMethod]
        public static string GetDataHumidity()
        {
            return MBRead.Instance().OilPump_State;
        }
        [WebMethod]
        public static string GetDataAirspeed()
        {
            return MBRead.Instance().FireTurn_State;
        }
        [WebMethod]
        public static string GetDataChipLevel()
        {
            return MBRead.Instance().Fan_State;
        }

        [WebMethod]
        public static string GetStatusPump1()
        {
            string Status;
            if(MBRead.Instance().Pump_1_Status.ToString()=="True")
            {
                Status = "ON";
                return Status;
            }
            Status = "OFF";
            return Status;
        }
        [WebMethod]
        public static string GetStatusPump2()
        {
            string Status;
            if (MBRead.Instance().Pump_2_Status.ToString() == "True")
            {
                Status = "ON";
                return Status;
            }
            Status = "OFF";
            return Status;
        }
        [WebMethod]
        public static string GetStatusPump3()
        {
            string Status;
            if (MBRead.Instance().Pump_3_Status.ToString() == "True")
            {
                Status = "ON";
                return Status;
            }
            Status = "OFF";
            return Status;
        }


        [WebMethod]
        public static string GetStatusPump4()
        {
            string Status;
            if (MBRead.Instance().Motor_1_Status.ToString() == "True")
            {
                Status = "ON";
                return Status;
            }
            Status = "OFF";
            return Status;
        }

        [WebMethod]
        public static string GetStatusPump5()
        {
            string Status;
            if (MBRead.Instance().Motor_2_Status.ToString() == "True")
            {
                Status = "ON";
                return Status;
            }
            Status = "OFF";
            return Status;
        }

        [WebMethod]
        public static string GetStatusPump6()
        {
            string Status;
            if (MBRead.Instance().Motor_3_Status.ToString() == "True")
            {
                Status = "ON";
                return Status;
            }
            Status = "OFF";
            return Status;
        }

        [WebMethod]
        public static string GetStatusError()
        {
            string Status;
            if (MBRead.Instance().Error.ToString() == "True")
            {
                
                Status = "Hệ thống đang bị lỗi vui lòng nhấp vào "+"Error"+" để kiểm tra";
                return Status;
            }
            Status = "";
            return Status;
        }


        protected  void OnPump1_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Pump_1_CLient1 = "True";
            Thread.Sleep(500);
            MBWrite.Instance().Pump_1_CLient1 = null;

        }


        protected  void OffPump1_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Pump_1_CLient1 = "False";
            Thread.Sleep(500);
            MBWrite.Instance().Pump_1_CLient1 = null;


        }

        protected void OnPump2_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Pump_2_CLient1 = "True";
            Thread.Sleep(500);
            MBWrite.Instance().Pump_2_CLient1 = null;

        }

        protected void OffPump2_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Pump_2_CLient1 = "False";
            Thread.Sleep(500);
            MBWrite.Instance().Pump_2_CLient1 = null;

        }

        protected void OnPump3_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Pump_3_CLient1 = "True";
            Thread.Sleep(500);
            MBWrite.Instance().Pump_3_CLient1 = null;

        }

        protected void OffPump3_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Pump_3_CLient1 = "False";
            Thread.Sleep(500);
            MBWrite.Instance().Pump_3_CLient1 = null;

        }

        protected void OnFan1_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Motor_1_CLient1 = "True";
            Thread.Sleep(500);
            MBWrite.Instance().Motor_1_CLient1 = null;

        }

        protected void OffFan1_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Motor_1_CLient1 = "False";
            Thread.Sleep(500);
            MBWrite.Instance().Motor_1_CLient1 = null;

        }

        protected void OnFan2_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Motor_2_CLient1 = "True";
            Thread.Sleep(500);
            MBWrite.Instance().Motor_2_CLient1 = null;

        }

        protected void OffFan2_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Motor_2_CLient1 = "False";
            Thread.Sleep(500);
            MBWrite.Instance().Motor_2_CLient1 = null;

        }

        protected void OnFan3_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Motor_3_CLient1 = "true";
            Thread.Sleep(500);
            MBWrite.Instance().Motor_3_CLient1 = null;

        }

        protected void OffFan3_Click(object sender, EventArgs e)
        {
            MBWrite.Instance().Motor_3_CLient1 = "False";
            Thread.Sleep(500);
            MBWrite.Instance().Motor_3_CLient1 = null;

        }

        protected void SetValue1_Click(object sender, EventArgs e)
        {
            short temp;
            if (short.TryParse(txtValue1.Text, out temp )==true)
            {
                MBWrite.Instance().SetValue1_CLient1 = txtValue1.Text;
            }    
            else
            {
                txtValue1.Text = "vui lòng nhập lại";
            }    
        }

        protected void SetValue2_Click(object sender, EventArgs e)
        {
            short temp;
            if (short.TryParse(txtvalue2.Text, out temp) == true)
            {
                MBWrite.Instance().SetValue2_CLient1 = txtvalue2.Text;
            }
            else
            {
                txtvalue2.Text = "vui lòng nhập lại";
            }
        }

        protected void SetValue3_Click(object sender, EventArgs e)
        {
            short temp;
            if (short.TryParse(txtValue3.Text, out temp) == true)
            {
                MBWrite.Instance().SetValue3_CLient1 = txtValue3.Text;
            }
            else
            {
                txtValue3.Text = "vui lòng nhập lại";
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            GvError.DataBind();

        }
    }













    }
