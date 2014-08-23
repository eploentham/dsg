using dsg.object1;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

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
            pa.CateId = "part_cate_id";
            pa.CateName = "part_cate_name";
            pa.Certify = "certify";
            pa.dateCancel = "date_cancel";
            pa.dateCreate = "date_create";
            pa.dateDraw = "date_draw";
            pa.dateInv = "date_inv";
            pa.dateModi = "date_modi";
            pa.dateReceive = "date_receive";
            pa.Name = "description";
            pa.Id = "part_id";
            pa.Code = "part_code";
            pa.Number = "part_number";
            pa.Remark = "part_remark";
            pa.pathPicCertify = "path_pic_certify";
            pa.PriceCost = "price_cost";
            pa.PriceSale = "price_sale";
            pa.SerialNo = "serial_no";
            pa.stockLoca1 = "stock_loca1";
            pa.stockLoca2 = "stock_loca2";
            pa.stockLoca3 = "stock_loca3";
            pa.stockLoca4 = "stock_loca4";
            pa.stockLoca5 = "stock_loca5";
            pa.InvNumber = "inv_number";
            pa.Model = "part_model";
            pa.TypeId = "part_type_id";
            pa.TypeName = "part_type_name";
            pa.Active = "part_active";
            pa.TypeSubId = "part_type_sub_id";
            pa.TypeSubName = "part_type_sub_name";
            pa.sort1 = "sort1";
            pa.pathPic1 = "path_pic1";
            pa.pathPic2 = "path_pic2";
            pa.pathPic3 = "path_pic3";
            pa.pathPic4 = "path_pic4";
            pa.pathPic5 = "path_pic5";

            pa.table = "b_part";
            pa.pkField = "part_id";
        }
        private Part setData(Part item, DataTable dt)
        {
            item.acftModel = dt.Rows[0][pa.acftModel].ToString();
            item.barcode = dt.Rows[0][pa.barcode].ToString();
            item.CateId = dt.Rows[0][pa.CateId].ToString();
            item.Certify = dt.Rows[0][pa.Certify].ToString();
            item.dateCancel = dt.Rows[0][pa.dateCancel].ToString();

            item.dateCreate = dt.Rows[0][pa.dateCreate].ToString();
            item.dateDraw = dt.Rows[0][pa.dateDraw].ToString();
            item.dateInv = dt.Rows[0][pa.dateInv].ToString();
            item.dateModi = dt.Rows[0][pa.dateModi].ToString();
            item.dateReceive = dt.Rows[0][pa.dateReceive].ToString();

            item.Name = dt.Rows[0][pa.Name].ToString();
            item.Id = dt.Rows[0][pa.Id].ToString();
            item.Code = dt.Rows[0][pa.Code].ToString();
            item.Number = dt.Rows[0][pa.Number].ToString();

            item.Remark = dt.Rows[0][pa.Remark].ToString();
            item.pathPicCertify = dt.Rows[0][pa.pathPicCertify].ToString();
            item.PriceCost = dt.Rows[0][pa.PriceCost].ToString();
            item.PriceSale = dt.Rows[0][pa.PriceSale].ToString();
            item.SerialNo = dt.Rows[0][pa.SerialNo].ToString();
            item.stockLoca1 = dt.Rows[0][pa.stockLoca1].ToString();

            item.stockLoca2 = dt.Rows[0][pa.stockLoca2].ToString();
            item.stockLoca3 = dt.Rows[0][pa.stockLoca3].ToString();
            item.stockLoca4 = dt.Rows[0][pa.stockLoca4].ToString();
            item.stockLoca5 = dt.Rows[0][pa.stockLoca5].ToString();
            item.InvNumber = dt.Rows[0][pa.InvNumber].ToString();

            item.Model = dt.Rows[0][pa.Model].ToString();
            item.TypeSubId = dt.Rows[0][pa.TypeSubId].ToString();
            item.TypeSubName = dt.Rows[0][pa.TypeSubName].ToString();
            item.pathPic1 = dt.Rows[0][pa.pathPic1].ToString();
            item.pathPic2 = dt.Rows[0][pa.pathPic2].ToString();

            item.pathPic3 = dt.Rows[0][pa.pathPic3].ToString();
            item.pathPic4 = dt.Rows[0][pa.pathPic4].ToString();
            item.pathPic5 = dt.Rows[0][pa.pathPic5].ToString();
            item.pathPicCertify = dt.Rows[0][pa.pathPicCertify].ToString();
            item.TypeName = dt.Rows[0][pa.TypeName].ToString();

            item.TypeId = dt.Rows[0][pa.TypeId].ToString();
            item.CateName = dt.Rows[0][pa.CateName].ToString();

            return item;
        }
        public DataTable selectAll()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pa.table + " Where " + pa.Active + "='1'";
            dt = conn.selectData(sql);

            return dt;
        }
        public DataTable selectModel()
        {
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select distinct "+pa.acftModel+" From " + pa.table + " Where " + pa.Active + "='1'";
            dt = conn.selectData(sql);

            return dt;
        }
        public List<Part> selectSAll()
        {
            List<Part> ls = new List<Part>();
            DataTable dt = selectAll();
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Part item = new Part();
                    item.acftModel = dt.Rows[0][pa.acftModel].ToString();
                    item.barcode = dt.Rows[0][pa.barcode].ToString();
                    item.CateId = dt.Rows[0][pa.CateId].ToString();
                    item.Certify = dt.Rows[0][pa.Certify].ToString();
                    item.dateCancel = dt.Rows[0][pa.dateCancel].ToString();

                    item.dateCreate = dt.Rows[0][pa.dateCreate].ToString();
                    item.dateDraw = dt.Rows[0][pa.dateDraw].ToString();
                    item.dateInv = dt.Rows[0][pa.dateInv].ToString();
                    item.dateModi = dt.Rows[0][pa.dateModi].ToString();
                    item.dateReceive = dt.Rows[0][pa.dateReceive].ToString();

                    item.Name = dt.Rows[0][pa.Name].ToString();
                    item.Id = dt.Rows[0][pa.Id].ToString();
                    item.Code = dt.Rows[0][pa.Code].ToString();
                    item.Number = dt.Rows[0][pa.Number].ToString();

                    item.Remark = dt.Rows[0][pa.Remark].ToString();
                    item.pathPicCertify = dt.Rows[0][pa.pathPicCertify].ToString();
                    item.PriceCost = dt.Rows[0][pa.PriceCost].ToString();
                    item.PriceSale = dt.Rows[0][pa.PriceSale].ToString();
                    item.SerialNo = dt.Rows[0][pa.SerialNo].ToString();
                    item.stockLoca1 = dt.Rows[0][pa.stockLoca1].ToString();

                    item.stockLoca2 = dt.Rows[0][pa.stockLoca2].ToString();
                    item.stockLoca3 = dt.Rows[0][pa.stockLoca3].ToString();
                    item.stockLoca4 = dt.Rows[0][pa.stockLoca4].ToString();
                    item.stockLoca5 = dt.Rows[0][pa.stockLoca5].ToString();
                    item.InvNumber = dt.Rows[0][pa.InvNumber].ToString();

                    item.CateName = dt.Rows[0][pa.CateName].ToString();
                    item.TypeId = dt.Rows[0][pa.TypeId].ToString();
                    item.TypeName = dt.Rows[0][pa.TypeName].ToString();

                    item.Model = dt.Rows[0][pa.Model].ToString();
                    item.TypeSubId = dt.Rows[0][pa.TypeSubId].ToString();
                    item.TypeSubName = dt.Rows[0][pa.TypeSubName].ToString();
                    item.pathPic1 = dt.Rows[0][pa.pathPic1].ToString();
                    item.pathPic2 = dt.Rows[0][pa.pathPic2].ToString();

                    item.pathPic3 = dt.Rows[0][pa.pathPic3].ToString();
                    item.pathPic4 = dt.Rows[0][pa.pathPic4].ToString();
                    item.pathPic5 = dt.Rows[0][pa.pathPic5].ToString();
                    item.pathPicCertify = dt.Rows[0][pa.pathPicCertify].ToString();

                    ls.Add(item);
                }
            }
            return ls;
        }
        public Part selectByPk(String pcId)
        {
            Part item = new Part();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pa.table + " Where " + pa.pkField + "='" + pcId + "'";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        public Part selectByCode(String pcId)
        {
            Part item = new Part();
            String sql = "";
            DataTable dt = new DataTable();
            sql = "Select * From " + pa.table + " Where " + pa.Id + "='" + pcId + "' and " + pa.Active + "='1' ";
            dt = conn.selectData(sql);
            if (dt.Rows.Count > 0)
            {
                item = setData(item, dt);
            }
            return item;
        }
        private String insert(Part p)
        {
            String sql = "", chk = "";
            if (p.Id.Equals(""))
            {
                p.Id = "pa"+p.getGenID();
            }
            //if (p.Limit1.Equals(""))
            //{
            //    p.Limit1 = "0";
            //}
            p.Name = p.Name.Replace("''", "'");
            p.Remark = p.Remark.Replace("''", "'");
            p.CateName = p.CateName.Replace("''", "'");
            p.TypeName = p.TypeName.Replace("''", "'");
            p.acftModel = p.acftModel.Replace("''", "'");
            p.Model = p.Model.Replace("''", "'");
            sql = "Insert Into " + pa.table + " (" + pa.pkField + "," + pa.acftModel + "," + pa.barcode + "," +
                pa.CateId + "," + pa.Certify + "," + pa.dateCancel + ", " +
                pa.dateCreate + "," + pa.dateDraw + "," + pa.dateInv + ", " +
                pa.dateModi + "," + pa.dateReceive + "," + pa.Name + ", " +
                pa.Code + "," + pa.Number + "," + pa.Remark + ", " +
                pa.pathPicCertify + "," + pa.PriceCost + "," + pa.PriceSale + ", " +
                pa.SerialNo + "," + pa.stockLoca1 + "," + pa.stockLoca2 + ", " +
                pa.stockLoca3 + "," + pa.stockLoca4 + "," + pa.stockLoca5 + "," +
                pa.CateName + "," + pa.TypeId + "," + pa.TypeName + "," +
                pa.Active + "," + pa.TypeSubId + "," + pa.TypeSubName + "," + pa.Model + ") " +
                "Values('" + p.Id + "','" + p.acftModel + "','" + p.barcode + "','" +
                p.CateId + "','" + p.Certify + "','" + p.dateCancel + "','"+
                p.dateCreate + "','" + p.dateDraw + "','" + p.dateInv + "','" +
                p.dateModi + "','" + p.dateReceive + "','" + p.Name + "','" +
                p.Code + "','" + p.Number + "','" + p.Remark + "','" +
                p.pathPicCertify + "','" + p.PriceCost + "','" + p.PriceSale + "','" +
                p.SerialNo + "','" + p.stockLoca1 + "','" + p.stockLoca2 + "','" +
                p.stockLoca3 + "','" + p.stockLoca4 + "','" + p.stockLoca5 + "','" +
                p.CateName + "','" + p.TypeId + "','" + p.TypeName + "','" +
                p.Active + "','" + p.TypeSubId + "','" + p.TypeSubName + "','" + p.Model + "')";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
                chk = p.Id;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "insert Part");
            }
            finally
            {
            }
            return chk;
        }
        private String update(Part p)
        {
            String sql = "", chk = "";

            p.Remark = p.Remark.Replace("''", "'");
            p.Name = p.Name.Replace("''", "'");
            p.CateName = p.CateName.Replace("''", "'");
            p.TypeName = p.TypeName.Replace("''", "'");
            p.Model = p.Model.Replace("''", "'");

            sql = "Update " + pa.table + " Set " + pa.acftModel + "='" + p.acftModel + "', " +
                pa.barcode + "='" + p.barcode + "', " +
                pa.CateId + "='" + p.CateId + "', " +
                pa.Certify + "='" + p.Certify + "', " +
                pa.dateCancel + "='" + p.dateCancel + "', " +
                pa.dateCreate + "='" + p.dateCreate + "', " +
                pa.dateDraw + "='" + p.dateDraw + "', " +
                pa.dateInv + "='" + p.dateInv + "', " +
                pa.dateModi + "='" + p.dateModi + "', " +
                pa.dateReceive + "='" + p.dateReceive + "', " +
                pa.Name + "='" + p.Name + "', " +
                pa.Code + "='" + p.Code + "', " +
                pa.Number + "='" + p.Number + "', " +
                pa.Remark + "='" + p.Remark + "', " +
                pa.pathPicCertify + "='" + p.pathPicCertify + "', " +
                pa.PriceCost + "='" + p.PriceCost + "', " +
                pa.PriceSale + "='" + p.PriceSale + "', " +
                pa.SerialNo + "='" + p.SerialNo + "', " +
                pa.stockLoca1 + "='" + p.stockLoca1 + "', " +
                pa.stockLoca2 + "='" + p.stockLoca2 + "', " +
                pa.stockLoca3 + "='" + p.stockLoca3 + "', " +
                pa.stockLoca4 + "='" + p.stockLoca4 + "', " +
                pa.stockLoca5 + "='" + p.stockLoca5 + "', " +
                pa.CateName + "='" + p.CateName + "', " +
                pa.TypeId + "='" + p.TypeId + "', " +
                pa.TypeName + "='" + p.TypeName + "', " +
                pa.TypeSubId + "='" + p.TypeSubId + "', " +
                pa.TypeSubName + "='" + p.TypeSubName + "', " +
                pa.Model + "='" + p.Model + "' " +
                "Where " + pa.pkField + "='" + p.Id + "'";
            try
            {
                chk = conn.ExecuteNonQuery(sql);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error " + ex.ToString(), "update Part");
            }
            finally
            {
            }
            return chk;
        }
        public String insertPart(Part p)
        {
            Part item = new Part();
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
            sql = "Delete From " + pa.table;
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public ComboBox getCboPart(ComboBox c)
        {
            ComboBoxItem item = new ComboBoxItem();
            DataTable dt = selectAll();
            //String aaa = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                item = new ComboBoxItem();
                item.Value = dt.Rows[i][pa.Id].ToString();
                item.Text = dt.Rows[i][pa.Code].ToString();
                c.Items.Add(item);
                //aaa += "new { Text = "+dt.Rows[i][sale.Name].ToString()+", Value = "+dt.Rows[i][sale.Id].ToString()+" },";
                //c.Items.Add(new );
            }
            return c;
        }
        public ComboBox getCboModel(ComboBox c)
        {
            ComboBoxItem item = new ComboBoxItem();
            DataTable dt = selectModel();
            //String aaa = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                item = new ComboBoxItem();
                item.Value = dt.Rows[i][pa.acftModel].ToString();
                item.Text = dt.Rows[i][pa.acftModel].ToString();
                c.Items.Add(item);
                //aaa += "new { Text = "+dt.Rows[i][sale.Name].ToString()+", Value = "+dt.Rows[i][sale.Id].ToString()+" },";
                //c.Items.Add(new );
            }
            return c;
        }
        public String VoidPartType(String ptId)
        {
            String sql = "", chk = "";

            sql = "Update " + pa.table + " Set " + pa.Active + "='3' " +
                "Where " + pa.pkField + "='" + ptId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdatePathPicCertify(String paId, String fileName)
        {
            String sql = "", chk = "";

            sql = "Update " + pa.table + " Set " + pa.pathPicCertify + "='"+fileName+"' " +
                "Where " + pa.pkField + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdatePathPic1(String paId, String fileName)
        {
            String sql = "", chk = "";

            sql = "Update " + pa.table + " Set " + pa.pathPic1 + "='" + fileName + "' " +
                "Where " + pa.pkField + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdatePathPic2(String paId, String fileName)
        {
            String sql = "", chk = "";

            sql = "Update " + pa.table + " Set " + pa.pathPic2 + "='" + fileName + "' " +
                "Where " + pa.pkField + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdatePathPic3(String paId, String fileName)
        {
            String sql = "", chk = "";

            sql = "Update " + pa.table + " Set " + pa.pathPic3 + "='" + fileName + "' " +
                "Where " + pa.pkField + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdatePathPic4(String paId, String fileName)
        {
            String sql = "", chk = "";

            sql = "Update " + pa.table + " Set " + pa.pathPic4 + "='" + fileName + "' " +
                "Where " + pa.pkField + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdatePathPic5(String paId, String fileName)
        {
            String sql = "", chk = "";

            sql = "Update " + pa.table + " Set " + pa.pathPic5 + "='" + fileName + "' " +
                "Where " + pa.pkField + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdateTypeName(String paId, String TypeName)
        {
            String sql = "", chk = "";
            TypeName = TypeName.Replace("''", "'");
            sql = "Update " + pa.table + " Set " + pa.TypeName + "='" + TypeName + "' " +
                "Where " + pa.TypeId + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdateTypeSubName(String paId, String TypeSubName)
        {
            String sql = "", chk = "";
            TypeSubName = TypeSubName.Replace("''", "'");
            sql = "Update " + pa.table + " Set " + pa.TypeSubName + "='" + TypeSubName + "' " +
                "Where " + pa.TypeSubId + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
        public String UpdateCateName(String paId, String CateName)
        {
            String sql = "", chk = "";
            CateName = CateName.Replace("''", "'");
            sql = "Update " + pa.table + " Set " + pa.CateName + "='" + CateName + "' " +
                "Where " + pa.CateId + "='" + paId + "'";
            chk = conn.ExecuteNonQuery(sql);
            return chk;
        }
    }
}
