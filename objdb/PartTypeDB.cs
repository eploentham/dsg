using dsg.object1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.objdb
{
    public class PartTypeDB
    {
        ConnectDB conn;
        public PartType pt;
        public PartTypeDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        private void initConfig()
        {
            pt = new PartType();
            pt.Active = "part_type_active";
            pt.Id = "part_type_id";
            pt.partTName = "part_type_name";
            pt.Remark = "part_type_remark";

            pt.table = "part_type_id";
            pt.pkField = "b_part_type";
        }
    }
}
