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
    public partial class FrmPartTypeSubAdd : Form
    {
        DsgControl dc;
        PartTypeSub pts;
        public FrmPartTypeSubAdd(DsgControl d, String ptsId, String ptId)
        {
            InitializeComponent();
            initConfig(d, ptsId, ptId);
        }
        private void initConfig(DsgControl d, String ptsId, String ptId)
        {
            dc = d;
            cboPaType = dc.ptdb.getCboPartType(cboPaType);
            if (!ptId.Equals(""))
            {
                cboPaType.Text = dc.getTextCboItem(cboPaType, ptId);
                nUdSort.Value = int.Parse(dc.cf.NumberNullSort(dc.ptsdb.selectMaxSort(dc.cf.getValueCboItem(cboPaType)))) + 1;
                txtCode.Text = nUdSort.Value.ToString();
                chkActive.Checked = true;
                btnUnActive.Visible = false;
            }
            
            setControl(ptsId);
        }
        private void setControl(String ptsId)
        {
            if (ptsId.Equals(""))
            {
                return;
            }
            pts = dc.ptsdb.selectByPk(ptsId);
            txtCode.Text = pts.Code;
            txtId.Text = pts.Id;
            txtName.Text = pts.TypeSubname;
            txtRemark.Text = pts.Remark;
            cboPaType.Text = dc.getTextCboItem(cboPaType, pts.TypeId);
            nUdSort.Value = int.Parse(dc.cf.NumberNullSort(pts.sort1));
            if (pts.Active.Equals("1") || ptsId.Equals(""))
            {
                chkActive.Checked = true;
                ChkUnActive.Checked = false;
                btnUnActive.Visible = false;
            }
            else
            {
                chkActive.Checked = false;
                ChkUnActive.Checked = true;
            }
        }
        private void getPartTypeSub()
        {
            pts.Code = txtCode.Text;
            pts.Id = txtId.Text;
            pts.TypeSubname = txtName.Text;
            pts.Remark = txtRemark.Text;
            pts.sort1 = nUdSort.Value.ToString();
            pts.Active = "1";
            pts.TypeId = dc.cf.getValueCboItem(cboPaType);
            //pts.TypeId=cboPaType.
        }
        private void txtNameFocus()
        {
            txtName.SelectAll();
            txtName.Focus();
        }
        private void txtRemarkFocus()
        {
            txtRemark.SelectAll();
            txtRemark.Focus();
        }
        private void nUdSortFocus()
        {
            //nUdSort.SelectAll();
            nUdSort.Focus();
        }

        private void FrmPartTypeSubAdd_Load(object sender, EventArgs e)
        {

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Equals(""))
            {
                MessageBox.Show("ไม่ได้ป้อนชื่อ", "ป้อนข้อมูลไม่ครบ");
                return;
            }
            if (txtCode.Text.Equals(""))
            {
                MessageBox.Show("ไม่ได้ป้อนรหัส", "ป้อนข้อมูลไม่ครบ");
                return;
            }
            if (cboPaType.Text.Equals(""))
            {
                MessageBox.Show("ไม่ได้เลือกประเภท", "ป้อนข้อมูลไม่ครบ");
                return;
            }
            if (txtId.Text.Equals(""))
            {
                pts = dc.ptsdb.selectByCode(txtCode.Text);
                if (!pts.Code.Equals(""))
                {
                    MessageBox.Show("ป้อนรหัสซ้ำ\nรหัส " + pts.Code + " ชื่อ " + pts.TypeSubname, "รหัสซ้ำ");
                    return;
                }
                if (!pts.TypeSubname.Equals(""))
                {
                    MessageBox.Show("ป้อนชื่อซ้ำ\nรหัส " + pts.Code + " ชื่อ " + pts.TypeSubname, "ชื่อซ้ำ");
                    return;
                }
            }
            getPartTypeSub();
            if (dc.ptsdb.insertPartTypeSub(pts).Length >= 1)
            {
                MessageBox.Show("บันทึกข้อมูล เรียบร้อย", "บันทึกข้อมูล");
                this.Dispose();
                //this.Hide();
            }
        }

        private void chkActive_Click(object sender, EventArgs e)
        {
            if (chkActive.Checked)
            {
                btnUnActive.Visible = false;

                txtCode.Enabled = true;
                txtName.Enabled = true;
                txtRemark.Enabled = true;
                btnSave.Enabled = true;
                btnCancel.Enabled = true;
                nUdSort.Enabled = true;
            }
        }

        private void ChkUnActive_Click(object sender, EventArgs e)
        {
            if (ChkUnActive.Checked)
            {
                btnUnActive.Visible = true;

                txtCode.Enabled = false;
                txtName.Enabled = false;
                txtRemark.Enabled = false;
                btnSave.Enabled = false;
                btnCancel.Enabled = false;
                nUdSort.Enabled = false;
            }
        }

        private void btnUnActive_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("ต้องการยกเลิก", "ยกเลิก", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            {
                dc.ptsdb.VoidPartTypeSub(txtId.Text);
                this.Dispose();
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Dispose();
        }

        private void txtCode_Enter(object sender, EventArgs e)
        {
            txtCode.BackColor = Color.LightYellow;
        }

        private void txtCode_Leave(object sender, EventArgs e)
        {
            txtCode.BackColor = Color.White;
        }

        private void txtCode_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                txtNameFocus();
            }
        }

        private void txtName_Enter(object sender, EventArgs e)
        {
            txtName.BackColor = Color.LightYellow;
        }

        private void txtName_Leave(object sender, EventArgs e)
        {
            txtName.BackColor = Color.White;
        }

        private void txtName_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                txtRemarkFocus();
            }
        }

        private void txtRemark_Enter(object sender, EventArgs e)
        {
            txtRemark.BackColor = Color.LightYellow;
        }

        private void txtRemark_Leave(object sender, EventArgs e)
        {
            txtRemark.BackColor = Color.White;
        }

        private void txtRemark_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                nUdSortFocus();
            }
        }

        private void cboPaType_Enter(object sender, EventArgs e)
        {
            cboPaType.BackColor = Color.LightYellow;
        }

        private void cboPaType_Leave(object sender, EventArgs e)
        {
            cboPaType.BackColor = Color.White;
        }

        private void txtSort1_Click(object sender, EventArgs e)
        {
            nUdSort.Value = int.Parse(dc.cf.NumberNullSort(dc.ptsdb.selectMaxSort(dc.cf.getValueCboItem(cboPaType))))+1;
        }
    }
}
