using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class LoginHistory
    {
        public void cmd_SQLWrite(string sqltable_name,
                                    string collum1, string data1,
                                    string collum2, string data2)
        {
            SqlConnection sql_conn; // Khởi tạo tên kết nối SQL
            string sqlName = "Data Source=WINDOWS-10;Initial Catalog=Data_Sensor;Persist Security Info=True;User ID=sa;Password=khanhvinh";
            sql_conn = new SqlConnection(sqlName);
            sql_conn.Open();
            string sql = " INSERT INTO " + sqltable_name +
                " ("
                + collum1 + ","
                + collum2 + ")"
                + " VALUES "
                + "("
                + "@" + collum1 + ","
                + "@" + collum2 + ")";
            using (SqlCommand cmd = new SqlCommand(sql, sql_conn))
            {
                cmd.Parameters.AddWithValue(collum1, data1);
                cmd.Parameters.AddWithValue(collum2, data2);
                cmd.ExecuteNonQuery();
            }
            sql_conn.Close();
        }
    }

}