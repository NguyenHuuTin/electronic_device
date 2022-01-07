<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="ECommerceV2.ProductDetails" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 300px;
        }
        .auto-style2 {
            margin-left: 0px;
        }
        .auto-style3 {
            width: 214px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="dx-justification">
        <tr>
            <td>
                <dx:ASPxImage style="margin-top:20px; margin-bottom:20px" ID="imgProductDetails" runat="server" Height="333px" ImageUrl="~/hinhanh/c2.jpg" ShowLoadingImage="true" Width="400px">
                </dx:ASPxImage>
            </td>
            <td>
                  <div style="border: 1px solid black; padding: 10px; border-radius: 10px">
                <table class="auto-style1">
                    <tr>
                        <td>Tên sản phẩm</td>
                        <td>
                            <dx:ASPxLabel ID="lblProductNameDetails" runat="server" Text="ASPxLabel">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>Giá</td>
                        <td>
                            <dx:ASPxLabel ID="lblProductPriceDetails" runat="server" Text="ASPxLabel" Font-Bold="True" Font-Size="11pt" ForeColor="#FF3300">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>Còn lại</td>
                        <td>
                            <dx:ASPxLabel ID="lblProductAvailable" runat="server" Text="ASPxLabel">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>Nhà sản xuất</td>
                        <td>
                            <dx:ASPxLabel ID="lblProductProducerDetails" runat="server" Text="ASPxLabel">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>Đã bán&nbsp;</td>
                        <td>
                            <dx:ASPxLabel ID="lblSold" runat="server" Text="ASPxLabel">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxButton ID="btnAddToCard" runat="server" Text="Add to Cart" Theme="MaterialCompact" onClick="btnAddToCard_Click">
                            </dx:ASPxButton>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel style="margin-bottom:20px" ID="lblProductContent" runat="server" Font-Size="13pt" Text="Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, ">
                </dx:ASPxLabel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table style="margin-top:30px; margin-bottom:20px" class="dxeLyGroup_MaterialCompact">
                    <tr>
                        <td>
                            <dx:ASPxImage ID="ASPxImage3" runat="server" Height="20px" ImageUrl="~/Images/vote.png" ShowLoadingImage="true" Width="20px">
                            </dx:ASPxImage>
                        </td>
                        <td class="auto-style3">
                            <dx:ASPxTextBox style="margin-bottom: 10px" ID="txtComment" runat="server" Width="171px">
                            </dx:ASPxTextBox>
                        </td>
                        <td>
                            <dx:ASPxButton ID="btnSubmitComment" runat="server" Text="Submit" CssClass="auto-style2" OnClick="btnSubmitComment_Click">
                            </dx:ASPxButton>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td class="auto-style3">
                            <asp:Label  ID="lblMessage" runat="server"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaHH" DataSourceID="SqlDataSourceComment" Width="500px">
                    <ItemTemplate>
                        <div style="border: 1px solid black; border-radius: 15px; margin-bottom:20px; padding:20px">

                       
                        <table class="dxeLyGroup_MaterialCompact">
                            <tr>
                                <td>
                                    <dx:ASPxImage ID="ASPxImage2" runat="server" Height="20px" ImageUrl="~/Images/user.png" ShowLoadingImage="true" Width="20px">
                                    </dx:ASPxImage>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="lblPhoneComment" runat="server" Text='<%# Eval("SDT") %>'>
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <dx:ASPxLabel ID="lblContentComment" runat="server" Text='<%# Eval("NoiDung") %>'>
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>
                            </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSourceComment" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [DanhGia]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
