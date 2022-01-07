<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="PostProduct.aspx.cs" Inherits="ECommerceV2.Admin.PostProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        #itemBV {
            color: white;
            background-color: #007bff;
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
                    <h1>Bài Viết Giới Thiệu</h1>
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
                            <h3 class="card-title">Danh sách bài viết</h3>
                            <asp:Button runat="server" ID="btnAddProduct" Text ="Thêm bài viết" CssClass="btn btn-outline-dark add" OnClick="btnAddProduct_Click" />
                        </div>
                        <div class="card-body">
                            <asp:GridView runat="server" ID="GridPhone" AutoGenerateColumns="False" DataKeyNames="MaBV" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-hover" OnSelectedIndexChanged="GridPhone_SelectedIndexChanged" OnRowCommand="GridPhone_RowCommand">
                                <Columns>
                                    <asp:BoundField DataField="MaBV" HeaderText="MaBV" ReadOnly="True" SortExpression="MaBV" />
                                    <asp:BoundField DataField="ChuDe" HeaderText="ChuDe" SortExpression="ChuDe" />
                                    <asp:BoundField DataField="NoiDung" HeaderText="NoiDung" SortExpression="NoiDung" />
                                    <asp:CommandField SelectText="Xem" ShowSelectButton="True">
                                    <ControlStyle CssClass="btn btn-outline-warning" Font-Size="Small" />
                                    </asp:CommandField>
                                    <asp:ButtonField ButtonType="Button" CommandName="DeleteBV" Text="Xóa">
                                    <ControlStyle CssClass="btn btn-outline-dark" Font-Size="Small" />
                                    </asp:ButtonField>
                                </Columns>

                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [BaiViet]">
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
