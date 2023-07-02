<%@LANGUAGE="VBSCRIPT" CODEPAGE = "65001"%>
<%
Response.CodePage = 65001
Response.CharSet = "UTF-8"
%>
<%
'code here
Dim connDB
set connDB = Server.CreateObject("ADODB.Connection")
Dim strConnection
strConnection = "Provider=SQLOLEDB.1;Data Source=DESKTOP-4N36RC0;Database=Web_doc_truyen;User Id=lam1;Password=123456789;"
connDB.ConnectionString = strConnection
Response.ContentType = "text/html"
Response.AddHeader "Content-Type", "text/html;charset=UTF-8"
Response.CodePage = 65001
Response.CharSet = "UTF-8"
%>
