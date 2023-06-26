<%
Dim id_truyen,id_binh_luan
id_truyen = Request.QueryString("id_truyen")
id_binh_luan = Request.QueryString("id_binh_luan")

' Kết nối đến CSDL
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

' Kiểm tra nếu id_binh_luan tồn tại
If id_binh_luan <> "" Then
    ' Thực hiện truy vấn xóa dữ liệu CommentAt từ cơ sở dữ liệu dựa trên id_binh_luan
    sql = "DELETE FROM binh_luan WHERE id_binh_luan = " & id_binh_luan
    conn.Execute sql
End If

' Đóng kết nối CSDL
conn.Close
Set conn = Nothing

' Chuyển hướng trở lại trang truyện
Response.Redirect "testTrangTruyen.asp?id_truyen=" & id_truyen
%>
