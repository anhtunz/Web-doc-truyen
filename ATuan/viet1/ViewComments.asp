<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

    
</head>
<style>
   /* CSS cho phần bình luận */
#comment-section {
    margin-top: 20px;
  }
  #comment-section h2 {
    font-size: 18px;
    margin-bottom: 10px;
  }
  #comment-section form {
    margin-bottom: 10px;
  }
  #comment-section textarea {
    width: 100%;
    height: 100px;
    resize: none;
  }
  #comment-section button {
    padding: 5px 10px;
  }
  #comment-section .comment {
    margin-bottom: 10px;
  }
  #comment-section .comment .author {
    font-weight: bold;
  }
  #comment-section .comment .date {
    font-size: 12px;
    color: gray;
  }
 #comment-section .comment .acts {
    float: right;
    text-align: right;
    font-size: 12px;
    line-height: 20px;
}
</style>
<body>
<div id="comment-section">
          <h2>Bình luận</h2>
          <form id="comment-form" method="post" action="comments.asp">
            <input type="" name="idusername" placeholder="Nhập id người dùng"><br>
            <textarea name="comment" placeholder="Nhập bình luận của bạn"></textarea><br>
            <button type="submit">Gửi</button>
          </form>
        <div id="comment-list">
            <% Dim ndung_binh_luan, id_nguoi_dung, id_binh_luan ' Xử lý gửi bình luận
            If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
                ndung_binh_luan = Trim(Request.Form("ndung_binh_luan"))
                id_nguoi_dung = Trim(Request.Form("id_nguoi_dung"))
                If ndung_binh_luan <> "" Then
                    ' Lưu bình luận vào cơ sở dữ liệu hoặc tệp tin ' Sau khi lưu, chuyển hướng trở lại trang truyện
                    Response.Redirect "testTrangTruyen.asp#comment-section"
                End If
            End If
            %>       
            <%
                ' Kết nối đến CSDL
                Set conn = Server.CreateObject("ADODB.Connection")
                conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

                ' Truy vấn dữ liệu từ CSDL
                Set rs = conn.Execute("SELECT * " & _
                                      "FROM binh_luan INNER JOIN nguoi_dung ON binh_luan.id_nguoi_dung = nguoi_dung.id_nguoi_dung " & _
                                      "WHERE binh_luan.id_truyen = " & id_truyen & _
                                      "ORDER BY binh_luan.ngay_binh_luan DESC")

                ' Hiển thị dữ liệu
                Do While Not rs.EOF
            %>
            <div>

                <div class="d-flex justify-content-start align-items-center">
                    <small>
                        <div class="userinfo">
                            <strong style="font-size: 16px; color: blue"><%=rs("id_nguoi_dung")%></strong>
                            <i class="fa fa-circle"></i> <%=rs("ngay_binh_luan")%>
                        </div>
                        <p style="font-size: 16px; color: black"><%=rs("ndung_binh_luan")%></p>
                    </small>
                    <div class="acts ml-auto">
                        <a href="#comment-list" style="color: red">Thích</a>
                        <a href="DeleteComments.asp?id_binh_luan=<%=rs("id_binh_luan")%>" > Xóa </a>
                    </div>
                </div>
            </div>
                <%
                    rs.MoveNext
                    Loop

                    ' Đóng kết nối CSDL
                     rs.Close
                    Set rs = Nothing
                    conn.Close
                    Set conn = Nothing
                %>
        </div>
        
</div>



    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>