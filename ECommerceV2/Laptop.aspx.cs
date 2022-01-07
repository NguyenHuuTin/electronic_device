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
    public partial class Laptop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "select * from HangHoa where MaLoai = 'LT'";
        }

        protected void ASPxDataView1_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAddLaptop_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnAddLaptop_Click1(object sender, EventArgs e)
        {

        }

        protected void btnLaptopView_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            DataListItem selectedItem = (DataListItem)btn.NamingContainer;

            Label lblLaptopName = (Label)selectedItem.FindControl("lblLaptopName");
            string name = lblLaptopName.Text;

            string connectionString = ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string sql = "select MaHH from HangHoa where TenHH = '" + name + "'";
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataReader reader = cmd.ExecuteReader();
            string productID = "";

            while (reader.Read())
            {
                productID = reader.GetValue(0) + "";
            }


            Session["ProductID"] = productID;

            Response.Redirect("ProductDetails.aspx");
        }
    }
}