<!-- #include file="connect.asp" -->
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Web đọc truyện</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

</head>
<style>
    .context {
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
        text-align: center;

    }
    .chapter {
        font-size: 24px;
        font-family: inherit;
        margin-bottom: 10px;
    }
</style>
</div>

<body>
    <% Dim id_chuong 
    id_chuong=Request.QueryString("id_chuong") 
    Dim conn 
    Set conn=Server.CreateObject("ADODB.Connection")
        conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
        %>

        <% ' Lấy id_truyen từ tham số trên URL hoặc từ cơ sở dữ liệu
   Dim id_truyen
   id_truyen = Request.QueryString("id_truyen")
 
   
 
 %>
 
   <div class="context">
     <div class="breadcrumb">
     <a href="index.asp"><b> Trang chủ </b> <a>/
   <%
    If id_truyen <> "" And id_chuong <> "" Then
     Dim strSQLTitle
     strSQLTitle = "SELECT t.ten_truyen, c.ten_chuong, t.id_truyen FROM truyen AS t INNER JOIN chuong AS c ON t.id_truyen = c.id_truyen WHERE t.id_truyen = " & id_truyen & " AND c.id_chuong = " & id_chuong
     
     Set conn = Server.CreateObject("ADODB.Connection")
     conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
     
     Set rs = conn.Execute(strSQLTitle)
     
     If Not rs.EOF Then
         Dim ten_truyen
         Dim ten_chuong
         Dim trang_truyen_link
 
         ten_truyen = rs("ten_truyen")
         ten_chuong = rs("ten_chuong")
         trang_truyen_link = "testTrangTruyen.asp?id_truyen=" & rs("id_truyen")
 
         ' Hiển thị thông tin ten_truyen và ten_chuong 
            Response.Write "<a href=""" & trang_truyen_link & """>" &ten_truyen & "</a>/" 
            Response.Write " " & ten_chuong 
            End If 
            rs.Close 
            conn.Close 
            Set rs=Nothing 
            Set conn=Nothing 
            End If 
            %>
            </div>

            <div class="title">
                <% If id_truyen <> "" And id_chuong <> "" Then
                        Dim strSQLeee
                        strSQLeee = "SELECT t.ten_truyen, c.ten_chuong, c.chuong_thoi_gian " & _
                        "FROM truyen AS t " & _
                        "INNER JOIN chuong AS c ON t.id_truyen = c.id_truyen " & _
                        "WHERE t.id_truyen = " & id_truyen & " AND c.id_chuong = " & id_chuong

                        Set conn = Server.CreateObject("ADODB.Connection")
                        conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
                        Set rs = conn.Execute(strSQLeee)
                        If Not rs.EOF Then

                        Dim chuong_thoi_gian

                        ten_truyen = rs("ten_truyen")
                        ten_chuong = rs("ten_chuong")
                        chuong_thoi_gian = rs("chuong_thoi_gian")

                        ' Hiển thị thông tin
                        Response.Write "<h2>" & ten_truyen & "</h2>"
                        Response.Write "<div class='chapter'>" & ten_chuong & "</div>"
                        Response.Write "<div class='time'>" & chuong_thoi_gian & "</div>"
                        End If

                        rs.Close
                        conn.Close
                        Set rs = Nothing
                        Set conn = Nothing
                        End If
                        %>
            </div>
            <div id="buttom" style= "text-align: center;">
                <% If id_truyen <> "" Then
                    ' Kiểm tra xem chương đó có phải là chương đầu tiên hay không
                    Dim strSQLPrev
                    strSQLPrev = "SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong< " & id_chuong & " ORDER BY id_chuong DESC" 
                    Set conn=Server.CreateObject("ADODB.Connection")
                        conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
                        Set rs=conn.Execute(strSQLPrev) 
                        If Not rs.EOF Then 
                        ' Nếu tồn tại chương trước đó, hiển thị nút quay lại chương
              %>
                  <button class="buttons">   <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"> <b>< Trước </b> </a>  </button>
              <%
                  End If
              End If
              %>
              
                  <button>
              <a href="testTrangTruyen.asp?id_truyen=<%= id_truyen %>"><b> Mục lục </b></a></button>
              <%
              If id_truyen <> "" Then
                  ' Kiểm tra xem chương đó có phải là chương cuối cùng hay không Dim strSQLNext
                                      strSQLNext="SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong > " &id_chuong & " ORDER BY id_chuong ASC" 
                                      Set conn=Server.CreateObject("ADODB.Connection")
                                      conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
                                      Set rs=conn.Execute(strSQLNext) 
                                      If Not rs.EOF Then 
                                      ' Nếu tồn tại chương tiếp theo, hiển thị nút chuyển chương tiếp
              %>
                    <button class="buttons">
                    <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"> <b> Sau ></b> </a>    
                    </button>
              
              <%
                  End If
              
                
              End If
              %>
              
            </div>
 
  <div id= "ndungchuong" 
  style= "background: #fff;
    font-family: Palatino Linotype, 'sans-serif';
    font-size: 22px;
    line-height: 160%;
     text-align: justify;">
           <%
           Dim rs
           Set rs = Server.CreateObject("ADODB.Recordset")
 
           Dim strSQL
           strSQL = "SELECT * FROM chuong WHERE chuong.id_chuong =" &id_chuong 
 
           rs.Open strSQL, conn
 
 
 
           If Not rs.EOF Then
               Do While Not rs.EOF
                   Response.Write  (rs("ndung_chuong") & "<br>")
                   rs.MoveNext
               Loop
           End If
 
 
           %>
 </div>  
 
 <div class="button" style= "text-align: center;">
 
 <%            
 
 If id_truyen <> "" Then
     ' Kiểm tra xem chương đó có phải là chương đầu tiên hay không Dim strSQLPrevi
      strSQLPrevi="SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen & " AND id_chuong < " &id_chuong & " ORDER BY id_chuong DESC" 
      Set conn=Server.CreateObject("ADODB.Connection")
      conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
      Set rs=conn.Execute(strSQLPrevi) 
      If Not rs.EOF Then 
      ' Nếu tồn tại chương trước đó, hiển thị nút quay lại chương
 %>
     <button>   <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"><b> Chương Trước </b></a>  </button>
 <%
     End If
 End If
 %>
  <button>
 <a href="testTrangTruyen.asp?id_truyen=<%= id_truyen %>"><b> Mục lục </b></a></button>
 <%
 If id_truyen <> "" Then
     ' Kiểm tra xem chương đó có phải là chương cuối cùng hay không Dim strSQLNextChapter
      strSQLNextChapter="SELECT TOP 1 * FROM chuong WHERE id_truyen = " & id_truyen& " AND id_chuong > " & id_chuong & " ORDER BY id_chuong ASC" 
      Set conn=Server.CreateObject("ADODB.Connection")
      conn.Open "Provider=SQLOLEDB.1;Data Source=VIET\MSSQLSERVER01;Database=Web_doc_truyen;User Id=sa;Password=123456"
      Set rs=conn.Execute(strSQLNextChapter) 
      If Not rs.EOF Then 
      ' Nếu tồn tại chương tiếp theo, hiển thị nút chuyển chương tiếp
 %>
       <button>
       <a href="doc.asp?id_chuong=<%= rs("id_chuong") %>&id_truyen=<%= id_truyen %>"><b> Chương Sau </b> </a>    </button>
 
 <%
     End If
 
   
 End If
 %>
 
</div>
      <div id="comment-section">
 <!-- #include file="ViewComments.asp" -->
   </div>
 </div>
   <%
     Set rs = Nothing
     %>
   </body>
 </html>
   