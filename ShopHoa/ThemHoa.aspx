<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="ShopHoa.ThemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>Thêm Hoa mới</h2>
    <hr />
    <div class="row mt-3 mb-2">
        <div class="form-inline">
        danh Muc:<asp:DropDownList ID="ddloai" AutoPostBack="True" runat="server" CssClass="form-control" DataSourceID="dsLoai" 
            DataTextField="TenLoai" DataValueField="MaLoai" OnSelectedIndexChanged="ddloai_SelectedIndexChanged"></asp:DropDownList>
    </div>
    <div class="row mb-2">
        <div class="col-md-2"> Tên Hoa </div>
        <div class="col-md-10">
            <asp:TextBox ID="txtTenHoa" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
      <div class="row mb-2">
        <div class="col-md-2">Gia</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtgia" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-2">Ngày Cap nhat</div>
        <div class="col-md-10">
            <asp:TextBox ID="txtNgayCapNhat" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-2">Hinh</div>
        <div class="col-md-10">
          <asp:Image ID="FHinh" runat="server" />
        </div>
    </div>
   
     <div class="row mb-2">
        <div class="col-md-2"></div>
        <div class="col-md-10">
             <asp:Button ID="btThem" runat="server" Text="Them Moi" OnClick="btThem_Click" CssClass="btn btn-primary" />
             <asp:Label ID="lbThongBao" runat="server" Text="" ForeColor="#cc3300"></asp:Label>
        </div>
    </div>

</div>
   <asp:SqlDataSource ID="dsLoai" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
        SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
</asp:Content>
