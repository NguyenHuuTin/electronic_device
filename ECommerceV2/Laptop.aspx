<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Laptop.aspx.cs" Inherits="ECommerceV2.Laptop" %>
<%@ Register assembly="DevExpress.Web.v21.1, Version=21.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" CellSpacing="20" DataKeyField="MaHH" DataSourceID="SqlDataSource1" RepeatColumns="3">
        <ItemTemplate>
            <div style="border: 1px solid black; margin: 20px; border-radius: 20px; padding: 10px">

            
            <table class="dx-justification">
                <tr>
                    <td class="dx-ac">
                        <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# Eval("Hinhanh") %>' Width="230px" />
                    </td>
                </tr>
                <tr>
                    <td class="dx-ac">
                        <asp:Label ID="lblLaptopName" runat="server" Text='<%# Eval("TenHH") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="dx-ac">
                        <asp:Label style="margin-top: 10px" ID="Label2" runat="server" Text='<%# Eval("Gia") %>' Font-Bold="True" Font-Size="11pt" ForeColor="#FF3300"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="dx-ac">
                        <asp:Button style="margin-top: 20px" ID="btnLaptopView" runat="server" OnClick="btnLaptopView_Click" Text="View" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
                </div>
        </ItemTemplate>
       
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" SelectCommand="SELECT * FROM [HangHoa]"></asp:SqlDataSource>
</asp:Content>
