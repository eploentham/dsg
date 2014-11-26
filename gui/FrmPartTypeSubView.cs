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
    public partial class FrmPartTypeSubView : Form
    {
        DsgControl dc;
        int colCnt = 6;
        int colRow = 0, colCode = 1, colTName=2, colName = 3, colRemark = 4, colId = 5;
        public FrmPartTypeSubView(DsgControl d)
        {
            InitializeComponent();
            initConfig(d);
        }
        private void initConfig(DsgControl d)
        {
            dc = d;
            dgvView.ReadOnly = true;
            cboPaType = dc.ptdb.getCboPartType(cboPaType);
            setGrd();
            //dt = lc.selectStaffAll();
        }
        public void setGrd()
        {
            
            dgvView.ColumnCount = colCnt;

            dgvView.RowCount = 1;
            dgvView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvView.Columns[colRow].Width = 50;
            dgvView.Columns[colName].Width = 150;
            dgvView.Columns[colRemark].Width = 120;
            dgvView.Columns[colId].Width = 80;
            dgvView.Columns[colCode].Width = 80;
            //dgvView.Columns[colPriority].Width = 180;

            dgvView.Columns[colRow].HeaderText = "ลำดับ";
            dgvView.Columns[colCode].HeaderText = "code";
            dgvView.Columns[colTName].HeaderText = "ประเภท";
            dgvView.Columns[colName].HeaderText = "ชื่อ";
            dgvView.Columns[colRemark].HeaderText = "หมายเหตุ";
            dgvView.Columns[colId].HeaderText = "id";
            //dgvView.Columns[colPriority].HeaderText = "สิทธิใช้งาน";
            //dgvView.Columns[colPassword].HeaderText = "  ";

            dgvView.Columns[colId].HeaderText = "id";
            Font font = new Font("Microsoft Sans Serif", 12);

            dgvView.Font = font;
            dgvView.Columns[colId].Visible = false;
            dgvView.ReadOnly = true;
            setGrd("");
        }
        public void setGrd(String ptId)
        {
            DataTable dt = new DataTable();
            if (ptId.Equals(""))
            {
                dt = dc.ptsdb.selectAll();
            }
            else
            {
                dt = dc.ptsdb.selectByptId(ptId);
            }
            dgvView.RowCount = dt.Rows.Count + 1;
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dgvView[colRow, i].Value = (i + 1);
                    dgvView[colCode, i].Value = dt.Rows[i][dc.ptsdb.pts.Code].ToString();
                    dgvView[colTName, i].Value = dc.getTextCboItem(dc.cboType, dt.Rows[i][dc.ptsdb.pts.TypeId].ToString());
                    dgvView[colName, i].Value = dt.Rows[i][dc.ptsdb.pts.TypeSubname].ToString();
                    dgvView[colRemark, i].Value = dt.Rows[i][dc.ptsdb.pts.Remark].ToString();
                    dgvView[colId, i].Value = dt.Rows[i][dc.ptsdb.pts.Id].ToString();

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
            groupBox1.Width = this.Width - btnAdd.Width - 60;
            groupBox1.Height = this.Height - cboPaType.Height - 100;
            dgvView.Width = groupBox1.Width - 10;
            dgvView.Height = groupBox1.Height - 30;
        }
        private void FrmPartTypeSubView_Load(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            FrmPartTypeSubAdd frm = new FrmPartTypeSubAdd(dc,"",dc.cf.getValueCboItem(cboPaType));
            frm.ShowDialog(this);
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
            FrmPartTypeSubAdd frm = new FrmPartTypeSubAdd(dc, dgvView[colId, e.RowIndex].Value.ToString(),"");
            //frm.setControl(dgvView[colId, e.RowIndex].Value.ToString());
            frm.ShowDialog(this);
            setGrd();
        }

        private void cboPaType_SelectedIndexChanged(object sender, EventArgs e)
        {
            setGrd(dc.cf.getValueCboItem(cboPaType));
        }

        private void FrmPartTypeSubView_Resize(object sender, EventArgs e)
        {
            setResize();
        }
    }
}
