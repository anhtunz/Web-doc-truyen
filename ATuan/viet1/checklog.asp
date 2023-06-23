
<!-- #include file="connect.asp" -->

<%
  Dim email
  email = Request.Form("loginemail")
  Dim password
  password = Request.Form("loginpass")
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
        
        Response.Redirect("/viet1/index.asp?email=" & email)
       
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
%>
    <p>Email: <%=email%></p>
    <p>Password: <%=password%></p>

