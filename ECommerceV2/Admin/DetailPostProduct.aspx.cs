using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECommerceV2.Admin
{
    public partial class DetailPostProduct : System.Web.UI.Page
    {
        String MaBV = "";
        String StrConnect = System.Configuration.ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            MaBV = Session["MaBV"].ToString();
            if (MaBV != "null")
            {
                if (!IsPostBack)
                {
                    getData();
                }
            }
            else if (MaBV == "null")
            {
                btnSaveChange.Text = "Thêm mới";
                lbltitle.InnerText = "";
            }
        }
        public void getData()
        {
            MaBV = Session["MaBV"].ToString();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();
            try
            {
                String query = "select * from BaiViet where MaBV = '" + MaBV + "'";
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                String topic = dr["ChuDe"].ToString();
                String content = dr["NoiDung"].ToString();
                String linkIma = dr["HinhAnh"].ToString();
                TopicPost.Value = topic;
                ContentTopic.Value = content;
                LinkImage.Text = linkIma;
                imgDetailPost.ImageUrl = linkIma;
                conn.Close();
            }
            catch (Exception ex)
            {

            }
        }
        public String getNewID()
        {
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();
            String query = "select top 1 MaBV from BaiViet order by MaBV DESC";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rd = cmd.ExecuteReader();
            rd.Read();
            int tmp = Convert.ToInt32(rd["MaBV"].ToString()) + 1;
            String id = tmp.ToString();
            return id;
        }

        protected void btnSaveChange_Click(object sender, EventArgs e)
        {
            MaBV = Session["MaBV"].ToString();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();

            String topic = TopicPost.Value.ToString().Trim();
            String content = ContentTopic.Value.ToString().Trim();
            String linkIma = LinkImage.Text;
            String query = "";
            String id = getNewID();
            if (MaBV == "null")
            {
                query = "insert into BaiViet values('" + id + "',N'" + topic + "',N'" + content + "','" + linkIma + "')";
            }
            else
            {
                query = "update BaiViet set ChuDe = N'" + topic + "', NoiDung = N'" + content + "', HinhAnh = '" + linkIma + "' where MaBV = '" + MaBV + "'";
            }
            try
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Redirect("PostProduct.aspx");
            }

            catch (Exception ex)
            {
                Response.Write("<script>alert('Xảy ra lỗi trong quá trình lưu dữ liệu')</script>");
            }
        }

        protected void DeleteComment_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            String sdt = btn.CommandArgument.ToString();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();
            try
            {
                String sql = "delete from BinhLuan where SDT = '" + sdt + "'";
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