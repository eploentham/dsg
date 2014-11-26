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
    public partial class FrmPartTypeView : Form
    {
        DsgControl dc;
        Staff sf;
        int colCnt = 5;
        int colRow = 0, colCode = 1, colName = 2, colRemark = 3, colId = 4;
        public FrmPartTypeView(DsgControl d)
        {
            InitializeComponent();
            initConfig(d);
        }
        private void initConfig(DsgControl d)
        {
            dc = d;
            setGrd();
            //dt = lc.selectStaffAll();
        }
        public void setGrd()
        {
            DataTable dt = new DataTable();
            dt = dc.ptdb.selectAll();
            dgvView.ColumnCount = colCnt;

            dgvView.RowCount = dt.Rows.Count + 1;
            dgvView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvView.Columns[colRow].Width = 50;
            dgvView.Columns[colName].Width = 150;
            dgvView.Columns[colRemark].Width = 120;
            dgvView.Columns[colId].Width = 80;
            dgvView.Columns[colCode].Width = 80;
            //dgvView.Columns[colPriority].Width = 180;

            dgvView.Columns[colRow].HeaderText = "ลำดับ";
            dgvView.Columns[colCode].HeaderText = "code";
            dgvView.Columns[colName].HeaderText = "ชื่อ";
            dgvView.Columns[colRemark].HeaderText = "หมายเหตุ";
            dgvView.Columns[colId].HeaderText = "id";
            //dgvView.Columns[colPriority].HeaderText = "สิทธิใช้งาน";
            //dgvView.Columns[colPassword].HeaderText = "  ";

            dgvView.Columns[colId].HeaderText = "id";
            Font font = new Font("Microsoft Sans Serif", 12);

            dgvView.Font = font;
            dgvView.Columns[colId].Visible = false;
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dgvView[colRow, i].Value = (i + 1);
                    dgvView[colCode, i].Value = dt.Rows[i][dc.ptdb.pt.Code].ToString();
                    dgvView[colName, i].Value = dt.Rows[i][dc.ptdb.pt.partTName].ToString();
                    dgvView[colRemark, i].Value = dt.Rows[i][dc.ptdb.pt.Remark].ToString();
                    dgvView[colId, i].Value = dt.Rows[i][dc.ptdb.pt.Id].ToString();

                    if ((i % 2) != 0)
                    {
                        dgvView.Rows[i].DefaultCellStyle.BackColor = Color.LightSalmon;
                    }
                }
            }
        }
        private void setResize()
        {
            btnAdd.Left = this.Width - btnAdd.Width - 40;
            groupBox1.Width = this.Width - btnAdd.Width- 60;
            groupBox1.Height = this.Height - 100;
            dgvView.Width = groupBox1.Width - 10;
            dgvView.Height = groupBox1.Height - 30;

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            FrmPartTypeAdd frm = new FrmPartTypeAdd(dc,"");
            frm.ShowDialog(this);
            setGrd();
        }

        private void FrmPartTypeView_Resize(object sender, EventArgs e)
        {
            setResize();
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
            FrmPartTypeAdd frm = new FrmPartTypeAdd(dc,dgvView[colId, e.RowIndex].Value.ToString());
            //frm.setControl(dgvView[colId, e.RowIndex].Value.ToString());
            frm.ShowDialog(this);
            setGrd();
        }

        private void FrmPartTypeView_Load(object sender, EventArgs e)
        {

        }
    }
}
