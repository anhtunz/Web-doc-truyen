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
  <h5>Nhận xét của độc giả về truyện </h5>
  <%
  Dim email
  email = Session("email")
  Dim isLoggedIn
  isLoggedIn = False
  
  If Not email = "" Then
    isLoggedIn = True
    
    ' Kết nối đến CSDL và truy vấn thông tin người dùng
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    sql = "SELECT * FROM nguoi_dung WHERE email = '" & email & "'"

    Set rs = conn.Execute(sql)
    Dim id_nguoi_bl, ten_nguoi_bl
    id_nguoi_bl = rs("id_nguoi_dung")
    ten_nguoi_bl = rs("nghe_danh")
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
  End If
  %>
  
  <%
  If isLoggedIn Then
  %>
    <form id="comment-form" method="post" action="comments.asp?id_truyen=<%= id_truyen %>">
      <div id="" style="display: none;">
        <input type="text" class="ID_Nguoi_dung" name="id_truyen" value="<%= id_truyen %>" placeholder="">
      </div>
      <div id="" style="display: none;">
        <input type="" name="idusername" placeholder="" value="<%= id_nguoi_bl %>"><br>
      </div>
      <textarea name="comment" placeholder="Nhập bình luận của bạn"></textarea><br>
      <button type="submit">Gửi</button>
    </form>
  <%
  Else
  %>
    <form id="comment-form" method="post" action="comments.asp?id_truyen=<%= id_truyen %>" onsubmit="return checkLoginStatus()">
      <div id="" style="display: none;">
        <input type="text" class="ID_Nguoi_dung" name="id_truyen" value="<%= id_truyen %>" placeholder="">
      </div>
      <div id="" style="display: none;">
        <input type="" name="idusername" placeholder="" value="<%= id_nguoi_bl %>"><br>
      </div>
      <textarea name="comment" placeholder="Nhập bình luận của bạn"></textarea><br>
          <b id="login-message" style="display: none; color: red;">Bạn cần đăng nhập để có thể gửi bình luận!</b>
      <button type="submit"><b>Gửi</b></button>
    </form>
    <script>
      function checkLoginStatus() {
        var email = "<%= email %>";
        if (email === "") {
          document.getElementById("login-message").style.display = "block";
          return false; // Ngăn không gửi form
        }
        return true; // Cho phép gửi form
      }
    </script>
  <%
  End If
  %>

  <div id="comment-list">   
    <%
    ' Kết nối đến CSDL
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    ' Truy vấn dữ liệu từ CSDL
    Set rs = conn.Execute("SELECT binh_luan.*, nguoi_dung.* " & _
                          "FROM binh_luan INNER JOIN nguoi_dung ON binh_luan.id_nguoi_dung = nguoi_dung.id_nguoi_dung " & _
                          "WHERE binh_luan.id_truyen = " & id_truyen & _
                          "ORDER BY binh_luan.ngay_binh_luan DESC")

    ' Hiển thị dữ liệu
     Do While Not rs.EOF
      %>
      <div>
        <div class="acts ml-auto d-flex justify-content-between" style= "display: flex">
          <small>
            <div class="userinfo">
              <strong style="font-size: 16px; color: blue"><%= rs("nghe_danh") %></strong>
              <i class="fa fa-circle"></i> <%= rs("ngay_binh_luan") %>
            </div>
            <% If isLoggedIn And rs("id_nguoi_dung") = id_nguoi_bl Then %>
              <textarea id="edit-comment-<%= rs("id_binh_luan") %>" style="display: none;"><%= rs("ndung_binh_luan") %></textarea>
              <p id="comment-text-<%= rs("id_binh_luan") %>" style="font-size: 16px; color: black"><%= rs("ndung_binh_luan") %></p>
              <button type="button" onclick="editComment(<%= rs("id_binh_luan") %>)" style="color: brown;">Sửa</button>
              <button type="button" onclick="saveComment(<%= rs("id_binh_luan") %>)" style="color: green; display: none;">Lưu</button>
            <% Else %>
              <p style="font-size: 16px; color: black"><%= rs("ndung_binh_luan") %></p>
            <% End If %>
          </small>
          <div class="acts ml-auto">
            <% If isLoggedIn And rs("id_nguoi_dung") = id_nguoi_bl Then %>
              <a href="DeleteComments.asp?id_binh_luan=<%= rs("id_binh_luan") %>&id_truyen=<%= id_truyen %>" style="color: red;">Xóa</a>
            <% End If %>
          </div>
        </div>
      </div>
      <% rs.MoveNext
    Loop

    ' Đóng kết nối CSDL
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing
    %>
  </div>
</div>



      <script>
        function editComment(commentId) {
          var commentText = document.getElementById("comment-text-" + commentId);
          var editCommentInput = document.getElementById("edit-comment-" + commentId);
          var saveButton = document.querySelector("#comment-list button[style*='color: green; display: none;']");

          commentText.style.display = "none";
          editCommentInput.style.display = "inline";
          editCommentInput.focus();
          saveButton.style.display = "inline";
        }

        function saveComment(commentId) {
          var commentText = document.getElementById("comment-text-" + commentId);
          var editCommentInput = document.getElementById("edit-comment-" + commentId);
          var saveButton = document.querySelector("#comment-list button[style*='color: green; display: none;']");

          // Lấy nội dung bình luận đã chỉnh sửa
          var updatedComment = editCommentInput.value;

          // Gửi yêu cầu Ajax để cập nhật bình luận
          var xhr = new XMLHttpRequest();
          xhr.open("POST", "update_comment.asp", true);
          xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
          xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
              // Cập nhật nội dung bình luận trên trang sau khi đã cập nhật thành công trong cơ sở dữ liệu
              commentText.innerText = updatedComment;

              commentText.style.display = "inline";
              editCommentInput.style.display = "none";
              saveButton.style.display = "none";
            }
          };
          xhr.send("comment_id=" + commentId + "&updated_comment=" + encodeURIComponent(updatedComment));
        }
      </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>