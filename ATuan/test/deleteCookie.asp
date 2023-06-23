<%
Dim cookieName
cookieName = Request.QueryString("cookieName")
Response.Write(cookieName)
If Request.Cookies("truyen").Count > 0 Then
  ' Kiểm tra xem cookie có tồn tại hay không
  
    ' Xóa giá trị trong mảng cookie
    Response.Cookies("truyen")(cookieName) = ""
    Response.Cookies("truyen").Expires = DateAdd("d", -1, Now)

    ' Hiển thị thông báo đã xóa thành công
    
    Response.redirect("/index.asp")
End If
 %>

 