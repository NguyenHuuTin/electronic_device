<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CommentProduct.aspx.cs" Inherits="ECommerceV2.Admin.CommentProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-control {
            font-style: inherit;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            color: black;
        }

        .comment {
            width: 100%;
        }

        #itemComment {
            color: white;
            background-color: #007bff;
        }

        .product {
            color: #005b9f;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="animation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Đánh Giá Sản Phẩm Từ Khách Hàng</h1>
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
                            <h3 class="card-title">Thông Tin Bài Viết</h3>
                        </div>
                        <div class="card-body">
                            <table style="width: 100%; margin-left: 10px;">
                                <tr>
                                    <td>
                                        <asp:DataList runat="server" ID="listComment" DataKeyField="MaHH" DataSourceID="SqlDataSource1" CssClass="comment">
                                            <ItemTemplate>
                                                <table style="width: 95%; margin-left: 10px;">
                                                    <tr>
                                                        <td class="card-header comment">
                                                            <asp:Label ID="MaHHLabel" runat="server" Text='<%# Eval("MaHH") %>' CssClass="product" />
                                                            _
                                                            <asp:Label ID="TenHHLabel" runat="server" Text='<%# Eval("TenHH") %>' CssClass="product" />
                                                            <br />
                                                            <i class="fas fa-user-tag"></i>
                                                            <asp:Label ID="HoTenLabel" runat="server" Text='<%# Eval("HoTen") %>' />
                                                            <br />
                                                            <br />
                                                            <asp:Label ID="NoiDungLabel" runat="server" Text='<%# Eval("NoiDung") %>' />
                                                            <br />
                                                            <br />
                                                        </td>
                                                        <td>
                                                            <asp:LinkButton ID="DeleteComment" runat="server" OnClick="DeleteComment_Click" Text="Xóa" CommandArgument='<%#Eval("SDT") +";" + Eval("MaHH") %>' />
                                                        </td>
                                                    </tr>
                                                </table>

                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" DeleteCommand="DELETE FROM [BinhLuan] WHERE [MaBV] = @MaBV AND [SDT] = @SDT" InsertCommand="INSERT INTO [BinhLuan] ([MaBV], [SDT], [BinhLuan]) VALUES (@MaBV, @SDT, @BinhLuan)" SelectCommand="SELECT DanhGia.MaHH, HangHoa.TenHH, DanhGia.SDT, TaiKhoan.HoTen, DanhGia.NoiDung FROM DanhGia INNER JOIN HangHoa ON DanhGia.MaHH = HangHoa.MaHH INNER JOIN TaiKhoan ON DanhGia.SDT = TaiKhoan.SDT" UpdateCommand="UPDATE [BinhLuan] SET [BinhLuan] = @BinhLuan WHERE [MaBV] = @MaBV AND [SDT] = @SDT">
                                            <DeleteParameters>
                                                <asp:Parameter Name="MaBV" Type="String" />
                                                <asp:Parameter Name="SDT" Type="String" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="MaBV" Type="String" />
                                                <asp:Parameter Name="SDT" Type="String" />
                                                <asp:Parameter Name="BinhLuan" Type="String" />
                                            </InsertParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="BinhLuan" Type="String" />
                                                <asp:Parameter Name="MaBV" Type="String" />
                                                <asp:Parameter Name="SDT" Type="String" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
