<%
Dim cookieName
cookieName = Request.QueryString("cookieName")

If Request.Cookies("truyen").Count > 0 Then
  ' Kiểm tra xem cookie có tồn tại hay không
  If Request.Cookies("truyen").HasKey(cookieName) Then
    ' Xóa giá trị trong mảng cookie
    Response.Cookies("truyen")(cookieName) = ""
    Response.Cookies("truyen").Expires = DateAdd("d", -1, Now)

    ' Hiển thị thông báo đã xóa thành công
    Response.Write("Đã xóa giá trị trong mảng cookie thành công!")
  Else
    ' Hiển thị thông báo nếu giá trị không tồn tại trong mảng cookie
    Response.Write("Giá trị không tồn tại trong mảng cookie!")
  End If
End If
 %>

 