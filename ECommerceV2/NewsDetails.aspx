<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="NewsDetails.aspx.cs" Inherits="ECommerceV2.NewsDetails" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 471px;
            text-align: right;
        }
        .auto-style2 {
            margin-left: 45px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            text-align: left;
        }
        .auto-style5 {
            margin-left: 56px;
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
                <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Font-Size="15pt" Text="Title"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:Image ID="imgNews" runat="server" Height="200px" Width="400px" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:Label ID="lblContent" runat="server" Text="Content" Width="700px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <div style="width: 400px; margin: 0 auto">
                <table class="dx-justification">
                    <tr>
                        <td>
                            <asp:Image ID="Image3" runat="server" Height="20px" ImageUrl="~/Images/vote.png" Width="20px" />
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="txtComment" runat="server" CssClass="auto-style2" Width="170px">
                            </dx:ASPxTextBox>
                        </td>
                        <td class="auto-style1">
                            <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" CssClass="auto-style5" OnClick="btnSubmit_Click">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
                    </div>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label style="padding-top: 10px" ID="lblMessage" runat="server" Height="30px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <div style="margin: 0 auto; width: 400px">
                <asp:DataList ID="DataList2" runat="server" DataKeyField="MaBV" DataSourceID="SqlDataSource1" Width="400px">
                    <ItemTemplate>
                        <div style="border: 1px solid black; border-radius: 15px; margin-bottom:20px; padding:20px">
                        <table class="dxeLyGroup_MaterialCompact">
                            <tr>
                                <td class="auto-style4">
                                    <asp:Image ID="Image4" runat="server" Height="20px" ImageUrl="~/Images/user.png" Width="20px" />
                                </td>
                                <td>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("SDT") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("BinhLuan") %>'></asp:Label>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                            </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [BinhLuan]"></asp:SqlDataSource>
            </div>
                    </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="12pt" Text="Các bài viết khác"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="dx-ac">
                <asp:DataList ID="DataList1" runat="server" DataKeyField="MaBV" DataSourceID="SqlDataSourceNews">
                    <ItemTemplate>
                        <div style="border: 1px solid black; margin: 20px; border-radius: 20px; padding: 10px">
                        <table class="dx-justification">
                            <tr>
                                <td>
                                    <asp:Image ID="Image2" runat="server" Height="100px" ImageUrl='<%# Eval("HinhAnh") %>' Width="200px" />
                                </td>
                                <td>
                                    <asp:Label ID="lblTitle" runat="server" Font-Bold="True" Text='<%# Eval("ChuDe") %>'></asp:Label>
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
