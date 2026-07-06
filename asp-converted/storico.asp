<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%
	session.lcid=1040
	'Tabelle Utilita
    Set tbst = Server.CreateObject("ADODB.Recordset")
    Set tbst1 = Server.CreateObject("ADODB.Recordset")
	Sql="Select * from ordine where password1='" & Trim(Session("Chisono")) & "' order by ID desc"
	tbst.Open Sql,connm

%>
<!DOCTYPE html>
<html lang="en">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>
  <!--#include file="top.inc" -->
  <br>
    </div>

    <section class="bf-content-page">
      <div class="bf-container">
        <div class="bf-page-title">
          <h2>STORICO ORDINE</h2>
        </div>

        <div class="bf-content-card">
			<TABLE class="bf-history-table" width="98%" CELLPADDING="0" CELLSPACING="0">
				<tr><td height="10px"></td></tr>
				<%if Tbst.EOF then%>
				<TR>
					<td>NESSUN ORDINE ARCHIVIATO</td>
					<td align="center"><%=date()%></td>
					<td align="center"><%=time()%></td>
					<td align="center"><img src="img/ico_freccia.png" border="0"></td>
				</TR>
				<%end if
					data=""
					tempo=""
					i=0
					 Do until Tbst.EOF
						if data=cstr(tbst("data")) and tempo=cstr(tbst("tempo")) then%>
						<%
						else
							%>
							<TR>
								<td width="300px">LISTA ARTICOLI ORDINATI IL </td>
								<td align="center"><%=tbst("data")%></td>
								<td align="center"><%=tbst("tempo")%></td>
								<td align="center"><a href='storicolista.asp?data=<%=tbst("data")%>&tempo=<%=tbst("tempo")%>#topage'><img src="img/ico_freccia.png" border="0"></a></td>
							</TR>
							<tr><td colspan="7" height="10px"></td></tr>
							<tr><td colspan="7" height="1px" bgcolor="#d1d0d0"></td></tr>
							<tr><td colspan="7" height="10px"></td></tr>
							<%
						end if

						data=""
						tempo=""
						data=cstr(tbst("data"))
						tempo=cstr(tbst("tempo"))

						Tbst.MoveNext

						i=i+1
						'numero max di ordine
						if i>200 then exit do
				Loop
				Tbst.close
				%>
			</TABLE>
        </div>

      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->
