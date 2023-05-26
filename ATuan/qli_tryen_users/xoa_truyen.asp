<%
    id_truyen = Request.QueryString("id_truyen")
    page = Request.QueryString("page")

    ' In ra các giá trị đã nhận được
    Response.Write("Id: " & id_truyen & "<br>")
    Response.Write("Id: " & page & "<br>")
    
    Dim strSQL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
    strSQL = "DELETE FROM truyen WHERE id_truyen = "&id_truyen
    ' conn.Open "Provider=SQLOLEDB;Data Source=ten_may_chu;Initial Catalog=ten_csdl;User ID=ten_nguoi_dung;Password=mat_khau;"
    conn.Execute strSQL

    ' Đóng kết nối CSDL
    conn.Close
    Set conn = Nothing

    ' Hiển thị thông báo thành công
    Response.Write("Xóa hàng thành công")
    Response.Redirect "qli_truyen.asp?page= " &page
%>