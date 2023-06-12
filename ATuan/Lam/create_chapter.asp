<%
' Kết nối cơ sở dữ liệu
<!-- #include file="connect.asp" -->
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB.1;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"

' Xử lý việc gửi form
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    Dim idTruyen, chapterTitle, chapterContent, currentTime
    idTruyen = Request.Form("id_truyen")
    chapterTitle = Request.Form("chapter_title")
    chapterContent = Request.Form("chapter_content")
    currentTime = Now()

    ' Thêm chương mới vào cơ sở dữ liệu
    Dim strSQL
    strSQL = "INSERT INTO chuong (id_truyen, ten_chuong, ndung_chuong, chuong_thoi_gian) VALUES (" & idTruyen & ", '" & Replace(chapterTitle, "'", "''") & "', '" & Replace(chapterContent, "'", "''") & "', '" & FormatDateTime(currentTime, 2) & "')"
    conn.Execute strSQL

    ' Chuyển hướng người dùng đến trang xác nhận hoặc trang truyện
    ' Response.Redirect "confirmation.asp"
End If

' Đóng kết nối cơ sở dữ liệu
conn.Close
Set conn = Nothing
%>
