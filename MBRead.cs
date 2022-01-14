using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class MBRead
    {
        protected MBRead()
        {

        }
        private static MBRead _instance;
        public static MBRead Instance()
        {
            if (_instance == null)
            {
                _instance = new MBRead();
            }
            return _instance;
        }

        public string temp01_State { get; set; }
        public string temp02_State { get; set; }
        public string temp03_State { get; set; }
        public string press01_State { get; set; }
        public string chipTank_State { get; set; }
        public string OilPump_State { get; set; }
        public string FireTurn_State { get; set; }
        public string Fan_State { get; set; }
        public string WaterPump_State { get; set; }
        public string Pump_1_Status { get; set; }
        public string Pump_2_Status { get; set; }
        public string Pump_3_Status { get; set; }
        public string Motor_1_Status { get; set; }
        public string Motor_2_Status { get; set; }
        public string Motor_3_Status { get; set; }
        public string Error { get; set; }
    }
}