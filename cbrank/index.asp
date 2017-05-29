<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
       <!--css reset--> <style>
           

/* http://meyerweb.com/eric/tools/css/reset/ 
   v2.0 | 20110126
   License: none (public domain)
*/

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

           </style> 
        <style>
            body{
                margin:0px;
            }
            .container{
                position:absolute;
                display:block;
                width:100%;
                height:100%;
                padding:0px;
                
                background: url("https://upload.wikimedia.org/wikipedia/commons/e/e0/Moskva_City2015.jpg") no-repeat center center fixed; 
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            table{
                height:100%;
                width:100%;
                border-collapse: collapse;
                border:2px solid #333;
                overflow:hidden;
            }
            td{
                width:10%;
                height:10%;
                padding:0px;
                margin:0px;
                border:2px solid #333;
                background:black;
                opacity:0.785;
                overflow:hidden;
                vertical-align:top;
                
            }
            td.opened{
                opacity:1;
                background:none;
                cursor:pointer;
                
            }
            .pulse {
                width: 10px;
                height: 10px;
                border: 5px solid #f7f14c;
                -webkit-border-radius: 30px;
                -moz-border-radius: 30px;
                border-radius: 30px;
                background-color: #716f42;
                z-index: 10;
                position: absolute;
            }

            .pulse-container {
                
                margin-left:30px;
                margin-top:30px;
                position: relative;
                cursor:pointer;
            }

            .dot {
            width: 10px;
            height: 10px;
            border: 5px solid #F00;
            border-radius: 600px;
            background-color: #F00;
            z-index: 10;
            position: absolute;
            
            }

            .base-pulse{
            background: transparent;
            border-radius: 600px;
            height: 50px;
            width: 50px;
            position: absolute;
            top: -20px;
            left: -20px;
            z-index: 1;
            opacity: 0;
            border: 5px solid #FF0;
             
            }

            .pulse1 {
            -webkit-animation: pulse1 2s ease-out infinite;
                    animation: pulse1 2s ease-out infinite;
            }
            .pulse2 {
            /*  animation: pulse1 2s ease-out infinite;
            animation-delay: 500ms;*/
            }
            .pulse3 {
            -webkit-animation: pulse1 2s ease-out infinite;
                    animation: pulse1 2s ease-out infinite;
            -webkit-animation-delay: 1000ms;
                    animation-delay: 1000ms;
            }
            .pulse4 {
            /*  animation: pulse1 2s ease-out infinite;
            animation-delay: 1500ms;*/
            }

            @-webkit-keyframes "pulse1" {
                0%   {-webkit-transform: scale(0.1, 0.1);transform: scale(0.1, 0.1); opacity: 0.0;}
                50%  {opacity: 1.0;}
                100% {-webkit-transform: scale(1.2, 1.2);transform: scale(1.2, 1.2); opacity: 0.0;}
            }
            .topnav {
                position:absolute;
                background-color: #333;
                overflow: hidden;
                z-index:100;
                width:100%;
                height:50px;
                
            }
            .topnav img{
                position:absolute;
            }
            .title{
                position:absolute;
                padding-left:50px;
                width:100%;
                text-align:center;
                padding:15px;
                padding-left:0px;
                text-transform: uppercase;
                color:white;
                font-weight: 20em;
                font-family: PT Sans Caption,Helvetica Neue,Helvetica,Arial,sans-serif;
            }
            .grate{
                 position:relative;
                width:100%;
                height:100%;
                opacity:0;
                text-transform: uppercase;
                color:white;
                font-size: 1rem;
                font-family: PT Sans Caption,Helvetica Neue,Helvetica,Arial,sans-serif;
                text-align:center;
                background:red;
                padding-top:5px;
                line-height: 0.8;
                -webkit-transition: all 0.2s ease-in-out;
                -moz-transition: all 0.2s ease-in-out;
                -o-transition: all 0.2s ease-in-out;
                transition: all 0.2s ease-in-out;
                
            }
            td.opened:hover .grate{
                
                
                opacity:1;
            }
            .thumbsup{
                position:absolute;
                width:50%;
                
                background-color:#f1c40f;
                border-radius:100px;
                left:50%;
                margin-left:-25%                
                
            }



            .modal {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 20;
  padding: 30px;
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
  opacity: 0;
  visibility: hidden;
  -webkit-transition: visibility 0s linear 0.1s,opacity 0.3s ease;
  transition: visibility 0s linear 0.1s,opacity 0.3s ease;
}
.modal.open {
  visibility: visible;
  opacity: 1;
  -webkit-transition-delay: 0s;
          transition-delay: 0s;
}
.modal__overlay {
  position: fixed;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  z-index: 21;
  background-color: rgba(0, 0, 0, 0.7);
}
.modal__close {
  position: absolute;
  top: 10px;
  right: 10px;
  border: none;
  outline: none;
  background: none;
  font-size: 24px;
  color: #747474;
  font-weight: bold;
}
.modal__close:hover {
  color: #000;
}
.modal__container {
  position: relative;
  z-index: 22;
  width: 400px;
  height: auto;
  top: 50%;
  -webkit-transform: translateY(-50%);
          transform: translateY(-50%);
  box-shadow: 0 0 10px #fff;
  margin: 0 auto;
  padding: 30px;
  background-color: #fff;
  text-align: center;
}
 .dummy{
     display:none;
 }
 .avatar{
                width:128px;
                height:128px;
                padding:2px;
                
                margin:0 auto;
                
}
.avatar img{
    width:128px;
    height:128px;
    border-radius:100px;
}
form div{
    margin:15px;
    text-align:left;
}

        </style>
    </head>
    <body>
        <div class="container">
             <div class="topnav" id="myTopnav">
                 <img height="50px" src="http://media.lpgenerator.ru/images/310017/cbr.png">
                 <div class="title">
                     <% @ codepage=65001 %>
                    <% Response.Charset= "utf-8"%>



                    <%
                        function print_r(data, dumpRef)
  dim dumpData
  if isArray(data) or cbool(instr(TypeName(data),"Dictionary")) or TypeName(data) = "ISessionObject" then
    dumpData = dump(data, 0)
  else
    if TypeName(data) = "Recordset" then
      dumpData = dumpQuery(data)
    else
      dumpData = TypeName(data) & ": " & data
    end if
  end if 
  dumpData = "----------- DUMP CALLED " & dumpRef &" -------------" & vbcrlf & dumpData
  globalDumpData = globalDumpData & vbcrlf & dumpData
  if left(dumpRef,5) = "<pre:" then
    response.write "<pre>"&dumpData&"</pre>"
    if dumpRef = "<pre:stop>" then
      response.end
    end if
  end if
  print_r = dumpData
end function
 
function dumpQuery(recordset)
  dim col, header, data, wrapper, q
  wrapper = "<table border=""1"">"&vbcrlf
  set q = recordset
  q.movefirst
  if q.absoluteposition = 1 then
    header = "  <tr>" & vbcrlf
    for each col in q.fields
      header = header & "    <th align=""left"" valign=""top"">"&col.name&"</th>" & vbcrlf
    next
    header = header & "  </tr>" & vbcrlf
    q.movefirst
  end if
 
  data =   rs.GetString(2, q.recordcount+1, "</td>" & vbcrlf & "    <td valign=""top"">", "[#]", "")
  data = left(data, len(data) - 3)
  data = replace(data, "[#]", "</td>" & vbcrlf & "  </tr>" & vbcrlf & "  <tr>" & vbcrlf & "    <td valign=""top"">")
  data = "  <tr>" & vbcrlf & "    <td valign=""top"">" & data & "</td>" & vbcrlf & "  </tr>"
  wrapper = wrapper & header & data & vbcrlf & "</table>"
  q.movefirst
  dumpQuery = wrapper
end function
 
function dump(data, depth)
  dim output, x
  if isArray(data) then
    output = "Array <br />"
    output = output & Tab(depth) & "(<br />"
    for x=0 to uBound(data)
      output = output & Tab(depth+1) & "["&x&"] => "
      output = output & dump(data(x), depth+2) 
      output = output & "<br />"
    next
    output = output & Tab(depth) & ")"
  elseif cbool(instr(TypeName(data),"Dictionary")) then
    output = TypeName(data) & " <br />"
    output = output & Tab(depth) & "(<br />"
    for each x in data
      output = output & Tab(depth+1) & "["&x&"] => "
      output = output & dump(data(x), depth+2) 
      output = output & "<br />"
    next
    output = output & Tab(depth) & ")"
  elseif TypeName(data) = "ISessionObject" then
    output = TypeName(data) & "<br />(<br/>"& Tab(depth+1) & "Contents<br />"
    output = output & Tab(depth+1) & "(<br />"
    for each x in data.contents
      output = output & Tab(depth+2) & "["&x&"] => "
      output = output & dump(data(x), depth+2) 
      output = output & "<br />"
    next
    output = output & Tab(depth+1) & ")<br/><br/>"
    output = output & Tab(depth+1) & "StaticObjects<br />"
    output = output & Tab(depth+1) & "(<br />"
    for each x in data.StaticObjects
      output = output & Tab(depth+2) & "["&x&"] => "
      output = output & dump(data(x), depth+2) 
      output = output & "<br />"
    next
    output = output & Tab(depth+1) & ")<br/>"
    output = output & Tab(depth) & ")"
  elseif TypeName(data) = "Recordset" then
    output = output & dumpQuery(data)
    output = output & "<br />"
  else
    output = output & data
  end if
  dump = output
end function
 
public function Tab(spaces)
  dim val, x
  val = ""
  for x=1 to spaces
    val = val & "    "
  next
  Tab = val
end function
                    
                    %>
                     <%

                     Dim Connection
Set conn = Server.CreateObject("ADODB.Connection")

conn.Open"Provider=Microsoft.Jet.OLEDB.4.0;Data source ="&Server.MapPath("./db.mdb")
            Dim deps
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
            

            Dim posts
            Set posts = Server.CreateObject("Scripting.Dictionary")
            Set rsPosts = Server.CreateObject("ADODB.Recordset")
            rsPosts.Open "SELECT * FROM posts", conn	
            Do While not rsPosts.EOF 
                
                desc = rsPosts("desc").Value
                
                id = rsPosts("id").Value
                posts.Add id ,desc 
                rsPosts.MoveNext 
            Loop
            rsPosts.close()

            Dim emps
            Set emps=Server.CreateObject("Scripting.Dictionary")
            Set rsEmps = Server.CreateObject("ADODB.Recordset")
            rsEmps.Open "SELECT * FROM employees", conn	
            Dim emp
            dim fname 
            dim dep
            dim pic
            Do While not rsEmps.EOF 
                
                
                Set emp=Server.CreateObject("Scripting.Dictionary")
                
                
                fname = rsEmps.Fields.Item("fullname").Value
                emp.Add "fname", fname
                
                dep = rsEmps.Fields.Item("department").Value
                emp.Add "department", dep
                
                
                pic = rsEmps.Fields.Item("pic").Value
                emp.Add "pic", pic 
                
                
                id = rsEmps.Fields.Item("id").value
                'if Not emps.Exists(id) Then
                    emps.Add id,emp  
                'end if
                rsEmps.MoveNext 
            Loop
            For Each e In emps 
                'response.write(emps.Item(e).Item("fname"))
            Next
            rsEmps.close()
            Dim grates
            Set grates=Server.CreateObject("Scripting.Dictionary")
            Set rsGrates = Server.CreateObject("ADODB.Recordset")
            rsGrates.Open "SELECT * FROM grates", conn	
            Dim date
            Dim val
            Dim GrateCount 
            GrateCount = 0
            Do While not rsGrates.EOF
                Dim grate
                Set grate=Server.CreateObject("Scripting.Dictionary")
                emp = rsGrates("employee").Value
                grate.Add "emp", emp

                set date = rsGrates("date")
                grate.Add "date", date
                val = rsGrates("value")
                grate.Add "value", val 
                desc = rsGrates("desc")
                grate.Add "desc", desc 
                id = rsGrates("id")
                grates.Add id ,grate 
                GrateCount = GrateCount + 1
                rsGrates.MoveNext
            Loop
            rsGrates.close()
            conn.close()
            dim a
            dim s
            
            for each e in posts
                Response.Write(e)
            next
            
            %>
                    Раскрываем ценности Банка России каждый день!
                 </div>
            </div> 
            
            <table>
                <%
                    Dim rows
                    rows = 10
                    Dim cols
                    cols = 10
                    For i = 1 to rows
                %>
                    <tr>
                <%
                        For j = 1 to cols
                %>
                    
                        <%
                            dim num
                            num = GrateCount - (rows - i)*cols + j - 1
                            dim r
                            r = grates.Items

                            if num<=GrateCount AND num > 0 Then 
                        %>
                            <td class="opened">
                                <div class="grate jsModalTrigger" href="#jsModal<%=num%>">
                                    <div class="thumbsup">
                                    <img width="100%"  class="icon icons8-Thumb-Up" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABiklEQVRoge2YO27CQBRFWQJLyAaQ2EN2QUXEAkKTtHl0WUGaQEOBUSSKsAIrrceyKbAiKOxUKROh0CHdFEwkTPB/PhjNkV5/j+f5Wp5Gw2AwGC4euNQHI4BRCDa41Z2nMGD0zQX241JXd6bcwKN2LDw/Cd25cnOwPrHRnSs3YOTXVgAeXZ0KXx8Bh+zaCiTtPh9fd75U4FI3JTzgkK07YyIJtRkfl/q6c56Eh//KFPCorTvrP3jjZIc/x/WBR0049JEZvtiEcAcP5VM9PSLPwKMmGL0LDn94YiRXIOFLK/IkZAvInqjeAgpWSNqTLx9eg8DPyw024w424w62sx529t2nmhYSKLCd9bB7u7+YFfob00Kmhco++dq0kPgG0iAgtoEUC6RMhfuj8xCIhAi0piM8Bz4mqwDXr5Y6AVErNFwuMA/XmIdrTFaBCoGKDZQiYAkWkNNARwKt6QjD5QKWhBWS00BHAppe4oo32PkFZP1SRmoE9j/14iUqr1BB+HWiCBEBDWQwGAyq+AXaWUD/bOYqiQAAAABJRU5ErkJggg==">
                                    </div>
                                </div>
                            </td>
                        <%
                            else
                        %>
                            <td><%=num%> "" <%=GrateCount%></td>
                        <%
                            end if  
                            if num=GrateCount1 Then
                        %>
                        <td> <div class="pulse-container jsModalTrigger" href="#jsModalForm">
                            <div class="base-pulse pulse1"></div>
                            <div class="base-pulse pulse2"></div>  
                            <div class="base-pulse pulse3"></div>
                            <div class="base-pulse pulse4"></div>
                            <div class="dot"></div>
                        </div></td>
                <%
                        end if
                        Next
                        
                %>
                    </tr>
                <%
                    Next
                %>
                <!--
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="opened">
                        <div class="grate jsModalTrigger" href="#jsModal">
                            <div class="thumbsup">
                            <img width="100%"  class="icon icons8-Thumb-Up" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABiklEQVRoge2YO27CQBRFWQJLyAaQ2EN2QUXEAkKTtHl0WUGaQEOBUSSKsAIrrceyKbAiKOxUKROh0CHdFEwkTPB/PhjNkV5/j+f5Wp5Gw2AwGC4euNQHI4BRCDa41Z2nMGD0zQX241JXd6bcwKN2LDw/Cd25cnOwPrHRnSs3YOTXVgAeXZ0KXx8Bh+zaCiTtPh9fd75U4FI3JTzgkK07YyIJtRkfl/q6c56Eh//KFPCorTvrP3jjZIc/x/WBR0049JEZvtiEcAcP5VM9PSLPwKMmGL0LDn94YiRXIOFLK/IkZAvInqjeAgpWSNqTLx9eg8DPyw024w424w62sx529t2nmhYSKLCd9bB7u7+YFfob00Kmhco++dq0kPgG0iAgtoEUC6RMhfuj8xCIhAi0piM8Bz4mqwDXr5Y6AVErNFwuMA/XmIdrTFaBCoGKDZQiYAkWkNNARwKt6QjD5QKWhBWS00BHAppe4oo32PkFZP1SRmoE9j/14iUqr1BB+HWiCBEBDWQwGAyq+AXaWUD/bOYqiQAAAABJRU5ErkJggg==">
                            </div>
                            
                            <p style="padding-top:70px" id="fio">Фамилия Имя</p>
                            <p id="date">01/01/1960</p>
                        </div>
                    </td>
                    <td> <section class="pulse-container jsModalTrigger" href="#jsModalForm">
                            <div class="base-pulse pulse1"></div>
                            <div class="base-pulse pulse2"></div>  
                            <div class="base-pulse pulse3"></div>
                            <div class="base-pulse pulse4"></div>
                            <div class="dot"></div>
                        </section></td>
                    <td></td>
                    <td></td>
                    <td>
                        
                    </td>
                </tr>
                -->
            </table>
        </div>
        <div class="dummy">
            <div class="grate jsModalTrigger" href="#jsModal2">
                            <div class="thumbsup">
                            <img width="100%"  class="icon icons8-Thumb-Up" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABiklEQVRoge2YO27CQBRFWQJLyAaQ2EN2QUXEAkKTtHl0WUGaQEOBUSSKsAIrrceyKbAiKOxUKROh0CHdFEwkTPB/PhjNkV5/j+f5Wp5Gw2AwGC4euNQHI4BRCDa41Z2nMGD0zQX241JXd6bcwKN2LDw/Cd25cnOwPrHRnSs3YOTXVgAeXZ0KXx8Bh+zaCiTtPh9fd75U4FI3JTzgkK07YyIJtRkfl/q6c56Eh//KFPCorTvrP3jjZIc/x/WBR0049JEZvtiEcAcP5VM9PSLPwKMmGL0LDn94YiRXIOFLK/IkZAvInqjeAgpWSNqTLx9eg8DPyw024w424w62sx529t2nmhYSKLCd9bB7u7+YFfob00Kmhco++dq0kPgG0iAgtoEUC6RMhfuj8xCIhAi0piM8Bz4mqwDXr5Y6AVErNFwuMA/XmIdrTFaBCoGKDZQiYAkWkNNARwKt6QjD5QKWhBWS00BHAppe4oo32PkFZP1SRmoE9j/14iUqr1BB+HWiCBEBDWQwGAyq+AXaWUD/bOYqiQAAAABJRU5ErkJggg==">
                            </div>
                            
                            <p id="fio">Фамилия Имя</p>
                            <p id="date">01/01/1960</p>
            </div>
        </div>
        <%
        dim cc
        cc = 1
        For Each e In grates 
        %>
        <div id="jsModal<%=cc%>" class="modal">
            <div class="modal__overlay jsOverlay"></div>
            <div class="modal__container">
                <div class="avatar">
                            <img   class="icon icons8-Thumb-Up" src="http://www.newsbiscuit.com/wp-content/uploads/2011/03/362-hester.jpg">
                </div>
                <p style="font-size:12px; font-weight:bold;" id="fio"><%=emps.Item(1).Item(fname)%></p>
                <p style="font-size:12px; font-weight:bold;" id="date"><%=%></p>
                <p><b><%=grates(e).Item("value")%></b></p>
                <p align="justify"><%=grates(e).Item("desc")%>
                </p>
                <button class="modal__close jsModalClose">&#10005;</button>
            </div>
        </div>
         <%
         cc = cc + 1 
         Next %>
        <div id="jsModalForm" class="modal">
            <div class="modal__overlay jsOverlay"></div>
            <div class="modal__container">
                <h2>Отправить благодарность!</h2>
                <form class="pure-form pure-form-aligned">
    <fieldset>
        
        <div class="pure-control-group">
            <label for="e">Сотрудник</label>
            <select id="e">
                <% 
                For Each e In emps %>
                    <option><%=emps.Item(e).Item("fname") %></option>
                <% Next %>
                            </select>
        </div>
        <div class="pure-control-group">
            <label for="d">Дата</label>
            <input id="d" type="date"/>
        </div>
         <div class="pure-control-group">
            <label for="v">Ценность</label>
            <select id="v">
                <option>Служение обществу</option>
                <option>Профессионализм</option>
                <option>...</option>
            </select>
        </div>

        <div class="pure-controls">
            <label for="cb" class="pure-checkbox">
                Текст благодарности
            </label>
            <br/>
            <textarea id="cb"> </textarea>
            <br/>
            <button type="submit" class="pure-button pure-button-primary">Отправить</button>
        </div>
    </fieldset>
</form>
                <button class="modal__close jsModalClose">&#10005;</button>
            </div>
        </div>

    <script>
        (function() {
            /* Opening modal window function */
            function openModal() {
                /* Get trigger element */
                var modalTrigger = document.getElementsByClassName('jsModalTrigger');

                /* Set onclick event handler for all trigger elements */
                for(var i = 0; i < modalTrigger.length; i++) {
                    modalTrigger[i].onclick = function() {
                        var target = this.getAttribute('href').substr(1);
                        var modalWindow = document.getElementById(target);

                        modalWindow.classList ? modalWindow.classList.add('open') : modalWindow.className += ' ' + 'open'; 
                    }
                }   
            }

            function closeModal(){
                /* Get close button */
                var closeButton = document.getElementsByClassName('jsModalClose');
                var closeOverlay = document.getElementsByClassName('jsOverlay');

                /* Set onclick event handler for close buttons */
                for(var i = 0; i < closeButton.length; i++) {
                    closeButton[i].onclick = function() {
                    var modalWindow = this.parentNode.parentNode;

                    modalWindow.classList ? modalWindow.classList.remove('open') : modalWindow.className = modalWindow.className.replace(new RegExp('(^|\\b)' + 'open'.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
                    }
                }   

                /* Set onclick event handler for modal overlay */
                for(var i = 0; i < closeOverlay.length; i++) {
                    closeOverlay[i].onclick = function() {
                    var modalWindow = this.parentNode;

                    modalWindow.classList ? modalWindow.classList.remove('open') : modalWindow.className = modalWindow.className.replace(new RegExp('(^|\\b)' + 'open'.split(' ').join('|') + '(\\b|$)', 'gi'), ' ');
                    }
                }  

            }

            /* Handling domready event IE9+ */
            function ready(fn) {
                if (document.readyState != 'loading'){
                fn();
                } else {
                document.addEventListener('DOMContentLoaded', fn);
                }
            }

            /* Triggering modal window function after dom ready */
            ready(openModal);
            ready(closeModal);
        }());
    </script>
    </body>
</html>