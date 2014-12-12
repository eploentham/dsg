using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.object1
{
    public class Part:Persistent
    {
        public String Id = "", Code = "", Number = "", barcode = "", SerialNo = "", Certify = "", Name = "", dateReceive = "", dateDraw = "";
        public String acftModel = "", dateInv = "", Remark = "", stockLoca1 = "", stockLoca2 = "", stockLoca3 = "", stockLoca4 = "", stockLoca5 = "", dateCreate = "", dateModi = "", dateCancel = "";
        public String CateId = "", PriceCost = "", PriceSale = "", pathPicCertify = "", Active="", InvNumber="", Model="", CateName="", TypeId="", TypeName="";
        public String TypeSubId = "", TypeSubName = "", sort1 = "", pathPic1 = "", pathPic2 = "", pathPic3 = "", pathPic4 = "", pathPic5 = "", userCreate = "", userModi = "", userCancel = "";
        public String CurrNamePriceCost = "", CurrNamePriceSale = "", CurrRatePriceCost = "", CurrRatePriceSale = "", CurrXPriceCost = "", CurrXriceSale = "", PriceCostCurrent = "", PriceSaleCurrent="";
    }
}
