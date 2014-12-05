using dsg.control;
using dsg.object1;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace dsg.gui
{
    public partial class FrmInitConfig : Form
    {
        DsgControl dc;
        Staff sf;
        object misValue = System.Reflection.Missing.Value;
        OpenFileDialog ofd = new OpenFileDialog();
        String fileName = "";
        public FrmInitConfig(String sfCode, DsgControl l)
        {
            InitializeComponent();
            initConfig(sfCode, l);
        }
        private void initConfig(String sfCode, DsgControl l)
        {
            dc = l;
            sf = dc.sfdb.selectByCode(sfCode);
            if (dc.initC.clearInput.Equals("yes"))
            {
                chkClearInput.Checked = true;
            }
            else
            {
                chkClearInput.Checked = false;
            }
            if (dc.initC.connectServer.Equals("yes"))
            {
                chkConnectServer.Checked = true;
                txtHost.Text = dc.initC.ServerIP;
                txtUser.Text = dc.initC.User;
                txtPwd.Text = dc.initC.Password;
                txtDatabase.Text = dc.initC.Database;
                txtDatabase.Visible = true;
                txtHost.Visible = true;
                txtPwd.Visible = true;
                txtUser.Visible = true;
            }
            else
            {
                chkConnectServer.Checked = false;
                txtDatabase.Visible = false;
                txtHost.Visible = false;
                txtPwd.Visible = false;
                txtUser.Visible = false;
            }
            txtPath.Text = dc.initC.pathImage;
            txtPath1.Text = dc.initC.pathImageBefore;
            if (dc.initC.delImage.Equals("yes"))
            {
                chkDelImage.Checked = true;
            }
            else
            {
                chkDelImage.Checked = false;
            }
        }
        private void FrmInitConfig_Load(object sender, EventArgs e)
        {

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            dc.SetClearInput(chkClearInput.Checked);

            dc.SetConnectServer(chkConnectServer.Checked, txtHost.Text, txtUser.Text, txtPwd.Text);
            dc.SetPathImage(txtPath.Text);
            dc.SetPathImageBefore(txtPath1.Text);
            dc.SetDelImage(chkDelImage.Checked);

            dc.GetConfig();
        }

        private void chkConnectServer_Click(object sender, EventArgs e)
        {
            if (chkConnectServer.Checked)
            {
                label1.Visible = true;
                label2.Visible = true;
                label3.Visible = true;
                label4.Visible = true;
                btnTest.Visible = true;
                lV1.Visible = true;
            }
            else
            {
                label1.Visible = false;
                label2.Visible = false;
                label3.Visible = false;
                label4.Visible = false;
                btnTest.Visible = false;
                lV1.Visible = false;
            }
        }

        private void btnPath_Click(object sender, EventArgs e)
        {
            //OpenFileDialog theDialog = new OpenFileDialog();
            //theDialog.Title = "Open Path File";
            ////theDialog.Filter = "TXT files|*.txt";
            //theDialog.InitialDirectory = @"C:\";
            //if (theDialog.ShowDialog() == DialogResult.OK)
            //{
            //    MessageBox.Show(theDialog.FileName.ToString());
            //}
            FolderBrowserDialog fbd = new FolderBrowserDialog();
            DialogResult result = fbd.ShowDialog();
            txtPath.Text = fbd.SelectedPath;
        }

        private void btnPath1_Click(object sender, EventArgs e)
        {
            FolderBrowserDialog fbd = new FolderBrowserDialog();
            DialogResult result = fbd.ShowDialog();
            txtPath1.Text = fbd.SelectedPath;
        }
        private void releaseObject(object obj)
        {
            try
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);
                obj = null;
            }
            catch (Exception ex)
            {
                obj = null;
                MessageBox.Show("Unable to release the Object " + ex.ToString());
            }
            finally
            {
                GC.Collect();
            }
        }

        private void btnConvert_Click(object sender, EventArgs e)
        {
            String code = "", partName = "", partNumber = "", SerialNo = "", certify = "", model = "";
            Cursor cursor = Cursor.Current;
            Cursor.Current = Cursors.WaitCursor;
            Microsoft.Office.Interop.Excel.Application xlApp = new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel.Workbook xlWorkbook = xlApp.Workbooks.Open(fileName);
            Microsoft.Office.Interop.Excel._Worksheet xlWorksheet = xlWorkbook.Sheets[1];
            Microsoft.Office.Interop.Excel.Range xlRange = xlWorksheet.UsedRange;
            int rowCount = xlRange.Rows.Count, row = 0, normal = 0;
            xlApp.Visible = false;
            for (int i = 6; i <= rowCount; i++)
            {

                if (xlRange.Cells[i, 2].Value2 != null)
                {
                    code = xlRange.Cells[i, 2].Value2.ToString();
                }
                else
                {
                    code = "";
                }
                if (xlRange.Cells[i, 3].Value2 != null)
                {
                    partName = xlRange.Cells[i, 3].Value2.ToString();
                }
                else
                {
                    partName = "";
                }
                if (xlRange.Cells[i+1, 3].Value2 != null)
                {
                    model = xlRange.Cells[i+1, 3].Value2.ToString();
                }
                else
                {
                    model = "";
                }
                if (xlRange.Cells[i, 4].Value2 != null)
                {
                    partNumber = xlRange.Cells[i, 4].Value2.ToString();
                }
                else
                {
                    partNumber = "";
                }
                if (xlRange.Cells[i, 5].Value2 != null)
                {
                    SerialNo = xlRange.Cells[i, 5].Value2.ToString();
                }
                else
                {
                    SerialNo = "";
                }
                Part pa = new Part();
                //pa.acftModel = cboAcftModel.Text;
                //pa.Model = model;
                //pa.Active = "1";
                //pa.barcode = "";
                //pa.CateId = dc.cf.getValueCboItem(cboPaCate);
                //pa.CateName = cboPaCate.Text;
                //pa.Certify = txtCertify.Text;
                //pa.Code = code;
                //pa.Name = partName;
                //pa.Id = "";
                //pa.TypeId = dc.cf.getValueCboItem(cboPaType);
                //pa.TypeName = cboPaType.Text;
                //pa.Remark = txtRemark.Text;
                //pa.Number = partNumber;

                //setPart();
                if (dc.padb.insertPart(pa).Length >= 1)
                {
                    MessageBox.Show("บันทึกข้อมูล เรียบร้อย", "บันทึกข้อมูล");
                    this.Dispose();
                    //this.Hide();
                }
            }

            xlWorkbook.Close(true, misValue, misValue);
            xlApp.Quit();
            releaseObject(xlApp);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ofd.ShowDialog();
            fileName = ofd.FileName;
        }
    }
}
