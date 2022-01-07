<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="ECommerceV2.SearchResult" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="dx-justification">
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="15pt" Text="Kết quả tìm kiếm"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaHH" DataSourceID="SqlDataSource1" RepeatColumns="3">
                    <ItemTemplate>
                        <div style="border: 1px solid black; margin: 20px; border-radius: 20px; padding: 10px; ">
                        <table class="dx-justification">
                            <tr>
                                <td>
                                    <asp:Image ID="Image2" runat="server" Height="200px" ImageUrl='<%# Eval("Hinhanh") %>' Width="230px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("TenHH") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="#FF3300" Text='<%# Eval("Gia") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button style="margin-top: 20px"  ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                                </td>
                            </tr>
                        </table>
                            </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [HangHoa]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
