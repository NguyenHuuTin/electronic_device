<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EmptyCartView.aspx.cs" Inherits="ECommerceV2.EmptyCartView" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="dx-justification">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/empty-cart.png" />
            </td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:Label style="margin-top: 30px" ID="Label2" runat="server" Text="Không có sản phẩm nào trong giỏ hàng, hãy quay về trang chủ để tiếp tục mua hàng bạn nhé" Height="20px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <dx:ASPxButton ID="btnBackToDefault" runat="server" Text="Quay về trang chủ" Theme="MaterialCompact" Width="200px" OnClick="btnBackToDefault_Click">
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
