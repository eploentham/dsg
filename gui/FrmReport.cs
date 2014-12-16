using dsg.control;
using dsg.objdb;
using dsg.object1;
using CrystalDecisions.CrystalReports.Engine;
//using CrystalDecisions.CrystalReports.Engine;
//using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using dsg.control;

namespace dsg
{
    public partial class FrmReport : Form
    {
        DsgControl dc;
        ConnectDB conn;
        //Quotation qu;
        public FrmReport(DsgControl c)
        {
            InitializeComponent();
            dc = c;
            conn = dc.conn;
            //initConfig(rptName, reportName, condition, sql);
        }        
                
        public void setReportBtem(DataTable dt)
        {
            String chk = "";
            ReportDocument rpt = new ReportDocument();
            try
            {
                dc.lw.WriteLog("rpt.setReportBtem OK ");
                rpt.Load(dc.initC.PathReport + "\\ItemPrint.rpt");
                dc.lw.WriteLog("rpt.setReportBtem OK Load" + dc.initC.PathReport + "\\ItemPrint.rpt");
                rpt.SetDataSource(dt);
                dc.lw.WriteLog("rpt.setReportBtem OK SetDataSource");

                rpt.SetParameterValue("line1", "NORTHERN AVIATION SERVICES COMPANY LIMITED");
                rpt.SetParameterValue("line2", "PART INVENTORY");
                rpt.SetParameterValue("line3", "Update at " +System.DateTime.Now.ToShortDateString());

                //rpt.SetParameterValue("custName", "Test Company");
                

                this.crystalReportViewer1.ReportSource = rpt;
                this.crystalReportViewer1.Refresh();
            }
            catch (Exception ex)
            {
                chk = ex.Message.ToString();
                dc.lw.WriteLog("rpt.setReportCheckUpSticker Error " + chk);
            }
        }
        public void setReportPartSerialNo(DataTable dt)
        {
            String chk = "";
            ReportDocument rpt = new ReportDocument();
            try
            {
                dc.lw.WriteLog("rpt.PartSerialNoPrint OK ");
                rpt.Load(dc.initC.PathReport + "\\PartSerialNoPrint.rpt");
                dc.lw.WriteLog("rpt.setReportBtem OK Load" + dc.initC.PathReport + "\\PartSerialNoPrint.rpt");
                rpt.SetDataSource(dt);
                dc.lw.WriteLog("rpt.PartSerialNoPrint OK SetDataSource");

                rpt.SetParameterValue("line1", "NORTHERN AVIATION SERVICES COMPANY LIMITED");
                rpt.SetParameterValue("line2", "PART INVENTORY");
                rpt.SetParameterValue("line3", "Part by Serial no current Update at " + System.DateTime.Now.ToShortDateString());

                //rpt.SetParameterValue("custName", "Test Company");


                this.crystalReportViewer1.ReportSource = rpt;
                this.crystalReportViewer1.Refresh();
            }
            catch (Exception ex)
            {
                chk = ex.Message.ToString();
                dc.lw.WriteLog("rpt.setReportCheckUpSticker Error " + chk);
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            
        }
    }
}
