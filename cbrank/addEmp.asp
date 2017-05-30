<%@ Language=VBScript %>
<%Option Explicit%>
<% Response.Charset= "utf-8"%>
<!-- #include file="upload.asp" -->
<%
Dim conn,rs,sql
Set conn = Server.CreateObject("ADODB.Connection")
'добавить пользователей приложения в писателей и изменятелей файла бд
conn.Open"Provider=Microsoft.Jet.OLEDB.4.0;Data source ="&Server.MapPath("./db2.mdb")
'Set rs = Server.CreateObject("ADODB.Recordset")
'sql="INSERT INTO grates ([employee],[date],"
'sql=sql & "[value],[desc])"
'sql=sql & " VALUES "
'sql=sql & "('" & CInt(Request.QueryString("e")) & "',"
'sql=sql & "'" & CDate(Request.QueryString("d")) & "',"
'sql=sql & "'" & CInt(Request.QueryString("v")) & "',"
'sql=sql & "'" & Request.QueryString("cb") & "')"
'добавить сендера 

'on error resume next
'conn.Execute sql,recaffected
'if err<>0 then
'  Response.Write(err.Description)
'else
'  Response.Write("<h3> Запись добавлена!</h3> <a href='index.asp'>Назад</a>")
'end if

Dim posts
Dim postid,rsPosts
Set posts = Server.CreateObject("Scripting.Dictionary")
Set rsPosts = Server.CreateObject("ADODB.Recordset")
rsPosts.Open "SELECT * FROM posts", conn	
Do While not rsPosts.EOF 
  desc = rsPosts("desc").Value
  postid = rsPosts("id").Value
  posts.Add postid ,desc 
  rsPosts.MoveNext 
Loop
rsPosts.close()

Dim deps,xs,rsDeps
Set deps=Server.CreateObject("Scripting.Dictionary")
Set rsDeps = Server.CreateObject("ADODB.Recordset")
rsDeps.Open "SELECT * FROM departments", conn
dim id 	
Do While not rsDeps.EOF 
  'Write the HTML to display the current record in the recordset
  id = rsDeps("id") 
  if Not deps.Exists(id) Then
    dim desc
    desc = rsDeps("desc")
    deps.Add id, desc
  end if
  rsDeps.MoveNext 
Loop
rsDeps.close()

conn.close

  Dim Uploader, File
  Set Uploader = New FileUploader

  ' This starts the upload process
  Uploader.Upload()
  
  If Uploader.Files.Count = 0 Then
	Response.Write "File(s) not uploaded."
  Else
	' Loop through the uploaded files
	For Each File In Uploader.Files.Items
    File.SaveToDisk "C:\cb\cbrank\cbrank\"
  Next
	Response.Write "File Uploaded: " & File.FileName & "<br>"
  end if
  Session.CodePage = 65001
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
  <body>
    <h3>Добавить сотрудника</h3>
    <form action="addEmp.asp" enctype="multipart/form-data" method="POST">
      <fieldset>
        <div class="pure-control-group">
                <label for="fio">Фио</label>
                <input name="fio" id="fio" type="text"/>
        </div>
        <div class="pure-control-group">
                <label for="e">Подразделение</label>
                <select name="e" id="e">
                    <% 
                    Dim d
                    For Each d In deps %>
                        <option value="<%=d%>"><%=deps(d) %></option>
                    <% Next %>
                </select>
        </div>
        <div class="pure-control-group">
                <label for="e">Должность</label>
                <select name="e" id="e">
                    <% 
                    Dim p
                    For Each p In posts %>
                        <option value="<%=p%>"><%=posts(p) %></option>
                    <% Next %>
                </select>
        </div>
         <div class="pure-control-group">
                <label for="file">Фотография</label>
                <input name="file" id="file" type="file"/>
        </div>
        <input type="submit" value="Отправить">
      </fieldset>
    </form>
  </body>
</html>
