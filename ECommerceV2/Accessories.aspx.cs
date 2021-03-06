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
    public partial class Accessories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "select * from HangHoa where MaLoai = 'PK'";
        }

        protected void ASPxDataView1_PageIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            
        }

        protected void btnViewAccessories_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            DataListItem selectedItem = (DataListItem)btn.NamingContainer;

            Label lblTabletName = (Label)selectedItem.FindControl("lblAccessoriesName");
            string name = lblTabletName.Text.Trim();


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

            Session["ProductID"] = productID1;
            Response.Redirect("ProductDetails.aspx");
        }
    }
}