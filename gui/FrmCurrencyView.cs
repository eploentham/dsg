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
    public partial class FrmCurrencyView : Form
    {
        DsgControl dc;
        Currency curr;
        int colCnt = 6;
        int colRow = 0, colName = 1, colRate=2, colx=3, colRemark = 4, colId = 5;
        public FrmCurrencyView(DsgControl d)
        {
            InitializeComponent();
            dc = d;
            initConfig();
        }
        private void initConfig()
        {
            setGrd();
            //dt = lc.selectStaffAll();
        }
        public void setGrd()
        {
            DataTable dt = new DataTable();
            dt = dc.currdb.selectAll();
            dgvView.ColumnCount = colCnt;

            dgvView.RowCount = dt.Rows.Count + 1;
            dgvView.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgvView.Columns[colRow].Width = 50;
            dgvView.Columns[colName].Width = 150;
            dgvView.Columns[colRemark].Width = 120;
            dgvView.Columns[colId].Width = 80;
            dgvView.Columns[colRate].Width = 80;
            dgvView.Columns[colx].Width = 80;

            dgvView.Columns[colRow].HeaderText = "ลำดับ";
            //dgvView.Columns[colCode].HeaderText = "code";
            dgvView.Columns[colName].HeaderText = "ประเทศ";
            dgvView.Columns[colRate].HeaderText = "Rate";
            dgvView.Columns[colx].HeaderText = "ตัวคูณ";
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
                    dgvView[colRate, i].Value = dt.Rows[i][dc.currdb.curr.CurrRate].ToString();
                    dgvView[colx, i].Value = dt.Rows[i][dc.currdb.curr.CurrX].ToString();
                    dgvView[colName, i].Value = dt.Rows[i][dc.currdb.curr.Name].ToString();
                    dgvView[colRemark, i].Value = dt.Rows[i][dc.currdb.curr.Remark].ToString();
                    dgvView[colId, i].Value = dt.Rows[i][dc.currdb.curr.Id].ToString();

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
            dgvView.Width = this.Width - btnAdd.Width - 60;
            dgvView.Height = this.Height - 100;
            //dgvView.Width = groupBox1.Width - 10;
            //dgvView.Height = groupBox1.Height - 30;
        }
        private void FrmCurrencyView_Load(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            FrmCurrencyAdd frm = new FrmCurrencyAdd(dc,"");
            frm.ShowDialog();
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
            FrmCurrencyAdd frm = new FrmCurrencyAdd(dc, dgvView[colId, e.RowIndex].Value.ToString());
            //frm.setControl(dgvView[colId, e.RowIndex].Value.ToString());
            frm.ShowDialog(this);
            setGrd();
        }
    }
}
