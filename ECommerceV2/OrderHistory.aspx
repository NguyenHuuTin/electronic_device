<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="ECommerceV2.OrderHistory" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 95px;
        }
        .auto-style2 {
            text-align: left;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="dx-justification">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Lịch sử đặt hàng"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <div style="width: 600px; margin: 0 auto">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaDonHang" DataSourceID="SqlDataSourceOrder" Width="700px">
                    <ItemTemplate>
                        <div style="border: 1px solid black; margin: 20px; border-radius: 20px; padding: 10px">
                        <table class="dx-justification">
                            <tr>
                                <td class="auto-style1" rowspan="3">
                                    <asp:Image ID="imgOrder" runat="server" Height="60px" Width="65px" />
                                </td>
                                <td class="dx-al">Mã đơn hàng&nbsp;&nbsp;
                                    <asp:Label ID="lblOrderID" runat="server" Text='<%# Eval("MaDonHang") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" ForeColor="#FF3300" Text='<%# Eval("TongTien") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="dx-al">
                                    <asp:Label ID="lblStatus" runat="server" ForeColor="#33CC33" Text='<%# Eval("TinhTrangDonHang") %>'></asp:Label>
                                </td>
                                <td>
                                    <dx:ASPxButton ID="btnView" runat="server" Text="View" Theme="Material" OnClick="btnView_Click">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                            </div>
                    </ItemTemplate>
                </asp:DataList>
                    </div>
                <asp:SqlDataSource ID="SqlDataSourceOrder" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [DonHang]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
