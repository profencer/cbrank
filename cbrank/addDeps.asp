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
if request.Form("desc") <> "" Then
    Set rs= Server.CreateObject("ADODB.Recordset")
    sql="INSERT INTO posts ([desc]"
    sql=sql & ")"
    sql=sql & " VALUES "
    sql=sql & "('" & request.Form("desc") 
    sql=sql & "')"
    on error resume next
    conn.Execute sql
    if err<>0 then
      Response.Write(err.Description)
    else
      Response.Write("<h3> Должность создана!</h3> ")
    end if
end if
%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
  <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <TITLE>Добавить должность</TITLE>
 <meta name="robots" content="noindex,nofollow">
</HEAD>
<BODY BGColor=white>


<Div style=width:600>






<h3>Добавить должность</h3>
    <form method="post">
      <fieldset>
         <div class="pure-control-group">
                <label for="fio">Название</label>
                <textarea name="desc" id="fio" /></textarea>
        </div>
        
        <input type="submit" value="Отправить">
      </fieldset>
    </form>









</Div>
</BODY></HTML>
