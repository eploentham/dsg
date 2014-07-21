using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using System.Threading.Tasks;

namespace dsg.object1
{
    public class Staff : Persistent
    {
        public String Id = "", Name = "", Password = "", Active = "", Remark = "", Code = "", Priority="";
        public override string ToString()
        {
            return Name;
        }
    }
}
