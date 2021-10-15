using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace SistemaInmobiliario
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*"));

			bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
							"~/Scripts/jquery-3.4.1.min.js"));

			bundles.Add(new ScriptBundle("~/bundles/init").Include(
						"~/Scripts/sweetalert2.min.js",
						"~/Scripts/popper.min.js",
						"~/Scripts/bootstrap.min.js",
						"~/Scripts/jquery.mCustomScrollbar.concat.min.js",
						"~/Scripts/bootstrap-material-design.min.js",
						"~/Scripts/main.js"));
		}
    }
}