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
    public partial class FrmCurrencyAdd : Form
    {
        DsgControl dc;
        Currency curr;
        public FrmCurrencyAdd(DsgControl d, String currId)
        {
            dc = d;
            InitializeComponent();
            initConfig(currId);
        }
        private void initConfig(String currId)
        {
            //dc = d;
            setControl(currId);
            btnUnActive.Visible = false;
        }
        private void setControl(String currId)
        {
            curr = dc.currdb.selectByPk(currId);
            //txtCode.Text = curr.Code;
            txtId.Text = curr.Id;
            txtName.Text = curr.Name;
            txtRemark.Text = curr.Remark;
            txtSort1.Text = curr.Sort1;
            txtRate.Text = curr.CurrRate;
            txtX.Text = curr.CurrX;
            if (curr.Default.Equals("1"))
            {
                chkDefault.Checked = true;
            }
            else
            {
                chkDefault.Checked = false;
            }
            if (curr.Active.Equals("1") || currId.Equals(""))
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
        private void getCurrency()
        {
            //curr.Code = txtCode.Text;
            curr.Id = txtId.Text;
            curr.Name = txtName.Text;
            curr.Remark = txtRemark.Text;
            curr.Sort1 = txtSort1.Text;
            curr.CurrRate = txtRate.Text;
            curr.CurrX = txtX.Text;
            curr.Active = "1";
            if (chkDefault.Checked)
            {
                curr.Default = "1";
                curr.Sort1 = "0000";
            }
            else
            {
                curr.Default = "0";
            }
        }
        private void FrmCurrencyAdd_Load(object sender, EventArgs e)
        {
            if (chkActive.Checked)
            {
                txtName.Enabled = true;
                txtRate.Enabled = true;
                txtRemark.Enabled = true;
                txtSort1.Enabled = true;
                btnUnActive.Visible = false;
            }
        }

        private void chkActive_Click(object sender, EventArgs e)
        {
            if (ChkUnActive.Checked)
            {
                txtName.Enabled = false;
                txtRate.Enabled = false;
                txtRemark.Enabled = false;
                txtSort1.Enabled = false;
                btnUnActive.Visible = true;
            }
        }

        private void ChkUnActive_Click(object sender, EventArgs e)
        {

        }

        private void btnUnActive_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("ต้องการยกเลิก", "ยกเลิก", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            {
                dc.currdb.VoidCurrency(txtId.Text);
                this.Dispose();
            }
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            if (txtName.Text.Equals(""))
            {
                MessageBox.Show("ไม่ได้ป้อนชื่อ", "ป้อนข้อมูลไม่ครบ");
                return;
            }
            //if (txtCode.Text.Equals(""))
            //{
            //    MessageBox.Show("ไม่ได้ป้อนรหัส", "ป้อนข้อมูลไม่ครบ");
            //    return;
            //}
            if (txtId.Text.Equals(""))
            {
                curr = dc.currdb.selectByPk(txtId.Text);
                if (!curr.Id.Equals(""))
                {
                    MessageBox.Show("ป้อนรหัสซ้ำ\nรหัส " + " ชื่อ " + curr.Name, "รหัสซ้ำ");
                    return;
                }
                //if (!curr.Code.Equals(""))
                //{
                //    MessageBox.Show("ป้อนชื่อซ้ำ\nรหัส " + " ชื่อ " + curr.Name, "ชื่อซ้ำ");
                //    return;
                //}
            }
            getCurrency();
            if (dc.currdb.insertPartCate(curr).Length >= 1)
            {
                //dc.padb.UpdateCateName(txtId.Text, txtName.Text);
                MessageBox.Show("บันทึกข้อมูล เรียบร้อย", "บันทึกข้อมูล");
                this.Dispose();
                //this.Hide();
            }
        }
    }
}
