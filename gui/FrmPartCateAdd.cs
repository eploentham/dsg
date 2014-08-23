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
    public partial class FrmPartCateAdd : Form
    {
        DsgControl dc;
        Staff sf;
        PartCategory pc;
        public FrmPartCateAdd(DsgControl d, String pcId)
        {
            InitializeComponent();
            initConfig(d, pcId);
        }
        private void initConfig(DsgControl d, String pcId)
        {
            dc = d;
            setControl(pcId);
        }
        private void setControl(String ptId)
        {
            pc = dc.pcdb.selectByPk(ptId);
            txtCode.Text = pc.Code;
            txtId.Text = pc.Id;
            txtName.Text = pc.CateName;
            txtRemark.Text = pc.Remark;
            nUdSort.Value = int.Parse(dc.cf.NumberNullSort(pc.sort1));
            if (pc.Active.Equals("1") || ptId.Equals(""))
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
        private void getPartCate()
        {
            pc.Code = txtCode.Text;
            pc.Id = txtId.Text;
            pc.CateName = txtName.Text;
            pc.Remark = txtRemark.Text;
            pc.sort1 = nUdSort.Value.ToString();
            pc.Active = "1";
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

        private void FrmPartCateAdd_Load(object sender, EventArgs e)
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
                pc = dc.pcdb.selectByCode(txtCode.Text);
                if (!pc.Code.Equals(""))
                {
                    MessageBox.Show("ป้อนรหัสซ้ำ\nรหัส " + pc.Code + " ชื่อ " + pc.CateName, "รหัสซ้ำ");
                    return;
                }
                if (!pc.Code.Equals(""))
                {
                    MessageBox.Show("ป้อนชื่อซ้ำ\nรหัส " + pc.Code + " ชื่อ " + pc.CateName, "ชื่อซ้ำ");
                    return;
                }
            }
            getPartCate();
            if (dc.pcdb.insertPartCate(pc).Length >= 1)
            {
                dc.padb.UpdateCateName(txtId.Text, txtName.Text);
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
                dc.pcdb.VoidPartCate(txtId.Text);
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
    }
}
