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

			<!-- Toolbar -->
			<div class="bf-toolbar">
				<div class="bf-toolbar-info">
					<h1 style="color:#ff0000;" ><%=ucase(request("marchio"))%></h1>
					<p><%=lcase(request("sotto"))%></p>
				</div>
				<div class="bf-toolbar-sort">
					<span>Order by:</span>
					<form name="form" method="post" action='odlista.asp?pagsp=1&cat=<%=Trim(Replace(Request("cat")," ","%20"))%>&sotto=<%=Trim(Replace(Request("sotto")," ","%20"))%>' ID="Form1">
					<select	class="bf-form-select" onchange="this.form.submit();">
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
									Divpagine=63
									'Pagine gestione
									paginasp=request("Pagsp")
									if paginasp="" then
										paginasp=0
									else
										paginasp=cint(paginasp)*Divpagine
									end if
									if Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))<>"" then
									 	vordine=Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))
									else
										 vordine=" giacenza desc "
									end if


									sotto1=Trim(Replace(Request("sotto1"),"%20"," "))
									sotto2=Trim(Replace(Request("sotto2"),"%20"," "))
									sotto3=Trim(Replace(Request("sotto3"),"%20"," "))
									sotto4=Trim(Replace(Request("sotto4"),"%20"," "))
									sotto5=Trim(Replace(Request("sotto5"),"%20"," "))
									sotto6=Trim(Replace(Request("sotto6"),"%20"," "))
									sotto7=Trim(Replace(Request("sotto7"),"%20"," "))
									sotto8=Trim(Replace(Request("sotto8"),"%20"," "))
									sotto9=Trim(Replace(Request("sotto9"),"%20"," "))
									sotto10=Trim(Replace(Request("sotto10"),"%20"," "))
									sotto11=Trim(Replace(Request("sotto11"),"%20"," "))
									sotto12=Trim(Replace(Request("sotto12"),"%20"," "))
									sotto13=Trim(Replace(Request("sotto13"),"%20"," "))
									sotto14=Trim(Replace(Request("sotto14"),"%20"," "))
									sotto15=Trim(Replace(Request("sotto15"),"%20"," "))
									sotto16=Trim(Replace(Request("sotto16"),"%20"," "))
									sotto17=Trim(Replace(Request("sotto17"),"%20"," "))
									sotto18=Trim(Replace(Request("sotto18"),"%20"," "))
									sotto19=Trim(Replace(Request("sotto19"),"%20"," "))
									sotto20=Trim(Replace(Request("sotto20"),"%20"," "))
									sotto21=Trim(Replace(Request("sotto21"),"%20"," "))
									sotto22=Trim(Replace(Request("sotto22"),"%20"," "))
									sotto23=Trim(Replace(Request("sotto23"),"%20"," "))
									sotto24=Trim(Replace(Request("sotto24"),"%20"," "))
									sotto25=Trim(Replace(Request("sotto25"),"%20"," "))
									sotto26=Trim(Replace(Request("sotto26"),"%20"," "))
									sotto27=Trim(Replace(Request("sotto27"),"%20"," "))
									sotto28=Trim(Replace(Request("sotto28"),"%20"," "))
									sotto29=Trim(Replace(Request("sotto29"),"%20"," "))
									sotto30=Trim(Replace(Request("sotto30"),"%20"," "))


									marchio1=Trim(Replace(Request("marchio1"),"%20"," "))
									marchio2=Trim(Replace(Request("marchio2"),"%20"," "))
									marchio3=Trim(Replace(Request("marchio3"),"%20"," "))
									marchio4=Trim(Replace(Request("marchio4"),"%20"," "))
									marchio5=Trim(Replace(Request("marchio5"),"%20"," "))
									marchio6=Trim(Replace(Request("marchio6"),"%20"," "))
									marchio7=Trim(Replace(Request("marchio7"),"%20"," "))
									marchio8=Trim(Replace(Request("marchio8"),"%20"," "))
									marchio9=Trim(Replace(Request("marchio9"),"%20"," "))
									marchio10=Trim(Replace(Request("marchio10"),"%20"," "))
									marchio11=Trim(Replace(Request("marchio11"),"%20"," "))
									marchio12=Trim(Replace(Request("marchio12"),"%20"," "))
									marchio13=Trim(Replace(Request("marchio13"),"%20"," "))
									marchio14=Trim(Replace(Request("marchio14"),"%20"," "))
									marchio15=Trim(Replace(Request("marchio15"),"%20"," "))
									marchio16=Trim(Replace(Request("marchio16"),"%20"," "))
									marchio17=Trim(Replace(Request("marchio17"),"%20"," "))
									marchio18=Trim(Replace(Request("marchio18"),"%20"," "))
									marchio19=Trim(Replace(Request("marchio19"),"%20"," "))
									marchio20=Trim(Replace(Request("marchio20"),"%20"," "))
									marchio21=Trim(Replace(Request("marchio21"),"%20"," "))
									marchio22=Trim(Replace(Request("marchio22"),"%20"," "))
									marchio23=Trim(Replace(Request("marchio23"),"%20"," "))
									marchio24=Trim(Replace(Request("marchio24"),"%20"," "))
									marchio25=Trim(Replace(Request("marchio25"),"%20"," "))
									marchio26=Trim(Replace(Request("marchio26"),"%20"," "))
									marchio27=Trim(Replace(Request("marchio27"),"%20"," "))
									marchio28=Trim(Replace(Request("marchio28"),"%20"," "))
									marchio29=Trim(Replace(Request("marchio29"),"%20"," "))
									marchio30=Trim(Replace(Request("marchio30"),"%20"," "))

									if sotto1="" and sotto2="" and sotto3="" and sotto4="" and sotto5="" and sotto6="" and sotto7="" and sotto8="" and sotto9="" and sotto10="" and sotto11="" and sotto12="" and sotto13="" and sotto14="" and sotto15="" and sotto16="" and sotto17="" and sotto18="" and sotto19="" and sotto20="" and sotto21="" and sotto22="" and sotto23="" and sotto24="" and sotto25="" and sotto26="" and sotto27="" and sotto28="" and sotto29="" and sotto30="" then
                                      aggiuntasotto= "  or sottocategoria like '%%' "
                                     else
									  aggiuntasotto= " "
									end if

									if marchio1="" and marchio2="" and marchio3="" and marchio4="" and marchio5="" and marchio6="" and marchio7="" and marchio8="" and marchio9="" and marchio10="" and marchio11="" and marchio12="" and marchio13="" and marchio14="" and marchio15="" and marchio16="" and marchio17="" and marchio18="" and marchio19="" and marchio20="" and marchio21="" and marchio22="" and marchio23="" and marchio24="" and marchio25="" and marchio26="" and marchio27="" and marchio28="" and marchio29="" and marchio30="" then
										aggiuntamarchio= " or marchio like '%%' "
								    else
										aggiuntamarchio= " "
									end if

									aggiunta=" " &_
									" sottocategoria='" & Trim(Replace(Request("sotto1"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto2"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto3"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto4"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto5"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto6"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto7"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto8"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto10"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto11"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto12"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto13"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto14"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto15"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto16"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto17"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto18"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto19"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto20"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto21"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto22"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto23"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto24"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto25"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto26"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto27"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto28"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto29"),"%20"," ")) & "'" &_
									" or sottocategoria='" & Trim(Replace(Request("sotto30"),"%20"," ")) & "'" & aggiuntasotto &_
									" ) and fornitore like '%buffetti%' and (p1>" & Trim(Replace(Request("minprezzo"),"%20"," ")) & " and p1<" & Trim(Replace(Request("maxprezzo"),"%20"," ")) & ")"

									colore =  Trim(Replace(Request("radio-colors"),"%20"," "))
									if colore="0" then colore="nero"
									if colore="1" then colore="bianco"
									if colore="2" then colore="rosso"
									if colore="3" then colore="arancio"
									if colore="4" then colore="blu"
									if colore="5" then colore="verde"

									colore=" and ( descrizione like '%" & colore & "%' or descrizione1 like '%" & colore & "%') "

									Set Tbcount = Server.CreateObject("ADODB.RecordSet")
									'Query
									querydcount="Select count(*) as Tot From prodotti where ( " & aggiunta & colore
									Tbcount.Open querydcount,connm

									npaginecat=Formatnumber(Cint(Tbcount("Tot")) / 63,0)
									npaginemax=Cint(Tbcount("Tot"))
									Tbcount.close
									'controllo
									'response.Write(npaginemax)
									'response.Write(npaginecat)
									queryd2="Select * From prodotti where ( " & aggiunta & colore & " order by  " & vordine & "  LIMIT " & paginasp & " , " & Divpagine
									Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
									tbprodcatalogo.Open queryd2,connm

									'response.Write(queryd2)
									'response.end



									 i=0
									counterfrm=18
									Do While not (tbprodcatalogo.eof)
										counterfrm=counterfrm+1
										 i=i+1
										'Nuovo_Prodotto=Ucase(Trim(tbprodcatalogo("Nuovoprodotto")))
										%>
										<!--#include file="single_product_buffetti.inc" -->
										<%

										tbprodcatalogo.movenext
									Loop
									tbprodcatalogo.close
									%>

			</div><!-- bf-products-grid -->

			<!-- Pagination -->
			<div class="bf-pagination">
			  <ul>
			    <li class="bf-pagination-prev">
			      <i class="fa-solid fa-arrow-left"></i>
			    </li>

			    <strong>
									<%paginabol=false
									for fsp=0 to npaginecat-1
										if trim(request("pagsp"))=cstr(fsp) then%>
										<button class="bf-pagination-btn active"><%=fsp+1%></button>
									<%else
										if trim(request("pagsp"))="" and paginabol=false then%>
											<button class="bf-pagination-btn active">1</button>
											<%paginabol=true
										else%>
									<button class="bf-pagination-btn" onClick="top.location.href='odfiltro.asp?pagsp=<%=fsp%>&menu=yes&cat=<%=request("cat")%>&sotto=<%=request("sotto")%>&marchio<%=request("marchio")%>#odposizione'"><%=fsp+1%></button>

										<%end if
									end if
									'Response.Write "</a>"
									next%> </strong>

			    <li class="bf-pagination-next">
			      <i class="fa-solid fa-arrow-right"></i>
			    </li>
			  </ul>
			  <span class="bf-pagination-info">
			    Showing 1 - 6 of <%=npaginecat-1%> items
			  </span>
			</div>

					</div><!-- bf-main-content -->
				</div><!-- bf-page-grid -->
			</div><!-- bf-container -->
		</div><!-- bf-page -->


 <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->