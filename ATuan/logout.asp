<%
    Session.Abandon()
    Response.redirect("/index.asp")
%>

<%
' Kiểm tra xem Cookie id_truyen có tồn tại hay không
' if Request.Cookies("id_truyen") <> "" then
'     ' Truy xuất giá trị id_truyen từ Cookie
'      Dim id_truyen
'     id_truyen = Request.Cookies("id_truyen")
'     ' Hiển thị giá trị id_truyen
'     Response.Write("id_truyen: " & id_truyen)
' end if
%>