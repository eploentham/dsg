﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.object1
{
    class Brand : Persistent
    {
        public String brandId = "";
        public String brandName = "";
        public override string ToString()
        {
            return brandName;
        }
    }
}
