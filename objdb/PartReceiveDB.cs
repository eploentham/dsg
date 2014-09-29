using dsg.object1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.objdb
{
    public class PartReceiveDB
    {
        public PartReceive pr;
        ConnectDB conn;
        public PartReceiveDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        private void initConfig()
        {
            pr = new PartReceive();
            pr.Active = "rec_active";
            pr.CustId = "cust_id";
            pr.CustName = "cust_name";
            pr.Id = "rec_id";
            pr.InvDate = "inv_date";
            pr.InvDiscount = "inv_discount";
            pr.InvNetTotal = "inv_nettotal";
            pr.InvNumber = "inv_number";
            pr.RecDate = "rec_date";
            pr.Remark = "rec_number";
            pr.RevNumber = "remark";

            pr.table = "t_part_receive";
            pr.pkField = "rec_id";
        }
    }
}
