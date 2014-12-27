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
            ps.PriceCost = "price_cost";
            ps.PriceSale = "price_sale";
            ps.serialNo = "serial_no";
            ps.Remark = "part_serial_no_remark";
            ps.Active = "part_serial_no_active";
            ps.rowNumber = "row_number";
            ps.StatusTran = "status_tran";
            ps.userCancel = "user_cancel";
            ps.userCreate = "user_create";
            ps.userModi = "user_modi";
            ps.DateCancel = "date_cancel";
            ps.DateCreate = "date_create";
            ps.DateModi = "date_modi";
            ps.RemarkDraw = "remark_draw";

            ps.CurrNamePriceCost = "current_name_price_cost";
            ps.CurrNamePriceSale = "current_name_price_sale";
            ps.CurrRatePriceCost = "current_rate_price_cost";
            ps.CurrRatePriceSale = "current_rate_price_sale";
            ps.CurrXPriceCost = "current_x_price_cost";
            ps.CurrXriceSale = "current_x_price_sale";
            ps.PriceCostCurrent = "price_cost_current";
            ps.PriceSaleCurrent = "price_sale_current";

            ps.table = "b_part_serial_no";
            ps.pkField = "part_serial_no_id";
        }
        private PartSerialNo setData(PartSerialNo item, DataTable dt)
        {
            item.dateInv = dt.Rows[0][ps.dateInv].ToString();
            item.dateReceive = dt.Rows[0][ps.dateReceive].ToString();
            item.Id = dt.Rows[0][ps.Id].ToString();
            item.locaId = dt.Rows[0][ps.locaId].ToString();
            item.partId = dt.Rows[0][ps.partId].ToString();

            item.PriceCost = dt.Rows[0][ps.PriceCost].ToString();
            item.PriceSale = dt.Rows[0][ps.PriceSale].ToString();
            item.serialNo = dt.Rows[0][ps.serialNo].ToString();
            item.Remark = dt.Rows[0][ps.Remark].ToString();
            item.Active = dt.Rows[0][ps.Active].ToString();
            
            item.rowNumber = dt.Rows[0][ps.rowNumber].ToString();
            item.StatusTran = dt.Rows[0][ps.StatusTran].ToString();
            item.userCancel = dt.Rows[0][ps.userCancel].ToString();
            item.userCreate = dt.Rows[0][ps.userCreate].ToString();
            item.userModi = dt.Rows[0][ps.userModi].ToString();

            item.DateCancel = dt.Rows[0][ps.DateCancel].ToString();
            item.DateCreate = dt.Rows[0][ps.DateCreate].ToString();
            item.DateModi = dt.Rows[0][ps.DateModi].ToString();
            item.RemarkDraw = dt.Rows[0][ps.RemarkDraw].ToString();

            item.CurrNamePriceCost = dt.Rows[0][ps.CurrNamePriceCost].ToString();
            item.CurrNamePriceSale = dt.Rows[0][ps.CurrNamePriceSale].ToString();
            item.CurrRatePriceCost = dt.Rows[0][ps.CurrRatePriceCost].ToString();
            item.CurrRatePriceSale = dt.Rows[0][ps.CurrRatePriceSale].ToString();
            item.CurrXPriceCost = dt.Rows[0][ps.CurrXPriceCost].ToString();
            item.CurrXriceSale = dt.Rows[0][ps.CurrXriceSale].ToString();
            item.PriceCostCurrent = dt.Rows[0][ps.PriceCostCurrent].ToString();
            item.PriceSaleCurrent = dt.Rows[0][ps.PriceSaleCurrent].ToString();

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
            DataTable dt = selectAll();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    PartSerialNo item = new PartSerialNo();
                    item.dateInv = dt.Rows[0][ps.dateInv].ToString();
                    item.dateReceive = dt.Rows[0][ps.dateReceive].ToString();
                    item.Id = dt.Rows[0][ps.Id].ToString();
                    item.locaId = dt.Rows[0][ps.locaId].ToString();
                    item.partId = dt.Rows[0][ps.partId].ToString();

                    item.PriceCost = dt.Rows[0][ps.PriceCost].ToString();
                    item.PriceSale = dt.Rows[0][ps.PriceSale].ToString();
                    item.serialNo = dt.Rows[0][ps.serialNo].ToString();
                    item.Remark = dt.Rows[0][ps.Remark].ToString();
                    item.Active = dt.Rows[0][ps.Active].ToString();

                    item.StatusTran = dt.Rows[0][ps.StatusTran].ToString();
                    item.userCancel = dt.Rows[0][ps.userCancel].ToString();
                    item.userCreate = dt.Rows[0][ps.userCreate].ToString();
                    item.userModi = dt.Rows[0][ps.userModi].ToString();
                    item.DateCancel = dt.Rows[0][ps.DateCancel].ToString();

                    item.DateCreate = dt.Rows[0][ps.DateCreate].ToString();
                    item.DateModi = dt.Rows[0][ps.DateModi].ToString();
                    item.RemarkDraw = dt.Rows[0][ps.RemarkDraw].ToString();

                    item.CurrNamePriceCost = dt.Rows[0][ps.CurrNamePriceCost].ToString();
                    item.CurrNamePriceSale = dt.Rows[0][ps.CurrNamePriceSale].ToString();
                    item.CurrRatePriceCost = dt.Rows[0][ps.CurrRatePriceCost].ToString();
                    item.CurrRatePriceSale = dt.Rows[0][ps.CurrRatePriceSale].ToString();
                    item.CurrXPriceCost = dt.Rows[0][ps.CurrXPriceCost].ToString();
                    item.CurrXriceSale = dt.Rows[0][ps.CurrXriceSale].ToString();
                    item.PriceCostCurrent = dt.Rows[0][ps.PriceCostCurrent].ToString();
                    item.PriceSaleCurrent = dt.Rows[0][ps.PriceSaleCurrent].ToString();

                    ls.Add(item);
                }
            }
            return ls;
        }
        public PartSerialNo selectByPk(String psId)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + ps.table + " Where " + ps.pkField + "='" + psId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public PartSerialNo selectBySerialNo(String psId)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + ps.table + " Where " + ps.serialNo + " = '" + psId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public PartSerialNo selectByPriceCost(String psId)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + ps.table + " Where " + ps.PriceCost + "='" + psId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public PartSerialNo selectByCode(String psCode)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + ps.table + " Where " + ps.Id + "='" + psCode + "' and " + ps.Active + "='1' ";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public DataTable selectByPartId(String paId)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + ps.table + " Where " + ps.partId + "='" + paId + "' and "+ps.Active+"='1' and "+ps.StatusTran+"='1'";
            dt = conn.selectData(sql);

            return dt;
        }
        public String selectMaxRowNumberByPartId(String paId)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "", cnt="";
            DataTable dt = new DataTable();
            sql = "Select max("+ps.rowNumber+") as cnt From " + ps.table + " Where " + ps.partId + "='" + paId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["cnt"] != null)
                {
                    if (dt.Rows[0]["cnt"].ToString().Equals(""))
                    {
                        cnt = "1";
                    }
                    else
                    {
                        cnt = dt.Rows[0]["cnt"].ToString();
                    }
                    
                }
                else
                {
                    cnt = "1";
                }
            }
            else
            {
                cnt = "1";
            }
            return cnt;
        }
        private String insert(PartSerialNo p)
        {
            String sql = "", chk = "";
            if (p.Id.Equals(""))
            {
                p.Id = "ps"+p.getGenID();
            }
            //if (p.Limit1.Equals(""))
            //{
            //    p.Limit1 = "0";
            //}
            //p.Remark = p.Remark.Replace("''", "'");
            p.DateCreate = p.dateGenDB;
            p.Remark = p.Remark.Replace("''", "'");

            p.CurrNamePriceCost = p.CurrNamePriceCost.Replace(",", "");
            p.CurrNamePriceSale = p.CurrNamePriceSale.Replace(",", "");
            p.CurrRatePriceCost = p.CurrRatePriceCost.Replace(",", "");
            p.CurrRatePriceSale = p.CurrRatePriceSale.Replace(",", "");
            p.CurrXPriceCost = p.CurrXPriceCost.Replace(",", "");
            p.CurrXriceSale = p.CurrXriceSale.Replace(",", "");
            p.PriceCostCurrent = p.PriceCostCurrent.Replace(",", "");
            p.PriceSaleCurrent = p.PriceSaleCurrent.Replace(",", "");
            p.PriceCost = p.PriceCost.Replace(",", "");
            p.PriceSale = p.PriceSale.Replace(",", "");

            sql = "Insert Into " + ps.table + " (" + ps.pkField + "," + ps.dateInv + "," + ps.dateReceive + "," +
                ps.locaId + "," + ps.partId + "," + ps.PriceCost + "," +
                ps.PriceSale + "," + ps.serialNo + "," + ps.Remark + "," +
                ps.Active + "," + ps.StatusTran + "," + ps.DateCreate + "," +
                ps.CurrNamePriceCost + "," + ps.CurrNamePriceSale + "," + ps.CurrRatePriceCost + "," +
                ps.CurrRatePriceSale + "," + ps.CurrXPriceCost + "," + ps.CurrXriceSale + "," +
                ps.PriceCostCurrent + "," + ps.PriceSaleCurrent + ") " +
                "Values('" + p.Id + "','" + p.dateInv + "','" + p.dateReceive + "','" +
                p.locaId + "','" + p.partId + "'," + NumberNull1(p.PriceCost) + "," +
                NumberNull1(p.PriceSale) + ",'" + p.serialNo + "','" + p.Remark + "','" +
                p.Active + "','" + p.StatusTran + "'," + p.DateCreate + ",'" + 
                p.CurrNamePriceCost + "','" + p.CurrNamePriceSale + "'," + NumberNull1(p.CurrRatePriceCost) + "," + 
                NumberNull1(p.CurrRatePriceSale) + "," + NumberNull1(p.CurrXPriceCost) + "," + NumberNull1(p.CurrXriceSale) + "," + 
                NumberNull1(p.PriceCostCurrent) + "," + NumberNull1(p.PriceSaleCurrent) + ")";
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
            p.DateModi = p.dateGenDB;
            //p.partTName = p.partTName.Replace("''", "'");

            p.CurrNamePriceCost = p.CurrNamePriceCost.Replace(",", "");
            p.CurrNamePriceSale = p.CurrNamePriceSale.Replace(",", "");
            p.CurrRatePriceCost = p.CurrRatePriceCost.Replace(",", "");
            p.CurrRatePriceSale = p.CurrRatePriceSale.Replace(",", "");
            p.CurrXPriceCost = p.CurrXPriceCost.Replace(",", "");
            p.CurrXriceSale = p.CurrXriceSale.Replace(",", "");
            p.PriceCostCurrent = p.PriceCostCurrent.Replace(",", "");
            p.PriceSaleCurrent = p.PriceSaleCurrent.Replace(",", "");
            p.PriceCost = p.PriceCost.Replace(",", "");
            p.PriceSale = p.PriceSale.Replace(",", "");

            sql = "Update " + ps.table + " Set " + ps.dateInv + "='" + p.dateInv + "', " +
                ps.dateReceive + "='" + p.dateReceive + "', " +
                ps.locaId + "='" + p.locaId + "', " +
                ps.partId + "='" + p.partId + "', " +
                ps.PriceCost + "=" + NumberNull1(p.PriceCost) + ", " +
                ps.PriceSale + "=" + NumberNull1(p.PriceSale) + ", " +
                ps.serialNo + "='" + p.serialNo + "', " +
                ps.Remark + "='" + p.Remark + "', " +
                ps.Active + "='" + p.Active + "', " +
                ps.DateModi + "=" + p.DateModi + ", " +
                ps.CurrNamePriceCost + "='" + p.CurrNamePriceCost + "', " +
                ps.CurrNamePriceSale + "='" + p.CurrNamePriceSale + "', " +
                ps.CurrRatePriceCost + "=" + NumberNull1(p.CurrRatePriceCost) + ", " +
                ps.CurrRatePriceSale + "=" + NumberNull1(p.CurrRatePriceSale) + ", " +
                ps.CurrXPriceCost + "=" + NumberNull1(p.CurrXPriceCost) + ", " +
                ps.CurrXriceSale + "=" + NumberNull1(p.CurrXriceSale) + ", " +
                ps.PriceCostCurrent + "=" + NumberNull1(p.PriceCostCurrent) + ", " +
                ps.PriceSaleCurrent + "=" + NumberNull1(p.PriceSaleCurrent) + " " +

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
        public String insertPartSerialNo(PartSerialNo p)
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
        public String VoidPartSerialNo(String psId)
        {
            String sql = "", chk = "";

            sql = "Update " + ps.table + " Set " + ps.Active + "='3' " +
                "Where " + ps.pkField + "='" + psId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String updateDraw(String psId, String remarkDraw)
        {
            String sql = "", chk = "";
            remarkDraw = remarkDraw.Replace("''", "'");
            sql = "Update " + ps.table + " Set " + ps.StatusTran + "='2', "+ps.RemarkDraw+"='"+remarkDraw+"' " +
                "Where " + ps.pkField + "='" + psId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String updateReceive(String psId)
        {
            String sql = "", chk = "";

            sql = "Update " + ps.table + " Set " + ps.StatusTran + "='1' " +
                "Where " + ps.pkField + "='" + psId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        private String NumberNull1(String o)
        {
            if (o.Equals(""))
            {
                return "0";
            }
            else
            {
                return o;
            }
        }
    }
}
