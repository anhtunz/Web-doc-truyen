<%
    id_nguoi_dung = Request.QueryString("id_nguoi_dung")
    
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "DELETE FROM nguoi_dung WHERE id_nguoi_dung = "&id_nguoi_dung
     conn.Execute strSQL

    ' Đóng kết nối CSDL
    conn.Close
    Set conn = Nothing

    ' Hiển thị thông báo thành công
    Response.Write("Xóa hàng thành công")
    Response.Redirect "qli_nguoi_dung.asp?id_nguoi_dung=" & id_nguoi_dung 
%>