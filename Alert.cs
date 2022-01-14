using Microsoft.Reporting.Map.WebForms.BingMaps;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class Alert
    {
        public void cmd_SQLWrite(string sqltable_name,
                                string collum1, string data1,
                                string collum2, string data2,
                                string collum3, string data3,
                                string collum4, string data4)
        {
            SqlConnection sql_conn; // Khởi tạo tên kết nối SQL
            string sqlName = "Data Source=WINDOWS-10;Initial Catalog=Data_Sensor;Persist Security Info=True;User ID=sa;Password=khanhvinh";
            sql_conn = new SqlConnection(sqlName);
            sql_conn.Open();
            string sql = " INSERT INTO " + sqltable_name +
                " ("
                + collum1 + ","
                + collum2 + ","
                + collum3 + ","
                + collum4 + ")"
                + " VALUES "
                + "("
                + "@" + collum1 + ","
                + "@" + collum2 + ","
                + "@" + collum3 + ","
                + "@" + collum4 + ")";
            using (SqlCommand cmd = new SqlCommand(sql, sql_conn))
            {
                cmd.Parameters.AddWithValue(collum1, data1);
                cmd.Parameters.AddWithValue(collum2, data2);
                cmd.Parameters.AddWithValue(collum3, data3);
                cmd.Parameters.AddWithValue(collum4, data4);
                cmd.ExecuteNonQuery();
            }
            sql_conn.Close();
        }
        
        public bool CheckError( bool[] ValueCheck)
        {
            foreach (bool item in ValueCheck)
            {
                if(item ==true)
                {
                    return true;
                }    
            }
            return false;
        }
    }

}