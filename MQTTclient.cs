using MQTTnet;
using MQTTnet.Client.Connecting;
using MQTTnet.Client.Disconnecting;
using MQTTnet.Client.Options;
using MQTTnet.Client.Receiving;
using MQTTnet.Extensions.ManagedClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Diagnostics.Tracing;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using System.Web;

namespace WebApp
{
    class MqttClient
    {

        private IManagedMqttClient _mqttClient;
        private static string ipAddressServer = "192.168.1.5";
        private static int portServer = 707;
        public MqttClientOptionsBuilder builder;
        public ManagedMqttClientOptions options;
        public MqttTopicFilter topic;

        protected MqttClient()
        {

        }
        private static MqttClient _instance;
        public static MqttClient Instance()
        {
            if (_instance == null)
            {
                _instance = new MqttClient();
            }
            return _instance;
        }

        public async void ClientConnectMqtt()
        {
            builder = new MqttClientOptionsBuilder()
                                                    .WithClientId("Client3")
                                                    .WithTcpServer(ipAddressServer, portServer)
                                                    .WithCredentials("mySecretUser", "mySecretPassword");

            // Create client options objects
            options = new ManagedMqttClientOptionsBuilder()
                                    .WithAutoReconnectDelay(TimeSpan.FromSeconds(60))
                                    .WithClientOptions(builder.Build())
                                    .Build();

            // Creates the client object
            _mqttClient = new MqttFactory().CreateManagedMqttClient();



            _mqttClient.ApplicationMessageReceivedHandler = new MqttApplicationMessageReceivedHandlerDelegate(OnNewMessage);




            topic = new MqttTopicFilterBuilder()
            .WithTopic("topic/state")
            .WithAtLeastOnceQoS()
            .Build();


            await _mqttClient.SubscribeAsync(topic);


            _mqttClient.StartAsync(options).GetAwaiter().GetResult();

        }

        private void OnNewMessage(MqttApplicationMessageReceivedEventArgs e)
        {
            var message = e.ApplicationMessage.ConvertPayloadToString();
            var json = JsonConvert.DeserializeObject<MBRead>(message);
            MBRead.Instance().temp01_State = json.temp01_State;
            MBRead.Instance().temp02_State = json.temp02_State;
            MBRead.Instance().temp03_State = json.temp02_State;
            MBRead.Instance().press01_State = json.press01_State;
            MBRead.Instance().chipTank_State = json.chipTank_State;
            MBRead.Instance().OilPump_State = json.OilPump_State;
            MBRead.Instance().FireTurn_State = json.FireTurn_State;
            MBRead.Instance().Fan_State = json.Fan_State;
            MBRead.Instance().WaterPump_State = json.WaterPump_State;
            MBRead.Instance().Pump_1_Status = json.Pump_1_Status;
            MBRead.Instance().Pump_2_Status = json.Pump_2_Status;
            MBRead.Instance().Pump_3_Status = json.Pump_3_Status;
            MBRead.Instance().Motor_1_Status = json.Motor_1_Status;
            MBRead.Instance().Motor_2_Status = json.Motor_2_Status;
            MBRead.Instance().Motor_3_Status = json.Motor_3_Status;
            MBRead.Instance().Error = json.Error;

        }

        public void SendMqtt()
        {
            while (true)
            {
                string json = JsonConvert.SerializeObject(MBWrite.Instance());
                _mqttClient.PublishAsync("topic/control/1", json);
                Task.Delay(100).GetAwaiter().GetResult();
            }
        }
    }
}