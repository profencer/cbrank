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
  response.write(Form("fio"))
	response.write "<br><Font Color=green>Files (" & Form.TotalBytes \1024 & "kB) was saved to " & DestinationPath & " folder.</Font>"
  Session("path") = DestinationPath
  response.write "<br><a href='addEmps2.asp'>Заполнить данные сотрудника</a>
  
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





%>  
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
  <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <TITLE>Добавить сотрудника</TITLE>
 <meta name="robots" content="noindex,nofollow">
</HEAD>
<BODY BGColor=white>


<Div style=width:600>






<h3>Добавить сотрудника</h3>
  <form enctype="multipart/form-data" method="post">
         <div class="pure-control-group">
                <label for="file">Загрузите фотографию</label>
                <input name="file1" id="file" type="file"/>
        </div>
        <input type="submit" value="Отправить">
      </fieldset>
    </form>









</Div>
</BODY></HTML>
