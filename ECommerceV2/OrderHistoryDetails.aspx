<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderHistoryDetails.aspx.cs" Inherits="ECommerceV2.OrderHistoryDetails" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
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
                <asp:Label ID="Label2" runat="server" Text="Thông tin chi tiết đơn hàng   "></asp:Label>
&nbsp;&nbsp;
                <asp:Label ID="lblOrderID" runat="server" Text="OrderID"></asp:Label>
            </td>
            <td>Tình trạng:&nbsp;
                <asp:Label ID="lblStatus" runat="server" ForeColor="#33CC33" Text="Đang xử lý"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <div style="width: 600px auto">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaHH" DataSourceID="SqlDataSource1">
                    
                    <ItemTemplate>
                        <div style="border: 1px solid black; margin: 20px; border-radius: 20px; padding: 10px">
                        <table class="dx-justification">
                            <tr>
                                <td rowspan="3">
                                    <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl='<%# Eval("Hinhanh") %>' Width="55px" />
                                </td>
                                <td>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("TenHH") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="lblProductPrice" runat="server" Font-Bold="True" ForeColor="#FF3300" Text='<%# Eval("Gia") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="dx-ac">Số lượng:&nbsp;
                                    <asp:Label ID="lblProductAmount" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                    </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [HangHoa]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Thông tin thanh toán</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="dx-justification">
                    <tr>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text="Số điện thoại"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" AutoPostBack="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text="Ngày đặt hàng"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblOrderDate" runat="server" Text="OrderDate"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text="Địa chỉ nhận hàng"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtDeliveryAddress" runat="server" AutoPostBack="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Tổng tiền"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblTotal" runat="server" Font-Bold="True" ForeColor="#FF3300" Text="Total"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [DonHang]"></asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <dx:ASPxButton ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" Theme="MaterialCompact">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>
