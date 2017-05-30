<%

Option Explicit
'Stores only files with size less than MaxFileSize


Dim DestinationPath
DestinationPath = Server.mapPath("UploadFolder")

'Create upload form
'Using Huge-ASP file upload
'Dim Form: Set Form = Server.CreateObject("ScriptUtils.ASPForm")
'Using Pure-ASP file upload
Dim Form: Set Form = New ASPForm %><!--#INCLUDE FILE="_upload.asp"--><% 


Server.ScriptTimeout = 2000
Form.SizeLimit = &H100000

If Form.State = 0 Then 'Completted
	Form.Files.Save DestinationPath 
	response.write "<br><Font Color=green>Files (" & Form.TotalBytes \1024 & "kB) was saved to " & DestinationPath & " folder.</Font>"
ElseIf Form.State > 10 then
  Const fsSizeLimit = &HD
  Select case Form.State
		case fsSizeLimit: response.write  "<br><Font Color=red>Source form size (" & Form.TotalBytes & "B) exceeds form limit (" & Form.SizeLimit & "B)</Font><br>"
		case else response.write "<br><Font Color=red>Some form error.</Font><br>"
  end Select
End If'Form.State = 0 then

Session.CodePage=65001


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

response.write(request.from("fio"))

%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
  <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <TITLE>ASP huge file upload - base upload.</TITLE>
 <meta name="robots" content="noindex,nofollow">
</HEAD>
<BODY BGColor=white>


<Div style=width:600>






<h3>Добавить сотрудника</h3>
    <form enctype="multipart/form-data" method="POST">
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
                        <option value="<%=d%>"><%=deps(d) %></option>
                    <% Next %>
                </select>
        </div>
        <div class="pure-control-group">
                <label for="p">Должность</label>
                <select name="p" id="p">
                    <% 
                    Dim p
                    For Each p In posts %>
                        <option value="<%=p%>"><%=posts(p) %></option>
                    <% Next %>
                </select>
        </div>
         <div class="pure-control-group">
                <label for="file">Фотография</label>
                <input name="file1" id="file" type="file"/>
        </div>
        <input type="submit" value="Отправить">
      </fieldset>
    </form>









</Div>
</BODY></HTML>
