﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.object1
{
    public class Persistent
    {
        public String table { get; set; }
        public String pkField { get; set; }
        public String sited { get; set; }
        Random r = new Random();
        public Persistent()
        {
            table = "";
            pkField = "";
            sited = "";
        }
        public String getGenID()
        {
            r = new Random();
            return r.Next().ToString();
        }
    }
}
