<!--#include file="connect.asp"-->


<%
Dim email, password
email = Request.Form("email")
password = Request.Form("password")
If (NOT isnull(email) AND NOT isnull(password) AND TRIM(email)<>"" AND TRIM(password)<>"" ) Then
    ' true
    Dim sql
    sql = "select * from nguoi_dung where email= ?  and mat_khau= ?"
    Dim cmdPrep
    set cmdPrep = Server.CreateObject("ADODB.Command")
    connDB.Open()
    cmdPrep.ActiveConnection = connDB
    cmdPrep.CommandType=1
    cmdPrep.Prepared=true
    cmdPrep.CommandText = sql
    cmdPrep.Parameters(0)=email
    cmdPrep.Parameters(1)=password
    Dim result
    set result = cmdPrep.execute()
    
    'kiem tra ket qua result o day
    If not result.EOF Then
        ' dang nhap thanh cong
        Session("email")=result("email")
        Session("Success")= "Login thanh cong!!!"
        
        Response.Redirect("index.asp?email=" & email)
       
    Else
        ' dang nhap ko thanh cong
        Session("Error") = "Sai email hoặc mật khẩu"
    End if
    result.Close()
    connDB.Close()
Else
    ' false
    Session("Error")="Hãy nhập email hoặc mật khẩu."
End if

'Lay ve thong tin dang nhap gom email va password

'Validate thong tin dang nhap

'Kiem tra thong tin xem co ton tai trong bang taikhoan hay khong

'Neu ton tai thi dang nhap thanh cong, tao Session, redirect toi trang quan tri

'Neu dang nhap ko thanh cong, thi thong bao loi.
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Đăng nhập</title>
    </head>
   
          
    <body>        
        <!-- #include file="header.asp" -->
        <style>
            .boder {
      margin-top: 50px;
      border: 1px solid #a5a2a2d1;
      padding: 20px;
      max-width: 1000px;
      margin: 0 auto;}
    </style>
     
        <div class="container">
               , <div class="boder" >

            <form method="post" action="login.asp">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" class="form-control" id="email" name="email" value="<%=email%>">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div> 
                <button type="submit" class="btn btn-primary">Đăng nhập</button>
            </form>
        </div>
    </div>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        -->
    </body>
</html>