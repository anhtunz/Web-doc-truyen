<!-- #include file="connect.asp" -->
<%
Response.ContentType = "text/html"
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"
%>
<%
    Dim name
    name = Request.Form("signname")
    Dim email
    email = Request.Form("signemail")
    Dim password
    password = Request.Form("signpass")
    Dim nickname
    nickname = Request.Form("signnick")
    Dim vaitro
    vaitro = Request.Form("role")

    set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456;"

' Thêm dữ liệu vào bảng "nguoi_dung"

    sql = "INSERT INTO nguoi_dung (ho_ten, email, mat_khau, nghe_danh, vai_tro) VALUES (N'" & name & "', '" & email & "', '" & password & "', N'" & nickname & "', " & vaitro & ")"
    conn.Execute sql

' Đóng kết nối
    conn.Close
    set conn = Nothing
    'Hiển thị thông báo thành công
     Response.Write("<script>")
    Response.Write("setTimeout(function() {")
    Response.Write(" alert('Đăng kí thành công');")
    Response.Write(" window.location.href = '/login.asp';")
    Response.Write("}, 2000);")
    Response.Write("</script>")
%>


