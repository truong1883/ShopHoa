<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="ShopHoa.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    
    <div class="form-inline mb-2">
        Giá Bán từ<asp:TextBox ID="txtGiaTu" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="rfvGiaTu" runat="server" ErrorMessage=" Chưa Nhâp Giá" ControlToValidate="txtGiaTu" ForeColor="#CC3300"></asp:RegularExpressionValidator>
        đến<asp:TextBox ID="txtGiaDen" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="rfvGiaDen" runat="server" ErrorMessage="Chưa Nhập giá" ForeColor="#CC3300" ControlToValidate="txtGiaDen"></asp:RegularExpressionValidator>
        <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Giá dên phải lớn hon giá từ" ControlToCompare="txtGiaTu" ControlToValidate="txtGiaDen"></asp:CompareValidator>
        <asp:Button ID="btnTraCuu" runat="server" Text="tìm Kiếm" CssClass="btn btn-secondary" />
    </div>
      <div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa">
            <ItemTemplate>
                <div class="col-md-3 text-center mb-2">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("Hinh")%>" style="width:100px" />
                    </a><br />
                    <%# Eval("TenHoa") %> <br />
                    Giá  bán: <%#Eval("Gia") %> <br />
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CssClass="btn btn-success"/>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="dsHoa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Hoa] WHERE ([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2)">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" Name="Gia" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtGiaDen" Name="Gia2" PropertyName="Text" Type="Double" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
