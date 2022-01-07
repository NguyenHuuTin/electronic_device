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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string phone = txtPhone.Text;
            string password = txtPassword.Text;
            string name = txtName.Text;
            string email = txtEmail.Text;
            string permisstionCode = 1 + "";

            if(!authorize(phone))
            {
                SqlDataSource1.InsertCommand = "insert into TaiKhoan values(@Phone, @Password, @Name, @Email, @PermissionCode)";
                SqlDataSource1.InsertParameters.Add("Phone", phone);
                SqlDataSource1.InsertParameters.Add("Password", password);
                SqlDataSource1.InsertParameters.Add("Name", name);
                SqlDataSource1.InsertParameters.Add("Email", email);
                SqlDataSource1.InsertParameters.Add("PermissionCode", permisstionCode);

                int flag = SqlDataSource1.Insert();
                if (flag > 0)
                {
                    Response.Write("<script>alert('Đăng ký tài khoản thành công')</script>");
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Lỗi xảy ra khi đăng ký tài khoản')</script>");
                }
            } else
            {
                Response.Write("<script>alert('Số điện thoại này đã được đăng ký tài khoản')</script>");
            }
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private bool authorize(string phone)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select count(*) from TaiKhoan where SDT = '" + phone + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (Convert.ToInt32(reader.GetValue(0)) > 0)
                {
                    return true;
                }
            }
            return false;
        }
    }
}