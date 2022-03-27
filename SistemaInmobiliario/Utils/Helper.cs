using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaInmobiliario.Utils
{
    public class Helper
    {
        public static int GetPageTotalsModelViews(int CantItemsTot, int ItemsPerPage)
        {
            int PagesTot = (CantItemsTot / ItemsPerPage);
            int LeftoverPage = 0;
            if (ItemsPerPage < CantItemsTot)
            {
                LeftoverPage = (CantItemsTot % ItemsPerPage) > 0 ? 1 : 0;
            }

            return (PagesTot == 0 ? 1 : PagesTot) + LeftoverPage;
        }
    }
}