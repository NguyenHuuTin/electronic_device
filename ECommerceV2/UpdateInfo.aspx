<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateInfo.aspx.cs" Inherits="ECommerceV2.UpdateInfo" %>

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
            text-align: center;
        }
        .auto-style3 {
            width: 108px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl="~/Images/shoplogo.png" OnClick="ImageButton1_Click" Width="50px" />
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" Text="Update your account" Height="30px"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="dx-ac">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="#33CC33" Height="30px"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2" colspan="3">
                        <div style="border: 1px solid black; margin: 0 auto; border-radius: 20px; padding: 10px; width: 400px">
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Họ và tên" Height="25px"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label3" runat="server" Text="Số điện thoại" Height="25px"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label4" runat="server" Text="Email" Height="25px"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <dx:ASPxCheckBox ID="chkChangePassword" runat="server" Text="Thay đổi mật khẩu" Theme="Default" AutoPostBack="True" OnCheckedChanged="chkChangePassword_CheckedChanged">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text="Mật khẩu cũ" Height="25px"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtOldPassword" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label7" runat="server" Text="Mật khẩu mới" Height="25px"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPasswordAgain" ControlToValidate="txtNewPassword" ErrorMessage="Mật khẩu không khớp, vui lòng kiểm tra lại" ForeColor="#FF3300"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server" Text="Nhập lại mật khẩu mới" Height="25px"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNewPasswordAgain" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                            </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [TaiKhoan]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="dx-ac">
                        <dx:ASPxButton ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" Theme="MaterialCompact">
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
