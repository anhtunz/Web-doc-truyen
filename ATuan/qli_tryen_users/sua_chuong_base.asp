<!-- #include file="connect.asp" -->

<%
    Dim id_chuong, idtruyen, tenchuong, noidungchuong
    id_chuong = Request.Form("idchuong")
    idtruyen = Request.Form("idtruyen")
    tenchuong = Request.Form("tenchuong")
    noidungchuong = Request.Form("noidungchuong")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "UPDATE chuong SET ten_chuong=N'" & tenchuong & "', ndung_chuong=N'" & noidungchuong & "' WHERE id_chuong='" & id_chuong & "'"
    conn.Execute strSQL

    ' Đóng kết nối CSDL
    conn.Close
    Set conn = Nothing

    'Hiển thị thông báo thành công
Response.Write("<script>")
Response.Write("setTimeout(function() {")
Response.Write("   var message = decodeURIComponent('" & Server.URLEncode("Sửa chương thành công.") & "');")
Response.Write("   alert(message);")
Response.Write("   window.location.href = 'qli_chuong.asp?id_truyen=" & idtruyen & "';")
Response.Write("}, 2000);")
Response.Write("</script>")


%>