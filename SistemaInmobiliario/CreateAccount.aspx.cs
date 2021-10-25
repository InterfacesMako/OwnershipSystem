using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaInmobiliario
{
    public partial class CreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreateAndLogin_Click(object sender, EventArgs e)
        {
            string pass = UserPassword.Value;
            string passRepeat = UserRepeatPassword.Value;

            if(pass.Equals(passRepeat))
            {
                string user = UserName.Value;
                string email = UserMail.Value;


            }
        }
    }
}