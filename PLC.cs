using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class PLC
    {

        protected PLC()
        {

        }
        private static PLC _Intance;
        public static PLC Instance()
        {
            if(_Intance==null)
            {
                _Intance = new PLC();
            }
            return _Intance;
        }
    }
}