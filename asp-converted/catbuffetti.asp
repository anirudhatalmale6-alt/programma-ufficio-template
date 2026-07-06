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

			<h1 class="bf-page-title">CATALOGO BUFFETTI</h1>

			<div class="bf-content-card">

				<ul style="list-style:none;padding:0;margin:0;">

					<%'Catalogo
							if trim(request("cat"))="" then
							 queryd1="Select Distinct Categoria From prodotti where fornitore='Gruppo Buffetti S.p.A.' order by Categoria asc"
							else
							 queryd1="Select Distinct Categoria From prodotti where fornitore='Gruppo Buffetti S.p.A.' and categoria='" & request("cat") & "' order by Categoria asc"
							end if
							Set Tbc = Server.CreateObject("ADODB.RecordSet")
							Tbc.Open queryd1,connm
							Do While not Tbc.eof
								if trim(Tbc("categoria"))<>"Altro" then
										txt_categoria=trim(replace(replace(Tbc("categoria"),"%20"," "),"'","`"))%>

					<li style="margin-bottom:24px;">
						<h2 style="font-size:17px;font-weight:700;color:var(--primary);display:flex;align-items:center;gap:8px;margin-bottom:10px;padding-bottom:8px;border-bottom:2px solid var(--border);">
							<i class="fa-solid fa-chevron-right" style="font-size:12px;"></i>
							<%=Ucase(Tbc("Categoria"))%>
						</h2>

						<ul style="list-style:none;padding:0;margin:0;display:grid;grid-template-columns:repeat(auto-fill, minmax(250px, 1fr));gap:6px 24px;">
							<%
									queryd2="Select Distinct SottoCategoria,Categoria from prodotti where fornitore='Gruppo Buffetti S.p.A.' and Categoria='" & Tbc("categoria") & "' order by SottoCategoria asc"
									'response.Write(queryd2)
									'response.end
									Set Tbst = Server.CreateObject("ADODB.RecordSet")
									Tbst.Open queryd2,connm
									Do While not Tbst.eof%>

							<li style="padding:4px 0;">
								<a href="catbuffettilista.asp?id=<%=Replace(Tbst("SottoCategoria")," ","%20")%>&cat=<%=Replace(Tbst("Categoria")," ","%20")%>#buffposizione"
								   style="color:var(--text);display:flex;align-items:center;gap:6px;">
									<i class="fa-solid fa-angle-right" style="font-size:11px;color:var(--primary);"></i>
									<%=ucase(Tbst("SottoCategoria"))%>
								</a>
							</li>

							<%		Tbst.movenext
									Loop
									Tbst.Close%>
						</ul>
					</li>

								<%end if
								Tbc.movenext
							Loop
							Tbc.close
							%>

				</ul>

			</div><!-- bf-content-card -->

		</div><!-- bf-container -->
	</div><!-- bf-content-page -->

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->