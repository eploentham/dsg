using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace dsg.object1
{
    public class Part:Persistent
    {
        public String Id = "", partCode = "", partNumber = "", barcode = "", serialNo = "", certify = "", description = "", dateReceive = "", dateDraw = "";
        public String acftModel = "", dateInv = "", partRemark = "", stockLoca1 = "", stockLoca2 = "", stockLoca3 = "", stockLoca4 = "", stockLoca5 = "", dateCreate = "", dateModi = "", dateCancel = "";
        public String cateId = "", priceCost = "", priceSale = "", pathPic = "";
    }
}
