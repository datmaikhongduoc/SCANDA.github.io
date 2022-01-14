using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class MBWrite
    {
        protected MBWrite()
        {

        }

        private static MBWrite _instance;
        public static MBWrite Instance()
        {
            if (_instance == null)
            {
                _instance = new MBWrite();
            }
            return _instance;
        }

        public string Pump_1_CLient1 { get; set; }
        public string Pump_2_CLient1 { get; set; }
        public string Pump_3_CLient1 { get; set; }
        public string Motor_1_CLient1 { get; set; }
        public string Motor_2_CLient1 { get; set; }
        public string Motor_3_CLient1 { get; set; }
        public string SetValue1_CLient1 { get; set; }
        public string SetValue2_CLient1 { get; set; }
        public string SetValue3_CLient1 { get; set; }



    }
}