<%
    ' Kết nối đến CSDL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    ' Trích xuất giá trị ID từ tham số truy vấn
    Dim id_binh_luan
    id_binh_luan = Request.QueryString("id_binh_luan")

    ' Kiểm tra nếu ID tồn tại
    If id_nguoi_dung <> "" Then
        ' Thực hiện truy vấn xóa dữ liệu CommentAt từ cơ sở dữ liệu dựa trên commentID
        sql = "DELETE FROM binh_luan WHERE id_binh_luan = " & id_binh_luan
        conn.Execute sql
    End If

    ' Đóng kết nối CSDL
    conn.Close
    Set conn = Nothing

    ' Chuyển hướng trở lại trang truyện
    Response.Redirect "testTrangTruyen.asp#comment-section"
%>
