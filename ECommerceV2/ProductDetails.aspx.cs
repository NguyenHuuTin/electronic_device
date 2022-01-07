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
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string productID = Session["ProductID"].ToString();

            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();

            string sql = "select TenHH, Gia, SoLuongTonKho, NhaSanXuat, Hinhanh, ChiTiet , SoLuongBan from HangHoa where MaHH ='" + productID +"'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();

            string productName = "";
            int productPrice = 0;
            int productRemain = 0;
            string productProducer = "";
            string productImage = "";
            string productContent = "";
            string productSold = "";
            while(reader.Read())
            {
                productName = reader.GetValue(0) + "";
                productPrice = Convert.ToInt32(reader.GetValue(1));
                productRemain = Convert.ToInt32(reader.GetValue(2));
                productProducer = reader.GetValue(3) + "";
                productImage = reader.GetValue(4) + "";
                productContent = reader.GetValue(5) + "";
                productSold = reader.GetValue(6) + "";
            }

            lblProductNameDetails.Text = productName;
            lblProductPriceDetails.Text = productPrice + "";
            lblProductAvailable.Text = productRemain + "";
            lblProductProducerDetails.Text = productProducer;
            lblProductContent.Text = productContent;
            imgProductDetails.ImageUrl = productImage;
            lblSold.Text = productSold;

            SqlDataSourceComment.SelectCommand = "select * from DanhGia where MaHH = '" + productID + "'";
        }

        protected void btnAddToCard_Click(object sender, EventArgs e)
        {
            string productID = Session["ProductID"].ToString();
            MasterPage.addToCardItems.Add(productID);

            if(checkProduct(productID))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                string sql = "select TenHH from HangHoa where MaHH = '" + productID + "'";
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlDataReader reader = cmd.ExecuteReader();
                string name = "";
                while (reader.Read())
                {
                    name = reader.GetValue(0) + "";
                }

                CartView.listRemove.Remove(name);
            }
        }

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            string phone = "";
            if (Request.Cookies["Phone"] != null)
            {
                phone = Request.Cookies["Phone"].Value;
                string productID = Session["ProductID"].ToString();


                string content = txtComment.Text;

                SqlDataSourceComment.InsertCommand = "insert into DanhGia values(@ProductID, @Phone, @Content)";
                SqlDataSourceComment.InsertParameters.Add("ProductID", productID);
                SqlDataSourceComment.InsertParameters.Add("Phone", phone);
                SqlDataSourceComment.InsertParameters.Add("Content", content);
                int flag = SqlDataSourceComment.Insert();
                if (flag > 0)
                {
                    lblMessage.Text = "Đánh giá của bạn đang được phê duyệt và sẽ sớm xuất hiện";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Lỗi xảy ra khi đánh giá";
                }
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Bạn hãy đăng nhập để thực hiện đánh giá nhé !";
                Session["LoginBeforeFeedback"] = 1;
                string productID = Session["ProductID"].ToString();
                Session["ProductIDBack"] = productID; 
            }           
        }

        private bool isExistInRemoveList(string name)
        {
            for(int i = 0; i < CartView.listRemove.Count; i++)
            {
                if(name.Equals(CartView.listRemove[i]))
                {
                    return true;
                }
            }
            return false;
        }

        private bool checkProduct(string productID)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select TenHH from HangHoa where MaHH = '" + productID + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string name = "";
            while(reader.Read())
            {
                name = reader.GetValue(0) + "";
            }

            if(isExistInRemoveList(name))
            {
                return true;
            }

            return false;
        }
    }
}