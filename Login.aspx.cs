using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Login : System.Web.UI.Page
    {
        LoginHistory insert = new LoginHistory();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection sql_conn; // Khởi tạo tên kết nối SQL
            string sqlName = "Data Source=WINDOWS-10;Initial Catalog=Data_Sensor;Persist Security Info=True;User ID=sa;Password=khanhvinh";

            sql_conn = new SqlConnection(sqlName);
            sql_conn.Open();
            string sqlSelect = "select * from DataLogin where Name=@UserName and PassWord=@Pass";
            SqlCommand cmd = new SqlCommand(sqlSelect, sql_conn);
            cmd.Parameters.AddWithValue("@UserName", txtuser.Text.Trim());
            cmd.Parameters.AddWithValue("@Pass", txtpassword.Text.Trim());
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                if (reader.GetBoolean(2) == true)
                {
                    insert.cmd_SQLWrite("History", "Name", txtuser.Text.Trim(), "Time", System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                    Session["Name"] = txtuser.Text;
                    Response.Redirect("~/Admin.aspx");
                }
                else
                {
                    insert.cmd_SQLWrite("History", "Name", txtuser.Text.Trim(), "Time", System.DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                    Session["Name"] = txtuser.Text;
                    //Response.Redirect("~/User.aspx");
                    Response.Write("<script>alert('Đang cập nhật')</script>");
                }
                sql_conn.Close();
            }
            else
            {
                Response.Write("<script>alert('Error')</script>");
            }
        }
    }
}