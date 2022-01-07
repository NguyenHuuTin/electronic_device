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
    public partial class AllOrder : System.Web.UI.Page
    {
        String StrConnect = System.Configuration.ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public DataTable getData()
        {
            DataTable tb = new DataTable();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();
            try
            {
                String query = "Select * from DonHang";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataAdapter dp = new SqlDataAdapter(cmd);
                dp.Fill(tb);
            }
            catch (Exception)
            {

            }
            return tb;
        }
        protected void GridPhone_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["TypeOrder"] = "all";
            Session["IDDH"] = GridPhone.SelectedRow.Cells[0].Text;
            Response.Redirect("DetailOrder.aspx");
        }

        protected void GridPhone_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Receive")
            {
                try
                {
                    DataTable tb = getData();
                    int index = Convert.ToInt32(e.CommandArgument.ToString());
                    String id = tb.Rows[index].ItemArray[0].ToString();
                    SqlConnection conn = new SqlConnection(StrConnect);
                    conn.Open();
                    String query = "delete from CTDonHang where MaDonHang = '" + id + "'";
                    SqlCommand cmd = new SqlCommand(query, conn);
                    int result = cmd.ExecuteNonQuery();
                    if (result != 0)
                    {
                        String sql = "delete from DonHang where MaDonHang = '" + id + "'";
                        SqlCommand command = new SqlCommand(sql, conn);
                        command.ExecuteNonQuery();
                        conn.Close();
                        GridPhone.DataBind();
                    }
                    conn.Close();

                }
                catch (Exception)
                {

                }
            }
        }
    }
}