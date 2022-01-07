using DevExpress.Web;
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
    public partial class NewsDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string newsID = Session["NewsID"].ToString();
            SqlDataSourceNews.SelectCommand = "select * from BaiViet where MaBV not in ('" + newsID + "')";
            SqlDataSource1.SelectCommand = "select * from BinhLuan where MaBV ='" + newsID + "'";

            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select * from BaiViet where MaBV = '" + newsID + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string title = "";
            string content = "";
            string image = "";

            while(reader.Read())
            {
                title = reader.GetValue(1) + "";
                content = reader.GetValue(2) + "";
                image = reader.GetValue(3) + "";
            }

            lblTitle.Text = title;
            lblContent.Text = content;
            imgNews.ImageUrl = image;


        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            ASPxButton btn = sender as ASPxButton;
            DataListItem selectedItem = (DataListItem)btn.NamingContainer;
            Label lblTitle = (Label)selectedItem.FindControl("lblTitle");
            string title = lblTitle.Text;
            string id = getIDFromTitle(title);

            Session["NewsID"] = id;
            Response.Redirect("NewsDetails.aspx");
        }

        private string getIDFromTitle(string title)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "select MaBV from BaiViet where ChuDe = N'" + title + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string id = "";
            while (reader.Read())
            {
                id = reader.GetValue(0) + "";
            }

            return id;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string phone = "";
            if(Request.Cookies["Phone"] != null)
            {
                phone = Request.Cookies["Phone"].Value;
                string cmt = txtComment.Text;
                string newsID = Session["NewsID"].ToString();

                SqlDataSource1.InsertCommand = "insert into BinhLuan values(@NewsID, @Phone, @Comment)";
                SqlDataSource1.InsertParameters.Add("NewsID", newsID);
                SqlDataSource1.InsertParameters.Add("Phone", phone);
                SqlDataSource1.InsertParameters.Add("Comment", cmt);
                int flag = 0;
                try
                {
                    flag = SqlDataSource1.Insert();
                } catch(Exception ex)
                {
                    lblMessage.Text = "Bạn đã bình luận vào bài viết này rồi!";
                }
                
                if(flag > 0)
                {
                    lblMessage.Text = "Bình luận của bạn sẽ sớm xuất hiện";
                } else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Lỗi xảy ra khi thực hiện bình luận";
                }
            } else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Hãy đăng nhập để thực hiện bình luận bạn nhé";
                Session["LoginBeforeComment"] = 1;
                string newsID = Session["NewsID"].ToString();
                Session["NewsIDBack"] = newsID;
            }
        }
    }
}