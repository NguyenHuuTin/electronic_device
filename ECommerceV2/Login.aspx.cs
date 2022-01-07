using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceV2
{
    public partial class Login : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["Phone"] != null && Request.Cookies["Password"] != null)
            {
                Response.Cookies["Phone"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string phone = txtPhone.Text;
            string password = txtPassword.Text;
            if(authorize(phone, password))
            {
                Session["IsLogin"] = 1;
                Response.Cookies["Phone"].Value = phone;
                Response.Cookies["Password"].Value = password;
                if (Convert.ToInt32(Session["LoginBeforeFeedback"].ToString()) == 1)
                {
                    Session["ProductID"] = Session["ProductIDBack"].ToString();
                    Response.Redirect("ProductDetails.aspx");
                }
                else if (Convert.ToInt32(Session["LoginBeforeComment"].ToString()) == 1) {

                    Session["NewsID"] = Session["NewsIDBack"].ToString();
                    Response.Redirect("NewsDetails.aspx");
                }
                else
                {
                    SqlConnection conn = new SqlConnection(connectionString);
                    conn.Open();
                    String sql = "select MaQuyen from TaiKhoan where SDT = '" + phone + "' and MatKhau = '" + password + "'";
                    SqlCommand cmd = new SqlCommand(sql, conn);
                    SqlDataReader rd = cmd.ExecuteReader();
                    rd.Read();
                    int maquyen = Convert.ToInt32(rd["MaQuyen"].ToString());
                    if(maquyen == 1)
                    {
                        Response.Redirect("Default.aspx");
                    }else if(maquyen == 2){
                        Response.Redirect("Admin/Statistical.aspx");
                    } 
                }
                
            } else
            {
                lblErrorMessage.Text = "Số điện thoại hoặc mật khẩu bạn nhập không đúng, vui lòng nhập lại!";
            }
        }

        private bool authorize(string phone, string password)
        {
            
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select count(*) from TaiKhoan where SDT = '" + phone + "' and MatKhau = '" + password + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                if(Convert.ToInt32(reader.GetValue(0)) > 0)
                {
                    return true;
                }
            }
            return false;
        }
    }
}