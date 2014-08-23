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
    public partial class FrmPartTypeAdd : Form
    {
        DsgControl dc;
        Staff sf;
        PartType pt;
        public FrmPartTypeAdd(DsgControl d, String ptId)
        {
            InitializeComponent();
            initConfig(d, ptId);
        }
        private void initConfig(DsgControl d, String ptId)
        {
            dc = d;
            setControl(ptId);
        }
        private void setControl(String ptId)
        {
            pt = dc.ptdb.selectByPk(ptId);
            txtCode.Text = pt.Code;
            txtId.Text = pt.Id;
            txtName.Text = pt.partTName;
            txtRemark.Text = pt.Remark;
            nUdSort.Value = int.Parse(dc.cf.NumberNullSort(pt.sort1));
            if (pt.Active.Equals("1") || ptId.Equals(""))
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
        private void getPartType()
        {
            pt.Code = txtCode.Text;
            pt.Id = txtId.Text;
            pt.partTName = txtName.Text;
            pt.Remark = txtRemark.Text;
            pt.sort1 = nUdSort.Value.ToString();
            pt.Active = "1";
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

        private void FRmPartTypeAdd_Load(object sender, EventArgs e)
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
            if (txtId.Text.Equals(""))
            {
                pt = dc.ptdb.selectByCode(txtCode.Text);
                if (!pt.Code.Equals(""))
                {
                    MessageBox.Show("ป้อนรหัสซ้ำ\nรหัส " + pt.Code + " ชื่อ " + pt.partTName, "รหัสซ้ำ");
                    return;
                }
                if (!pt.partTName.Equals(""))
                {
                    MessageBox.Show("ป้อนชื่อซ้ำ\nรหัส " + pt.Code + " ชื่อ " + pt.partTName, "ชื่อซ้ำ");
                    return;
                }
            }
            getPartType();
            if (dc.ptdb.insertPartType(pt).Length >= 1)
            {
                dc.padb.UpdateTypeName(txtId.Text, txtName.Text);
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
                dc.ptdb.VoidPartType(txtId.Text);
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

        private void nUdSort_Enter(object sender, EventArgs e)
        {
            nUdSort.BackColor = Color.LightYellow;
        }

        private void nUdSort_Leave(object sender, EventArgs e)
        {
            nUdSort.BackColor = Color.White;
        }

        private void nUdSort_KeyUp(object sender, KeyEventArgs e)
        {

        }
    }
}
