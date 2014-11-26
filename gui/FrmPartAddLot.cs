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
    public partial class FrmPartAddLot : Form
    {
        DsgControl dc;
        Part pa;
        PartSerialNo ps;
        public FrmPartAddLot(DsgControl d, String lotId)
        {
            InitializeComponent();
            dc = d;
            initConfig(lotId);
        }
        private void initConfig(String lotId)
        {
            pa = new Part();
            ps = new PartSerialNo();
            cboPaCate = dc.pcdb.getCboPartCate(cboPaCate);
            cboPaType = dc.ptdb.getCboPartType(cboPaType);
            cboAcftModel = dc.padb.getCboModel(cboAcftModel);
        }
        private void FrmPartAddLot_Load(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {

        }
    }
}
