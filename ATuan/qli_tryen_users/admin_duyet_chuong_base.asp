<!-- #include file="connect.asp" -->

<%

Dim id_nguoi_dung, id_truyen,id_chuong, page

page = Request.QueryString("page")
id_nguoi_dung = Request.QueryString("id_nguoi_dung")
id_truyen = Request.QueryString("id_truyen")
id_chuong = Request.QueryString("id_chuong")



Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "UPDATE chuong SET duyet = 1 WHERE id_chuong = " & id_chuong
    conn.Execute strSQL
    ' Đóng kết nối CSDL
    conn.Close
    Set conn = Nothing
    Response.Write("<script>")
    Response.Write("setTimeout(function() {")
    Response.Write("   alert('Duyệt chương thành công.');")
    Response.Write("window.location.href = 'admin_duyet_chuong.asp?id_truyen=" & id_truyen & "&id_nguoi_dung=" & id_nguoi_dung & "&page=" & page & "';")
    Response.Write("}, 2000);")
    Response.Write("</script>")


%>