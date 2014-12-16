using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.object1
{
    public class PartSerialNo:Persistent
    {
        public String Id = "", serialNo = "", locaId = "", partId = "", PriceCost = "", PriceSale = "", dateInv = "", dateReceive = "", Remark="";
        public String Active = "", rowNumber = "", StatusTran = "", userCreate = "", userModi = "", userCancel = "", DateCreate = "", DateModi = "", DateCancel = "";
        public String RemarkDraw = "";
        public String CurrNamePriceCost = "", CurrNamePriceSale = "", CurrRatePriceCost = "", CurrRatePriceSale = "", CurrXPriceCost = "", CurrXriceSale = "", PriceCostCurrent = "", PriceSaleCurrent = "";
    }
}
