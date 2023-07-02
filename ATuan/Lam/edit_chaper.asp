<%
' Kết nối cơ sở dữ liệu
' #include file="connect.asp"

' Lấy giá trị id_chuong từ URL hoặc biểu mẫu
Dim chapterID
chapterID = Request.QueryString("id_chuong")

' Kiểm tra xem có yêu cầu chỉnh sửa hay không
Dim isEditMode
isEditMode = (Request.Form("edit_chapter") = "1")

If isEditMode Then
    ' Xử lý yêu cầu chỉnh sửa và lưu vào cơ sở dữ liệu
    Dim chapterTitle, chapterContent
    chapterTitle = Request.Form("ten_chuong")
    chapterContent = Request.Form("ndung_chuong")

    ' Kiểm tra xem id_chuong có tồn tại và hợp lệ hay không
    If IsNumeric(chapterID) Then
        ' Truy vấn cơ sở dữ liệu để cập nhật thông tin chương
        Dim strSQL
        strSQL = "UPDATE chuong SET ten_chuong='" & chapterTitle & "', ndung_chuong='" & chapterContent & "' WHERE id_chuong=" & chapterID
        conn.Execute(strSQL)

        ' Chuyển hướng người dùng đến trang hiển thị chương đã chỉnh sửa
        Response.Redirect "view_chapter.asp?id_chuong=" & chapterID
    Else
        Response.Write "Id chương không hợp lệ."
    End If
Else
    ' Hiển thị thông tin chương và biểu mẫu chỉnh sửa
    Dim rs
    Set rs = Server.CreateObject("ADODB.Recordset")

    Dim strSQL
    strSQL = "SELECT * FROM chuong WHERE chuong.id_chuong =" & chapterID

    rs.Open strSQL, conn

    If Not rs.EOF Then
        ' Lấy thông tin chương từ cơ sở dữ liệu
        Dim chapterTitle, chapterContent
        chapterTitle = rs("ten_chuong")
        chapterContent = rs("ndung_chuong")

        ' Hiển thị thông tin chương
        Response.Write "<h2>" & chapterTitle & "</h2>"
        Response.Write "<p>" & chapterContent & "</p>"

        ' Hiển thị form chỉnh sửa với thông tin chương
        %>
        <!-- Phần chỉnh sửa chương -->
        <div class="edit-section">
            <h2>Chỉnh sửa chương</h2>
            <form action="view_chapter.asp?id_chuong=<%= chapterID %>" method="post">
                <!-- Các trường form để chỉnh sửa chương -->
                <input type="hidden" name="id_chuong" value="<%= chapterID %>" />
                <input type="text" name="ten_chuong" value="<%= chapterTitle %>" placeholder="Tiêu đề chương" />
                <textarea name="ndung_chuong" placeholder="Nội dung chương"><%= chapterContent %></textarea>
                <input type="hidden" name="edit_chapter" value="1" />
                <input type="submit" value="Lưu" />
            </form>
        </div>
        <%
    Else
        Response.Write "Không tìm thấy chương."
    End If

    rs.Close
End If
%>
