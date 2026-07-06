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
<!--#include file="menusx.inc" -->

			<!-- Sort Bar -->
			<div class="bf-sort-bar" style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;flex-wrap:wrap;gap:12px;">
				<div class="bf-sort-label">
					<p><%=lcase(request("sotto"))%></p>
				</div>
				<div class="bf-sort-select" style="display:flex;align-items:center;gap:8px;">
					<span>Ordina per:</span>
					<form name="form" method="post" action='odlista.asp?pagsp=1&cat=<%=Trim(Replace(Request("cat")," ","%20"))%>&sotto=<%=Trim(Replace(Request("sotto")," ","%20"))%>' ID="Form1">
					<select class="bf-form-select" onchange="this.form.submit();">
					<option value="p1 asc" >ordina per prezzo minore</option>
					<option value="p1 desc">ordina per prezzo maggiore</option>
					<option value="marchio asc">ordina per nome della marca </option>
					</select>
					</form>
				</div>
			</div>

			<!-- Product Grid -->
			<div class="bf-products-grid">

			<%


										'Pagine
										Divpagine=21
										'Pagine gestione
										paginasp=request("Pagsp")
										if paginasp="" then
											paginasp=0
										else
											paginasp=cint(paginasp)*Divpagine
										end if


										'Query
										querydcount="Select count(*) as Tot From prodotti where SottoCategoria='" & Trim(Replace(Request("id"),"%20"," ")) & "' and codice_buf<>'' limit 1"
										Set tbcount = Server.CreateObject("ADODB.RecordSet")
										tbcount.Open querydcount,connm

										npaginecat=Formatnumber(Cint(tbcount("Tot")) / 21,0)
										npaginemax=Cint(tbcount("Tot"))
										tbcount.close

										'query x nome prodotto
										Set tbst = Server.CreateObject("ADODB.RecordSet")
										querydp="Select * From prodotti where Sottocategoria='" & Trim(Replace(Request("id"),"%20"," ")) & "'  and codice_buf<>'' order by codice_buf desc LIMIT " & paginasp & " , " & Divpagine
										'response.Write(querydp)
										tbst.Open querydp,connm


										if	not (tbst.eof) then
											'response.Write("<br>")
											'Response.write "<br><a href='catbuffetti.asp' class='tx12 azzurro lnk'><b>" & Ucase(tbst("Categoria")) & "</a>&nbsp;&nbsp;--&nbsp;&nbsp;<font class='tx3 grigioscuro'>" & Ucase(tbst("SottoCategoria")) & "</font></b><br><br>"
										else
											queryd2="Select * From prodotti where Sottocategoria='" & Trim(Replace(Request("id"),"%20"," ")) & "' codice_buf<>'' LIMIT " & abs(npaginemax-Divpagine) & " , " & Divpagine
											tbst.Close
											tbst.Open queryd2,conn
											'controllo
											'response.Write(queryd2)
										end if

										'response.Write(queryd2)
										i=0
										counterfrm=10
										Do While not (tbst.eof)
											counterfrm=counterfrm+1
											i=i+1
											Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
											sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(tbst("Codice_buf")) & "' order by codice_buf desc"
											tbprodcatalogo.Open sSQLisp1, connm%>
												<!--#include file="single_product_buffetti.inc" -->
											<%
											tbprodcatalogo.Close
											tbst.movenext
										Loop
										'response.Write(i)
										%>

			</div><!-- bf-products-grid -->

			<!-- Pagination -->
			<div class="bf-pagination" style="display:flex;align-items:center;justify-content:space-between;margin:32px 0;flex-wrap:wrap;gap:12px;">
				<div style="display:flex;align-items:center;gap:4px;flex-wrap:wrap;">

				<%paginabol=false
				for fsp=0 to npaginecat-1
					if trim(request("pagsp"))=cstr(fsp) then%>
					<button class="bf-btn bf-btn-primary" style="min-width:40px;padding:6px 12px;"><%=fsp+1%></button>
				<%else
					if trim(request("pagsp"))="" and paginabol=false then%>
						<button class="bf-btn bf-btn-primary" style="min-width:40px;padding:6px 12px;">1</button>
						<%paginabol=true
					else%>
					<button class="bf-btn bf-btn-outline" style="min-width:40px;padding:6px 12px;" onClick="top.location.href='catbuffettilista.asp?pagsp=<%=fsp%>&id=<%=Trim(Replace(Request("id")," ","%20"))%>&cat=<%=Trim(Replace(Request("cat")," ","%20"))%>&ricerca=<%=Trim(Request("ricerca"))%>'"><%=fsp+1%></button>

					<%end if
				end if
				'Response.Write "</a>"
				next%>

				</div>
				<span style="color:var(--text-muted);font-size:13px;">
					Mostrando 1 - 6 di <%=npaginecat-1%> pagine
				</span>
			</div>

					</div><!-- bf-main-content -->
				</div><!-- bf-page-grid -->
			</div><!-- bf-container -->
		</div><!-- bf-page -->


 <!--#include file="footer.inc" -->
<%tbprodcatalogo.close%>
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->