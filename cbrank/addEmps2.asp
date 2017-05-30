<%

Option Explicit

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
dim res
if request.Form("fio") <> "" Then
    Set rs= Server.CreateObject("ADODB.Recordset")
    sql="INSERT INTO employees ([fullname],[department],"
    sql=sql & "[post],[pic])"
    sql=sql & " VALUES "
    sql=sql & "('" & request.Form("fio") & "',"
    sql=sql & "'" & CInt(request.Form("d")) & "',"
    sql=sql & "'" & CInt(request.Form("p")) & "',"
    sql=sql & "'" & request.Form("pic") & "')"
    on error resume next
    conn.Execute sql
    if err<>0 then
      Response.Write(err.Description)
    else
      Session("path") = ""
      res = " Пользователь создан!"
    end if
end if
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
  <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <TITLE>Добавить сотрудника - шаг 2.</TITLE>
 <meta name="robots" content="noindex,nofollow">
</HEAD>
<BODY BGColor=white>


<Div style=width:600>





<h3><%=res%></h3>
<h3>Добавить сотрудника c фото <%=Session("path")%></h3>
    <form method="post">
      <fieldset>
        <input type="text" style="display:none" name="pic" value="<%=Session("path")%>">
        <div class="pure-control-group">
                <label for="fio">Фио</label>
                <textarea name="fio" id="fio" /></textarea>
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
        <input type="submit" value="Отправить">
      </fieldset>
    </form>









</Div>
</BODY></HTML>
