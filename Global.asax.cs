using System;
using System.Collections.Generic;
using System.Linq;
using System.Timers;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using EasyModbus;
using System.Data;
using System.Threading;

namespace WebApp
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            MqttClient.Instance().ClientConnectMqtt();
            Thread t2 = new Thread(() =>
             {
                 ThreadTwo();
             });
            t2.Start();

        }

        private void ThreadTwo()
        {
            MqttClient.Instance().SendMqtt();
        }
    }
}