<%Dim id_truyen
id_truyen = Request.Cookies("truyen")

' Kiểm tra xem cookie "truyen" có tồn tại không
If Not id_truyen = "" Then
    Response.Write("Giá trị id_truyen: " & id_truyen)
Else
    Response.Write("Cookie 'truyen' không tồn tại hoặc không có giá trị")
End If%>