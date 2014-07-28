using dsg.object1;
using System;
using System.Collections.Generic;
using System.Data;
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
            pc.Code = "part_cate_code";

            pc.table = "b_part_category";
            pc.pkField = "part_cate_id";
        }
        private PartCategory setData(PartCategory item, DataTable dt)
        {
            item.Id = dt.Rows[0][pt.Id].ToString();
            item.Active = dt.Rows[0][pt.Active].ToString();
            item.partTName = dt.Rows[0][pt.partTName].ToString();
            item.Remark = dt.Rows[0][pt.Remark].ToString();
            item.Code = dt.Rows[0][pt.Code].ToString();

            return item;
        }
        public DataTable selectAll()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pt.table + " Where " + pt.Active + "='1'";
            dt = conn.selectData(sql);

            return dt;
        }
        public List<PartType> selectSAll()
        {
            List<PartType> ls = new List<PartType>();
            DataTable dt1 = selectAll();
            if (dt1.Rows.Count > 0)
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    PartType item = new PartType();
                    item.Id = dt1.Rows[0][pt.Id].ToString();
                    item.Active = dt1.Rows[0][pt.Active].ToString();
                    item.partTName = dt1.Rows[0][pt.partTName].ToString();
                    item.Remark = dt1.Rows[0][pt.Remark].ToString();
                    item.Code = dt1.Rows[0][pt.Code].ToString();
                    ls.Add(item);
                }
            }
            return ls;
        }
        public PartType selectByPk(String saleId)
        {
            PartType item = new PartType();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pt.table + " Where " + pt.pkField + "='" + saleId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public PartType selectByCode(String saleId)
        {
            PartType item = new PartType();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pt.table + " Where " + pt.Id + "='" + saleId + "' and " + pt.Active + "='1' ";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
    }
}
