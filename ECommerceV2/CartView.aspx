<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CartView.aspx.cs" Inherits="ECommerceV2.CartView" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-weight: bold;
            font-size: x-large;
            color: #FF0000;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            width: 276px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="dx-justification">
        <tr>
            <td colspan="2" class="dx-ar">
                <asp:Label style="margin-top: 10px; margin-right: 20px" ID="Label3" runat="server" Text="Giỏ hàng của bạn"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Mã đơn hàng:&nbsp;&nbsp;
                <asp:Label ID="lblOrderID" runat="server" Text="Label"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [DonHang]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaHH" DataSourceID="SqlDataSource1" Width="793px">
                    <ItemTemplate>
                        <div style="border: 1px solid black; margin: 20px; border-radius: 20px; padding: 10px">
                        <table class="dx-justification">
                            <tr>
                                <td rowspan="3">
                                    <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl='<%# Eval("Hinhanh") %>' Width="60px" />
                                </td>
                                <td class="auto-style3"><strong>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("TenHH") %>'></asp:Label>
                                    </strong></td>
                                <td><strong>
                                    <asp:Label ID="lblPrice" runat="server" ForeColor="#FF3300" Text='<%# Eval("Gia") %>'></asp:Label>
                                    </strong></td>
                            </tr>
                            <tr>
                                <td class="auto-style3">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style3">
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                                </td>
                                <td>
                                    <table class="auto-style2">
                                        <tr>
                                            <td>Số lượng</td>
                                            <td>
                                                <dx:ASPxSpinEdit ID="spinAmount" runat="server" Height="16px" Number="1" NumberType="Integer" OnNumberChanged="spinAmount_NumberChanged" Theme="DevEx" Width="57px" AutoPostBack="True" />
                                            </td>
                                        </tr>
                                    </table>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                            </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [HangHoa]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [CTDH]"></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [DonHang]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td><strong>THÔNG TIN KHÁCH HÀNG</strong></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Anh</asp:ListItem>
                    <asp:ListItem>Chị</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Họ và tên</td>
            <td>
                <asp:TextBox style="margin-bottom: 20px" ID="txtName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Số điện thoại</td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><strong>NHẬP ĐỊA CHỈ NHẬN HÀNG</strong></td>
            <td>
                <asp:TextBox ID="txtDeliveryAddress" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><strong>Tổng tiền</strong></td>
            <td>
                <asp:Label ID="lblTotal" runat="server" CssClass="auto-style1" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac" colspan="2">
                <asp:Button ID="btnOrder" runat="server" Text="Đặt hàng" Width="200px" OnClick="btnOrder_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
