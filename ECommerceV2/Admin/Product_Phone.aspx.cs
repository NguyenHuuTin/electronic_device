using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceV2.Admin
{
    public partial class Product_Phone : System.Web.UI.Page
    {
        String StrConnect = System.Configuration.ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GridPhone_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["type"] = "DT";
            Session["MaHH"] = GridPhone.SelectedRow.Cells[0].Text;
            Response.Redirect("DetailProduct.aspx");
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Session["type"] = "DT";
            Session["MaHH"] = "null";
            Response.Redirect("DetailProduct.aspx");
        }

        public DataTable getData()
        {
            DataTable tb = new DataTable();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();
            try
            {
                String query = "Select * from HangHoa where MaLoai = 'DT'";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter dp = new SqlDataAdapter(cmd);
                dp.Fill(tb);
            }
            catch (Exception)
            {

            }
            return tb;
        }

        protected void GridPhone_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                try
                {
                    int index = Convert.ToInt32(e.CommandArgument.ToString());
                    String id = getData().Rows[index].ItemArray[0].ToString();
                    SqlConnection conn = new SqlConnection(StrConnect);
                    conn.Open();
                    String query = "delete from HangHoa where MaHH = '" + id + "'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Xóa thành công')</script>");
                    GridPhone.DataBind();
                    conn.Close();
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('Không thể xóa sản phẩm này')</script>");
                }



            }
        }
    }
}