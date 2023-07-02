<!-- #include file="connect.asp" -->

<%
    Response.ContentType = "text/html"
    Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
    Response.CodePage = 65001
    Response.CharSet = "UTF-8"
    Dim id_chuong,id_truyen
    id_chuong = Request.QueryString("id_chuong")
    id_truyen = Request.QueryString("id_truyen")
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "DELETE FROM chuong WHERE id_chuong = "&id_chuong
    ' conn.Open "Provider=SQLOLEDB;Data Source=ten_may_chu;Initial Catalog=ten_csdl;User ID=ten_nguoi_dung;Password=mat_khau;"
    conn.Execute strSQL
    ' Đóng kết nối CSDL
    conn.Close
    Set conn = Nothing
    Response.Redirect "qli_chuong.asp?id_truyen=" & id_truyen  

    %>