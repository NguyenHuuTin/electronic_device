using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceV2.Admin
{
    public partial class DetailOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String id = Session["IDDH"].ToString();
            String titleOrder = "Thông tin đơn hàng số: " + id;
            title.Text = titleOrder;
        }
    }
}