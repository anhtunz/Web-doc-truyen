<!-- #include file="connect.asp" -->
<%
Dim id_truyen
    id_truyen = Request.QueryString("id_truyen")
    Dim ChuongSo,TenChuong, NoiDung
        ChuongSo = Request.Form("ChuongSo_nhap")
        TenChuong = Request.Form("TenChuong_nhap")
        NoiDung = Request.Form("NoiDungChuong")
        
    ' Xử lý dữ liệu ở đây...

    ' Ví dụ: In ra các giá trị đã nhận được
    Response.Write("Nội Dung Chương: " & NoiDung & "<br>")
    Response.Write("Tên chương: " & ChuongSo &":"& TenChuong &  "<br>")
    Response.Write("Id truyen: " & id_truyen & "<br>")


    ' ChuongSo = Replace(Request.Form("ChuongSo_nhap"), "'", "''")
    ' TenChuong = Replace(Request.Form("TenChuong_nhap"), "'", "''")
    ' NoiDung = Replace(Request.Form("NoiDungChuong"), "'", "''")
    ' Dim strSQL
    ' Set conn = Server.CreateObject("ADODB.Connection")
    ' conn.Open "Provider=SQLOLEDB.1;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"
                
    ' strSQL = "INSERT INTO chuong (ten_chuong, ndung_chuong, duyet) VALUES ('" & TenChuong & "','" & NoiDung & "',1)"
    ' ' conn.Open "Provider=SQLOLEDB;Data Source=ten_may_chu;Initial Catalog=ten_csdl;User ID=ten_nguoi_dung;Password=mat_khau;"
    ' conn.Execute strSQL

    ' ' Đóng kết nối CSDL
    ' conn.Close
    ' Set conn = Nothing

    ' ' Hiển thị thông báo thành công
    ' Response.Write("Dữ liệu đã được thêm vào cơ sở dữ liệu thành công.")
    ' Response.Redirect ("qli_chuong.asp?id_truyen=" & id_truyen)
%>
