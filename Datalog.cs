using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;


namespace WebApp
{


    public class Datalog
    {
        public void cmd_SQLWrite(string sqltable_name,
                                string collum1, string data1,
                                string collum2, string data2,
                                string collum3, string data3,
                                string collum4, string data4)
        {
            SqlConnection sql_conn; 
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

        public DataSet BindData()
        {
            string strConnection = "Data Source=WINDOWS-10;Initial Catalog=Data_Sensor;Persist Security Info=True;User ID=sa;Password=khanhvinh";
            SqlConnection con = new SqlConnection(strConnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Data ", con);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            
            return ds;
        }
    }
}