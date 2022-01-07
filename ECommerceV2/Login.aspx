<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECommerceV2.Login" %>

<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 1000px; margin: 0 auto;">
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl="~/Images/shoplogo.png" OnClick="ImageButton1_Click" Width="50px" />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" Text="Login"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div style="border: 1px solid black; margin: 0 auto; border-radius: 20px; padding: 10px; width: 500px">
                        <table class="auto-style1">
                            <tr>
                                <td>Số điện thoại</td>
                                <td>
                                    <asp:TextBox style="margin-bottom: 20px; margin-top: 20px" ID="txtPhone" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>Mật khẩu</td>
                                <td>
                                    <asp:TextBox style="margin-bottom: 20px; margin-top: 20px" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Label ID="lblErrorMessage" runat="server" ForeColor="#FF3300"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <dx:ASPxButton ID="btnLogin" runat="server" Text="Login" Theme="MaterialCompact" OnClick="btnLogin_Click">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                            </div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
