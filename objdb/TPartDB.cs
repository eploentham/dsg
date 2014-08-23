using dsg.object1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace dsg.objdb
{
    public class TPartDB
    {
        ConnectDB conn;
        public TPart TPa;
        public TPartDB(ConnectDB c)
        {
            conn = c;
            initConfig();
        }
        public void initConfig()
        {
            TPa = new TPart();
            TPa.Active = "t_part_active";
            TPa.DateCancel = "date_cancel";
            TPa.DateCreate = "date_create";
            TPa.DateModi = "date_modi";
            TPa.DateTran = "date_tran";
            TPa.Id = "t_part_id";
            TPa.partId = "part_id";
            TPa.PsId = "part_serial_no_id";
            TPa.StatusTran = "status_tran";

            TPa.pkField = "t_part_id";
            TPa.table = "t_part";
        }
        private TPart setData(TPart item, DataTable dt)
        {
            item.Active = dt.Rows[0][TPa.Active].ToString();
            item.DateCancel = dt.Rows[0][TPa.DateCancel].ToString();
            item.DateCreate = dt.Rows[0][TPa.DateCreate].ToString();
            item.DateModi = dt.Rows[0][TPa.DateModi].ToString();
            item.DateTran = dt.Rows[0][TPa.DateTran].ToString();

            item.Id = dt.Rows[0][TPa.Id].ToString();
            item.partId = dt.Rows[0][TPa.partId].ToString();
            item.PsId = dt.Rows[0][TPa.PsId].ToString();
            item.StatusTran = dt.Rows[0][TPa.StatusTran].ToString();

            return item;
        }
        public DataTable selectAll()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + TPa.table + " Where " + TPa.Active + "='1'";
            dt = conn.selectData(sql);

            return dt;
        }
        public DataTable selectByPart(String PaId)
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + TPa.table + " Where " + TPa.Active + "='1' and " + TPa.partId + "='" + PaId+"'";
            dt = conn.selectData(sql);

            return dt;
        }
        public TPart selectByPk(String tpaId)
        {
            TPart item = new TPart();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + TPa.table + " Where " + TPa.pkField + "='" + tpaId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        private String insert(TPart p)
        {
            String sql = "", chk = "";
            if (p.Id.Equals(""))
            {
                p.Id = "tpa" + p.getGenID();
            }
            //if (p.Limit1.Equals(""))
            //{
            //    p.Limit1 = "0";
            //}
            //p.Remark = p.Remark.Replace("''", "'");
            //p.Remark = p.Remark.Replace("''", "'");
            p.DateCreate = p.dateGenDB;
            sql = "Insert Into " + TPa.table + " (" + TPa.pkField + "," + TPa.Active + "," + TPa.DateCancel + "," +
                TPa.DateCreate + "," + TPa.DateModi + "," + TPa.DateTran + "," +
                TPa.partId + "," + TPa.PsId + "," + TPa.StatusTran + ") " +
                "Values('" + p.Id + "','" + p.Active + "','" + p.DateCancel + "'," +
                p.DateCreate + ",'" + p.DateModi + "','" + p.DateTran + "','" +
                p.partId + "','" + p.PsId + "','" + p.StatusTran + "')";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
                chk = p.Id;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "insert TPart");
            }
            finally
            {
            }
            return chk;
        }
        private String update(TPart p)
        {
            String sql = "", chk = "";

            //p.Remark = p.Remark.Replace("''", "'");
            //p.partTName = p.partTName.Replace("''", "'");
            p.DateModi = p.dateGenDB;
            sql = "Update " + TPa.table + " Set " + TPa.DateModi + "=" + p.DateModi + ", " +
                TPa.DateTran + "='" + p.DateTran + "', " +
                TPa.partId + "='" + p.partId + "', " +
                TPa.PsId + "='" + p.PsId + "' " +

                "Where " + TPa.pkField + "='" + p.Id + "'";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "update TPart");
            }
            finally
            {
            }
            return chk;
        }
        public String insertTPart(TPart p)
        {
            TPart item = new TPart();
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
            sql = "Delete From " + TPa.table;
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String VoidTPart(String ptId)
        {
            String sql = "", chk = "";

            sql = "Update " + TPa.table + " Set " + TPa.Active + "='3' " +
                "Where " + TPa.pkField + "='" + ptId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        //public String UpdateReceive(String ptId)
        //{
        //    String sql = "", chk = "";

        //    sql = "Update " + TPa.table + " Set " + TPa.StatusTran + "='1' " +
        //        "Where " + TPa.pkField + "='" + ptId + "'";
        //    chk = conn.ExecuteNonQuery(sql);
        //    return chk;
        //}
        //public String UpdateDraw(String ptId)
        //{
        //    String sql = "", chk = "";

        //    sql = "Update " + TPa.table + " Set " + TPa.StatusTran + "='2' " +
        //        "Where " + TPa.pkField + "='" + ptId + "'";
        //    chk = conn.ExecuteNonQuery(sql);
        //    return chk;
        //}
    }
}
