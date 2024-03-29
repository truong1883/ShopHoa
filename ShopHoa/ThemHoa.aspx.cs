using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace ShopHoa
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString;

            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();

            string sql = "insert into hoa(tenhoa,gia,hinh,maloai,ngaydang,soluotxem)"+ " values (@tenhoa,@gia,@hinh,@maloai,@ngaydang,@soluotxem)";
            SqlCommand cmd = new SqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@teenhoa", txtTenHoa.Text);
            cmd.Parameters.AddWithValue("@tennv", txtgia.Text);
            if (FHinh.HasFile)
            {
                string duong_dan = Server.MapPath("~/Hinh_San_Pham") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@ngaydang", txtNgayCapNhat.Text);
            cmd.Parameters.AddWithValue("@soluotxem", 0);


            if (cmd.ExecuteNonQuery() > 0)
            {
                Response.Redirect("XemHoa.aspx");
            }
            else
            {
                lbThongBao.Text = "Thao tac them nhan vien fail";
            }
        }
    }
    }
