<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="ECommerceV2.News" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="dx-justification">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="20pt" Text="Tin công nghệ"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaBV" DataSourceID="SqlDataSourceNews" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                    <ItemTemplate>
                        <div style="border: 1px solid black; margin: 20px; border-radius: 20px; padding: 10px">
                        <table class="dx-justification">
                            <tr>
                                <td>
                                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("HinhAnh") %>' Width="200px" />
                                </td>
                                <td>
                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("ChuDe") %>' Width="500px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnView" runat="server" OnClick="btnView_Click" Text="View" Theme="Material">
                                    </dx:ASPxButton>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                        <br />
                            </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSourceNews" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [BaiViet]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
