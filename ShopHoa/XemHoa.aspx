<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="ShopHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="form-inline">
        chọn Loại hoa:<asp:DropDownList ID="ddloai" AutoPostBack="True" runat="server" CssClass="form-control" DataSourceID="dsLoai" 
            DataTextField="TenLoai" DataValueField="MaLoai" OnSelectedIndexChanged="ddloai_SelectedIndexChanged"></asp:DropDownList>
    </div>
    <div class="row">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="dsHoa">
            <ItemTemplate>
                <div class="col-md-3">
                    <a href="#">
                        <img src="Hinh_San_Pham/<%# Eval("Hinh")%>" style="width:100px" />
                    </a><br />
                    <%# Eval("TenHoa") %> <br />
                    Giá bán: <%#Eval("Gia") %> <br />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="dsLoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsHoa" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddloai" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
