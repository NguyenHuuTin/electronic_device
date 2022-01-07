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
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
            while(reader.Read())
            {
                id = reader.GetValue(0) + "";
            }

            return id;
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}