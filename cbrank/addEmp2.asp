
<%Option Explicit @CHARSET="65001"%>
<% Response.Charset= "utf-8"%>
<!--#INCLUDE FILE="clsUpload.asp"-->
<%
  Function Encode_UTF8(astr) 
dim utftext,c,n
utftext = "" 

For n = 1 To Len(astr) 
c = AscW(Mid(astr, n, 1)) 
If c < 128 Then 
utftext = utftext + Mid(astr, n, 1) 
ElseIf ((c > 127) And (c < 2048)) Then 
utftext = utftext + Chr(((c \ 64) Or 192)) 
'((c>>6)|192); 
utftext = utftext + Chr(((c And 63) Or 128)) 
'((c&63)|128);} 
Else 
utftext = utftext + Chr(((c \ 144) Or 234)) 
'((c>>12)|224); 
utftext = utftext + Chr((((c \ 64) And 63) Or 128)) 
'(((c>>6)&63)|128); 
utftext = utftext + Chr(((c And 63) Or 128)) 
'((c&63)|128); 
End If 
Next 
Encode_UTF8 = utftext 
End Function 
%>

<%
Dim conn,rs,sql
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open"Provider=Microsoft.Jet.OLEDB.4.0;Data source ="&Server.MapPath("./db2.mdb")


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



Dim objUpload
Dim strFileName
Dim strPath

' Instantiate Upload Class
Set objUpload = New clsUpload

' Grab the file name
strFileName = objUpload.Fields("file").FileName

' Compile path to save file to
strPath = Server.MapPath("Uploads") & "\" & strFileName

' Save the binary data to the file system
objUpload("file").SaveAs strPath

' Release upload object from memory
Set objUpload = Nothing
    Set rs = Server.CreateObject("ADODB.Recordset")
    sql="INSERT INTO employees ([fullname],[department],"
    sql=sql & "[post],[pic])"
    sql=sql & " VALUES "
    sql=sql & "('" & objUpload.Fields("fio") & "',"
    sql=sql & "'" & CInt(objUpload.Fields("d")) & "',"
    sql=sql & "'" & CInt(objUpload.Fields("p")) & "',"
    sql=sql & "'" & strFileName & "')"
    'on error resume next
    conn.Execute sql
    'if err<>0 then
    '  Response.Write(err.Description)
    'else
    '  Response.Write("<h3> Пользователь создан!</h3> ")
    'end if
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
                <label for="d">Подразделение</label>
                <select name="d" id="d">
                    <% 
                    Dim d
                    For Each d In deps %>
                        <option value="<%=d%>"><%=Encode_UTF8(deps(d)) %></option>
                    <% Next %>
                </select>
        </div>
        <div class="pure-control-group">
                <label for="p">Должность</label>
                <select name="p" id="p">
                    <% 
                    Dim p
                    For Each p In posts %>
                        <option value="<%=p%>"><%=Encode_UTF8(posts(p)) %></option>
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
