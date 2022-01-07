<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DetailOrder.aspx.cs" Inherits="ECommerceV2.Admin.DetailOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <%if (Session["TypeOrder"].ToString() == "all")
        { %>
    <link rel="stylesheet" type="text/css" href="Style/StyleAllOrder.css" />
    <%}
        else if (Session["TypeOrder"].ToString() == "new")
        { %>
    <link rel="stylesheet" type="text/css" href="Style/StyleNewOrder.css" />
    <%}
        else if (Session["TypeOrder"].ToString() == "delivery")
        { %>
    <link rel="stylesheet" type="text/css" href="Style/StyleDeliveryOrder.css" />
    <%} %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="animation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <asp:Label class="card-title" runat="server" ID="title">Danh sách đơn hàng</asp:Label>
                        </div>
                        <div class="card-body">
                            <asp:GridView runat="server" ID="GridDetailOrder" CssClass="table table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="MaDonHang" HeaderText="Mã DH" SortExpression="MaDonHang" />
                                    <asp:BoundField DataField="MaHH" HeaderText="Mã SP" SortExpression="MaHH" />
                                    <asp:BoundField DataField="TenHH" HeaderText="Tên sản phẩm" SortExpression="TenHH" />
                                    <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" SortExpression="SoLuong" />
                                    <asp:BoundField DataField="GiaTien" HeaderText="Giá tiền" SortExpression="GiaTien" />
                                </Columns>

                            </asp:GridView>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT CTDonHang.MaDonHang, CTDonHang.MaHH, HangHoa.TenHH, CTDonHang.SoLuong, CTDonHang.GiaTien FROM CTDonHang INNER JOIN HangHoa ON CTDonHang.MaHH = HangHoa.MaHH WHERE (CTDonHang.MaDonHang = @MaDonHang)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="MaDonHang" SessionField="IDDH" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
