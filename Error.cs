using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class Error
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string ErrorName { get; set; }
        public string TimeError { get; set; }
        public Error()
        {

        }
        public Error(string id, string name,string errorname,string timeerror)
        {
            this.ID = id;
            this.Name = name;
            this.ErrorName = errorname;
            this.TimeError = timeerror;
        }
    }

}