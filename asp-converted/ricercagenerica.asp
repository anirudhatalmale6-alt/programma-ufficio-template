<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%
if Len(Trim(Request.Form("search")))<>0 then
	cod_ric=Trim(Request.Form("search")) & " "
else
	cod_ric=Trim(Request("search")) & " "
end if
lung_cod_ric=len(cod_ric)
cod_ric=lcase(left(cod_ric,lung_cod_ric-1))
'SE NESSUNA RICERCA
if cod_ric="" then response.redirect "articolonontrovato.asp"

%>
<!DOCTYPE html>
<html lang="it">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>

<!--#include file="top.inc" -->
<!--#include file="menusxsenza.inc" -->

			<!-- Sort Bar -->
			<div class="bf-sort-bar" style="display:flex;justify-content:space-between;align-items:center;margin-bottom:20px;flex-wrap:wrap;gap:12px;">
				<div class="bf-sort-label">
					<p><%=lcase(request("sotto"))%></p>
				</div>
				<div class="bf-sort-select" style="display:flex;align-items:center;gap:8px;">
					<span>Ordina per:</span>
					<form name="form" method="post" action='ricercagenerica.asp?pagsp=1&cat=<%=Trim(Replace(Request("cat")," ","%20"))%>&sotto=<%=Trim(Replace(Request("sotto")," ","%20"))%>' ID="Form1">
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

							<%Response.Buffer = True%>
							<div id="loadingimg" style="text-align:center;padding:20px;"><img width="200px" src="images/loading.gif"></div>
							<%
							Response.Flush
							%>

						<%


						'############# CODICE RICERA AFFINATO  PHP
						'############# CODICE RICERA AFFINATO  PHP
						'############# CODICE RICERA AFFINATO  PHP


						'############# CODICE RICERA AFFINATO  HP HP HP
						'response.Write(mid(cod_ric,1,2))
						'response.Write(mid(cod_ric,1,3))

						if mid(cod_ric,1,2)="hp" or mid(cod_ric,1,3)="hp" then

									aring=split(replace(cod_ric,"hp ","")," ")
									sSQL="select codice_od,codice_buf,categoria,sottocategoria,descrizione,descrizione1,fornitore,marchio from prodotti where ("
									for f=0 to ubound(aring)
									if trim(aring(f))<>""  then
										sSQL=sSQL & " codice_od like '%" & trim(aring(f)) & "%' or "
										sSQL=sSQL & " descrizione1 like '%" & trim(aring(f)) & "%' or "
										sSQL=sSQL & " descrizione like '%" & trim(aring(f)) & "%' or "
									end if
									next
									sSQL=left(sSQL,len(sSQL)-4) & ") and marchio='hp'  order by fornitore asc,codice_od asc limit 60 "
									sSQLtot=sSQL

						else

								cod_ric=replace(replace(replace(replace(replace(replace(replace(replace(replace(cod_ric," il "," ")," per "," ")," un "," ")," la "," ")," e "," ")," una "," ")," it","-it")," a "," ")," con "," ")
								'SELECT * FROM prodotti_mondadori  WHERE (codice_prodotto LIKE '%maurizio%' AND codice_prodotto LIKE '%de%' AND codice_prodotto LIKE '%giovanni%') OR (descrizione LIKE '%maurizio%' AND descrizione LIKE '%de%' AND descrizione LIKE '%giovanni%') OR (autori LIKE '%maurizio%' AND autori LIKE '%de%' AND autori LIKE '%giovanni%') OR (codice_originale LIKE '%maurizio%' AND codice_originale LIKE '%de%' AND codice_originale LIKE '%giovanni%') order by autori asc
								aring=split(trim(cod_ric)," ")
								sSQL="SELECT descrizione1,codice_buf,partnumber,codice_od,descrizione,fornitore FROM prodotti where (codice_buf<>'' or codice_od<>'') and "
								sSQL1=""
								sSQL2=""
								sSQL3=""
								sSQL4=""
								sSQL5=""
								for f=0 to ubound(aring)
									if trim(aring(f))<>"" then
									'response.write(cstr(trim(aring(f))) & f & "ciaooo<br>")
												sSQL1=sSQL1 & "descrizione like '%" & cstr(trim(aring(f)))  & "%' and  "
												'sSQL2=sSQL2 & "partnumber like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQL3=sSQL3 & "codice_od like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQL4=sSQL4 & "codice_buf like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQL5=sSQL5 & "descrizione1 like '%" & cstr(trim(aring(f)))  & "%' and  "
									end if
								next
								'response.write(cstr(trim(aring(f))) & f & "ciaooo<br>")
								sSQL1="(" & left(sSQL1,len(sSQL1)-5) & ")"
								'sSQL2="(" & left(sSQL2,len(sSQL2)-5) & ")"
								sSQL3="(" & left(sSQL3,len(sSQL3)-5) & ")"
								sSQL4="(" & left(sSQL4,len(sSQL4)-5) & ")"
								sSQL5="(" & left(sSQL5,len(sSQL5)-5) & ")"
								sSQL=sSQL & sSQL1 & " or " &  sSQL3 & " or " &  sSQL4 & " or " &  sSQL5
								sSQLec=" union SELECT cdescription,ccode,cname,catalogid,cimageurl,fornitore FROM shop_products where "
								'sSQLec1=""
								sSQLec2=""
								sSQLec3=""
								for f=0 to ubound(aring)
									if trim(aring(f))<>"" then
												'response.write(cstr(trim(aring(f))) & f & "ciaooo<br>")
												'sSQLec1=sSQLec1 & "cdescription like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQLec2=sSQLec2 & "ccode like '%" & cstr(trim(aring(f)))  & "%' and  "
												sSQLec3=sSQLec3 & "cname like '%" & cstr(trim(aring(f)))  & "%' and  "
									end if
								next
								'response.write(cstr(trim(aring(f))) & f & "ciaooo<br>")
								'sSQLec1="(" & left(sSQLec1,len(sSQLec1)-5) & ")"
								sSQLec2="(" & left(sSQLec2,len(sSQLec2)-5) & ")"
								sSQLec3="(" & left(sSQLec3,len(sSQLec3)-5) & ")"
								sSQLec=sSQLec & sSQLec2 & " or " &  sSQLec3
								sSQLtot=sSQL & sSQLec & " order by fornitore desc,codice_buf asc limit 180"
						end if
								'response.write(sSQLtot & " >>>> TEST SQL <<<<")
								'response.Write(sSQLtot & "<hr>")
								'response.end
								Set tbst = Server.CreateObject("ADODB.RecordSet")
								tbst.open sSQLtot,connm
								'############# CODICE RICERA AFFINATO PHP
								'############# CODICE RICERA AFFINATO PHP
								'############# CODICE RICERA AFFINATO PHP

								iod=1
								ibuffetti=1
								iecommerce=1
								i=0
								Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
								Do While not (tbst.eof) and i<>180
									counterfrm=counterfrm+1
									i=i+1
									sSQLisp1=""
									if lcase(trim(tbst("fornitore")))="od" and iod=<60 then
										iod=iod+1
										sSQLisp1 = "select * from prodotti where codice_od='" & Trim(tbst("codice_od")) & "' limit 1"
										tbprodcatalogo.Open sSQLisp1, connm
										if not tbprodcatalogo.eof then %>
											<!--#include file=single_product.inc-->
									<%  end if
										tbprodcatalogo.close
									end if
									'buffetti controllo errori
									if lcase(trim(tbst("fornitore")))="gruppo buffetti s.p.a." and ibuffetti=<60  then
										ibuffetti=ibuffetti+1
										sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(tbst("codice_buf")) & "' limit 1"
										tbprodcatalogo.Open sSQLisp1, connm
										if not tbprodcatalogo.eof then%>
											<!--#include file=single_product_buffetti.inc-->
									<%   end if
										tbprodcatalogo.close
									end if
									'response.write(lcase(trim(tbst("fornitore"))))
									if lcase(trim(tbst("fornitore")))="ecommerce" and iecommerce=<60 then
										iecommerce=iecommerce+1
										sql="SELECT shop_products.*, shop_products.catalogID, shop_products.catalogID AS shownID from shop_products WHERE shop_products.ccode='" & Trim(tbst("codice_buf")) & "' limit 1 "
										tbprodcatalogo.open Sql,connm
										if not tbprodcatalogo.eof then


										end if
										tbprodcatalogo.close
									end if
									tbst.movenext
								Loop
								tbst.close%>

							<%
							Response.Flush
							%>
							<script language="javascript">
							<!--
							document.getElementById("loadingimg").style.display="none";
							//-->
							</script>

			</div><!-- bf-products-grid -->

					</div><!-- bf-main-content -->
				</div><!-- bf-page-grid -->
			</div><!-- bf-container -->
		</div><!-- bf-page -->


 <!--#include file="footer.inc" -->
<%tbprodcatalogo.close%>
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->