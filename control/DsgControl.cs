using dsg.objdb;
using dsg.object1;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace dsg.control
{
    public class DsgControl
    {
        public Config1 cf;
        public ConnectDB conn;//
        public StaffDB sfdb;
        public CustomerDB cudb;
        public PartDB padb;
        public PartTypeDB ptdb;
        public PartSerialNoDB psdb;
        public PartCategoryDB pcdb;
        public PartTypeSubDB ptsdb;
        public TPartDB tpadb;
        public CurrencyDB currdb;
        
        public Staff staff;
        public Customer cu;
        public Part pa;
        public PartType pt;
        public PartSerialNo ps;
        public PartCategory pc;
        public PartTypeSub pts;
        public TPart tpa;
        public Currency curr;

        public LogWriter lw;
        
        public String thooId = "";

        public ComboBox cboType, cboSale, cboThoo;
        //public List<Thoo> lTho = new List<Thoo>();
        public List<Currency> lcurr;

        private IniFile iniFile;
        public InitConfig initC;
        //public List<Reward1> lRew1 = new List<Reward1>();

        public DsgControl()
        {
            initConfig();
        }
        private void initConfig()
        {
            iniFile = new IniFile(Environment.CurrentDirectory+"\\"+Application.ProductName+".ini");
            initC = new InitConfig();
            //regE = new RegEdit();
            GetConfig();
            cf = new Config1();
            conn = new ConnectDB(initC);
            sfdb = new StaffDB(conn);
            cudb = new CustomerDB(conn);
            padb = new PartDB(conn);
            ptdb = new PartTypeDB(conn);
            psdb = new PartSerialNoDB(conn);
            pcdb = new PartCategoryDB(conn);
            ptsdb = new PartTypeSubDB(conn);
            tpadb = new TPartDB(conn);
            currdb = new CurrencyDB(conn);
            
            staff = new Staff();
            cu = new Customer();
            pa = new Part();
            pt = new PartType();
            ps = new PartSerialNo();
            pc = new PartCategory();
            pts = new PartTypeSub();
            tpa = new TPart();
            curr = new Currency();

            lw = new LogWriter();

            lcurr = new List<Currency>();
            currdb.getListItemGroup(lcurr);

            cboType = new ComboBox();
            cboType = ptdb.getCboPartType(cboType);
        }
        public ComboBoxItem getCboItem(ComboBox c, String valueId)
        {
            ComboBoxItem r = new ComboBoxItem();
            foreach (ComboBoxItem cc in c.Items)
            {
                if (cc.Value.Equals(valueId))
                {
                    r = cc;
                }
            }
            return r;
        }
        public String getTextCboItem(ComboBox c, String valueId)
        {
            ComboBoxItem r = new ComboBoxItem();
            r.Text = "";
            r.Value = "";
            foreach (ComboBoxItem cc in c.Items)
            {
                if (cc.Value.Equals(valueId))
                {
                    r = cc;
                }
            }
            return r.Text;
        }
        public Staff selectStaffbyPk(String staffId)
        {
            staff = sfdb.selectByPk(staffId);
            return staff;
        }
        public DataTable selectStaffAll()
        {
            DataTable dt = sfdb.selectAll();
            return dt;
        }
        public String saveStaff(Staff p)
        {
            String chk = "";
            chk = sfdb.insertStaff(p);
            return chk;
        }

        public Boolean getLoginByCode(String code, String password)
        {
            Boolean chk = false;
            staff = sfdb.selectByCode(code);
            if (staff != null)
            {
                if (staff.Password.Equals(password))
                {
                    chk = true;
                }
            }
            return chk;
        }
        String alignPrint(String txt, int space)
        {
            if (txt.Length >= space)
            {
                return txt;
            }
            String prn = "";
            for (int i = 0; i < space; i++)
            {
                prn += " ";
            }
            prn = prn + txt;
            prn = prn.Substring(prn.Length - space);
            return prn;
        }
        public float alignR(float gapCol, float fixCol, int len, float fontSizeinPoint)
        {
            if (len == 1)
            {
                return ((gapCol) + ((fixCol - len) * fontSizeinPoint));
            }
            else if (len == 5)
            {
                return ((gapCol) + ((fixCol - len) * fontSizeinPoint) + ((float)len * (float)1.5));
            }
            else
            {
                return ((gapCol) + ((fixCol - len) * fontSizeinPoint) + ((float)len * (float)1.3333));
            }
        }
        public ComboBox setCboPeriodDefault(ComboBox c)
        {
            if (System.DateTime.Now.Day >= 2)
            {
                if (System.DateTime.Now.Day <= 17)
                {
                    c.SelectedValue = "01";
                }
                else
                {
                    c.SelectedValue = "02";
                }

            }
            else
            {
                c.SelectedValue = "01";
            }
            return c;
        }
        public String GetConfigbyKey(String key)
        {
            AppSettingsReader _configReader = new AppSettingsReader();
            // Set connection string of the sqlconnection object
            return _configReader.GetValue(key, "".GetType()).ToString();
        }
        public void GetConfig()
        {
            initC.clearInput = iniFile.Read("clearinput");
            initC.connectServer = iniFile.Read("connectserver");
            initC.ServerIP = iniFile.Read("host");
            initC.User = iniFile.Read("username");
            initC.Password = iniFile.Read("password");

            initC.pathImage = iniFile.Read("pathimage");
            initC.pathImageBefore = iniFile.Read("pathimagebefore");
            initC.PathReport = iniFile.Read("pathreport");

            initC.delImage = iniFile.Read("delimage");
            //initC.connectServer = regE.getConnectServer();
            //initC.ServerIP = regE.getServerIP();
            //initC.User = regE.getUsername();
            //initC.Password = regE.getPassword();
        }
        public void SetPathImage(String path)
        {
            iniFile.Write("pathimage", path);
        }
        public void SetPathImageBefore(String path)
        {
            iniFile.Write("pathimagebefore", path);
        }
        public void SetPathReport(String path)
        {
            iniFile.Write("pathreport", path);
        }
        public void SetClearInput(Boolean value)
        {
            if (value)
            {
                iniFile.Write("clearinput", "yes");
            }
            else
            {
                iniFile.Write("clearinput", "no");
            }
        }
        public void SetDelImage(Boolean value)
        {
            if (value)
            {
                iniFile.Write("delimage", "yes");
            }
            else
            {
                iniFile.Write("delimage", "no");
            }
        }
        public void SetConnectServer(Boolean value, String host, String username, String password)
        {
            if (value)
            {
                iniFile.Write("connectserver", "yes");
                iniFile.Write("host", host.Trim());
                iniFile.Write("username", username.Trim());
                iniFile.Write("password", password.Trim());
            }
            else
            {
                iniFile.Write("connectserver", "no");
            }
        }
        public void renameFileImage(String fileName)
        {
            String file1 = fileName.Replace("_0","_1");
            System.IO.File.Move(fileName, file1);
        }
        public Currency getCurrencyByList(String itId)
        {
            Currency item = new Currency();

            foreach (Currency i in lcurr)
            {
                if (i.Id.Equals(itId))
                {
                    //item = i;
                    return i;
                }
            }
            return item;
        }
        public Currency getCurrencyByList1(String Name)
        {
            Currency item = new Currency();

            foreach (Currency i in lcurr)
            {
                if (i.Name.Equals(Name))
                {
                    //item = i;
                    return i;
                }
            }
            return item;
        }
        public String calCurrency(Currency c, Double m)
        {
            Double r = 0;
            r = (m * Double.Parse(NumberNull1(c.CurrRate))) / Double.Parse(NumberNull0(c.CurrX));
            return String.Format("{0:#,###,###.00}", r);
        }
        public String NumberNull1(String o)
        {
            if (o.Equals(""))
            {
                return "0";
            }
            else
            {
                return o;
            }
        }
        private String NumberNull0(String o)
        {
            if (o.Equals(""))
            {
                return "1";
            }
            else
            {
                return o;
            }
        }
        public String getValueCboItem(ComboBox c)
        {
            ComboBoxItem iSale;
            iSale = (ComboBoxItem)c.SelectedItem;
            if (iSale == null)
            {
                return "";
            }
            else
            {
                return iSale.Value;
            }
        }
        //public String NumberNull1(String o)
        //{
        //    if (o.Equals(""))
        //    {
        //        return "0";
        //    }
        //    else
        //    {
        //        return o;
        //    }
        //}
    }
}
