<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
</head>
<style>   
.card-header {
  position: relative;
  padding-right: 25px; /* Để tạo khoảng trống cho nút X */
}

.close-btn {
  position: absolute;
  top: 0;
  right: 0;
  padding: 5px;
  cursor: pointer;
  font-weight: bold;
  padding-right: 10px;
}  
</style>
<body>
<%
Response.ContentType = "text/html"
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"
dim x,y
for each x in Request.Cookies
  response.write("<p>")
  if Request.Cookies(x).HasKeys then
    for each y in Request.Cookies(x)
      Set conn = Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=SQLOLEDB.1;Data Source=TUNZTUNZ\SQLEXPRESS;Database=Web_doc_truyen;User Id=sa;Password=123456"
        sql = "SELECT * FROM truyen WHERE id_truyen = " & y
        Set rs = conn.Execute(sql)
        Response.Write(y)
        %>
        
        <div class="card text-center">
          <div class="card-header">
            Bạn đang đọc dở
            <button class="close-btn" onclick="deleteCookie('<%= y %>')">X</button>
          </div>
          <div class="card-body">
            <h5 class="card-title"><%= rs("ten_truyen")%></h5>
            <p class="card-text">Chương này</p>
            <a href="/testTrangTruyen.asp?id_truyen=<%=rs("id_truyen")%>" class="btn btn-primary">Đọc tiếp</a>
          </div>
        </div>
        <%
        rs.Close
        Set rs = Nothing

        conn.Close
        Set conn = Nothing
        next
        else
        Response.Write(x & "=" & Request.Cookies(x) & "<br>")
        end if
        response.write "</p>"
    next
%>

<script>
function deleteCookie(cookieName) {
  // var xhr = new XMLHttpRequest();
  // var url = '/deleteCookie.asp?cookieName=' + encodeURIComponentencodeURIComponent(cookieName);
  // xhr.open('GET', url, true);
  // xhr.onload = function() {
  //   if (xhr.status === 200) {
  //     // Xóa cookie thành công, chuyển hướng trang
  //     window.location.href = "luuweb.asp"; // Thay "/newPage.asp" bằng URL của trang mới
      
  //   } else {
  //     // Xử lý lỗi nếu có
  //   }
  // };
  // xhr.send();
  var url = "/test/deleteCookie.asp?cookieName=" + encodeURIComponent(cookieName);

  // Chuyển hướng trang sang process.asp  
  window.location.href = url;
}
</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>