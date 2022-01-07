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
    public partial class UpdateInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtOldPassword.Visible = false;
            txtNewPassword.Visible = false;
            txtNewPasswordAgain.Visible = false;
            
            if(IsPostBack == false)
            {
                string phone = "";
                if (Request.Cookies["Phone"] != null)
                {
                    phone = Request.Cookies["Phone"].Value;
                    txtPhone.Text = phone;
                }
                string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                string sql = "select MatKhau, HoTen, Email from TaiKhoan where SDT = '" + phone + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader reader = cmd.ExecuteReader();
                while(reader.Read())
                {
                    txtName.Text = reader.GetValue(1) + "";
                    txtEmail.Text = reader.GetValue(2) + "";
                }
            }
            
        }

        protected void chkChangePassword_CheckedChanged(object sender, EventArgs e)
        {
            if(chkChangePassword.Checked == true)
            {
                txtOldPassword.Visible = true;
                txtNewPassword.Visible = true;
                txtNewPasswordAgain.Visible = true;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string phone = "";
            if (Request.Cookies["Phone"] != null)
            {
                phone = Request.Cookies["Phone"].Value;
                txtPhone.Text = phone;
            }
            if (chkChangePassword.Checked == false)
            {
                string name = txtName.Text;
                string email = txtEmail.Text;
                SqlDataSource1.UpdateCommand = "update TaiKhoan set HoTen = @Name , Email = @Email where SDT ='" + phone + "'";
                SqlDataSource1.UpdateParameters.Add("Name", name);
                SqlDataSource1.UpdateParameters.Add("Email", email);
                int flag = SqlDataSource1.Update();
                if (flag > 0)
                {
                    lblMessage.Text = "Cập nhật thông tin thành công";
                }
                else
                {
                    lblMessage.Text = "Cập nhật thông tin thành công";
                }
            }
            else
            {
                if (isRightPass(txtOldPassword.Text))
                {
                    string name = txtName.Text;
                    string email = txtEmail.Text;
                    string newPass = txtNewPassword.Text;
                    SqlDataSource1.UpdateCommand = "update TaiKhoan set HoTen = @Name , Email = @Email , MatKhau = @MatKhau where SDT ='" + phone + "'";
                    SqlDataSource1.UpdateParameters.Add("Name", name);
                    SqlDataSource1.UpdateParameters.Add("Email", email);
                    SqlDataSource1.UpdateParameters.Add("MatKhau", newPass);
                    int flag = SqlDataSource1.Update();
                    if (flag > 0)
                    {
                        lblMessage.Text = "Cập nhật thông tin thành công";
                    }
                    else
                    {
                        lblMessage.Text = "Cập nhật thông tin thành công";
                    }
                }
            }
            //Response.Write("<script>alert('OK')</script>");
        }

        private bool isRightPass(string pass)
        {
            string phone = "";
            if(Request.Cookies["Phone"] != null)
            {
                phone = Request.Cookies["Phone"].Value;
            }
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select count(*) from TaiKhoan where SDT ='" + phone + "' and MatKhau ='" + pass + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int count = 0;
            while(reader.Read())
            {
                count = Convert.ToInt32(reader.GetValue(0));
            }
            if(count > 0)
            {
                return true;
            } else
            {
                return false;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}