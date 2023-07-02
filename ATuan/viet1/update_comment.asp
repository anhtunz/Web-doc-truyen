<%
Response.ContentType = "text/html"
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"
' Kết nối đến CSDL
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

' Xử lý yêu cầu chỉnh sửa comment
If Request.Form("commentId") <> "" And Request.Form("commentText") <> "" Then
    Dim commentId, commentText
    commentId = Request.Form("commentId")
    commentText = Request.Form("commentText")

    ' Cập nhật comment trong CSDL
    conn.Execute("UPDATE binh_luan SET ndung_binh_luan = N'" & commentText & "' WHERE id_binh_luan = " & commentId)

    ' Trả về phản hồi thành công
    Response.Write "success"
End If

' Đóng kết nối CSDL
conn.Close
Set conn = Nothing
%>
