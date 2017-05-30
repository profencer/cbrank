<%
Dim Connection
Set conn = Server.CreateObject("ADODB.Connection")
'добавить пользователей приложения в писателей и изменятелей файла бд
conn.Open"Provider=Microsoft.Jet.OLEDB.4.0;Data source ="&Server.MapPath("./db2.mdb")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="INSERT INTO grates ([id],[employee],[date],"
sql=sql & "[value],[desc])"
sql=sql & " VALUES "
sql=sql & "('" & Nothing & "',"
sql=sql & "'" & CInt(Request.QueryString("e")) & "',"
sql=sql & "'" & CDate(Request.QueryString("d")) & "',"
sql=sql & "'" & CInt(Request.QueryString("v")) & "',"
sql=sql & "'" & Request.QueryString("cb") & "')"
'добавить сендера 

on error resume next
conn.Execute sql,recaffected
if err<>0 then
  Response.Write(err.Description)
else
  Response.Write("<h3>" & recaffected & " record added</h3>")
end if
conn.close
%>