using dsg.object1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace dsg.objdb
{
    public class CurrencyDB
    {
        ConnectDB conn;
        public Currency curr;
        public CurrencyDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        private void initConfig()
        {
            curr = new Currency();
            curr.Active = "currency_active";
            curr.Id = "currency_id";
            curr.Name = "currency_name";
            curr.CurrRate = "currency_rate";
            curr.CurrX = "currency_x";
            curr.Remark = "remark";
            curr.Sort1 = "sort1";
            curr.Default = "current_default";

            curr.table = "b_currency";
            curr.pkField = "currency_id";
        }
        private Currency setData(Currency item, DataTable dt)
        {
            item.Active = dt.Rows[0][curr.Active].ToString();
            item.Id = dt.Rows[0][curr.Id].ToString();
            item.Name = dt.Rows[0][curr.Name].ToString();
            item.CurrRate = dt.Rows[0][curr.CurrRate].ToString();
            item.CurrX = dt.Rows[0][curr.CurrX].ToString();
            item.Remark = dt.Rows[0][curr.Remark].ToString();
            item.Sort1 = dt.Rows[0][curr.Sort1].ToString();
            item.Default = dt.Rows[0][curr.Default].ToString();

            return item;
        }
        public DataTable selectAll()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + curr.table + " Where " + curr.Active + "='1' Order By "+curr.Default+" desc,"+curr.Sort1+" asc";
            dt = conn.selectData(sql);

            return dt;
        }
        public Currency selectByPk(String saleId)
        {
            Currency item = new Currency();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + curr.table + " Where " + curr.pkField + "='" + saleId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        private String insert(Currency p)
        {
            String sql = "", chk = "";
            if (p.Id.Equals(""))
            {
                p.Id = p.getGenID();
            }

            p.Name = p.Name.Replace("''", "'");
            //p.Remark = p.Remark.Replace("''", "'");
            sql = "Insert Into " + curr.table + " (" + curr.pkField + "," + curr.Active + "," + curr.Name + "," +
                curr.CurrRate + "," + curr.CurrX + "," + curr.Remark + "," + curr.Sort1 + "," + curr.Default + ") " +
                "Values('" + p.Id + "','" + p.Active + "','" + p.Name + "'," +
                NumberNull1(p.CurrRate) + "," + NumberNull1(p.CurrX) + ",'" + p.Remark + "','" + p.Sort1 + "','" + p.Default + "')";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
                chk = p.Id;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "insert Currency");
            }
            finally
            {
            }
            return chk;
        }
        private String update(Currency p)
        {
            String sql = "", chk = "";

            p.Name = p.Name.Replace("''", "'");
            p.Remark = p.Remark.Replace("''", "'");

            sql = "Update " + curr.table + " Set " + curr.Name + "='" + p.Name + "', " +
                curr.CurrRate + "=" + NumberNull1(p.CurrRate) + ", " +
                curr.CurrX + "=" + NumberNull1(p.CurrX) + ", " +
                curr.Remark + "='" + p.Remark + "', " +
                curr.Sort1 + "='" + p.Sort1 + "', " +
                curr.Default + "='" + p.Default + "' " +
                "Where " + curr.pkField + "='" + p.Id + "'";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "update Currency");
            }
            finally
            {
            }
            return chk;
        }
        public String insertPartCate(Currency p)
        {
            Currency item = new Currency();
            String chk = "";
            item = selectByPk(p.Id);
            if (item.Sort1.Equals(""))
            {
                item.Sort1 = "9999";
            }
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
            sql = "Delete From " + curr.table;
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public ComboBox getCboCurrency(ComboBox c)
        {
            ComboBoxItem item = new ComboBoxItem();
            DataTable dt = selectAll();
            String default1 = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i == 0)
                {
                    default1 = dt.Rows[i][curr.Name].ToString();
                }
                item = new ComboBoxItem();
                item.Value = dt.Rows[i][curr.Id].ToString();
                item.Text = dt.Rows[i][curr.Name].ToString();
                c.Items.Add(item);
                //aaa += "new { Text = "+dt.Rows[i][sale.Name].ToString()+", Value = "+dt.Rows[i][sale.Id].ToString()+" },";
                //c.Items.Add(new );
            }
            c.Text = default1;
            return c;
        }
        public String VoidCurrency(String saleId)
        {
            String sql = "", chk = "";
            sql = "Update " + curr.table + " Set " + curr.Active + "='3' " +
                "Where " + curr.pkField + "='" + saleId + "'";
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
        public List<Currency> getListItemGroup(List<Currency> item)
        {
            //ComboBoxItem item = new ComboBoxItem();
            DataTable dt = selectAll();
            //c.Items.Clear();
            //String aaa = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Currency itg1 = new Currency();
                itg1.Active = dt.Rows[i][curr.Active].ToString();
                //item.Code = dt.Rows[0][itg.Code].ToString();
                itg1.Id = dt.Rows[i][curr.Id].ToString();
                itg1.Name = dt.Rows[i][curr.Name].ToString();
                itg1.CurrRate = dt.Rows[i][curr.CurrRate].ToString();
                itg1.CurrX = dt.Rows[i][curr.CurrX].ToString();
                itg1.Remark = dt.Rows[i][curr.Remark].ToString();
                itg1.Sort1 = dt.Rows[i][curr.Sort1].ToString();
                itg1.Default = dt.Rows[i][curr.Default].ToString();
                
                item.Add(itg1);
                //aaa += "new { Text = "+dt.Rows[i][sale.Name].ToString()+", Value = "+dt.Rows[i][sale.Id].ToString()+" },";
                //c.Items.Add(new );
            }
            return item;
        }
    }
}
