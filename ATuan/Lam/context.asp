 <!-- #include file="connect.asp" -->
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
Dim id_truyen
userIP = Request.QueryString("id_truyen")
%>

  <div class="context">
    <div class="breadcrumb">
      <a href="index.asp">Trang chủ</a> /
      <a href="testTrangTruyen.asp" %>Tên truyện</a> /
      <a href="doc.asp">Nội dung</a>
    </div>

    <div class="title">
      <h2>Tên truyện</h2>
      <a  class="chapter">Tên chương</a>
      <p class="author">Tác giả</p>
      <div class="buttons">
        <button >Chương trước</button>
        <button>Mục lục</button>
        <button>Chương sau</button>
      </div>
    </div>
   
   
<%
Dim rs
Set rs = Server.CreateObject("ADODB.Recordset")

Dim strSQL
strSQL = "SELECT * FROM chuong WHERE chuong.id_chuong =" &id_chuong

rs.Open strSQL, conn
%>

<%
If Not rs.EOF Then
    Do While Not rs.EOF
        Response.Write(rs("ndung_chuong") & "<br>")
        rs.MoveNext
    Loop
End If

rs.Close
Set rs = Nothing
%>


   <div id="comment-section">
  <div class="buttons">
    <button>Chương trước</button>
    <button>Mục lục</button>
    <button>Chương sau</button>
  </div>
</div>
  </div>
  

  </body>
</html>