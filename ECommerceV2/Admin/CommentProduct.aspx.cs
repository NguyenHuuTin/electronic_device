using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceV2.Admin
{
    public partial class CommentProduct : System.Web.UI.Page
    {
        String StrConnect = System.Configuration.ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DeleteComment_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            String[] arrayitem = btn.CommandArgument.ToString().Split(';');
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();
            try
            {
                String sql = "delete from DanhGia where SDT = '" + arrayitem[0] + "' and MaHH = '" + arrayitem[1] + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                listComment.DataBind();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Xảy ra lỗi')</script>");
            }
        }
    }
}