using dsg.object1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

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
            pt.Code = "part_type_code";
            pt.sort1 = "sort1";

            pt.table = "b_part_type";
            pt.pkField = "part_type_id";
        }
        private PartType setData(PartType item, DataTable dt)
        {
            item.Id = dt.Rows[0][pt.Id].ToString();
            item.Active = dt.Rows[0][pt.Active].ToString();
            item.partTName = dt.Rows[0][pt.partTName].ToString();
            item.Remark = dt.Rows[0][pt.Remark].ToString();
            item.Code = dt.Rows[0][pt.Code].ToString();
            item.sort1 = dt.Rows[0][pt.sort1].ToString();

            return item;
        }
        public DataTable selectAll()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pt.table + " Where " + pt.Active + "='1' Order By "+pt.sort1;
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
                    item.sort1 = dt1.Rows[0][pt.sort1].ToString();
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
        private String insert(PartType p)
        {
            String sql = "", chk = "";
            if (p.Id.Equals(""))
            {
                p.Id = "pt"+p.getGenID();
            }
            //if (p.Limit1.Equals(""))
            //{
            //    p.Limit1 = "0";
            //}
            p.partTName = p.partTName.Replace("''", "'");
            p.Remark = p.Remark.Replace("''", "'");
            sql = "Insert Into " + pt.table + " (" + pt.pkField + "," + pt.Active + "," + pt.partTName + "," +
                pt.Remark + "," + pt.Code + "," + pt.sort1 + ") " +
                "Values('" + p.Id + "','" + p.Active + "','" + p.partTName + "','" +
                p.Remark + "','" + p.Code + "','" + p.sort1 + "')";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
                chk = p.Id;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "insert PartType");
            }
            finally
            {
            }
            return chk;
        }
        private String update(PartType p)
        {
            String sql = "", chk = "";

            p.Remark = p.Remark.Replace("''", "'");
            p.partTName = p.partTName.Replace("''", "'");
            sql = "Update " + pt.table + " Set " + pt.partTName + "='" + p.partTName + "', " +
                pt.Remark + "='" + p.Remark + "', " +
                pt.sort1 + "='" + p.sort1 + "', " +
                pt.Code + "='" + p.Code + "' " +
                "Where " + pt.pkField + "='" + p.Id + "'";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "update PartType");
            }
            finally
            {
            }
            return chk;
        }
        public String insertPartType(PartType p)
        {
            PartType item = new PartType();
            String chk = "";
            item = selectByPk(p.Id);
            if (item.sort1.Equals(""))
            {
                item.sort1 = "99";
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
            sql = "Delete From " + pt.table;
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public ComboBox getCboPartType(ComboBox c)
        {
            ComboBoxItem item = new ComboBoxItem();
            try
            {
                DataTable dt = selectAll();
                //String aaa = "";
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    item = new ComboBoxItem();
                    item.Value = dt.Rows[i][pt.Id].ToString();
                    item.Text = dt.Rows[i][pt.partTName].ToString();
                    c.Items.Add(item);
                    //aaa += "new { Text = "+dt.Rows[i][sale.Name].ToString()+", Value = "+dt.Rows[i][sale.Id].ToString()+" },";
                    //c.Items.Add(new );
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(""+ex.Message, "");
            }
            
            return c;
        }
        public String VoidPartType(String ptId)
        {
            String sql = "", chk = "";

            sql = "Update " + pt.table + " Set " + pt.Active + "='3' " +
                "Where " + pt.pkField + "='" + ptId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
    }
}
