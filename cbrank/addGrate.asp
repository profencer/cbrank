<%
Dim Connection
Set conn = Server.CreateObject("ADODB.Connection")

conn.Open"Provider=Microsoft.Jet.OLEDB.4.0;Data source ="&Server.MapPath("./db.mdb")
Set rs = Server.CreateObject("ADODB.Recordset")
sql="INSERT INTO grates (employee,date,"
sql=sql & "value,desc)"
sql=sql & " VALUES "
sql=sql & "('" & Request.QueryString("e") & "',"
sql=sql & "'" & Request.QueryString("d") & "',"
sql=sql & "'" & Request.QueryString("v") & "',"
sql=sql & "'" & Request.QueryString("cb") & "')"
'добавить сендера 

%>