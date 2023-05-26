<%
' Lấy giá trị id_truyen từ URL
Dim id_truyen
id_truyen = Request.QueryString("id_truyen")

' Kiểm tra xem id_truyen có tồn tại hay không
If Not IsEmpty(id_truyen) Then
    ' Tiếp tục xử lý với giá trị id_truyen

    ' Ví dụ: Hiển thị id_truyen lên trang
    Response.Write "id_truyen: " & id_truyen
Else
    ' Nếu id_truyen không tồn tại, xử lý theo trường hợp không có id_truyen

    ' Ví dụ: Hiển thị thông báo lỗi
    Response.Write "Không tìm thấy id_truyen."
End If
%>