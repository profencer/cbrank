<%@CODEPAGE=65001%>
<%
Dim Connection,xs
Set conn = Server.CreateObject("ADODB.Connection")
'добавить пользователей приложения в писателей и изменятелей файла бд
conn.Open"Provider=Microsoft.Jet.OLEDB.4.0;Data source ="&Server.MapPath("./db2.mdb")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="INSERT INTO grates ([employee],[date],"
sql=sql & "[value],[desc])"
sql=sql & " VALUES "
sql=sql & "('" & CInt(Request.QueryString("e")) & "',"
sql=sql & "'" & CDate(Request.QueryString("d")) & "',"
sql=sql & "'" & CInt(Request.QueryString("v")) & "',"
sql=sql & "'" & Request.QueryString("cb") & "')"
'добавить сендера 

on error resume next
conn.Execute sql,recaffected
%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
  <body>

<%
if err<>0 then
  Response.Write(err.Description)
else
  Response.Write("<h3> Запись добавлена!</h3> <a href='index.asp'>Назад</a>")
end if
conn.close
%>
</body>
</html>