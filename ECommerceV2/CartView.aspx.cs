using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceV2
{
    public partial class CartView : System.Web.UI.Page
    {
        public static List<string> listRemove = new List<string>();
        public static Dictionary<string, int> dic = new Dictionary<string, int>();
        public static string orderIDS = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string strListID = Session["StrListID"].ToString();
            if(strListID.Length == 0)
            {
                Response.Redirect("EmptyCartView.aspx");
            } else
            {
                orderIDS = RandomString(8);

                if (listRemove.Count > 0)
                {
                    string strRemove = "";
                    for (int i = 0; i < listRemove.Count; i++)
                    {
                        if (i == listRemove.Count - 1)
                        {
                            strRemove += "N'" + listRemove[i] + "'";
                        }
                        else
                        {
                            strRemove += "N'" + listRemove[i] + "', ";
                        }
                    }

                    string sql = "Select * from HangHoa where MaHH in (" + strListID + ") and TenHH not in (" + strRemove + ")";
                    SqlDataSource1.SelectCommand = sql;
                }
                else
                {
                    string sql = "Select * from HangHoa where MaHH in (" + strListID + ")";
                    SqlDataSource1.SelectCommand = sql;
                }

                lblOrderID.Text = orderIDS;

                //Khởi tạo đơn hàng ban đầu 
                string initializeOrderSQL = "insert into DonHang (MaDonHang)  values(@MaDH)";
                SqlDataSource3.InsertCommand = initializeOrderSQL;
                SqlDataSource3.InsertParameters.Add("MaDH", lblOrderID.Text);
                SqlDataSource3.Insert();

                //Điền sẵn sdt nếu người dùng đăng nhập
                if (Request.Cookies["Phone"] != null)
                {
                    txtPhone.Text = Request.Cookies["Phone"].Value;
                }

                //Tính tổng tiền cần thanh toán dựa trên các sản phẩm và số lượng mua tương ứng
                int anotherTotal = 0;
                for(int i = 0; i < DataList1.Items.Count; i++)
                {
                    DataListItem item = DataList1.Items[i];
                    Label lblPrice = (Label)item.FindControl("lblPrice");
                    ASPxSpinEdit spinAmount = (ASPxSpinEdit)item.FindControl("spinAmount");

                    int price = Convert.ToInt32(lblPrice.Text);
                    int amount = Convert.ToInt32(spinAmount.Text);

                    anotherTotal += (price * amount);
                }
                lblTotal.Text = anotherTotal + "";

                //Thêm các sản phẩm và số lượng đặt mua tương ứng vào dictionary để thêm vào csdl
                //sau khi người dùng đặt hàng
                for (int i = 0; i < DataList1.Items.Count; i++)
                {
                    DataListItem item = DataList1.Items[i];
                    Label lblProductName = (Label)item.FindControl("lblProductName");
                    ASPxSpinEdit spinAmount = (ASPxSpinEdit)item.FindControl("spinAmount");

                    string name = lblProductName.Text;
                    int amount = Convert.ToInt32(spinAmount.Text);
                    
                    if(!dic.ContainsKey(name))
                    {
                        dic.Add(name, amount);
                    }
                   
                }
            }
            
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            DataListItem selecedItem = (DataListItem)btn.NamingContainer;
            Label lblProductName = (Label)selecedItem.FindControl("lblProductName");
            string productName = lblProductName.Text;

            listRemove.Add(productName);

            //Remove sản phẩm khỏi dictionary khi nó bị xoá khỏi giỏ hàng
            if(dic.ContainsKey(productName))
            {
                dic.Remove(productName);
            }
            //Load lại trang để thực hiện tính lại số tiền thanh toán
            //khi người dùng xoá sản phẩm ra khỏi giỏ hàng
            Response.Redirect("CartView.aspx");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            string dicStr = "";
            foreach (KeyValuePair<string, int> item in dic)
            {
                dicStr += item.Key + ": " + item.Value + "---";
            }

            //Response.Write("<script>alert('" + dicStr + "')</script>");

            int extremeChar = 0;
            int flag1 = 0;
            foreach (KeyValuePair<string, int> pair in dic)
            {
                extremeChar++;
                string orderDetailsID = RandomStringV2() + extremeChar;
                string orderID = lblOrderID.Text;
                string id = getIDByName(pair.Key);
                int soLuong = Convert.ToInt32(pair.Value);
                int tempAmount = soLuong * getPriceByName(pair.Key);

                string para1 = "@a" + extremeChar;
                string para2 = "@b" + extremeChar;
                string para3 = "@c" + extremeChar;
                string para4 = "@d" + extremeChar;
                string para5 = "@e" + extremeChar;

                SqlDataSource2.InsertCommand = "insert into CTDonHang values(" + para1 + ", " + para2 + ", " + para3 +
                    ", " + para4 + ", " + para5 + ")";


                SqlDataSource2.InsertParameters.Add("a" + extremeChar, orderDetailsID);
                SqlDataSource2.InsertParameters.Add("b" + extremeChar, orderID);
                SqlDataSource2.InsertParameters.Add("c" + extremeChar, id);
                SqlDataSource2.InsertParameters.Add("d" + extremeChar, soLuong + "");
                SqlDataSource2.InsertParameters.Add("e" + extremeChar, tempAmount + "");
                flag1 = SqlDataSource2.Insert();             
            }

            if (flag1 > 0)
            {
                Response.Write("<script>alert('Order thanh cong')</script>");
            }
            else
            {
                Response.Write("<script>alert('Loi xay ra')</script>");
            }

            string phone = txtPhone.Text;
            string tongtien = lblTotal.Text;
            string ngayDatHang = DateTime.Now.ToShortDateString();
            string diaDiem = txtDeliveryAddress.Text;
            string tinhTrangDonHang = "Đang xử lý";

            SqlDataSource3.UpdateCommand = "update DonHang set SDT = @Phone, TongTien = @Total, " +
                "NgayDatHang = @OrderDate, DiaChi = @DeliveryAddress, TinhTrangDonHang = @Status where MaDonHang = '" + lblOrderID.Text + "'";
            
            SqlDataSource3.UpdateParameters.Add("Phone", phone);
            SqlDataSource3.UpdateParameters.Add("Total", tongtien);
            SqlDataSource3.UpdateParameters.Add("OrderDate", ngayDatHang);
            SqlDataSource3.UpdateParameters.Add("DeliveryAddress", diaDiem);
            SqlDataSource3.UpdateParameters.Add("Status", tinhTrangDonHang);

            int flag = SqlDataSource3.Update();
            

            SqlDataSource3.DeleteCommand = "delete from DonHang where TinhTrangDonHang is NULL";
            SqlDataSource3.Delete();

            updateProduct(dic);
            //Response.Redirect("Default.aspx");
        }

        protected void spinAmount_NumberChanged(object sender, EventArgs e)
        {

            ASPxSpinEdit spin = sender as ASPxSpinEdit;
            DataListItem selectedItem = (DataListItem)spin.NamingContainer;
            Label lblProductName = (Label)selectedItem.FindControl("lblProductName");
            string name = lblProductName.Text;
            

            if(dic.ContainsKey(name))
            {
                dic[name] = Convert.ToInt32(spin.Text);
            }

        }

        private string getIDByName(string name)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select MaHH from HangHoa where TenHH = N'" + name + "'";

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();

            string productID1 = "";
            while (reader.Read())
            {
                productID1 = Convert.ToString(reader.GetValue(0));
            }

            return productID1;
        }

        private int getPriceByName(string name)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select Gia from HangHoa where TenHH = N'" + name + "'";

            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();

            int price = 0;
            while (reader.Read())
            {
                price = Convert.ToInt32(reader.GetValue(0));
            }

            return price;
        }

        public string RandomString(int size)
        {
            const string src = "abcdefghijklmnopqrstuvwxyz0123456789";          
            var sb = new StringBuilder();
            Random RNG = new Random();
            for (var i = 0; i < size; i++)
            {
                var c = src[RNG.Next(0, src.Length)];
                sb.Append(c);
            }

            return sb.ToString();
        }

        public string RandomStringV2()
        {
            const string src = "abcdefghijklmnopqrstuvwxyz0123456789";
            var sb = new StringBuilder();
            Random RNG = new Random();
            for (var i = 0; i < 7; i++)
            {
                var c = src[RNG.Next(0, src.Length)];
                sb.Append(c);
            }

            return sb.ToString();
        }

        private void updateProduct(Dictionary<string, int> dic)
        {
            int extremeChar = 0;
            foreach(KeyValuePair<string, int> item in dic)
            {
                extremeChar++;
                string productID = getIDByName(item.Key);
                int amount = item.Value;
                int remainProduct = getRemainProductByID(productID);
                int newRemain = remainProduct - amount;
                int soldProduct = getSoldAmountByID(productID);
                int newSold = soldProduct + amount;

                string para = "SoLuong" + extremeChar;
                string para1 = "BanDuoc" + extremeChar;
                SqlDataSource1.UpdateCommand = "update HangHoa set SoLuongTonKho = @"+ para +" ," +
                    " SoLuongBan = @"+ para1 +" where MaHH = '" + productID + "'";
                SqlDataSource1.UpdateParameters.Add(para, newRemain + "");
                SqlDataSource1.UpdateParameters.Add(para1, newSold + "");
                int flag = SqlDataSource1.Update();
                if(flag > 0)
                {
                    //Response.Write("<script>alert('Update so luong ton kho, so luong ban thanh cong')</script>");
                } else
                {
                    //Response.Write("<script>alert('Update so luong ton kho, so luong ban that bai')</script>");
                }
            }
        }

        private int getRemainProductByID(string id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select SoLuongTonKho from HangHoa where MaHH ='" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int remain = 0;
            while(reader.Read())
            {
                remain = Convert.ToInt32(reader.GetValue(0));
            }
            return remain;
        }

        private int getSoldAmountByID(string id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select SoLuongBan from HangHoa where MaHH ='" + id + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            int sold = 0;
            while (reader.Read())
            {
                sold = Convert.ToInt32(reader.GetValue(0));
            }
            return sold;
        }
    }
}