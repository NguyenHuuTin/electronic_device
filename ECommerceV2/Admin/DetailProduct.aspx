<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DetailProduct.aspx.cs" Inherits="ECommerceV2.Admin.DetailProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        label{
            color:#005b9f;
        }
        .form-control{
            font-style:inherit; 
            font-family: Arial, Helvetica, sans-serif;
            font-weight: normal;
        }
    </style>
    <% if (Session["type"] == "DHTT")
        {
    %>
    <link rel="stylesheet" type="text/css" href="Style/StyleDHTT.css" />
    <%
    }
    else if (Session["type"] == "DHTM")
    {
    %>
    <link rel="stylesheet" type="text/css" href="Style/StyleDHTM.css" />
    <% 
    }
    else if (Session["type"] == "DT")
    {%>
    <link rel="stylesheet" type="text/css" href="Style/StyleDT.css" />
    <%}
    else if (Session["type"] == "LT")
    {%>
    <link rel="stylesheet" type="text/css" href="Style/StyleLaptop.css" />
    <%}
    else if (Session["type"] == "PC")
    {%>
    <link rel="stylesheet" type="text/css" href="Style/StylePC.css" />
    <%}
    else if (Session["type"] == "PK")
    {%>
    <link rel="stylesheet" type="text/css" href="Style/StyleAccessories.css" />
    <%}
    else if (Session["type"] == "TL")
    {%>
    <link rel="stylesheet" type="text/css" href="Style/StyleTablet.css" />
    <%} %>
    <!-- include summernote css/js -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
    <script type="text/javascript">
       
        $('#Detail').summernote();
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="animation" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
     <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Sản Phẩm Điện Tử</h1>
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
                            <h3 class="card-title">Thông Tin Chi Tiết</h3>
                        </div>
                        <div class="card-body">
                            <table style="width: 95%;margin-left:10px;">
                                <tr>
                                    <td style="width: 30%">
                                        <asp:Image runat="server" ID="imgDetailProduct" Width="100%"/>
                                    </td>
                                    <td style="width: 100%">
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="validation" ForeColor="Red" />
                                        <table  style="width: 100%">
                                            <tr>
                                                <td>
                                                    <label for="ur">Tên Sản Phẩm:</label>
                                                                 
                                                        <input runat="server" type="text" class="form-control" id="nameProduct" >
                                                </td>
                                                <td style="width:3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationName" SetFocusOnError="True" ControlToValidate="nameProduct" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="ur">Ngày Nhập Hàng:</label>
                                                    <input runat="server" type="text" class="form-control" id="dateImport" style="font-family: Arial, Helvetica, sans-serif; font-weight: normal; font-style: normal; text-transform: none; color: #000000"/>
                                                </td>
                                                <td style="width:3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationDate" SetFocusOnError="True" ControlToValidate="dateImport" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="ur">Giá:</label>
                                                    <input runat="server" type="text" class="form-control" id="PriceProduct">
                                                </td>
                                                <td style="width:3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationPrice" SetFocusOnError="True" ControlToValidate="PriceProduct" ErrorMessage="Thông tin bắt buộc" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="ur">Số Lượng Bán:</label>
                                                    <input runat="server" type="number" class="form-control" id="SellNumber">
                                                </td>
                                                <td style="width:3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationSellNum" SetFocusOnError="True" ControlToValidate="SellNumber" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="ur">Số Lượng Tồn Kho:</label>
                                                    <input runat="server" type="number" class="form-control" id="Inventorynumber">
                                                </td>
                                                <td style="width:3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationInventoryNum" SetFocusOnError="True" ControlToValidate="Inventorynumber" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="ur">Nhà Sản Xuất:</label>
                                                    <input runat="server" type="text" class="form-control" id="Producer">
                                                </td>
                                                <td style="width:3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="valdationProducer" SetFocusOnError="True" ControlToValidate="Producer" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <label for="ur">Hình Ảnh:</label>
                                                    <asp:TextBox runat="server" type="text" class="form-control" id="LinkImage"/>
                                                </td>
                                                <td style="width:3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationImage" SetFocusOnError="True" ControlToValidate="LinkImage" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                            </tr>

                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <label for="ur">Chi Tiết:</label>
                                        <textarea runat="server" id="Detail" style="width: 100%; height: 150px;"></textarea>
                                    </td>
                                    <td style="width:3px;">
                                                    <p></p>
                                                    <asp:RequiredFieldValidator runat="server" ID="validationDetail" SetFocusOnError="True" ControlToValidate="Detail" ForeColor="Red" Font-Size="30px">*</asp:RequiredFieldValidator></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td align="right">
                                        <asp:Button runat="server" ID="btnSaveChange" Text="Lưu thay đổi" CssClass="btn btn-outline-dark" OnClick="btnSaveChange_Click"/>
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
