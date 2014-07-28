using dsg.object1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace dsg.objdb
{
    public class PartSerialNoDB
    {
        ConnectDB conn;
        public PartSerialNo ps;
        public PartSerialNoDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        private void initConfig()
        {
            ps = new PartSerialNo();
            ps.dateInv = "date_inv";
            ps.dateReceive = "date_receive";
            ps.Id = "part_serial_no_id";
            ps.locaId = "loca_id";
            ps.partId = "part_id";
            ps.priceCost = "price_cost";
            ps.priceSale = "price_sale";
            ps.serialNo = "serial_no";
            ps.Remark = "part_serial_no_remark";
            ps.Active = "part_serial_no_active";

            ps.table = "";
            ps.pkField = "part_serial_no_id";
        }
        private PartSerialNo setData(PartSerialNo item, DataTable dt)
        {
            item.dateInv = dt.Rows[0][ps.dateInv].ToString();
            item.dateReceive = dt.Rows[0][ps.dateReceive].ToString();
            item.Id = dt.Rows[0][ps.Id].ToString();
            item.locaId = dt.Rows[0][ps.locaId].ToString();
            item.partId = dt.Rows[0][ps.partId].ToString();
            item.priceCost = dt.Rows[0][ps.priceCost].ToString();
            item.priceSale = dt.Rows[0][ps.priceSale].ToString();
            item.serialNo = dt.Rows[0][ps.serialNo].ToString();
            item.Remark = dt.Rows[0][ps.Remark].ToString();
            item.Active = dt.Rows[0][ps.Active].ToString();

            return item;
        }
        public DataTable selectAll()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + ps.table + " Where " + ps.Active + "='1'";
            dt = conn.selectData(sql);

            return dt;
        }
        public List<PartSerialNo> selectSAll()
        {
            List<PartSerialNo> ls = new List<PartSerialNo>();
            DataTable dt1 = selectAll();
            if (dt1.Rows.Count > 0)
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    PartSerialNo item = new PartSerialNo();
                    item.dateInv = dt1.Rows[0][ps.dateInv].ToString();
                    item.dateReceive = dt1.Rows[0][ps.dateReceive].ToString();
                    item.Id = dt1.Rows[0][ps.Id].ToString();
                    item.locaId = dt1.Rows[0][ps.locaId].ToString();
                    item.partId = dt1.Rows[0][ps.partId].ToString();
                    item.priceCost = dt1.Rows[0][ps.priceCost].ToString();
                    item.priceSale = dt1.Rows[0][ps.priceSale].ToString();
                    item.serialNo = dt1.Rows[0][ps.serialNo].ToString();
                    item.Remark = dt1.Rows[0][ps.Remark].ToString();
                    item.Active = dt1.Rows[0][ps.Active].ToString();

                    ls.Add(item);
                }
            }
            return ls;
        }
        public PartSerialNo selectByPk(String saleId)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + ps.table + " Where " + ps.pkField + "='" + saleId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public PartSerialNo selectByCode(String saleId)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + ps.table + " Where " + ps.Id + "='" + saleId + "' and " + ps.Active + "='1' ";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        private String insert(PartSerialNo p)
        {
            String sql = "", chk = "";
            if (p.Id.Equals(""))
            {
                p.Id = p.getGenID();
            }
            //if (p.Limit1.Equals(""))
            //{
            //    p.Limit1 = "0";
            //}
            //p.Remark = p.Remark.Replace("''", "'");
            p.Remark = p.Remark.Replace("''", "'");
            sql = "Insert Into " + ps.table + " (" + ps.pkField + "," + ps.dateInv + "," + ps.dateReceive + "," +
                ps.locaId + "," + ps.partId + "," + ps.priceCost + "," +
                ps.priceSale + "," + ps.serialNo + "," + ps.Remark + "," + 
                ps.Active + ") " +
                "Values('" + p.Id + "','" + p.dateInv + "','" + p.dateReceive + "','" +
                p.locaId + "','" + p.partId + "','" + p.priceCost + "','" +
                p.priceSale + "','" + p.serialNo + "','" + p.Remark + "','" + 
                p.Active + "')";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
                chk = p.Id;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "insert PartSerialNo");
            }
            finally
            {
            }
            return chk;
        }
        private String update(PartSerialNo p)
        {
            String sql = "", chk = "";

            p.Remark = p.Remark.Replace("''", "'");
            //p.partTName = p.partTName.Replace("''", "'");
            sql = "Update " + ps.table + " Set " + ps.dateInv + "='" + p.dateInv + "', " +
                ps.dateReceive + "='" + p.dateReceive + "', " +
                ps.locaId + "='" + p.locaId + "', " +
                ps.partId + "='" + p.partId + "', " +
                ps.priceCost + "='" + p.priceCost + "', " +
                ps.priceSale + "='" + p.priceSale + "', " +
                ps.serialNo + "='" + p.serialNo + "', " +
                ps.Remark + "='" + p.Remark + "', " +
                ps.Active + "='" + p.Active + "' " +

                "Where " + ps.pkField + "='" + p.Id + "'";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "update PartSerialNo");
            }
            finally
            {
            }
            return chk;
        }
        public String insertSale(PartSerialNo p)
        {
            PartSerialNo item = new PartSerialNo();
            String chk = "";
            item = selectByPk(p.Id);
            if (item.Id == "")
            {
                chk = insert(p);
            }
            else
            {
                chk = update(p);
            }
            return chk;
        }
        public String deleteAll()
        {
            String sql = "", chk = "";
            sql = "Delete From " + ps.table;
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public ComboBox getCboSale(ComboBox c)
        {
            ComboBoxItem item = new ComboBoxItem();
            DataTable dt = selectAll();
            //String aaa = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                item = new ComboBoxItem();
                item.Value = dt.Rows[i][ps.Id].ToString();
                item.Text = dt.Rows[i][ps.serialNo].ToString();
                c.Items.Add(item);
                //aaa += "new { Text = "+dt.Rows[i][sale.Name].ToString()+", Value = "+dt.Rows[i][sale.Id].ToString()+" },";
                //c.Items.Add(new );
            }
            return c;
        }
        public String VoidPartSerialNo(String ptId)
        {
            String sql = "", chk = "";

            sql = "Update " + ps.table + " Set " + ps.Active + "='3' " +
                "Where " + ps.pkField + "='" + ptId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
    }
}
