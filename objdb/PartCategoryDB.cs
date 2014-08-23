using dsg.object1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

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
            pc.Active = "part_cate_active";
            pc.CateName = "part_cate_name";
            pc.Id = "part_cate_id";
            pc.Remark = "part_cate_reamark";
            pc.Code = "part_cate_code";
            pc.sort1 = "sort1";

            pc.table = "b_part_category";
            pc.pkField = "part_cate_id";
        }
        private PartCategory setData(PartCategory item, DataTable dt)
        {
            item.Id = dt.Rows[0][pc.Id].ToString();
            item.Active = dt.Rows[0][pc.Active].ToString();
            item.CateName = dt.Rows[0][pc.CateName].ToString();
            item.Remark = dt.Rows[0][pc.Remark].ToString();
            item.Code = dt.Rows[0][pc.Code].ToString();
            item.sort1 = dt.Rows[0][pc.sort1].ToString();

            return item;
        }
        public DataTable selectAll()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pc.table + " Where " + pc.Active + "='1' Order By " + pc.sort1;
            dt = conn.selectData(sql);

            return dt;
        }
        public List<PartCategory> selectSAll()
        {
            List<PartCategory> ls = new List<PartCategory>();
            DataTable dt = selectAll();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    PartCategory item = new PartCategory();
                    item.Id = dt.Rows[0][pc.Id].ToString();
                    item.Active = dt.Rows[0][pc.Active].ToString();
                    item.CateName = dt.Rows[0][pc.CateName].ToString();
                    item.Remark = dt.Rows[0][pc.Remark].ToString();
                    item.Code = dt.Rows[0][pc.Code].ToString();
                    item.sort1 = dt.Rows[0][pc.sort1].ToString();
                    ls.Add(item);
                }
            }
            return ls;
        }
        public PartCategory selectByPk(String pcId)
        {
            PartCategory item = new PartCategory();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pc.table + " Where " + pc.pkField + "='" + pcId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public PartCategory selectByCode(String pcId)
        {
            PartCategory item = new PartCategory();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pc.table + " Where " + pc.Id + "='" + pcId + "' and " + pc.Active + "='1' ";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        private String insert(PartCategory p)
        {
            String sql = "", chk = "";
            if (p.Id.Equals(""))
            {
                p.Id = "pc"+p.getGenID();
            }
            //if (p.Limit1.Equals(""))
            //{
            //    p.Limit1 = "0";
            //}
            p.CateName = p.CateName.Replace("''", "'");
            p.Remark = p.Remark.Replace("''", "'");
            sql = "Insert Into " + pc.table + " (" + pc.pkField + "," + pc.Active + "," + pc.CateName + "," +
                pc.Remark + "," + pc.Code + "," + pc.sort1 + ") " +
                "Values('" + p.Id + "','" + p.Active + "','" + p.CateName + "','" +
                p.Remark + "','" + p.Code + "','" + p.sort1 + "')";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
                chk = p.Id;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "insert PartCategory");
            }
            finally
            {
            }
            return chk;
        }
        private String update(PartCategory p)
        {
            String sql = "", chk = "";

            p.Remark = p.Remark.Replace("''", "'");
            p.CateName = p.CateName.Replace("''", "'");
            sql = "Update " + pc.table + " Set " + pc.CateName + "='" + p.CateName + "', " +
                pc.Remark + "='" + p.Remark + "', " +
                pc.sort1 + "='" + p.sort1 + "', " +
                pc.Code + "='" + p.Code + "' " +
                "Where " + pc.pkField + "='" + p.Id + "'";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "update PartCategory");
            }
            finally
            {
            }
            return chk;
        }
        public String insertPartCate(PartCategory p)
        {
            PartCategory item = new PartCategory();
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
            sql = "Delete From " + pc.table;
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public ComboBox getCboPartCate(ComboBox c)
        {
            ComboBoxItem item = new ComboBoxItem();
            DataTable dt = selectAll();
            //String aaa = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                item = new ComboBoxItem();
                item.Value = dt.Rows[i][pc.Id].ToString();
                item.Text = dt.Rows[i][pc.CateName].ToString();
                c.Items.Add(item);
                //aaa += "new { Text = "+dt.Rows[i][sale.Name].ToString()+", Value = "+dt.Rows[i][sale.Id].ToString()+" },";
                //c.Items.Add(new );
            }
            return c;
        }
        public String VoidPartCate(String ptId)
        {
            String sql = "", chk = "";

            sql = "Update " + pc.table + " Set " + pc.Active + "='3' " +
                "Where " + pc.pkField + "='" + ptId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
    }
}
