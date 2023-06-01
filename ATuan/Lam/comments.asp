<%
Dim ndung_binh_luan, id_nguoi_dung

' Xử lý gửi bình luận
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    ndung_binh_luan = Trim(Request.Form("ndung_binh_luan"))
    id_nguoi_dung = Trim(Request.Form("id_nguoi_dung"))

    If ndung_binh_luan <> "" Then
        ' Kết nối đến cơ sở dữ liệu
        Dim conn
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=SQLOLEDB.1;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"

        ' Thêm bình luận vào cơ sở dữ liệu
        Dim sql
        sql = "INSERT INTO binh_luan (id_nguoi_dung, ndung_binh_luan) VALUES ('" & id_binh_luan & "', '" & ndung_binh_luan & "')"
        conn.Execute sql

        ' Đóng kết nối
        conn.Close
        Set conn = Nothing

        ' Sau khi lưu, chuyển hướng trở lại trang truyện
        Response.Redirect "doc.asp#comment-section"
    End If
End If
%>
