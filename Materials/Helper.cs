using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Materials
{
    
    class Helper
    {
        public static MaterialsEntities s_Model1;

        public static MaterialsEntities GetContext()
        {
            if (s_Model1 == null)
            {
                s_Model1 = new MaterialsEntities();
            }
            return s_Model1;
        }
    }
}
