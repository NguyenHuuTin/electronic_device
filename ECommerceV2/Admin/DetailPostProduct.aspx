<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DetailPostProduct.aspx.cs" Inherits="ECommerceV2.Admin.DetailPostProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        label {
            color: #005b9f;
        }

        .form-control {
            font-style: inherit;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            color: black;
        }

        .topic {
            font-weight: bold;
            color: black;
        }

        .add {
            position: absolute;
            right: 20px;
            bottom: 3px;
        }

        .comment {
            width: 100%;
        }
         #itemBV {
            color: white;
            background-color: #007bff;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="animation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
     <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Bài Viết Giới Thiệu</h1>
                </div>
            </div>
        </div>
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="card-title">Thông Tin Bài Viết</h3>
                            <asp:Button runat="server" ID="btnSaveChange" Text="Lưu thay đổi" CssClass="btn btn-outline-dark add" OnClick="btnSaveChange_Click" />
                        </div>
                        <div class="card-body">
                            <table style="width: 95%; margin-left: 10px;">
                                <tr>
                                    <td style="width: 40%;" align="top">
                                        <asp:Image runat="server" ID="imgDetailPost" Width="97%" CssClass="imgboder" />
                                    </td>
                                    <td style="width: 100%">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <label for="ur">Chủ đề</label>

                                                    <input runat="server" type="text" class="form-control topic" id="TopicPost">
                                                </td>
                                                <td style="width: 3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationTopic" SetFocusOnError="True" ControlToValidate="TopicPost" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <label for="ur">Nội dung:</label>
                                                    <textarea runat="server" id="ContentTopic" style="width: 100%; height: 500px;"></textarea>
                                                </td>
                                                <td style="width: 3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationDetail" SetFocusOnError="True" ControlToValidate="ContentTopic" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                            </tr>


                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label for="ur">Hình Ảnh:</label>
                                        <asp:TextBox runat="server" type="text" class="form-control" ID="LinkImage" />
                                    </td>
                                    <td style="width: 3px;">
                                        <p></p>
                                        <asp:RequiredFieldValidator runat="server" ID="validationImage" SetFocusOnError="True" ControlToValidate="LinkImage" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                </tr>

                            </table>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <label runat="server" id="lbltitle" class="card-title">Bình luận của người xem</label>
                        </div>
                        <div class="card-body">
                            <table style="width: 100%; margin-left: 10px;">
                            <tr>
                                <td>
                                    <asp:DataList runat="server" ID="listComment" DataKeyField="MaBV" DataSourceID="SqlDataSource1" CssClass="comment">
                                        <ItemTemplate>
                                            <table style="width: 95%; margin-left: 10px;">
                                                <tr>
                                                    <td class="card-header comment">
                                                        <i class="fas fa-user-tag"></i>
                                                        <asp:Label ID="HoTenLabel" runat="server" Text='<%# Eval("HoTen") %>' />
                                                        <br />
                                                        <br />
                                                        <asp:Label ID="BinhLuanLabel" runat="server" Text='<%# Eval("BinhLuan") %>' />
                                                        <br />
                                                        <br />
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="DeleteComment" runat="server" OnClick="DeleteComment_Click" Text="Xóa" CommandArgument='<%# Eval("SDT") %>'/>
                                                   </td>
                                                </tr>
                                               
                                            </table>
                                        </ItemTemplate>
                                    </asp:DataList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TIEULUANWEBConnectionString %>" DeleteCommand="DELETE FROM [BinhLuan] WHERE [MaBV] = @MaBV AND [SDT] = @SDT" InsertCommand="INSERT INTO [BinhLuan] ([MaBV], [SDT], [BinhLuan]) VALUES (@MaBV, @SDT, @BinhLuan)" SelectCommand="SELECT BinhLuan.MaBV, BinhLuan.SDT, TaiKhoan.HoTen, BinhLuan.BinhLuan FROM BinhLuan INNER JOIN TaiKhoan ON BinhLuan.SDT = TaiKhoan.SDT WHERE (BinhLuan.MaBV = @MaBV)" UpdateCommand="UPDATE [BinhLuan] SET [BinhLuan] = @BinhLuan WHERE [MaBV] = @MaBV AND [SDT] = @SDT">
                                        <DeleteParameters>
                                            <asp:Parameter Name="MaBV" Type="String" />
                                            <asp:Parameter Name="SDT" Type="String" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:Parameter Name="MaBV" Type="String" />
                                            <asp:Parameter Name="SDT" Type="String" />
                                            <asp:Parameter Name="BinhLuan" Type="String" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:SessionParameter Name="MaBV" SessionField="MaBV" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter Name="BinhLuan" Type="String" />
                                            <asp:Parameter Name="MaBV" Type="String" />
                                            <asp:Parameter Name="SDT" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="server">
</asp:Content>
