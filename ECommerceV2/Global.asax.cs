using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ECommerceV2
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        void Session_OnStart(Object sender, EventArgs e)
        {
            Session["IsLogin"] = 0;
            Session["LoginBeforeFeedback"] = 0;
            Session["ProductIDBack"] = "null";

            Session["LoginBeforeComment"] = 0;
            Session["NewsIDBack"] = "null";
        }
    }
}