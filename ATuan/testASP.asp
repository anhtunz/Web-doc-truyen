<!DOCTYPE html>
<html>
<head>
<%
sub vbproc(num1,num2)
response.write(num1*num2)
end sub
    
    i=hour(time)
    If i = 10 Then
        response.write("Just started...!")
    ElseIf i = 11 Then
        response.write("Hungry!")
    ElseIf i = 12 Then
        response.write("Ah, lunch-time!")
    ElseIf i = 15 Then
        response.write("Time to go home!")
    Else
        response.write("Unknown")
    
    End If


%>
</head>
<body>

<p>Result: <%call vbproc(3,4)%></p>
</body>
</html>