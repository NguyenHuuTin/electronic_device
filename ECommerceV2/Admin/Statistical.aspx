<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Statistical.aspx.cs" Inherits="ECommerceV2.Admin.Statistical" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #itemTK {
            color: white;
            background-color: #007bff;
        }

        .card {
        }

        .imgCard {
            width: 100px;
            height: 100px;
        }

        .tablecarrd {
            width: fit-content;
            border-radius: .25rem;
        }

        .tag {
            width: fit-content;
        }

        .content {
            width: 150px;
            height: 120px;
        }

        .user {
            background-color: #f9a825;
            padding: 10px;
        }

        .order {
            background-color: #2e7d32;
            padding: 10px;
        }

        .dollar {
            background-color: #0277bd;
            padding: 10px;
        }

        .box {
            background-color: #6a1b9a;
            padding: 10px;
        }

        .numb {
            font-size: 30px;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="animation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-3">
                <div class="col-12">
                    <table style="width: 100%; margin-left: 10px;">
                        <tr>
                            <td align="center" class="col-3">
                                <div class="card tag">
                                    <table class="tablecarrd user">
                                        <tr>
                                            <td class="content">
                                                <h4 style="color: white;"><strong>Người dùng</strong></h4>
                                                <br />
                                                <asp:Label runat="server" ID="lbluser" CssClass="numb"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Image runat="server" ImageUrl="~/Images/users.png" CssClass="imgCard" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td align="center" class="col-3">
                                <div class="card tag">
                                    <table class="tablecarrd order">
                                        <tr>
                                            <td class="content">
                                                <h4 style="color: white;"><strong>Đơn hàng</strong></h4>
                                                <br />
                                                <asp:Label runat="server" ID="lblorrder" CssClass="numb">120</asp:Label>
                                            </td>
                                            <td>
                                                <asp:Image runat="server" ImageUrl="~/Images/order.png" CssClass="imgCard" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td align="center" class="col-3">
                                <div class="card tag">
                                    <table class="tablecarrd dollar">
                                        <tr>
                                            <td class="content">
                                                <h4 style="color: white;"><strong>Doanh thu</strong></h4>
                                                <br />
                                                <asp:Label runat="server" ID="lbldollar" CssClass="numb">120</asp:Label>
                                            </td>
                                            <td>
                                                <asp:Image runat="server" ImageUrl="~/Images/dollar.png" CssClass="imgCard" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                            <td align="center" class="col-3">
                                <div class="card tag">
                                    <table class="tablecarrd box">
                                        <tr>
                                            <td class="content">
                                                <h4 style="color: white;"><strong>Sản phẩm</strong></h4>
                                                <br />
                                                <asp:Label runat="server" ID="lblbox" CssClass="numb">120</asp:Label>
                                            </td>
                                            <td>
                                                <asp:Image runat="server" ImageUrl="~/Images/box.png" CssClass="imgCard" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </section>
    <section class="content-header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <table style="width: 100%; margin-left: 10px;">
                        <tr>
                            <td align="center" class="col-6">
                                <div class="card">
                                    <h3>Biểu đồ doanh thu</h3>
                                    <asp:Chart ID="pieChart" runat="server" Height="450px" Width="600px">
                                        <Series>
                                            <asp:Series Name="Series1" ChartType="Pie">

                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1" Area3DStyle-Enable3D="true">

                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </div>
                            </td>
                            <td style="vertical-align: top" class="col-6">
                                <div class="card">
                                    <asp:GridView runat="server" ID="gridRevenue" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" CssClass="col-12">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="MaDonHang" HeaderText="MaDH" SortExpression="MaDonHang" />
                                            <asp:BoundField DataField="MaHH" HeaderText="MaHH" SortExpression="MaHH" />
                                            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" SortExpression="SoLuong" />
                                            <asp:BoundField DataField="GiaTien" HeaderText="Giá tiền" SortExpression="GiaTien" />
                                        </Columns>
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />

                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT [MaDonHang], [MaHH], [SoLuong], [GiaTien] FROM [CTDonHang]"></asp:SqlDataSource>
                                </div>
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
