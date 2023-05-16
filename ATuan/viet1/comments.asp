<%
Dim commentText, userName

' Xử lý gửi bình luận
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    commentText = Trim(Request.Form("comment"))
    userName = Trim(Request.Form("username"))

    If commentText <> "" Then
        ' Kết nối đến cơ sở dữ liệu
        Dim conn
        Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

        ' Thêm bình luận vào cơ sở dữ liệu
        Dim sql
        sql = "INSERT INTO Comments (UserName, CommentText) VALUES ('" & userName & "', '" & commentText & "')"
        conn.Execute sql

        ' Đóng kết nối
        conn.Close
        Set conn = Nothing

        ' Sau khi lưu, chuyển hướng trở lại trang truyện
        Response.Redirect "trangtruyen.asp#comment-section"
    End If
End If
%>
