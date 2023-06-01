<%@LANGUAGE="VBSCRIPT" CODEPAGE = "65001"%>

<!-- #include file="connect.asp" -->
<%
    
    page = Request.QueryString("page")
    Dim TenTruyen, SoChuong, NamXuatBan, AnhTruyen, TinhTrang, MoTa,ID_Nguoi_dung
    TenTruyen = Request.Form("TenTruyen")
    SoChuong = Request.Form("SoChuong")
    NamXuatBan = Request.Form("NamXB")
    AnhTruyen = Request.Form("Anhtruyen")
    TinhTrang = Request.Form("flexRadioDefault")
    TheLoai = Request.Form("flexRadioDefault1")
    MoTa = Request.Form("gioithieu")
    ID_Nguoi_dung = Request.Form("ID_Nguoi_dung")

    TenTruyen = Replace(Request.Form("TenTruyen"), "'", "''")
    SoChuong = Replace(Request.Form("SoChuong"), "'", "''")
    NamXuatBan = Replace(Request.Form("NamXB"), "'", "''")
    AnhTruyen = Replace(Request.Form("Anhtruyen"), "'", "''")
    TinhTrang = Replace(Request.Form("flexRadioDefault"), "'", "''")
    TheLoai = Replace(Request.Form("flexRadioDefault1"), "'", "''")
    MoTa = Replace(Request.Form("gioithieu"), "'", "''")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "INSERT INTO truyen (ten_truyen,id_the_loai, so_chuong, nam_xb, anh_truyen, tinh_trang, mo_ta_ndung, id_nguoi_dung) VALUES (N'" & TenTruyen & "','" & TheLoai & "', '" & SoChuong & "', '" & NamXuatBan & "', '" & AnhTruyen & "', '" & TinhTrang & "', N'" & MoTa & "','" & ID_Nguoi_dung & "' )"
    ' conn.Open "Provider=SQLOLEDB;Data Source=ten_may_chu;Initial Catalog=ten_csdl;User ID=ten_nguoi_dung;Password=mat_khau;"
    conn.Execute strSQL

    ' Đóng kết nối CSDL
    conn.Close
    Set conn = Nothing

    'Hiển thị thông báo thành công
    Response.Write("Dữ liệu đã được thêm vào cơ sở dữ liệu thành công.")
    Response.Redirect "qli_truyen.asp?id_nguoi_dung=" & ID_Nguoi_dung & "&page=" & page

%>
