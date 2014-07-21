using dsg.object1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.objdb
{
    public class PartDB
    {
        ConnectDB conn;
        public Part pa;
        public PartDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        public void initConfig()
        {
            pa = new Part();
            pa.acftModel = "acft_model";
            pa.barcode = "barcode";
            pa.cateId = "cate_id";
            pa.certify = "certify";
            pa.dateCancel = "date_cancel";
            pa.dateCreate = "date_create";
            pa.dateDraw = "date_draw";
            pa.dateInv = "date_inv";
            pa.dateModi = "date_modi";
            pa.dateReceive = "date_receive";
            pa.description = "description";
            pa.Id = "part_id";
            pa.partCode = "part_code";
            pa.partNumber = "part_number";
            pa.partRemark = "part_remark";
            pa.pathPic = "path_pic";
            pa.priceCost = "price_cost";
            pa.priceSale = "price_sale";
            pa.serialNo = "serial_no";
            pa.stockLoca1 = "stock_loca1";
            pa.stockLoca2 = "stock_loca2";
            pa.stockLoca3 = "stock_loca3";
            pa.stockLoca4 = "stock_loca4";
            pa.stockLoca5 = "stock_loca5";

            pa.table = "b_part";
            pa.pkField = "part_id";
        }
    }
}
