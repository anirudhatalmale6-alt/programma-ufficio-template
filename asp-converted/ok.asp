<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html lang="it">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>

<!--#include file="top.inc" -->

	<!-- Content Page -->
	<div class="bf-content-page">
		<div class="bf-container">

			<h1 class="bf-page-title">INVIO AVVENUTO CON SUCCESSO...........</h1>

			<div class="bf-content-card">

							<%if trim(request("nordine"))<>"" then
							connm.execute("Delete From Carrello Where sessionid='" & text_sessionid & "' or Sessionid='" &  Session.SessionID & "'")
							%>
									<h2>Ordine Inviato con Successo Numero:<b><%=request("nordine")%></b></h2>

									<table cellspacing="0" cellpadding="0" width="100%" border="1" class="tx14 nero">
									<tr><td colspan="2" height="10px">stampare o memorizzare il numero d'ordine</td></tr>
									<tr>
									<td style="font-size:24px;color:#ff0000;"><b>Totale + Iva</b><br></td>
									<td style="font-size:24px;color:#ff0000;" align="right"><b>&#8364;.&nbsp;<%=session("totcarta")%></b></td>
									</tr>
									<tr><td colspan="2" height="10px">
									<br><br><br>
									</td>
									</tr>

									<tr><td colspan="2" height="10px">
									<!--#include file="datibonifico.asp" -->
									</td>
									</tr>
									</table>

							<%else%>
							<h2>Mail inviata con successo</h2>
							<%end if%>

			</div><!-- bf-content-card -->

		</div><!-- bf-container -->
	</div><!-- bf-content-page -->

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->