 <!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href=  "style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

    </head>
<style>
   .context {
    text-align: center;
    margin-top: 50px;
    border: 1px solid #a5a2a2d1;
    padding: 20px;
    max-width: 1000px;
    margin: 0 auto;
  }
  
  .title {
    border-bottom: 1px solid #ccc;
    margin-bottom: 20px;
    padding-bottom: 10px;
    font-size: 18px;
    font-weight: bold;
  }
  
  .chapter {
    font-size: 16px;
    margin-bottom: 10px;
  }
  
  .author {
    font-size: 14px;
    color: #888;
  }
  .breadcrumb {
    text-align: left ;
    font-size: 14px;
  }
  
  .breadcrumb a {
    text-decoration: none;
  }
  
  .breadcrumb a:hover {
    text-decoration: underline;
  }
   /* CSS cho phần bình luận */
  #comment-section {    
    border-top: 1px solid #ccc;

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

  .buttons {
    margin-top: 20px;
  }
  
  .buttons button {
    padding: 5px 7px;
    background-color: #f1f1f1;
    border: 1px solid #ccc;
    margin-right: 10px;
    cursor: pointer;
}

</style>
</div>
<body>
<%
   Dim id_chuong
   id_chuong = Request.QueryString("id_chuong")
   
Dim conn
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=SQLOLEDB;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"
%>

<%

  ' Lấy id_truyen từ tham số trên URL hoặc từ cơ sở dữ liệu
  Dim id_truyen
  id_truyen = Request.QueryString("id_truyen")

  

%>

  <div class="context">
    <div class="breadcrumb">
    <a href="index.asp">Trang Chủ <a>/
  <%
 If id_truyen <> "" And id_chuong <> "" Then
    Dim strSQLTitle
    strSQLTitle = "SELECT t.ten_truyen, c.ten_chuong FROM truyen AS t INNER JOIN chuong AS c ON t.id_truyen = c.id_truyen WHERE t.id_truyen = " & id_truyen & " AND c.id_chuong = " & id_chuong
    
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"
    
    Set rs = conn.Execute(strSQLTitle)
    
    If Not rs.EOF Then
        Dim ten_truyen
        Dim ten_chuong
        
        ten_truyen = rs("ten_truyen")
        ten_chuong = rs("ten_chuong")
        
        ' Hiển thị thông tin ten_truyen và ten_chuong
        Response.Write "" & ten_truyen & "/"
        Response.Write " " & ten_chuong
    End If
    
    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing
End If
   %>
    </div>

    <div class="title">
    <%
If id_truyen <> "" And id_chuong <> "" Then
    Dim strSQLe
    strSQLe = "SELECT t.ten_truyen, c.ten_chuong FROM truyen AS t INNER JOIN chuong AS c ON t.id_truyen = c.id_truyen WHERE t.id_truyen = " & id_truyen & " AND c.id_chuong = " & id_chuong
    
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"
    
    Set rs = conn.Execute(strSQLe)
    
    If Not rs.EOF Then
      
        ten_truyen = rs("ten_truyen")
        ten_chuong = rs("ten_chuong")
        
        ' Hiển thị thông tin ten_truyen và ten_chuong
        Response.Write "" & ten_truyen & "<br>"
        Response.Write " " & ten_chuong
    End If
    
    rs.Close
    conn.Close
    Set rs = Nothing
    Set conn = Nothing
End If
%>

        
    '   <%
   'strSQLTitle = "SELECT  ten_chuong FROM chuong WHERE id_chuong =" & id_chuong
  'Set rsTitle = conn.Execute(strSQLTitle)
   
   '   Response.Write("<a  class='chapter'   >" & rsTitle("ten_chuong") & "</a>")
 '%>
     
   <div class="buttons">

   <%
If id_truyen <> "" Then
    ' Kiểm tra xem chương đó có phải là chương đầu tiên hay không
    Dim strSQLPrev
    strSQLPrev = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong < " & id_chuong & " ORDER BY id_chuong DESC"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    Set rs = conn.Execute(strSQLPrev)

    If Not rs.EOF Then
        ' Nếu tồn tại chương trước đó, hiển thị nút quay lại chương
%>
    <button>   <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>">Chương Trước</a>  </button>
<%
    End If
End If
%>

    <button>
<a href="testTrangTruyen.asp?id_truyen=<%= id_truyen %>">Mục lục</a></button>
<%
If id_truyen <> "" Then
    ' Kiểm tra xem chương đó có phải là chương cuối cùng hay không
    Dim strSQLNext
    strSQLNext = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong > " & id_chuong & " ORDER BY id_chuong ASC"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    Set rs = conn.Execute(strSQLNext)

    If Not rs.EOF Then
        ' Nếu tồn tại chương tiếp theo, hiển thị nút chuyển chương tiếp
%>
      <button>
      <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"> Chương Sau  </a>    </button>

<%
    End If

  
End If
%>

</div>

   
<%
Dim rs
Set rs = Server.CreateObject("ADODB.Recordset")

Dim strSQL
strSQL = "SELECT * FROM chuong WHERE chuong.id_chuong =" &id_chuong 

rs.Open strSQL, conn



If Not rs.EOF Then
    Do While Not rs.EOF
        Response.Write(rs("ndung_chuong") & "<br>")

        rs.MoveNext
    Loop
End If


%>


%>
   <div id="comment-section">
   <div class="button">

<%            

If id_truyen <> "" Then
    ' Kiểm tra xem chương đó có phải là chương đầu tiên hay không
    Dim strSQLPrevi
    strSQLPrevi = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong < " & id_chuong & " ORDER BY id_chuong DESC"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    Set rs = conn.Execute(strSQLPrevi)

    If Not rs.EOF Then
        ' Nếu tồn tại chương trước đó, hiển thị nút quay lại chương
%>
    <button>   <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>">Chương Trước</a>  </button>
<%
    End If
End If
%>
 <button>
<a href="testTrangTruyen.asp?id_truyen=<%= id_truyen %>">Mục lục</a></button>
<%
If id_truyen <> "" Then
    ' Kiểm tra xem chương đó có phải là chương cuối cùng hay không
    Dim strSQLNextChapter
    strSQLNextChapter = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong > " & id_chuong & " ORDER BY id_chuong ASC"
    Set conn = Server.CreateObject("ADODB.Connection")
    conn.Open "Provider=SQLOLEDB;Data Source=LAPTOP-LAM\MAYAO;Database=Web_doc_truyen;User Id=sa;Password=123456;"

    Set rs = conn.Execute(strSQLNextChapter)

    If Not rs.EOF Then
        ' Nếu tồn tại chương tiếp theo, hiển thị nút chuyển chương tiếp
%>
      <button>
      <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"> Chương Sau  </a>    </button>

<%
    End If

  
End If
%>
  </div>
</div>
  </div>
  <%
  rs.Close
Set rs = Nothing
%>

  </body>
</html>
  