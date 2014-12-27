using dsg.control;
using dsg.object1;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace dsg.gui
{
    public partial class FrmPartAdd : Form
    {
        DsgControl dc;
        Part pa;
        int colCnt = 8;
        int colRow = 0, colSerialNo = 1, colPriceCost = 2, colPriceSale = 3, colLoca = 4, coLRemark = 5, colId = 6, colLocaId=7;
        String fileCertify = "", filePart="";
        PartSerialNo ps;
        //FolderBrowserDialog fbd;
        OpenFileDialog ofd;
        public FrmPartAdd(DsgControl d, String paId)
        {
            InitializeComponent();
            initConfig(d,paId);
        }
        private void initConfig(DsgControl d, String paId)
        {            
            dc = d;
            pa = new Part();
            ps = new PartSerialNo();
            //gBSerial.Visible = false;
            cboPaCate = dc.pcdb.getCboPartCate(cboPaCate);
            cboPaType = dc.ptdb.getCboPartType(cboPaType);
            cboModel = dc.padb.getCboModel(cboModel);
            cboAcftModel = dc.padb.getCboAcftModel(cboAcftModel);
            cboCurrPriceCost = dc.currdb.getCboCurrency(cboCurrPriceCost);
            cboCurrPriceSale = dc.currdb.getCboCurrency(cboCurrPriceSale);
            cboSnCurrPriceSale = dc.currdb.getCboCurrency(cboSnCurrPriceSale);
            cboSnCurrPriceCost = dc.currdb.getCboCurrency(cboSnCurrPriceCost);
            filePart = dc.initC.pathImage;
            setGrd();
            setControl(paId);
            ofd = new OpenFileDialog();
            //fbd.SelectedPath = Environment.CurrentDirectory +"\\pic";
            DirectoryInfo dir = new DirectoryInfo(Environment.CurrentDirectory + "\\pic");
            bool isExists = System.IO.Directory.Exists(Environment.CurrentDirectory + "\\pic");
            if (!isExists)
                System.IO.Directory.CreateDirectory(Environment.CurrentDirectory + "\\pic");
            isExists = System.IO.Directory.Exists(Environment.CurrentDirectory + "\\pic\\part");
            if (!isExists)
                System.IO.Directory.CreateDirectory(Environment.CurrentDirectory +"\\pic\\part");
            isExists = System.IO.Directory.Exists(Environment.CurrentDirectory + "\\pic\\certify");
            if (!isExists)
                System.IO.Directory.CreateDirectory(Environment.CurrentDirectory + "\\pic\\certify");
            fileCertify = Environment.CurrentDirectory + "\\pic\\certify\\";
            //file1 = Environment.CurrentDirectory + "\\pic\\part\\";
            
            txtRemarkDraw.Visible = false;
            label19.Visible = false;
            btnUnActive.Visible = false;
            txtPriceCostCurr.Enabled = false;
            txtPriceSaleCurr.Enabled = false;
            txtSnPriceCostCurr.Enabled = false;
            txtSnPriceSaleCurr.Enabled = false;
            btnUnActive.Visible = false;
            btnSerialUnActive.Visible = false;

            //foreach (FileInfo file in dir.GetFiles())
            //{

            //}
            //gBDraw.Visible = false;
        }
        private void setGrd()
        {
            dgv1.ColumnCount = colCnt;
            dgv1.RowCount = 1;
            
            dgv1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dgv1.Columns[colRow].Width = 50;
            dgv1.Columns[colSerialNo].Width = 150;
            dgv1.Columns[colPriceCost].Width = 120;
            dgv1.Columns[colId].Width = 80;
            dgv1.Columns[colPriceSale].Width = 120;
            dgv1.Columns[coLRemark].Width = 180;

            dgv1.Columns[colRow].HeaderText = "ลำดับ";
            dgv1.Columns[colSerialNo].HeaderText = "serialno";
            dgv1.Columns[colPriceCost].HeaderText = "ราคาทุน";
            dgv1.Columns[colPriceSale].HeaderText = "ราคาขาย";
            dgv1.Columns[colId].HeaderText = "id";
            dgv1.Columns[coLRemark].HeaderText = "หมายเหตุ";
            //dgv1.Columns[colPassword].HeaderText = "  ";

            dgv1.Columns[colId].HeaderText = "id";
            Font font = new Font("Microsoft Sans Serif", 12);

            dgv1.ReadOnly = true;
            dgv1.Font = font;
            dgv1.Columns[colId].Visible = false;
            dgv1.Columns[colLocaId].Visible = false;
        }
        private void setControl(String paId)
        {
            pa = dc.padb.selectByPk(paId);
            txtPaId.Text = pa.Id;
            cboPaCate.Text = pa.CateName;
            cboPaType.Text = pa.TypeName;
            cboTypeSub.Text = pa.TypeSubName;
            txtPaCode.Text = pa.Code;
            txtBarcode.Text = pa.barcode;
            txtPaName.Text = pa.Name;
            cboAcftModel.Text = pa.acftModel;
            cboModel.Text = pa.Model;

            txtCertify.Text = pa.Certify;
            //txtOnHand.Text = 
            txtPriceCost.Text = String.Format("{0:#,###,###.00}", Double.Parse(dc.NumberNull1(pa.PriceCost)));
            txtPriceSale.Text = String.Format("{0:#,###,###.00}", Double.Parse(dc.NumberNull1(pa.PriceSale)));

            cboCurrPriceCost.Text = pa.CurrNamePriceCost;
            cboCurrPriceSale.Text = pa.CurrNamePriceSale;
            txtPriceCostCurr.Text = String.Format("{0:#,###,###.00}", Double.Parse(dc.NumberNull1(pa.PriceCostCurrent)));
            txtPriceSaleCurr.Text = String.Format("{0:#,###,###.00}", Double.Parse(dc.NumberNull1(pa.PriceSaleCurrent)));


            txtPaName.Text = pa.Name;
            txtRemark.Text = pa.Remark;
            txtPaNumber.Text = pa.Number;
            if (pa.Active.Equals("1"))
            {
                chkActive.Checked = true;
                ChkUnActive.Checked = false;
            }
            else
            {
                chkActive.Checked = false;
                ChkUnActive.Checked = true;
            }
            String pahtFile = "";
            //File.
            if (File.Exists(pahtFile + "\\" ))
            {
                //pic1.Image = Image.FromFile(pahtFile + "\\" + name[index]);
                Image im = Image.FromFile(pahtFile);
                pic1.Image = im;
                pic1.SizeMode = PictureBoxSizeMode.StretchImage;
            }
            if (cboCurrPriceSale.Text.Equals(""))
            {
                cboCurrPriceSale.Text = "USD";
            }
            if (cboCurrPriceCost.Text.Equals(""))
            {
                cboCurrPriceCost.Text = "USD";
            }
            setGrdSerialNo(paId);
            viewImageCertify(pa.pathPicPart);//ใช้อันนี้ไปก่อน
            chkPic1.Checked = true;
            viewImage(pa.pathPic1);
            //DataTable dt = dc.psdb.se
        }
        private void setGrdSerialNo(String paId)
        {
            dgv1.Rows.Clear();
            //setGrd();
            ClearSerialNo();
            if (paId.Equals(""))
            {
                return;
            }
            DataTable dt = dc.psdb.selectByPartId(paId);
            if (dt.Rows.Count > 0)
            {
                dgv1.RowCount = dt.Rows.Count + 1;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dgv1[colRow, i].Value = (i + 1);
                    dgv1[colId, i].Value = dt.Rows[i][dc.psdb.ps.Id].ToString();
                    dgv1[colSerialNo, i].Value = dt.Rows[i][dc.psdb.ps.serialNo].ToString();
                    dgv1[colPriceCost, i].Value = dt.Rows[i][dc.psdb.ps.PriceCost].ToString();
                    dgv1[colPriceSale, i].Value = dt.Rows[i][dc.psdb.ps.PriceSale].ToString();
                    dgv1[coLRemark, i].Value = dt.Rows[i][dc.psdb.ps.Remark].ToString();
                    dgv1[colLocaId, i].Value = dt.Rows[i][dc.psdb.ps.locaId].ToString();
                    if (dt.Rows[i][dc.psdb.ps.locaId].ToString().Equals("1"))
                    {
                        dgv1[colLoca, i].Value = "";
                    }
                    else if (dt.Rows[i][dc.psdb.ps.locaId].ToString().Equals("2"))
                    {
                        dgv1[colLoca, i].Value = "";
                    }
                    else if (dt.Rows[i][dc.psdb.ps.locaId].ToString().Equals("3"))
                    {
                        dgv1[colLoca, i].Value = "";
                    }
                    else if (dt.Rows[i][dc.psdb.ps.locaId].ToString().Equals("4"))
                    {
                        dgv1[colLoca, i].Value = "";
                    }
                    else if (dt.Rows[i][dc.psdb.ps.locaId].ToString().Equals("5"))
                    {
                        dgv1[colLoca, i].Value = "";
                    }
                    if ((i % 2) != 0)
                    {
                        dgv1.Rows[i].DefaultCellStyle.BackColor = Color.LightSalmon;
                    }
                }
            }
        }
        private void getPart()
        {
            pa.acftModel = cboAcftModel.Text;
            pa.Model = cboModel.Text;
            pa.Active = "1";
            pa.barcode = txtBarcode.Text;
            pa.CateId = dc.cf.getValueCboItem(cboPaCate);
            pa.CateName = cboPaCate.Text;
            pa.Certify = txtCertify.Text;
            pa.Code = txtPaCode.Text;
            pa.Name = txtPaName.Text;
            pa.Id = txtPaId.Text;
            pa.TypeId = dc.cf.getValueCboItem(cboPaType);
            pa.TypeName = cboPaType.Text;
            pa.Remark = txtRemark.Text;
            pa.Number = txtPaNumber.Text;
            pa.PriceCost = txtPriceCost.Text;
            pa.PriceSale = txtPriceSale.Text;
            //pa.CurrNamePriceCost = cboCurrPriceCost.Text;
            //pa.CurrNamePriceSale = cboCurrPriceSale.Text;

            Currency currCost = new Currency();
            currCost = dc.getCurrencyByList1(cboCurrPriceCost.Text);
            Currency currSale = new Currency();
            currSale = dc.getCurrencyByList1(cboCurrPriceSale.Text);
            pa.CurrNamePriceCost = cboCurrPriceCost.Text;
            pa.CurrNamePriceSale = cboCurrPriceSale.Text;
            pa.CurrRatePriceCost = currCost.CurrRate;
            pa.CurrRatePriceSale = currSale.CurrRate;
            pa.CurrXPriceCost = currCost.CurrX;
            pa.CurrXriceSale = currSale.CurrX;
            pa.PriceCostCurrent = txtPriceCostCurr.Text;
            pa.PriceSaleCurrent = txtPriceSaleCurr.Text;
        }
        private void ClearSerialNo()
        {
            txtPsId.Text = "";
            txtSerialNo.Text = "";
            txtSnPriceCost.Text = "";
            txtSnPriceSale.Text = "";
            txtInvNumber.Text = "";
            chkLoca1.Checked = false;
            chkLoca2.Checked = false;
            chkLoca3.Checked = false;
            chkLoca4.Checked = false;
            chkLoca5.Checked = false;
        }
        private void getPartSerialNo()
        {
            ps.Id = txtPsId.Text;
            ps.Active = "1";
            ps.dateInv = "";
            ps.dateReceive = "";
            ps.locaId = "";
            if (chkLoca1.Checked)
            {
                ps.locaId = "1";
            }
            else if (chkLoca2.Checked)
            {
                ps.locaId = "2";
            }
            else if (chkLoca3.Checked)
            {
                ps.locaId = "3";
            }
            else if (chkLoca4.Checked)
            {
                ps.locaId = "4";
            }
            else if (chkLoca5.Checked)
            {
                ps.locaId = "5";
            }
            ps.partId = txtPaId.Text;
            ps.PriceCost = txtSnPriceCost.Text;
            ps.PriceSale = txtSnPriceSale.Text;
            ps.Remark = txtPsRemark.Text;
            ps.serialNo = txtSerialNo.Text;
            ps.StatusTran = "0";

            if (txtRowNumber.Text.Equals(""))
            {
                ps.rowNumber = dc.psdb.selectMaxRowNumberByPartId(txtPaId.Text);
            }
            else
            {
                ps.rowNumber = txtRowNumber.Text;
            }

            Currency currCost = new Currency();
            currCost = dc.getCurrencyByList1(cboSnCurrPriceCost.Text);
            Currency currSale = new Currency();
            currSale = dc.getCurrencyByList1(cboSnCurrPriceSale.Text);
            ps.CurrNamePriceCost = cboSnCurrPriceCost.Text;
            ps.CurrNamePriceSale = cboSnCurrPriceSale.Text;
            ps.CurrRatePriceCost = currCost.CurrRate;
            ps.CurrRatePriceSale = currSale.CurrRate;
            ps.CurrXPriceCost = currCost.CurrX;
            ps.CurrXriceSale = currSale.CurrX;
            ps.PriceCostCurrent = txtSnPriceCostCurr.Text;
            ps.PriceSaleCurrent = txtSnPriceSaleCurr.Text;
        }
        private void setControlSerialNo(String psId)
        {
            ps = dc.psdb.selectByPk(psId);

            txtPsId.Text = ps.Id;
            txtSnPriceCost.Text = ps.PriceCost;
            txtSnPriceSale.Text = ps.PriceSale;
            txtPsRemark.Text = ps.Remark;
            txtSerialNo.Text = ps.serialNo;
            txtRowNumber.Text = ps.rowNumber;
            chkSerialActive.Checked = true;
            if (ps.locaId.Equals("1"))
            {
                chkLoca1.Checked = true;
                chkLoca2.Checked = false;
                chkLoca3.Checked = false;
                chkLoca4.Checked = false;
                chkLoca5.Checked = false;
            }
            else if (ps.locaId.Equals("2"))
            {
                chkLoca1.Checked = false;
                chkLoca2.Checked = true;
                chkLoca3.Checked = false;
                chkLoca4.Checked = false;
                chkLoca5.Checked = false;
            }
            else if (ps.locaId.Equals("3"))
            {
                chkLoca1.Checked = false;
                chkLoca2.Checked = false;
                chkLoca3.Checked = true;
                chkLoca4.Checked = false;
                chkLoca5.Checked = false;
            }
            else if (ps.locaId.Equals("4"))
            {
                chkLoca1.Checked = false;
                chkLoca2.Checked = false;
                chkLoca3.Checked = false;
                chkLoca4.Checked = true;
                chkLoca5.Checked = false;
            }
            else if (ps.locaId.Equals("5"))
            {
                chkLoca1.Checked = false;
                chkLoca2.Checked = false;
                chkLoca3.Checked = false;
                chkLoca4.Checked = false;
                chkLoca5.Checked = true;
            }
        }
        private void setControlSerialNo(int row)
        {
            txtPsId.Text = dgv1[colId, row].Value.ToString();
            PartSerialNo ps1 = new PartSerialNo();
            ps1 = dc.psdb.selectByPk(txtPsId.Text);
            txtSnPriceCost.Text = dgv1[colPriceCost, row].Value.ToString();
            txtSnPriceSale.Text = dgv1[colPriceSale, row].Value.ToString();
            txtPsRemark.Text = dgv1[coLRemark, row].Value.ToString();
            txtSerialNo.Text = ps1.serialNo;
            txtRowNumber.Text = dgv1[colRow, row].Value.ToString();
            if (dgv1[colLocaId, row].Value.ToString().Equals("1"))
            {
                chkLoca1.Checked = true;
                chkLoca2.Checked = false;
                chkLoca3.Checked = false;
                chkLoca4.Checked = false;
                chkLoca5.Checked = false;
            }
            else if (dgv1[colLocaId, row].Value.ToString().Equals("2"))
            {
                chkLoca1.Checked = false;
                chkLoca2.Checked = true;
                chkLoca3.Checked = false;
                chkLoca4.Checked = false;
                chkLoca5.Checked = false;
            }
            else if (dgv1[colLocaId, row].Value.ToString().Equals("3"))
            {
                chkLoca1.Checked = false;
                chkLoca2.Checked = false;
                chkLoca3.Checked = true;
                chkLoca4.Checked = false;
                chkLoca5.Checked = false;
            }
            else if (dgv1[colLocaId, row].Value.ToString().Equals("4"))
            {
                chkLoca1.Checked = false;
                chkLoca2.Checked = false;
                chkLoca3.Checked = false;
                chkLoca4.Checked = true;
                chkLoca5.Checked = false;
            }
            else if (dgv1[colLocaId, row].Value.ToString().Equals("5"))
            {
                chkLoca1.Checked = false;
                chkLoca2.Checked = false;
                chkLoca3.Checked = false;
                chkLoca4.Checked = false;
                chkLoca5.Checked = true;
            }
            if (ps1.Active.Equals("1"))
            {
                chkSerialActive.Checked = true;
                chkSerialUnActive.Checked = false;
            }else
            {
                chkSerialUnActive.Checked = true;
                chkSerialActive.Checked = false;
            }
            cboSnCurrPriceCost.Text = ps1.CurrNamePriceCost;
            cboSnCurrPriceSale.Text = ps1.CurrNamePriceSale;
            txtSnPriceCostCurr.Text = String.Format("{0:#,###,###.00}",Double.Parse(dc.NumberNull1(ps1.PriceCostCurrent)));
            txtSnPriceSaleCurr.Text = String.Format("{0:#,###,###.00}",Double.Parse(dc.NumberNull1(ps1.PriceSaleCurrent)));
        }
        private void viewImageCertify(String filename)
        {
            if (System.IO.File.Exists(filename))
            {
                picCertify.Image = Image.FromFile(filename);
                picCertify.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }
        private void viewImage(String filename)
        {
            if (System.IO.File.Exists(filename))
            {
                pic1.Image = Image.FromFile(filename);
                pic1.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }
        private void saveImagePart()
        {
            String fileName = "", fileName1 = "", ex = "";
            fileName = filePart+"\\" + txtPaId.Text + "";
            ofd.ShowDialog();
            if (ofd.FileName.Equals(""))
            {
                return;
            }
            fileName1 = ofd.FileName;
            ex = fileName1.Substring(ofd.FileName.IndexOf("."));
            //fbd.SelectedPath = Environment.CurrentDirectory + "\\pic";
            //DirectoryInfo dir = new DirectoryInfo(ofd.FileName);

            if (System.IO.File.Exists(ofd.FileName))
            {
                Image image = Image.FromFile(ofd.FileName);
                dc.DeleteFileImage(fileName + ex);
                image.Save(fileName + ex);
            }
            dc.padb.UpdatePathPicPart(txtPaId.Text, fileName + ex);
            viewImageCertify(fileName + ex);
        }
        private void saveImageCertify()
        {
            String fileName = "", fileName1="", ex="";
            fileName = fileCertify + txtPaId.Text + "";
            ofd.ShowDialog();
            if (ofd.FileName.Equals(""))
            {
                return;
            }
            fileName1 = ofd.FileName;
            ex = fileName1.Substring(ofd.FileName.IndexOf("."));
            //fbd.SelectedPath = Environment.CurrentDirectory + "\\pic";
            //DirectoryInfo dir = new DirectoryInfo(ofd.FileName);
            
            if (System.IO.File.Exists(ofd.FileName))
            {
                Image image = Image.FromFile(ofd.FileName);
                image.Save(fileName + ex);
            }
            dc.padb.UpdatePathPicCertify(txtPaId.Text, fileName + ex);
            viewImageCertify(fileName + ex);
        }
        private void saveImage(String flag)
        {
            String fileName = "", fileName1 = "", ex = "";
            fileName = filePart + txtPaId.Text + flag;
            ofd.ShowDialog();
            fileName1 = ofd.FileName;
            ex = fileName1.Substring(ofd.FileName.IndexOf("."));
            //fbd.SelectedPath = Environment.CurrentDirectory + "\\pic";
            //DirectoryInfo dir = new DirectoryInfo(ofd.FileName);

            if (System.IO.File.Exists(ofd.FileName))
            {
                Image image = Image.FromFile(ofd.FileName);
                image.Save(fileName + ex);
            }
            if (flag.Equals("_1"))
            {
                dc.padb.UpdatePathPic1(txtPaId.Text, fileName + ex);
                pa.pathPic1 = fileName + ex;
            }
            else if (flag.Equals("_2"))
            {
                dc.padb.UpdatePathPic2(txtPaId.Text, fileName + ex);
                pa.pathPic2 = fileName + ex;
            }
            else if (flag.Equals("_3"))
            {
                dc.padb.UpdatePathPic3(txtPaId.Text, fileName + ex);
                pa.pathPic3 = fileName + ex;
            }
            else if (flag.Equals("_4"))
            {
                dc.padb.UpdatePathPic4(txtPaId.Text, fileName + ex);
                pa.pathPic4 = fileName + ex;
            }
            viewImage(fileName + ex);
        }

        private void FrmPartAdd_Load(object sender, EventArgs e)
        {
            
        }

        private void btnReceive_Click(object sender, EventArgs e)
        {
            gBSerial.Visible = true;
            //gBDraw.Visible = false;
        }

        private void btnDraw_Click(object sender, EventArgs e)
        {
            //gBDraw.Visible = true;
            gBSerial.Visible = false;
            //gBDraw.Top = gBReceive.Top;
            //gBDraw.Left = gBReceive.Left;

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            String paId = "";
            if (cboPaType.Text.Equals(""))
            {
                MessageBox.Show("ไม่ได้ป้อนประเภท", "ป้อนข้อมูลไม่ครบ");
                return;
            }
            if (cboPaCate.Text.Equals(""))
            {
                MessageBox.Show("ไม่ได้ป้อนชนิด", "ป้อนข้อมูลไม่ครบ");
                return;
            }
            if (txtPaCode.Text.Equals(""))
            {
                MessageBox.Show("ไม่ได้ป้อนรหัส", "ป้อนข้อมูลไม่ครบ");
                return;
            }
            if (txtPaId.Text.Equals(""))
            {
                pa = dc.padb.selectByCode(txtPaCode.Text);
                if (!pa.Code.Equals(""))
                {
                    MessageBox.Show("ป้อนรหัสซ้ำ\nรหัส " + pa.Code + " ชื่อ " + pa.Code, "รหัสซ้ำ");
                    return;
                }
                if (!pa.barcode.Equals(""))
                {
                    MessageBox.Show("ป้อนชื่อซ้ำ\nรหัส " + pa.Code + " ชื่อ " + pa.barcode, "barcodeซ้ำ");
                    return;
                }
            }
            getPart();
            paId = dc.padb.insertPart(pa);
            if (paId.Length >= 1)
            {
                txtPaId.Text = paId;
                MessageBox.Show("บันทึกข้อมูล เรียบร้อย", "บันทึกข้อมูล");
                //this.Dispose();
                //this.Hide();
            }
        }

        private void btnSaveSerialNo_Click(object sender, EventArgs e)
        {
            String psId = "", tpa1="", ups="";
            //btnSave_Click(null,null);
            //if ((!chkReceive.Checked) && (!chkDraw.Checked))
            //{
            //    MessageBox.Show("ไม่ได้เลือก การรับเข้า หรือเบิกออก", "ป้อนข้อมูลไม่ครบ");
            //    return;
            //}

            //if (chkReceive.Checked)
            //{
                if (txtSnPriceCost.Text.Equals(""))
                {
                    MessageBox.Show("ไม่ได้ป้อนราคาทุน", "ป้อนข้อมูลไม่ครบ");
                    return;
                }
                if (txtSnPriceSale.Text.Equals(""))
                {
                    MessageBox.Show("ไม่ได้ป้อนราคาขาย", "ป้อนข้อมูลไม่ครบ");
                    return;
                }
                if (!chkLoca1.Checked)
                {
                    if (!chkLoca2.Checked)
                    {
                        if (!chkLoca3.Checked)
                        {
                            if (!chkLoca4.Checked)
                            {
                                if (!chkLoca5.Checked)
                                {
                                    MessageBox.Show("ไม่ได้เลือกสถานที่เก็บ", "ป้อนข้อมูลไม่ครบ");
                                    return;
                                }
                            }
                        }
                    }
                }
                //txtPaId.Text = psId;
                getPartSerialNo();
                psId = dc.psdb.insertPartSerialNo(ps);
                if (psId.Length >= 1)
                {
                    TPart tpa = new TPart();
                    tpa.Active = "1";
                    tpa.DateTran = "";
                    tpa.Id = "";
                    tpa.partId = txtPaId.Text;
                    tpa.PsId = psId;
                    tpa.StatusTran = "1";
                    
                    tpa1 = dc.tpadb.insertTPart(tpa);
                    if (tpa1.Length >= 1)
                    {
                        ups = dc.psdb.updateReceive(psId);
                        if (ups.Length >= 1)
                        {
                            //dc.tpadb.UpdateReceive(tpa1);
                            MessageBox.Show("บันทึกข้อมูล เรียบร้อย", "บันทึกข้อมูล");
                            setGrdSerialNo(txtPaId.Text);
                        }
                        else
                        {
                            MessageBox.Show("ไม่สามารถบันทึก updateReceive", "Error");
                        }
                    }
                    else
                    {
                        MessageBox.Show("ไม่สามารถสร้าง Stock Card ได้ insertTPart", "Error");
                    }
                }
            //}
            //else if (chkDraw.Checked)
            //{
            //    if (txtRemarkDraw.Text.Equals(""))
            //    {
            //        MessageBox.Show("กรุณาระบุหมายเหตุการเบิก", "หมายเหตุ");
            //        return;
            //    }
            //    if (MessageBox.Show("ต้องการเบิกหรือจำหน่าย", "เบิกสินค้า", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            //    {
            //        ups = dc.psdb.updateDraw(txtPsId.Text,txtRemarkDraw.Text);
            //        if (ups.Length >= 1)
            //        {
            //            TPart tpa = new TPart();
            //            tpa.Active = "1";
            //            tpa.DateTran = "";
            //            tpa.Id = "";
            //            tpa.partId = txtPaId.Text;
            //            tpa.PsId = txtPsId.Text;
            //            tpa.StatusTran = "2";

            //            tpa1 = dc.tpadb.insertTPart(tpa);
            //            if (tpa1.Length >= 1)
            //            {
            //                MessageBox.Show("บันทึกข้อมูลการเบิก เรียบร้อย", "บันทึกข้อมูล");
            //            }
            //            else
            //            {
            //                MessageBox.Show("ไม่สามารถสร้าง Stock Card ได้ insert TPart", "Error");
            //            }
            //        }
            //        else
            //        {
            //            MessageBox.Show("ไม่สามารถบันทึก updateDraw", "Error");
            //        }
            //    }
            //}
        }

        private void dgv1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            setControlSerialNo(e.RowIndex);
            //txtPsRemark.Enabled = true;
        }

        private void chkReceive_Click(object sender, EventArgs e)
        {
            ClearSerialNo();
            dgv1.Enabled = false;
            panel3.Enabled = true;
            txtRemarkDraw.Visible = false;
            label19.Visible = false;
        }

        private void chkDraw_Click(object sender, EventArgs e)
        {
            ClearSerialNo();
            dgv1.Enabled = true;
            panel3.Enabled = false;
            txtRemarkDraw.Visible = true;
            label19.Visible = true;
        }

        private void btnPicPart1_Click(object sender, EventArgs e)
        {
            saveImage("_1");
            chkPic1.Checked = true;
        }

        private void btnPicCertify_Click(object sender, EventArgs e)
        {
            saveImagePart();
        }

        private void btnPicPart2_Click(object sender, EventArgs e)
        {
            saveImage("_2");
            chkPic2.Checked = true;
        }

        private void chkPic1_Click(object sender, EventArgs e)
        {
            viewImage(pa.pathPic1);
        }

        private void chkPic2_Click(object sender, EventArgs e)
        {
            viewImage(pa.pathPic2);
        }

        private void chkPic3_Click(object sender, EventArgs e)
        {
            viewImage(pa.pathPic3);
        }

        private void chkPic4_Click(object sender, EventArgs e)
        {
            viewImage(pa.pathPic4);
        }

        private void btnPicPart3_Click(object sender, EventArgs e)
        {
            saveImage("_3");
            chkPic3.Checked = true;
        }

        private void btnPicPart4_Click(object sender, EventArgs e)
        {
            saveImage("_4");
            chkPic4.Checked = true;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {

        }

        private void txtPriceCost_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && !(e.KeyChar == 46);
            
        }

        private void txtPriceSale_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && !(e.KeyChar == 46);
        }

        private void txtSnPriceCost_KeyPress(object sender, KeyPressEventArgs e)
        {
            //e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && !(e.KeyChar == 46);
        }

        private void txtSnPriceSale_KeyPress(object sender, KeyPressEventArgs e)
        {
            e.Handled = !char.IsDigit(e.KeyChar) && !char.IsControl(e.KeyChar) && !(e.KeyChar == 46);
        }

        private void txtPriceCost_KeyUp(object sender, KeyEventArgs e)
        {
            txtSnPriceCost.Text = txtPriceCost.Text;
        }

        private void txtPriceSale_KeyUp(object sender, KeyEventArgs e)
        {
            txtSnPriceSale.Text = txtPriceSale.Text;
        }

        private void chkActive_Click(object sender, EventArgs e)
        {
            btnUnActive.Visible = false;

            txtPaCode.Enabled = true;
            cboPaType.Enabled = true;
            cboTypeSub.Enabled = true;
            cboPaCate.Enabled = true;
            txtBarcode.Enabled = true;
            txtPaNumber.Enabled = true;
            txtPaName.Enabled = true;
            cboModel.Enabled = true;
            cboAcftModel.Enabled = true;
            txtCertify.Enabled = true;
            txtOnHand.Enabled = true;
            txtPriceCost.Enabled = true;
            cboCurrPriceCost.Enabled = true;
            txtPriceCostCurr.Enabled = true;
            txtPriceSale.Enabled = true;
            cboCurrPriceSale.Enabled = true;
            txtPriceSaleCurr.Enabled = true;
            txtRemark.Enabled = true;

        }

        private void ChkUnActive_Click(object sender, EventArgs e)
        {
            btnUnActive.Visible = true;

            txtPaCode.Enabled = false;
            cboPaType.Enabled = false;
            cboTypeSub.Enabled = false;
            cboPaCate.Enabled = false;
            txtBarcode.Enabled = false;
            txtPaNumber.Enabled = false;
            txtPaName.Enabled = false;
            cboModel.Enabled = false;
            cboAcftModel.Enabled = false;
            txtCertify.Enabled = false;
            txtOnHand.Enabled = false;
            txtPriceCost.Enabled = false;
            cboCurrPriceCost.Enabled = false;
            txtPriceCostCurr.Enabled = false;
            txtPriceSale.Enabled = false;
            cboCurrPriceSale.Enabled = false;
            txtPriceSaleCurr.Enabled = false;
            txtRemark.Enabled = false;
        }

        private void txtPriceCost_Leave(object sender, EventArgs e)
        {
            try
            {
                txtPriceCost.Text = txtPriceCost.Text.Replace("$", "");
                txtPriceCostCurr.Text = dc.calCurrency(dc.getCurrencyByList1(cboCurrPriceCost.Text), Double.Parse(txtPriceCost.Text));
                txtSnPriceCostCurr.Text = txtPriceCostCurr.Text;
            }
            catch (Exception ex)
            {

            }
            
        }

        private void txtPriceSale_Leave(object sender, EventArgs e)
        {
            try
            {
                txtPriceSale.Text = txtPriceSale.Text.Replace("$", "");
                txtPriceSaleCurr.Text = dc.calCurrency(dc.getCurrencyByList1(cboCurrPriceCost.Text), Double.Parse(txtPriceSale.Text));
                txtSnPriceSaleCurr.Text = txtPriceSaleCurr.Text;
            }
            catch (Exception ex)
            {

            }
        }

        private void txtSnPriceCost_Leave(object sender, EventArgs e)
        {
            try
            {
                txtSnPriceCostCurr.Text = dc.calCurrency(dc.getCurrencyByList1(cboSnCurrPriceCost.Text), Double.Parse(txtSnPriceCost.Text));
            }
            catch (Exception ex)
            {

            }
        }

        private void txtSnPriceSale_Leave(object sender, EventArgs e)
        {
            try
            {
                txtSnPriceSaleCurr.Text = dc.calCurrency(dc.getCurrencyByList1(cboSnCurrPriceSale.Text), Double.Parse(txtSnPriceSale.Text));
            }
            catch (Exception ex)
            {

            }
        }

        private void cboCurrPriceCost_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtPriceCostCurr.Text = dc.calCurrency(dc.getCurrencyByList1(cboCurrPriceCost.Text), Double.Parse(txtPriceCost.Text));
            }
            catch (Exception ex)
            {

            }
        }

        private void cboCurrPriceSale_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtPriceSaleCurr.Text = dc.calCurrency(dc.getCurrencyByList1(cboCurrPriceCost.Text), Double.Parse(txtPriceSale.Text));
                txtSnPriceSaleCurr.Text = txtPriceSaleCurr.Text;
            }
            catch (Exception ex)
            {

            }
        }

        private void cboSnCurrPriceCost_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtSnPriceCostCurr.Text = dc.calCurrency(dc.getCurrencyByList1(cboSnCurrPriceCost.Text), Double.Parse(txtSnPriceCost.Text));
            }
            catch (Exception ex)
            {

            }
        }

        private void cboSnCurrPriceSale_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtSnPriceSaleCurr.Text = dc.calCurrency(dc.getCurrencyByList1(cboSnCurrPriceSale.Text), Double.Parse(txtSnPriceSale.Text));
            }
            catch (Exception ex)
            {

            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            pa = dc.padb.selectByCode(txtPaCode.Text);
            setControl(pa.Id);
        }

        private void txtPriceCost_Enter(object sender, EventArgs e)
        {
            //txtPriceCost.SelectAll();
        }

        private void txtPriceSale_Enter(object sender, EventArgs e)
        {
            //txtPriceSale.SelectAll();
        }

        private void label12_Click(object sender, EventArgs e)
        {
            PartSerialNo ps1 = new PartSerialNo();
            ps1 = dc.psdb.selectByPriceCost(txtSnPriceCost.Text.Replace(",",""));
            chkReceive.Checked = true;
            setControlSerialNo(ps1.Id);

        }

        private void label4_Click(object sender, EventArgs e)
        {
            PartSerialNo ps1 = new PartSerialNo();
            ps1 = dc.psdb.selectBySerialNo(txtSerialNo.Text);
            chkReceive.Checked = true;
            setControlSerialNo(ps1.Id);
        }

        private void btnUnActive_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("ต้องการยกเลิก", "ยกเลิก", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            {
                dc.padb.VoidPart(txtPaId.Text);
                this.Dispose();
            }
        }

        private void btnSerialUnActive_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("ต้องการยกเลิก", "ยกเลิก", MessageBoxButtons.OKCancel) == System.Windows.Forms.DialogResult.OK)
            {
                dc.psdb.VoidPartSerialNo(txtPsId.Text);
                this.Dispose();
            }
        }

        private void chkSerialActive_Click(object sender, EventArgs e)
        {
            btnSerialUnActive.Visible = false;
            txtSerialNo.Enabled = true;
            chkLoca1.Enabled = true;
            chkLoca2.Enabled = true;
            chkLoca3.Enabled = true;
            chkLoca4.Enabled = true;
            chkLoca5.Enabled = true;
            txtSnPriceCost.Enabled = true;
            txtSnPriceSale.Enabled = true;
            cboSnCurrPriceCost.Enabled = true;
            cboSnCurrPriceSale.Enabled = true;
            txtSnPriceCostCurr.Enabled = true;
            txtSnPriceSaleCurr.Enabled = true;
            txtInvNumber.Enabled = true;
            txtDateInv.Enabled = true;
            txtPsRemark.Enabled = true;
            chkPic1.Enabled = true;
            chkPic2.Enabled = true;
            chkPic3.Enabled = true;
            chkPic4.Enabled = true;
            btnPicPart1.Enabled = true;
            btnPicPart2.Enabled = true;
            btnPicPart3.Enabled = true;
            btnPicPart4.Enabled = true;
        }

        private void chkSerialUnActive_Click(object sender, EventArgs e)
        {
            btnSerialUnActive.Visible = true;
            txtSerialNo.Enabled = false;
            chkLoca1.Enabled = false;
            chkLoca2.Enabled = false;
            chkLoca3.Enabled = false;
            chkLoca4.Enabled = false;
            chkLoca5.Enabled = false;
            txtSnPriceCost.Enabled = false;
            txtSnPriceSale.Enabled = false;
            cboSnCurrPriceCost.Enabled = false;
            cboSnCurrPriceSale.Enabled = false;
            txtSnPriceCostCurr.Enabled = false;
            txtSnPriceSaleCurr.Enabled = false;
            txtInvNumber.Enabled = false;
            txtDateInv.Enabled = false;
            txtPsRemark.Enabled = false;
            chkPic1.Enabled = false;
            chkPic2.Enabled = false;
            chkPic3.Enabled = false;
            chkPic4.Enabled = false;
            btnPicPart1.Enabled = false;
            btnPicPart2.Enabled = false;
            btnPicPart3.Enabled = false;
            btnPicPart4.Enabled = false;
        }
    }
}
