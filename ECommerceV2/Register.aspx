<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ECommerceV2.Register" %>

<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 199px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div  style="width: 1000px; margin: 0 auto;">
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl="~/Images/shoplogo.png" OnClick="ImageButton1_Click" Width="50px" />
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" Text="Register"></asp:Label>
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
                        <div  style="border: 1px solid black; margin: 0 auto; border-radius: 20px; padding: 10px; width: 500px">
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style2"> Họ và tên</td>
                                <td>
                                    <asp:TextBox style="margin-bottom: 20px; margin-top: 20px" ID="txtName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Email</td>
                                <td>
                                    <asp:TextBox style="margin-bottom: 20px;  margin-top: 20px" ID="txtEmail" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Số điện thoại</td>
                                <td>
                                    <asp:TextBox style="margin-bottom: 20px;  margin-top: 20px" ID="txtPhone" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Mật khẩu</td>
                                <td>
                                    <asp:TextBox style="margin-bottom: 20px;  margin-top: 20px" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Nhập lại mật khẩu</td>
                                <td>
                                    <asp:TextBox style="margin-bottom: 20px;  margin-top: 20px" ID="txtPasswordAgain" runat="server" TextMode="Password"></asp:TextBox>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtPasswordAgain" ErrorMessage="Mật khẩu bạn nhập không khớp, vui lòng nhập lại" ForeColor="#FF3300"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [TaiKhoan]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">&nbsp;</td>
                                <td>
                                    <dx:ASPxButton ID="btnRegister" runat="server" Text="Đăng Ký" Theme="MaterialCompact" OnClick="btnRegister_Click">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                            </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
