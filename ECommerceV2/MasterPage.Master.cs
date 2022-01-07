using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceV2
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        public static List<string> addToCardItems = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            int isLogin = Convert.ToInt32(Session["IsLogin"].ToString());
            if(isLogin == 1)
            {
                btnLogin.Visible = false;
                lblPhone.Visible = true;
                if(Request.Cookies["Phone"] != null)
                {
                    lblPhone.Text = "Xin chào, " + Request.Cookies["Phone"].Value;
                }
            } else
            {
                btnLogin.Visible = true;
                lblPhone.Visible = false;
            }
            
            if(addToCardItems.Count > 0)
            {
                ImageButton2.ImageUrl = "Images\\shopping-bag-dot.png";
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            string strID = "";
            for(int i = 0; i < addToCardItems.Count; i++)
            {
                if(i == addToCardItems.Count - 1)
                {
                    strID += "'" + addToCardItems[i] + "'";
                } else
                {
                    strID += "'" + addToCardItems[i] + "', ";
                }
            }

            Response.Write("<script>alert('" + strID.Length + "')</script>");
            Session["StrListID"] = strID;
            Response.Redirect("CartView.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            if(Request.Cookies["Phone"] != null && Request.Cookies["Password"] != null)
            {
                Response.Cookies["Phone"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
            }
            Session["IsLogin"] = 0;
            Response.Redirect("Default.aspx");
        }

        protected void ibtnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtSearch.Text;
            Session["Keyword"] = keyword;
            Response.Redirect("SearchResult.aspx");
        }
    }
}