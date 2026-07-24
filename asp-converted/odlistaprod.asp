<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html lang="en">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>


<!--#include file="top.inc" -->
<!--#include file="menusx.inc" -->



          <div class="bf-main-content">
            <div class="bf-toolbar">
              <div class="bf-toolbar-info">
                <p><%=lcase(request("sotto"))%></p>
              </div>
              <div class="bf-toolbar-sort">
                <span>Order by:</span>
					<form name="form" method="post" action='odlista.asp?pagsp=1&cat=<%=Trim(Replace(Request("cat")," ","%20"))%>&sotto=<%=Trim(Replace(Request("sotto")," ","%20"))%>' ID="Form1">
					<select	class="bf-form-select">
					<option value="p1 asc" >ordina per prezzo minore</option>
					<option value="p1 desc">ordina per prezzo maggiore</option>
					<option value="marchio asc">ordina per nome della marca </option>
					</select>
					</form>
              </div>
            </div>
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
									if Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))<>"" then
									 	vordine=Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))
									else
										 vordine=" giacenza desc "
									end if
									
									'Query
									querydcount="Select count(*) as Tot From prodotti where nome_prodotto='" & Trim(Replace(Request("nomeprodotto"),"%20"," ")) & "' and fornitore like '%od%'"
									Set Tbcount = Server.CreateObject("ADODB.RecordSet")				
									Tbcount.Open querydcount,connm
									
									npaginecat=Formatnumber(Cint(Tbcount("Tot")) / 21,0)
									npaginemax=Cint(Tbcount("Tot"))
									Tbcount.close
									'controllo
									'response.Write(npaginemax)		
									'response.Write(npaginecat)						
									queryd2="Select * From prodotti where nome_prodotto like '%" & Trim(Replace(Request("nomeprodotto"),"%20"," ")) & "%'  and fornitore like '%od%' order by  " & vordine & "  LIMIT " & paginasp & " , " & Divpagine
									Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")	
									tbprodcatalogo.Open queryd2,connm
									'controllo
									'response.Write(queryd2)
									
									i=0
									counterfrm=21
									Do While not (tbprodcatalogo.eof)
									    i=i+1
										counterfrm=counterfrm+1
										'Nuovo_Prodotto=Ucase(Trim(tbprodcatalogo("Nuovoprodotto")))
										%>
										<!--#include file="single_product.inc" -->
										<%
										
										tbprodcatalogo.movenext
									Loop
									tbprodcatalogo.close%>

            </div>

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
									<button class="bf-pagination-btn" onClick="top.location.href='odlistaprod.asp?pagsp=<%=fsp%>&cat=<%=request("cat")%>&sotto=<%=request("sotto")%>&nomeprodotto=<%=request("nomeprodotto")%>'"><%=fsp+1%></button>

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
<%tbprodcatalogo.close%>
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->