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
    }
}
