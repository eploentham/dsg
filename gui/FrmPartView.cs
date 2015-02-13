using dsg.control;
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
    public partial class FrmPartView : Form
    {
        DsgControl dc;
        int colCnt = 10;
        int colRow = 0, colCode = 1, colName = 2, colModel = 3, colType = 4, colCate = 5, colPriceCost = 6, colPriceSale = 7, colRemark = 8, colId = 9;
        public FrmPartView(DsgControl d)
        {
            InitializeComponent();
            initConfig(d);
        }
        private void initConfig(DsgControl d)
        {
            dc = d;
            pB1.Visible = false;
            setGrd();
            //dt = lc.selectStaffAll();
            cboPrint.Items.Add("Print Part");
            cboPrint.Items.Add("Print Serial No");
            cboPrint.Items.Add("");
        }
        public void setGrd()
        {
            DataTable dt = new DataTable();
            dt = dc.padb.selectAll();
            dgvView.ColumnCount = colCnt;

            dgvView.RowCount = dt.Rows.Count + 1;
            dgvView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvView.Columns[colRow].Width = 50;
            dgvView.Columns[colName].Width = 180;
            dgvView.Columns[colRemark].Width = 180;
            dgvView.Columns[colId].Width = 80;
            dgvView.Columns[colCode].Width = 120;
            dgvView.Columns[colModel].Width = 250;
            dgvView.Columns[colType].Width = 180;
            dgvView.Columns[colCate].Width = 180;

            dgvView.Columns[colRow].HeaderText = "ลำดับ";
            dgvView.Columns[colCode].HeaderText = "code";
            dgvView.Columns[colName].HeaderText = "ชื่อ";
            dgvView.Columns[colModel].HeaderText = "Model";
            dgvView.Columns[colType].HeaderText = "ประเภท";
            dgvView.Columns[colCate].HeaderText = "ชนิด";
            dgvView.Columns[colPriceCost].HeaderText = "ราคาทุน";
            dgvView.Columns[colPriceSale].HeaderText = "ราคาขาย";
            dgvView.Columns[colRemark].HeaderText = "หมายเหตุ";
            dgvView.Columns[colId].HeaderText = "id";
            //dgvView.Columns[colPriority].HeaderText = "สิทธิใช้งาน";
            //dgvView.Columns[colPassword].HeaderText = "  ";

            dgvView.Columns[colId].HeaderText = "id";
            Font font = new Font("Microsoft Sans Serif", 12);

            dgvView.Font = font;
            dgvView.Columns[colId].Visible = false;
            dgvView.ReadOnly = true;
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dgvView[colRow, i].Value = (i + 1);
                    dgvView[colCode, i].Value = dt.Rows[i][dc.padb.pa.Code].ToString();
                    dgvView[colName, i].Value = dt.Rows[i][dc.padb.pa.Name].ToString();
                    dgvView[colRemark, i].Value = dt.Rows[i][dc.padb.pa.Remark].ToString();
                    dgvView[colModel, i].Value = dt.Rows[i][dc.padb.pa.Model].ToString();
                    dgvView[colType, i].Value = dt.Rows[i][dc.padb.pa.TypeName].ToString();
                    dgvView[colCate, i].Value = dt.Rows[i][dc.padb.pa.CateName].ToString();
                    dgvView[colPriceCost, i].Value = String.Format("{0:#,###,###.00}", dt.Rows[i][dc.padb.pa.PriceCost]);
                    dgvView[colPriceSale, i].Value = String.Format("{0:#,###,###.00}", dt.Rows[i][dc.padb.pa.PriceSale]);
                    dgvView[colId, i].Value = dt.Rows[i][dc.padb.pa.Id].ToString();

                    if ((i % 2) != 0)
                    {
                        dgvView.Rows[i].DefaultCellStyle.BackColor = Color.LightSalmon;
                    }
                }
            }
        }
        private void setResize()
        {
            dgvView.Width = this.Width - 50;
            dgvView.Height = this.Height - 150;

            //groupBox1.Width = this.Width - 50;
            //groupBox1.Height = this.Height = 150;
        }
        private void FrmPartView_Load(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            FrmPartAdd frm = new FrmPartAdd(dc,"");
            this.Hide();
            frm.ShowDialog(this);
            this.Show();
            setGrd();
        }

        private void dgvView_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            if (dgvView[colId, e.RowIndex].Value == null)
            {
                return;
            }
            FrmPartAdd frm = new FrmPartAdd(dc, dgvView[colId, e.RowIndex].Value.ToString());
            //frm.setControl(dgvView[colId, e.RowIndex].Value.ToString());
            this.Hide();
            frm.ShowDialog(this);
            this.Show();
            setGrd();
        }

        private void FrmPartView_Resize(object sender, EventArgs e)
        {
            setResize();
        }

        private void btnPrint_Click(object sender, EventArgs e)
        {
            //String sql = "";
            DataTable dt = new DataTable();
            FrmReport frm = new FrmReport(dc);
            if (cboPrint.Text.Equals("Print Part"))
            {
                dt = dc.padb.selectBitemListPrint();
                frm.setReportBtem(dt);
            }
            else if (cboPrint.Text.Equals("Print Serial No"))
            {
                dt = dc.padb.selectPartSerialNoListPrint();
                frm.setReportPartSerialNo(dt);
            }
            
            frm.ShowDialog(this);
        }

        private void btnExcel_Click(object sender, EventArgs e)
        {
            //String sql = "";
            DataTable dt = new DataTable();
            //FrmReport frm = new FrmReport(dc);
            if (cboPrint.Text.Equals("Print Part"))
            {
                dt = dc.padb.selectBitemListPrint();
                //frm.setReportBtem(dt);
            }
            else if (cboPrint.Text.Equals("Print Serial No"))
            {
                dt = dc.padb.selectPartSerialNoListPrint();
                //frm.setReportPartSerialNo(dt);
            }



            pB1.Show();
            Microsoft.Office.Interop.Excel.Application excelapp = new Microsoft.Office.Interop.Excel.Application();
            excelapp.Visible = false;
            String visitDate = "", visitTime = "", err = "", err1 = "", pharName = "";

            Microsoft.Office.Interop.Excel._Workbook workbook = (Microsoft.Office.Interop.Excel._Workbook)(excelapp.Workbooks.Add(Type.Missing));
            Microsoft.Office.Interop.Excel._Worksheet worksheet = (Microsoft.Office.Interop.Excel._Worksheet)workbook.ActiveSheet;
            pB1.Minimum = 0;
            pB1.Maximum = dt.Rows.Count;
            //worksheet.Cells[0, 0] = "patient name";
            for (int i = 1; i < dt.Rows.Count; i++)
            {
                try
                {
                    worksheet.Cells[i, colPatientHnno] = dgvAdd[colPatientHnno, i].Value.ToString();
                    worksheet.Cells[i, colPatientName] = dgvAdd[colPatientName, i].Value.ToString();
                    err = "001 " + dgvAdd[colPatientHnno, i].Value.ToString();
                    //worksheet.Cells[i, colDate] = dgvAdd[colDate, i].Value.ToString();
                    //worksheet.Cells[i, colTime] = dgvAdd[colTime, i].Value.ToString();
                    worksheet.Cells[i, colDiaCD1] = config1.stringNull(dgvAdd[colDiaCD1, i].Value.ToString());
                    if (dgvAdd[colDate, i].Value == null)
                    {
                        worksheet.Cells[i, colDate].Value = "";
                    }
                    else
                    {
                        visitDate = dgvAdd[colDate, i].Value.ToString();
                        worksheet.Cells[i, colDate] = visitDate;
                        visitTime = dgvAdd[colTime, i].Value.ToString();
                        worksheet.Cells[i, colTime] = visitTime;
                    }
                    err = "002 Dia";
                    if (dgvAdd[colDiaCD2, i].Value == null)
                    {
                        worksheet.Cells[i, colDiaCD2] = "";
                    }
                    else
                    {
                        worksheet.Cells[i, colDiaCD2] = config1.stringNull1(dgvAdd[colDiaCD2, i].Value.ToString());
                    }
                    err = "003 Chronic ";
                    worksheet.Cells[i, colDiaCD3] = config1.stringNull1(dgvAdd[colDiaCD3, i].Value);
                    worksheet.Cells[i, colDiaCD4] = config1.stringNull1(dgvAdd[colDiaCD4, i].Value);
                    worksheet.Cells[i, colDiaCD5] = config1.stringNull1(dgvAdd[colDiaCD5, i].Value);

                    worksheet.Cells[i, colCHRONICCODE1] = config1.stringNull1(dgvAdd[colCHRONICCODE1, i].Value);
                    worksheet.Cells[i, colCHRONICCODE2] = config1.stringNull1(dgvAdd[colCHRONICCODE2, i].Value);
                    worksheet.Cells[i, colCHRONICCODE3] = config1.stringNull1(dgvAdd[colCHRONICCODE3, i].Value);
                    worksheet.Cells[i, colCHRONICCODE4] = config1.stringNull1(dgvAdd[colCHRONICCODE4, i].Value);
                    worksheet.Cells[i, colCHRONICCODE5] = config1.stringNull1(dgvAdd[colCHRONICCODE5, i].Value);
                    if (nudChronic.Value <= 5)
                    {
                        continue;
                    }

                    worksheet.Cells[i, colCHRONICCODE6] = config1.stringNull1(dgvAdd[colCHRONICCODE6, i].Value);
                    worksheet.Cells[i, colCHRONICCODE7] = config1.stringNull1(dgvAdd[colCHRONICCODE7, i].Value);
                    worksheet.Cells[i, colCHRONICCODE8] = config1.stringNull1(dgvAdd[colCHRONICCODE8, i].Value);
                    worksheet.Cells[i, colCHRONICCODE9] = config1.stringNull1(dgvAdd[colCHRONICCODE9, i].Value);
                    worksheet.Cells[i, colCHRONICCODE10] = config1.stringNull1(dgvAdd[colCHRONICCODE10, i].Value);
                    err = "004 Drug ";

                    worksheet.Cells[i, colDrug1] = config1.stringNull1(dgvAdd[colDrug1, i].Value);
                    worksheet.Cells[i, colDrug2] = config1.stringNull1(dgvAdd[colDrug2, i].Value);
                    worksheet.Cells[i, colDrug3] = config1.stringNull1(dgvAdd[colDrug3, i].Value);
                    worksheet.Cells[i, colDrug4] = config1.stringNull1(dgvAdd[colDrug4, i].Value);
                    worksheet.Cells[i, colDrug5] = config1.stringNull1(dgvAdd[colDrug5, i].Value);

                    worksheet.Cells[i, colDrug6] = config1.stringNull1(dgvAdd[colDrug6, i].Value);
                    worksheet.Cells[i, colDrug7] = config1.stringNull1(dgvAdd[colDrug7, i].Value);
                    worksheet.Cells[i, colDrug8] = config1.stringNull1(dgvAdd[colDrug8, i].Value);
                    worksheet.Cells[i, colDrug9] = config1.stringNull1(dgvAdd[colDrug9, i].Value);
                    worksheet.Cells[i, colDrug10] = config1.stringNull1(dgvAdd[colDrug10, i].Value);
                    if (nudDrug.Value <= 10)
                    {
                        continue;
                    }

                    worksheet.Cells[i, colDrug11] = config1.stringNull1(dgvAdd[colDrug11, i].Value);
                    worksheet.Cells[i, colDrug12] = config1.stringNull1(dgvAdd[colDrug12, i].Value);
                    worksheet.Cells[i, colDrug13] = config1.stringNull1(dgvAdd[colDrug13, i].Value);
                    worksheet.Cells[i, colDrug14] = config1.stringNull1(dgvAdd[colDrug14, i].Value);
                    worksheet.Cells[i, colDrug15] = config1.stringNull1(dgvAdd[colDrug15, i].Value);

                    worksheet.Cells[i, colDrug16] = config1.stringNull1(dgvAdd[colDrug16, i].Value);
                    worksheet.Cells[i, colDrug17] = config1.stringNull1(dgvAdd[colDrug17, i].Value);
                    worksheet.Cells[i, colDrug18] = config1.stringNull1(dgvAdd[colDrug18, i].Value);
                    worksheet.Cells[i, colDrug19] = config1.stringNull1(dgvAdd[colDrug19, i].Value);
                    worksheet.Cells[i, colDrug20] = config1.stringNull1(dgvAdd[colDrug20, i].Value);
                    pB1.Value = i;
                }
                catch (Exception ex)
                {
                    //MessageBox.Show("Error " + ex.Message + "\n row " + i, "error " + err);
                }
                if (dgvAdd[colPatientHnno, i].Value == null)
                {
                    continue;
                }

            }


            //worksheet.Cells[1, 1] = "Name";
            //worksheet.Cells[1, 2] = "Bid";

            //worksheet.Cells[2, 1] = txbName.Text;
            //worksheet.Cells[2, 2] = txbResult.Text;
            pB1.Hide();
            excelapp.UserControl = true;
            excelapp.Visible = true;
        }
    }
}
