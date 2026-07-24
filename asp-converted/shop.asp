<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%
'Magazine
querymag="select * from magazinebuffetti "
if request("ric")="yes" then
			if Len(Trim(Request.Form("codice_ispf")))<>0 then
			cod_ric=Trim(Request.Form("codice_ispf"))
			else
			cod_ric=Trim(Request("codice_ispf"))
			end if
			aring=split(cod_ric," ")
			sSQL="Select * from magazinebuffetti where      "
			sSQL=left(sSQL,len(sSQL)-4)
			querymag = sSql & "  (codice Like '%" & cod_ric & "%' or descrizione Like '%" & cod_ric & "%')"
end if
'loggaVisSchede "MagazineBuffetti","Magazine","Magazine",Request.ServerVariables("remote_host"),Session("nomeutente"),Session("Chisono")
%>
<!DOCTYPE html>
<html lang="it">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>


<!--#include file="top.inc" -->
<!--#include file="menusxshop.inc" -->

			<!-- Sort Bar -->
			<div class="bf-sort-bar" style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;flex-wrap:wrap;gap:12px;">
				<div class="bf-sort-label">
					<p><%=lcase(request("sotto"))%></p>
				</div>
			</div>

			<!-- Product Grid -->
			<div class="bf-products-grid">

							<%


											'Pagine
											Divpagine=32
											'Pagine gestione
											paginasp=request("Pagsp")
											if paginasp="" then
												paginasp=0
											else
												paginasp=cint(paginasp)*Divpagine
											end if
											querymagcount="SELECT count(*) as tot FROM magazinebuffetti"
											Set tbcount = Server.CreateObject("ADODB.RecordSet")
											tbcount.Open querymagcount,conn
											npaginecat=formatnumber(Cint(tbcount("tot")) / 32,0)
											npaginemax=Cint(tbcount("tot"))
											tbcount.close

											'response.Write(npaginemax)
											'response.Write(npaginecat)
											querymag=querymag & " order by codice desc LIMIT " & paginasp & " , " & Divpagine
											Set tbmag = Server.CreateObject("ADODB.RecordSet")
											'response.write(querymag)
											tbmag.Open querymag,conn
											counterfrm=1
											Do While not tbmag.eof
												counterfrm=counterfrm+1
												magqta=tbmag("qta")

												%>

				<div class="bf-product-card">

					<div class="bf-product-image">
						<a HREF="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>#buffposizione"><img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbmag("codice")%>.jpg' border=0></a>
					</div>

					<div class="bf-product-actions">
						<a class='yBox yBox_iframe' href="listinovisua.asp?For=od&Op=Ins&Cod_Lis=<%=tbmag("codice")%>">
							<button class="bf-btn-wishlist" type="button"><i class="fa-regular fa-heart"></i></button>
						</a>
						<a class='yBox yBox_iframe' href="dettaglibuffettishoplittle.asp?cod=<%=tbmag("codice")%>#odposizione">
							<button class="bf-btn-quickview" type="button"><i class="fa-solid fa-eye"></i></button>
						</a>
					</div>

					<div class="bf-product-meta">
						<span class="bf-iva-info"><%=valore_iva(tbmag("codice"))%></span>
						<%if magqta<>1 then%>
						     min acquistabile pz.<%=magqta%>
						  <% else%>
						     min. acquistabile pz.1
						<% end if
						%>
					</div>

					<%
					'sconto%
					v1=formatnumber(tbmag("prezzo"),2)
					v2=formatnumber(tbmag("prezzoofferta"),2)
					percsconto=formatnumber(((v1-v2)*100)/v1,0)
					%>
					<div class="bf-product-badge">-<%=percsconto%>%</div>

					<div class="bf-product-info">
						<div class="bf-product-code">
							<a href="dettaglibuffettishoplittle.asp?cod=<%=tbmag("codice")%>#odposizione"><b><%=ucase(tbmag("codice"))%></b></a>
						</div>
						<div class="bf-product-name">
							<a href="dettaglibuffettishoplittle.asp?cod=<%=tbmag("codice")%>#odposizione"><%=mid(ucase(tbmag("descrizione")),1,30)%></a>
						</div>
						<div class="bf-product-price">
							<span class="bf-price-current">&#8364;.<%=formatnumber(tbmag("prezzoofferta"),2)%></span>
							<span class="bf-price-discount">SCONTO MAGAZINE</span>
							<span class="bf-price-old"><del>&#8364;.<%=formatnumber(tbmag("prezzo"),2)%></del></span>
						</div>
					</div>

					<div class="bf-product-footer">
						<%response.Write "<form name=formb" & counterfrm & " >" %>
						<div class="bf-quantity-row">
							<div class="bf-quantity-input">
								<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" value="-" >
								<input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" title="Qty" value="<%=magqta%>" min="1" step="1">
								<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+">
							</div>
							<button  onClick="carrellomagazine('<%=tbmag("codice")%>',document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)" class="bf-btn-cart" type="button">
								<i class="fa-solid fa-cart-shopping"></i> Acquista Subito
							</button>
						</div>
						</form>

						<div class="bf-wishlist-footer">
							<a class='yBox yBox_iframe' href="listinovisua.asp?For=buffetti&Op=Ins&Cod_Lis=<%=tbmag("codice")%>"><i class="fa-regular fa-heart"></i> Preferiti</a>
						</div>
					</div>
				</div>
										<%

										tbmag.movenext
									Loop%>

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
									<button class="bf-btn bf-btn-outline" style="min-width:40px;padding:6px 12px;" onClick="top.location.href='shop.asp?pagsp=<%=fsp%>'"><%=fsp+1%></button>

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
<%tbmag.close%>
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->