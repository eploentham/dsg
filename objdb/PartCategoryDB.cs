using dsg.object1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.objdb
{
    public class PartCategoryDB
    {
        ConnectDB conn;
        public PartCategory pc;
        public PartCategoryDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        public void initConfig()
        {
            pc = new PartCategory();
            pc.Actice = "part_cate_active";
            pc.cateName = "part_cate_name";
            pc.Id = "part_cate_id";
            pc.remark = "part_cate_reamark";

            pc.table = "b_part_category";
            pc.pkField = "part_cate_id";
        }
    }
}
