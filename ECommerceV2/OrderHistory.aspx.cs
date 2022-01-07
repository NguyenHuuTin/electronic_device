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
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.Cookies["Phone"] != null)
            {
                string phone = Request.Cookies["Phone"].Value;
                if(!haveOrder(phone))
                {
                    Response.Redirect("OrderHistoryEmpty.aspx");
                } else
                {
                    SqlDataSourceOrder.SelectCommand = "select * from DonHang where SDT = '" + phone + "'";

                    List<string> imageList = getRepresentativeImage(getImageList());
                    int k = -1;
                    for (int i = 0; i < DataList1.Items.Count; i++)
                    {
                        k = k + 1;
                        string imageURL = imageList[k];
                        DataListItem item = DataList1.Items[i];
                        Image imgOrder = (Image)item.FindControl("imgOrder");
                        imgOrder.ImageUrl = imageURL;
                    }
                }
                
                          
            } else
            {
                Response.Write("<script>alert('Vui lòng đăng nhập để xem lịch sử đơn hàng')</script>");
                Response.Redirect("Login.aspx");
            }
            
        }

        private List<string> getImageList()
        {
            string phone = "";
            if(Request.Cookies["Phone"] != null)
            {
                phone = Request.Cookies["Phone"].Value;
            }
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            
            string sql = "select Hinhanh from HangHoa where MaHH in" +
                " (select MaHH from CTDonHang where MaDonHang in ( select MaDonHang from DonHang where SDT = '"+ phone +"'))";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            List<string> imageList = new List<string>();
            while(reader.Read())
            {
                imageList.Add(reader.GetValue(0) + "");
            }
            
            return imageList;
        }

        private List<string> getRepresentativeImage(List<string> imageList)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            foreach(string item in imageList)
            {
                string orderID = getOrderIDfromImage(item);
                if(!dic.ContainsKey(orderID))
                {
                    dic.Add(orderID, item);
                }
            }
            List<string> result = new List<string>();
            foreach(KeyValuePair<string, string> item in dic)
            {
                result.Add(item.Value);
            }

            return result;
        }

        private string getOrderIDfromImage(string image)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select MaDonHang from CTDonHang where MaHH in (select MaHH from HangHoa where Hinhanh = '" + image + "')";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string orderID = "";
            while(reader.Read())
            {
                orderID = reader.GetValue(0) + "";
            }
            return orderID;
        }

        private bool haveOrder(string phone)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "Select count(*) from DonHang where SDT ='" + phone + "'";
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

        protected void btnView_Click(object sender, EventArgs e)
        {
            ASPxButton btnView = sender as ASPxButton;
            DataListItem selectedItem = btnView.NamingContainer as DataListItem;
            Label lblOrderID = selectedItem.FindControl("lblOrderID") as Label;
            string orderID = lblOrderID.Text;

            Session["OrderHistoryID"] = orderID;
            Response.Redirect("OrderHistoryDetails.aspx");
        }
    }
}