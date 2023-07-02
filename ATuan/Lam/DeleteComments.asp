<%
Dim id_truyen,id_binh_luan
Dim id_chuong
id_truyen = Request.QueryString("id_truyen")
id_binh_luan = Request.QueryString("id_binh_luan")
id_chuong = Request.QueryString("id_chuong")

' Kết nối đến CSDL
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;;"

' Kiểm tra nếu id_binh_luan tồn tại
If id_binh_luan <> "" Then
    ' Thực hiện truy vấn xóa dữ liệu CommentAt từ cơ sở dữ liệu dựa trên id_binh_luan
    sql = "DELETE FROM binh_luan WHERE id_binh_luan = " & id_binh_luan
    conn.Execute sql
End If

' Đóng kết nối CSDL
conn.Close
Set conn = Nothing

' Kiểm tra giá trị id_chuong và thực hiện chuyển hướng
If id_chuong <> "" Then
    Response.Redirect "doc.asp?id_chuong=" & id_chuong & "&id_truyen=" & id_truyen 
Else
    Response.Redirect "testTrangTruyen.asp?id_truyen=" & id_truyen
End If
%>
