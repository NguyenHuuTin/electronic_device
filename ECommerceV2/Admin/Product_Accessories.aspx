<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product_Accessories.aspx.cs" Inherits="ECommerceV2.Admin.Product_Accessories" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        #itemHH {
            color: white;
            background-color: #007bff;
        }

        #itemAccessories {
            background-color: rgba(255,255,255,.9);
            color: #343a40;
        }
       .add{
            position:absolute;
            right:20px;
            bottom:3px;
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
                    <h1>Đồ Phụ Kiện<h1>
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
                            <h3 class="card-title">Danh sách sản phẩm</h3>
                            <asp:Button runat="server" ID="btnAddProduct" Text ="Thêm sản phẩm" CssClass="btn btn-outline-dark add" OnClick="btnAddProduct_Click" />
                        </div>
                        <div class="card-body">
                            <asp:GridView runat="server" ID="GridPhone" AutoGenerateColumns="False" DataKeyNames="MaHH" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover" OnSelectedIndexChanged="GridPhone_SelectedIndexChanged" OnRowCommand="GridPhone_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="MaHH" HeaderText="MaHH" ReadOnly="True" SortExpression="MaHH" />
                                    <asp:BoundField DataField="TenHH" HeaderText="TenHH" SortExpression="TenHH" />
                                    <asp:BoundField DataField="Gia" HeaderText="Gia" SortExpression="Gia" />
                                    <asp:BoundField DataField="SoLuongBan" HeaderText="SoLuongBan" SortExpression="SoLuongBan" />
                                    <asp:ImageField DataImageUrlField="Hinhanh" HeaderText="Hình ẢNh">
                                        <ControlStyle Height="100px" Width="100px" />
                                    </asp:ImageField>
                                    <asp:CommandField SelectText="Chi tiết" ShowSelectButton="True" ButtonType="Button">
                                    <ControlStyle CssClass="btn btn-outline-warning" Font-Size="Small" />
                                    </asp:CommandField>
                                    <asp:ButtonField ButtonType="Button" CommandName="DeleteProduct" Text="Xóa">
                                    <ControlStyle CssClass="btn btn-outline-dark" Font-Size="Small" />
                                    </asp:ButtonField>
                                </Columns>

                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT [MaHH], [TenHH], [Gia], [SoLuongBan], [NhaSanXuat], [Hinhanh] FROM [HangHoa] WHERE ([MaLoai] = @MaLoai)" DeleteCommand="DELETE FROM [HangHoa] WHERE [MaHH] = @MaHH" InsertCommand="INSERT INTO [HangHoa] ([MaHH], [TenHH], [Gia], [SoLuongBan], [NhaSanXuat], [Hinhanh]) VALUES (@MaHH, @TenHH, @Gia, @SoLuongBan, @NhaSanXuat, @Hinhanh)" UpdateCommand="UPDATE [HangHoa] SET [TenHH] = @TenHH, [Gia] = @Gia, [SoLuongBan] = @SoLuongBan, [NhaSanXuat] = @NhaSanXuat, [Hinhanh] = @Hinhanh WHERE [MaHH] = @MaHH">
                                <DeleteParameters>
                                    <asp:Parameter Name="MaHH" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="MaHH" Type="String" />
                                    <asp:Parameter Name="TenHH" Type="String" />
                                    <asp:Parameter Name="Gia" Type="Int32" />
                                    <asp:Parameter Name="SoLuongBan" Type="Int32" />
                                    <asp:Parameter Name="NhaSanXuat" Type="String" />
                                    <asp:Parameter Name="Hinhanh" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="PK" Name="MaLoai" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="TenHH" Type="String" />
                                    <asp:Parameter Name="Gia" Type="Int32" />
                                    <asp:Parameter Name="SoLuongBan" Type="Int32" />
                                    <asp:Parameter Name="NhaSanXuat" Type="String" />
                                    <asp:Parameter Name="Hinhanh" Type="String" />
                                    <asp:Parameter Name="MaHH" Type="String" />
                                </UpdateParameters>
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
