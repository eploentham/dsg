using dsg.object1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.objdb
{
    public class PartReceiveItemDB
    {
        public PartReceiveItem pri;
        ConnectDB conn;
        public PartReceiveItemDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        private void initConfig()
        {
            pri = new PartReceiveItem();
            pri.Active = "rec_item_active";
            pri.Id = "rec_item_id";
            pri.PartId = "part_id";
            pri.PartNumber = "part_number";
            pri.PriceCost = "price_cost";
            pri.PriceSale = "price_sale";
            pri.RecId = "rec_id";
            pri.Remark = "rec_item_remark";

            pri.pkField = "rec_item_id";
            pri.table = "t_part_receive_item";
        }
    }
}
