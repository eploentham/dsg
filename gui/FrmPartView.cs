﻿using dsg.control;
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
    }
}
