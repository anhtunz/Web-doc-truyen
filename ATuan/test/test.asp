<!-- #include file="connect.asp" -->
<%
' Số bản ghi trên mỗi trang
    Dim recordsPerPage
    recordsPerPage = 10 ' Số bản ghi hiển thị trên mỗi trang

' Truy vấn dữ liệu từ cơ sở dữ liệu
    Dim conn, rs
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"

    Dim sql
    sql = "SELECT * FROM truyen"
    Set rs = conn.Execute(sql)

' Tính toán các thông số phân trang
    Dim totalRecords, totalPages, currentPage, startRecord, endRecord
    totalRecords = rs.RecordCount ' Tổng số bản ghi
    totalPages = CInt(totalRecords / recordsPerPage) ' Tổng số trang
    If totalRecords Mod recordsPerPage <> 0 Then totalPages = totalPages + 1 ' Kiểm tra và tăng số trang nếu có phần dư
    currentPage = Request.QueryString("page") ' Trang hiện tại
    If currentPage = "" Then currentPage = 1 ' Trang mặc định
    startRecord = (currentPage - 1) * recordsPerPage + 1 ' Vị trí bắt đầu của dữ liệu hiển thị trên trang
    endRecord = startRecord + recordsPerPage - 1 ' Vị trí kết thúc của dữ liệu hiển thị trên trang
    If endRecord > totalRecords Then endRecord = totalRecords ' Kiểm tra vị trí kết thúc không vượt quá tổng số bản ghi

' Truy vấn dữ liệu chỉ cho trang hiện tại
sql = "SELECT TOP " & recordsPerPage & " * FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY id_truyen) AS RowNum FROM truyen WHERE your_condition) AS Tbl WHERE RowNum BETWEEN " & startRecord & " AND " & endRecord

Set rs = conn.Execute(sql)
%>

<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Tên truyện</th>
      <th>Năm xuất bản</th>
      <th>Mô tả nội dung</th>
      <th>Số chương</th>
      <th>Tình trạng</th>
      <th>Thao tác</th>
    </tr>
  </thead>
  <tbody>
    <% While Not rs.EOF %>
    <tr>
      <td><%=rs("id_truyen")%></td>
      <td><%=rs("ten_truyen")%></td>
      <td><%=rs("nam_xb")%></td>
      <td><%=rs("mo_ta_ndung")%></td>
      <td><%=rs("so_chuong")%></td>
      <td><%=rs("tinh_trang")%></td>
      <td>
        <button type="button" class="btn btn-primary">Sửa</button>
        <button type="button" class="btn btn-danger">Xóa</button>
      </td>
    </tr>
    <% rs.MoveNext
    Wend %>
  </tbody>
</table>

<nav aria-label="Page Navigation">
  <ul class="pagination pagination-sm">
    <% If totalPages > 1 Then
      For i = 1 To totalPages %>
        <li class="page-item <%= checkPage(CLng(i) = CLng(currentPage), "active") %>">
          <a class="page-link" href="your_page.asp?page=<%= i %>"><%= i %></a>
        </li>
    <% Next
    End If %>
  </ul>
</nav>

<%
rs.Close
Set rs = Nothing
conn.Close
Set conn = Nothing
%>