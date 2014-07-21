using dsg.object1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.objdb
{
    public class PartSerialNoDB
    {
        ConnectDB conn;
        public PartSerialNo pasn;
        public PartSerialNoDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        private void initConfig()
        {
            pasn = new PartSerialNo();
            pasn.dateInv = "date_inv";
            pasn.dateReceive = "date_receive";
            pasn.Id = "part_serial_no_id";
            pasn.locaId = "loca_id";
            pasn.partId = "part_id";
            pasn.priceCost = "price_cost";
            pasn.priceSale = "price_sale";
            pasn.serialNo = "serial_no";
            pasn.Remark = "part_serial_no_remark";

            pasn.table = "";
            pasn.pkField = "part_serial_no_id";
        }
    }
}
