using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceV2.Admin
{
    public partial class DetailProduct : System.Web.UI.Page
    {
        String MaHH = "";
        String StrConnect = System.Configuration.ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            MaHH = Session["MaHH"].ToString();
            if (MaHH != "null")
            {
                if (!IsPostBack)
                {
                    getData();
                }
            }
            else if (MaHH == "null")
            {
                btnSaveChange.Text = "Thêm mới";
            }
        }
        public void getData()
        {
            MaHH = Session["MaHH"].ToString();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();
            try
            {
                String query = "select * from HangHoa where MaHH = '" + MaHH + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                String name = dr["TenHH"].ToString();
                String date = dr["NgayNhapHang"].ToString();
                int price = Convert.ToInt32(dr["Gia"].ToString());
                int inventoryNum = Convert.ToInt32(dr["SoLuongTonKho"].ToString());
                int sellNum = Convert.ToInt32(dr["SoLuongBan"].ToString());
                String pro = dr["NhaSanXuat"].ToString();
                String linkIma = dr["HinhAnh"].ToString();
                String details = dr["ChiTiet"].ToString();
                nameProduct.Value = name;
                dateImport.Value = date.ToString();
                PriceProduct.Value = price.ToString();
                SellNumber.Value = sellNum.ToString();
                Inventorynumber.Value = inventoryNum.ToString();
                Producer.Value = pro;
                LinkImage.Text = linkIma;
                Detail.Value = details;
                imgDetailProduct.ImageUrl = linkIma;
                conn.Close();
            }
            catch (Exception ex)
            {

            }
        }
        protected void BootstrapGridView1_SelectionChanged(object sender, EventArgs e)
        {

        }

        protected void LinkImage_TextChanged(object sender, EventArgs e)
        {
            imgDetailProduct.ImageUrl = LinkImage.Text.ToString().Trim();
        }
        public void toBack()
        {
            String Type = Session["type"].ToString();
            if (Type == "DHTM")
            {
                Response.Redirect("Product_SmartWatch.aspx");
            }
            else if (Type == "DHTT")
            {
                Response.Redirect("Product_FashionWatch.aspx");
            }
            else if (Type == "DT")
            {
                Response.Redirect("Product_Phone.aspx");
            }
            else if (Type == "PC")
            {
                Response.Redirect("Product_PC.aspx");
            }
            else if (Type == "LT")
            {
                Response.Redirect("Product_Laptop.aspx");
            }
            else if (Type == "PK")
            {
                Response.Redirect("Product_Accessories.aspx");
            }
            else if (Type == "TL")
            {
                Response.Redirect("Product_Tablet.aspx");
            }
        }
        public String getNewID()
        {
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();
            String query = "select top 1 MaHH from HangHoa order by MaHH DESC";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            String IDHH = rd["MaHH"].ToString();
            int numId = Convert.ToInt32(IDHH.Substring(2, IDHH.Length - 2)) + 1;
            String id = "HH" + numId;
            return id;
        }

        protected void btnSaveChange_Click(object sender, EventArgs e)
        {
            MaHH = Session["MaHH"].ToString();
            string MaLoai = Session["type"].ToString();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();

            String name = nameProduct.Value.ToString().Trim();
            String date = dateImport.Value.ToString().Trim();
            int price = Convert.ToInt32(PriceProduct.Value.ToString().Trim());
            int inventoryNum = Convert.ToInt32(Inventorynumber.Value.ToString().Trim());
            int sellNum = Convert.ToInt32(SellNumber.Value.ToString().Trim());
            String pro = Producer.Value.ToString().Trim();
            String linkIma = LinkImage.Text;
            String details = Detail.Value.ToString().Trim();
            String query = "";
            String id = getNewID();

            if (MaHH == "null")
            {
                query = "insert into HangHoa values('" + id + "','" + MaLoai + "',N'" + name + "','" + date + "','" + price + "'," +
                    "'" + linkIma + "',N'" + details + "'," + sellNum + "," + inventoryNum + ",N'" + pro + "')";
            }
            else
            {
                query = "update HangHoa set TenHH = N'" + name + "', NgayNhapHang = '" + date + "', " +
                    "Gia = " + price + ", HinhAnh = '" + linkIma + "', ChiTiet = N'" + details + "', " +
                    "SoLuongBan = " + sellNum + ", SoLuongTonKho = " + inventoryNum + ",NhaSanXuat = N'" + pro + "'" +
                    " where MaHH = '" + MaHH + "'";
            }
            try
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                toBack();
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('Xảy ra lỗi trong quá trình lưu dữ liệu')</script>");
            }


        }
    }
}