<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%
Sub Insmodello
Set Tb = Server.CreateObject("ADODB.RecordSet")
'Set Tbadd = Server.CreateObject("ADODB.RecordSet")
sSQL = "select * From Modello where Tipologia=" & cdbl(Request("Id")) &  " order by Modello"
Tb.Open sSQL,conn
If not Tb.EOF then
	I=0
	response.write("<TABLE border='0' valign=top cellspacing='0' cellpadding='0' width='100%'><tr><td height='10px'></td></tr><tr><td width='50px'></td><td></td><td valign=top  align=left >")
	Do While not Tb.eof
		'Controlla
		marca=trim(Tb("Id"))
		'sSQLad = "select * From Modello_Disp_Add where Idmodello=" & Tb("ID")
		'Tbadd.Open sSQLad,conn
		'if not Tbadd.EOF then
            Response.Write "<a class='12 nero lnk' href='odcartuccelista.asp?marca=" & Replace(Ucase(Tb("Modello"))," ","%20")  & "&id=" & request("Id") & "&Preisp=" & request("Preisp") & "&Modelloid=" & Tb("Id") & "#primaindietro'> " & UCase(Tb("Modello"))  & "</a><br>"
			I=I+1
       ' end if
        Var=request("Preisp")
        if i=500  then
            Response.Write "</td><td valign=top  align=left >"
            i=0
        end if

		'Tbadd.close
		Tb.movenext
	Loop
Else
	Response.Write "------------------"
End if

Response.Write "</TD></TR><tr><td height='10px'></td></tr></TABLE>"
Tb.close
End sub
'x data
session.lcid=1040
'Ricerca marca
sSQL = "select * From MarcaUti where id=" & cdbl(request("id"))
Set Tbmarche = Server.CreateObject("ADODB.RecordSet")
Tbmarche.Open sSQL,conn
ScrittaMarca=Tbmarche("Marca")
%>
<!DOCTYPE html>
<html lang="it">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>

  <!--#include file="top.inc" -->
 <br>

    <section class="bf-content-page">
      <div class="bf-container">
        <h2 class="bf-page-title">Cartucce Toner Laser <%=request("Preisp")%> ### modelli stampanti</h2>

        <div class="bf-category-list">

										<a style="position:relative;top:-80px;" name="topage"></a>

										<%Response.Buffer = True%>
										<div id="loadingimg"><img width="200px" src="images/loading.gif"></div>
										<%
										Response.Flush
										%>
										<p>


										<br>
										<%Insmodello%>
										<br>
										<br>

										</p>

										<%
										Response.Flush
										%>
										<script language="javascript">
										<!--
										document.getElementById("loadingimg").style.display="none";
										//-->
										</script>

        </div>

      </div>
    </section>


    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->