<%
Response.ContentType = "text/html"
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"
' Kết nối đến CSDL
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"

' Lấy dữ liệu từ biểu mẫu gửi đi
commentId = Request.Form("comment_id")
updatedComment = Request.Form("updated_comment")

' Cập nhật bình luận trong cơ sở dữ liệu
conn.Execute("UPDATE binh_luan SET ndung_binh_luan = N'" & updatedComment & "' WHERE id_binh_luan = " & commentId)

' Đóng kết nối CSDL
conn.Close
Set conn = Nothing

' Trở về trang gốc
Response.Redirect("comments.asp?id_truyen=" & Request.QueryString("id_truyen"))
%>
