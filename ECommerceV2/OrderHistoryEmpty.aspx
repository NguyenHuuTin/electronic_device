﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderHistoryEmpty.aspx.cs" Inherits="ECommerceV2.OrderHistoryEmpty" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="dx-justification">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:Label ID="Label2" runat="server" Text="Bạn chưa đặt đơn hàng nào, hãy quay lại trang chủ để mua hàng bạn nhé"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <dx:ASPxButton style="margin-bottom:500px" ID="btnGoHome" runat="server" OnClick="btnGoHome_Click" Text="Quay về trang chủ" Theme="MaterialCompact">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
