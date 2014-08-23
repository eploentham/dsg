using dsg.object1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace dsg.objdb
{
    public class PartTypeSubDB
    {
        ConnectDB conn;
        public PartTypeSub pts;
        public PartTypeSubDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        private void initConfig()
        {
            pts = new PartTypeSub();
            pts.Remark = "part_type_sub_remark";
            pts.TypeId = "part_type_id";
            pts.Active = "part_type_sub_active";
            pts.Id = "part_type_sub_id";
            pts.TypeSubname = "part_type_sub_name";
            pts.Code = "part_type_sub_code";
            pts.sort1 = "sort1";

            pts.table = "b_part_type_sub";
            pts.pkField = "part_type_sub_id";
            
        }
        private PartTypeSub setData(PartTypeSub item, DataTable dt)
        {
            item.Remark = dt.Rows[0][pts.Remark].ToString();
            item.TypeId = dt.Rows[0][pts.TypeId].ToString();
            item.Active = dt.Rows[0][pts.Active].ToString();
            item.Id = dt.Rows[0][pts.Id].ToString();
            item.TypeSubname = dt.Rows[0][pts.TypeSubname].ToString();
            item.Code = dt.Rows[0][pts.Code].ToString();
            item.sort1 = dt.Rows[0][pts.sort1].ToString();

            return item;
        }
        public DataTable selectAll()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pts.table + " Where " + pts.Active + "='1' Order By "+pts.Code+"," + pts.sort1;
            dt = conn.selectData(sql);

            return dt;
        }
        public List<PartTypeSub> selectSAll()
        {
            List<PartTypeSub> ls = new List<PartTypeSub>();
            DataTable dt = selectAll();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    PartTypeSub item = new PartTypeSub();
                    item.Remark = dt.Rows[0][pts.Remark].ToString();
                    item.TypeId = dt.Rows[0][pts.TypeId].ToString();
                    item.Active = dt.Rows[0][pts.Active].ToString();
                    item.Id = dt.Rows[0][pts.Id].ToString();
                    item.TypeSubname = dt.Rows[0][pts.TypeSubname].ToString();
                    item.Code = dt.Rows[0][pts.Code].ToString();
                    item.sort1 = dt.Rows[0][pts.sort1].ToString();
                    ls.Add(item);
                }
            }
            return ls;
        }
        public PartTypeSub selectByPk(String saleId)
        {
            PartTypeSub item = new PartTypeSub();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pts.table + " Where " + pts.pkField + "='" + saleId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public PartTypeSub selectByCode(String saleId)
        {
            PartTypeSub item = new PartTypeSub();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pts.table + " Where " + pts.Id + "='" + saleId + "' and " + pts.Active + "='1' ";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public DataTable selectByptId(String ptId)
        {
            PartTypeSub item = new PartTypeSub();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pts.table + " Where " + pts.TypeId + "='" + ptId + "' and " + pts.Active + "='1' ";
            dt = conn.selectData(sql);
            
            return dt;
        }
        public String selectMaxSort(String ptId)
        {
            PartSerialNo item = new PartSerialNo();
            String sql = "", cnt = "";
            DataTable dt = new DataTable();
            sql = "Select max(" + pts.sort1 + ") as cnt From " + pts.table + " Where " + pts.TypeId + "='" + ptId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["cnt"] != null)
                {
                    if (dt.Rows[0]["cnt"].ToString().Equals(""))
                    {
                        cnt = "10";
                    }
                    else
                    {
                        cnt = dt.Rows[0]["cnt"].ToString();
                    }

                }
                else
                {
                    cnt = "10";
                }
            }
            else
            {
                cnt = "10";
            }
            return cnt;
        }
        private String insert(PartTypeSub p)
        {
            String sql = "", chk = "";
            if (p.Id.Equals(""))
            {
                p.Id = "pts"+p.getGenID();
            }
            //if (p.Limit1.Equals(""))
            //{
            //    p.Limit1 = "0";
            //}
            p.TypeSubname = p.TypeSubname.Replace("''", "'");
            p.Remark = p.Remark.Replace("''", "'");
            sql = "Insert Into " + pts.table + " (" + pts.pkField + "," + pts.Remark + "," + pts.TypeId + "," +
                pts.Active + "," + pts.TypeSubname + "," + pts.Code + "," + pts.sort1 + ") " +
                "Values('" + p.Id + "','" + p.Remark + "','" + p.TypeId + "','" +
                p.Active + "','" + p.TypeSubname + "','" + p.Code + "','" + p.sort1 + "')";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
                chk = p.Id;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "insert PartTypeSub");
            }
            finally
            {
            }
            return chk;
        }
        private String update(PartTypeSub p)
        {
            String sql = "", chk = "";

            p.Remark = p.Remark.Replace("''", "'");
            p.TypeSubname = p.TypeSubname.Replace("''", "'");
            sql = "Update " + pts.table + " Set " + pts.Remark + "='" + p.Remark + "', " +
                pts.TypeId + "='" + p.TypeId + "', " +
                pts.TypeSubname + "='" + p.TypeSubname + "', " +
                pts.sort1 + "='" + p.sort1 + "', " +
                pts.Code + "='" + p.Code + "' " +
                "Where " + pts.pkField + "='" + p.Id + "'";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "update PartTypeSub");
            }
            finally
            {
            }
            return chk;
        }
        public String insertPartTypeSub(PartTypeSub p)
        {
            PartTypeSub item = new PartTypeSub();
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
            sql = "Delete From " + pts.table;
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public ComboBox getCboPartTypeSub(ComboBox c)
        {
            ComboBoxItem item = new ComboBoxItem();
            DataTable dt = selectAll();
            //String aaa = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                item = new ComboBoxItem();
                item.Value = dt.Rows[i][pts.Id].ToString();
                item.Text = dt.Rows[i][pts.TypeSubname].ToString();
                c.Items.Add(item);
                //aaa += "new { Text = "+dt.Rows[i][sale.Name].ToString()+", Value = "+dt.Rows[i][sale.Id].ToString()+" },";
                //c.Items.Add(new );
            }
            return c;
        }
        public String VoidPartTypeSub(String ptId)
        {
            String sql = "", chk = "";

            sql = "Update " + pts.table + " Set " + pts.Active + "='3' " +
                "Where " + pts.pkField + "='" + ptId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
    }
}
