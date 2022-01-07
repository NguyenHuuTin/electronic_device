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
    public partial class OrderHistoryDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderID = Session["OrderHistoryID"].ToString();
            string sql = "select * from HangHoa where MaHH in (select MaHH from CTDonHang where MaDonHang = '" + orderID + "')";
            SqlDataSource1.SelectCommand = sql;

            List<int> amountList = getAmountList();

            int k = -1;
            for (int i = 0; i < DataList1.Items.Count; i++)
            {
                k = k + 1;
                DataListItem item = DataList1.Items[i];
                Label lblProductAmount = item.FindControl("lblProductAmount") as Label;
                lblProductAmount.Text = amountList[k] + "";
            }

            lblOrderID.Text = orderID;

            if(IsPostBack == false)
            {
                if (Request.Cookies["Phone"] != null)
                {
                    txtPhone.Text = Request.Cookies["Phone"].Value;
                }
                string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                string sql1 = "select TongTien, NgayDatHang, DiaChi, TinhTrangDonHang from DonHang where MaDonHang = '" + orderID + "'";
                SqlCommand cmd = new SqlCommand(sql1, con);
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    lblTotal.Text = reader.GetValue(0) + "";
                    lblOrderDate.Text = reader.GetValue(1) + "";
                    txtDeliveryAddress.Text = reader.GetValue(2) + "";
                    lblStatus.Text = reader.GetValue(3) + "";
                }

                if (lblStatus.Text.Equals("Đang xử lý"))
                {
                    btnEdit.Visible = true;
                }
                else
                {
                    btnEdit.Visible = false;
                }
            }
            
        }

        private List<int> getAmountList()
        {
            string orderID = Session["OrderHistoryID"].ToString();
            List<int> amountList = new List<int>();
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select SoLuong from CTDonHang where MaDonHang = '"+ orderID +"'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            while(reader.Read())
            {
                amountList.Add(Convert.ToInt32(reader.GetValue(0)));
            }
            return amountList;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            string orderID = lblOrderID.Text;
            string phone = txtPhone.Text;
            string deliveryAddress = txtDeliveryAddress.Text;

            Response.Write("<script>alert('" + orderID + "')</script>");
            SqlDataSource2.UpdateCommand = "update DonHang set SDT = '"+ phone + "' , DiaChi =" +
                " '"+ deliveryAddress +"' where MaDonHang ='" + orderID + "'";
            
            int flag = SqlDataSource2.Update();
            
            if (flag > 0)
            {
                Response.Write("<script>alert('Cập nhật thông tin đơn hàng thành công')</script>");
            } else
            {
                Response.Write("<script>alert('Cập nhật thông tin đơn hàng thất bại')</script>");
            }
            Response.Redirect("OrderHistory.aspx");
        }
    }
}