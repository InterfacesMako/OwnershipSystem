using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SistemaInmobiliario.Utils
{
    public class BasePage
    {
        public readonly int NumPageShow  = 5;
        public int ActualPage { get; set; }
        public int PagesTot { get; set; }
    }
}