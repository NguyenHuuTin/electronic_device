using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace ECommerceV2.Admin
{
    public partial class Statistical : System.Web.UI.Page
    {
        String StrConnect = System.Configuration.ConfigurationManager.ConnectionStrings["TIEULUANWEBConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            getDataCardUser();
            getDataCardOrder();
            getDataCardDollar();
            getDataCardBox();
            if (!IsPostBack)
            {
                createChart();
            }
        }
        public void getDataCardUser()
        {
            DataTable tb = new DataTable();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();

            String queryuser = "Select count(SDT) from TaiKhoan where MaQuyen = 1";
            SqlCommand cmd = new SqlCommand(queryuser, conn);
            SqlDataAdapter dp = new SqlDataAdapter(cmd);
            dp.Fill(tb);
            lbluser.Text = tb.Rows[0].ItemArray[0].ToString();
            conn.Close();
        }
        public void getDataCardOrder()
        {
            DataTable tb = new DataTable();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();

            String queryuser = "Select count(*) from DonHang";
            SqlCommand cmd = new SqlCommand(queryuser, conn);
            SqlDataAdapter dp = new SqlDataAdapter(cmd);
            dp.Fill(tb);
            lblorrder.Text = tb.Rows[0].ItemArray[0].ToString();
            conn.Close();
        }
        public void getDataCardDollar()
        {
            DataTable tb = new DataTable();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();

            String queryuser = "select SUM(TongTien) from [DonHang]";
            SqlCommand cmd = new SqlCommand(queryuser, conn);
            SqlDataAdapter dp = new SqlDataAdapter(cmd);
            dp.Fill(tb);
            String money = tb.Rows[0].ItemArray[0].ToString();
            String numdollar = money.Substring(0, money.Length - 3);
            lbldollar.Text = numdollar + " K";
            conn.Close();
        }
        public void getDataCardBox()
        {
            DataTable tb = new DataTable();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();

            String queryuser = "select SUM(CAST(SoLuong AS int)) from [CTDonHang]";
            SqlCommand cmd = new SqlCommand(queryuser, conn);
            SqlDataAdapter dp = new SqlDataAdapter(cmd);
            dp.Fill(tb);
            lblbox.Text = tb.Rows[0].ItemArray[0].ToString();
            conn.Close();
        }
        public DataTable getDataPieChart()
        {
            DataTable tb = new DataTable();
            SqlConnection conn = new SqlConnection(StrConnect);
            conn.Open();

            String queryuser = "select HangHoa.MaLoai, LoaiMatHang.TenLoai, SUM(CAST(SoLuong AS int)) AS 'SL'" +
                " from HangHoa, CTDonHang, LoaiMatHang where HangHoa.MaHH = CTDonHang.MaHH AND HangHoa.MaLoai = LoaiMatHang.MaLoai" +
                " group by HangHoa.MaLoai, LoaiMatHang.TenLoai";
            SqlCommand cmd = new SqlCommand(queryuser, conn);
            SqlDataAdapter dp = new SqlDataAdapter(cmd);
            dp.Fill(tb);
            return tb;
        }
        public void createChart()
        {
            DataTable objBind = new DataTable();
            objBind = getDataPieChart();
            if (objBind != null)
            {
                if (objBind.Rows.Count > 0)
                {
                    string[] x = new string[objBind.Rows.Count];
                    int[] y = new int[objBind.Rows.Count];
                    for (int i = 0; i <= objBind.Rows.Count - 1; i++)
                    {
                        x[i] = objBind.Rows[i][1].ToString();
                        y[i] = Convert.ToInt32(objBind.Rows[i][2]);
                    }

                    pieChart.Series[0].Points.DataBindXY(x, y);
                    pieChart.Series[0].BorderWidth = 1;
                    pieChart.Series[0].BorderColor = System.Drawing.Color.FromArgb(26, 59, 105);
                    pieChart.Series[0]["PieLabelStyle"] = "Outside";

                    // Add a legend to the chart and dock it to the bottom-center
                    pieChart.Legends.Add("Legend1");
                    pieChart.Legends[0].Enabled = true;
                    pieChart.Legends[0].Docking = Docking.Bottom;
                    pieChart.Legends[0].Alignment = System.Drawing.StringAlignment.Center;

                    // Set the legend to display pie chart values as percentages
                    pieChart.Series[0].LegendText = "#PERCENT{P2}";
                }
            }
        }
    }
}