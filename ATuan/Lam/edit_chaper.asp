<%
' Kết nối cơ sở dữ liệu
' #include file="connect.asp"

' Lấy giá trị id_chuong từ URL
Dim chapterID
chapterID = Request.QueryString("id_chuong")

' Kiểm tra xem id_chuong có tồn tại và hợp lệ hay không
If IsNumeric(chapterID) Then
    ' Truy vấn cơ sở dữ liệu để lấy thông tin chương
    Dim strSQL, rs
    strSQL = "SELECT * FROM chuong WHERE id_chuong = " & id_chuong
    Set rs = conn.Execute(strSQL)

    ' Kiểm tra xem có dữ liệu chương hay không
    If Not rs.EOF Then
        ' Lấy thông tin chương từ cơ sở dữ liệu
        Dim chapterTitle, chapterContent
        chapterTitle = rs("ten_chuong")
        chapterContent = rs("ndung_chuong")

        ' Hiển thị form chỉnh sửa với thông tin chương
        %>
        <!-- Phần chỉnh sửa chương -->
        <div class="edit-section">
            <h2>Chỉnh sửa chương</h2>
            <form action="edit_chapter.asp" method="post">
                <!-- Các trường form để chỉnh sửa chương -->
                <input type="hidden" name="id_chuong" value="<%=id_chuong%>" />
                <input type="text" name="ten_chuong" value="<%=ten_chuong%>" placeholder="Tiêu đề chương" />
                <textarea name="ndung_chuong" placeholder="Nội dung chương"><%=chapterContent%></textarea>
                <input type="submit" value="Lưu" />
            </form>
        </div>
        <%
    Else
        Response.Write "Không tìm thấy chương."
    End If

    rs.Close
Else
    Response.Write "Id chương không hợp lệ."
End If
%>
