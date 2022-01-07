<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="NewOrder.aspx.cs" Inherits="ECommerceV2.Admin.NewOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" href="Style/StyleNewOrder.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="animation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
     <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Đơn Đặt Hàng Mới</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Danh sách đơn hàng</h3>
                        </div>
                        <div class="card-body">
                            <asp:GridView runat="server" ID="GridPhone" AutoGenerateColumns="False" DataKeyNames="MaDonHang" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover" OnSelectedIndexChanged="GridPhone_SelectedIndexChanged" OnRowCommand="GridPhone_RowCommand1">
                                <Columns>
                                    <asp:BoundField DataField="MaDonHang" HeaderText="Mã DH" ReadOnly="True" SortExpression="MaDonHang" />
                                    <asp:BoundField DataField="SDT" HeaderText="SDT" SortExpression="SDT" />
                                    <asp:BoundField DataField="TongTien" HeaderText="Tổng tiền" SortExpression="TongTien" />
                                    <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" SortExpression="DiaChi" />
                                    <asp:BoundField DataField="NgayDatHang" HeaderText="Ngày đặt hàng" SortExpression="NgayDatHang" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Chi tiết" CssClass="btn btn-outline-warning"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ControlStyle Font-Size="Small" />
                                    </asp:TemplateField>

                                    <asp:ButtonField ButtonType="Button" CommandName="Receive" Text="Duyệt">
                                    <ControlStyle CssClass="btn btn-outline-dark" Font-Size="Small" />
                                    </asp:ButtonField>

                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [DonHang] WHERE ([TinhTrangDonHang] = @TinhTrangDonHang)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Đang xử lý" Name="TinhTrangDonHang" Type="String" />
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
