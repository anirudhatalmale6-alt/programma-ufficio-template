<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%
'dettagli od
Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
Set tbprodcatalogogen = Server.CreateObject("ADODB.RecordSet")
sSql="select * from prodotti where codice_od='" & Trim(Request("cod")) & "' limit 1"
tbprodcatalogo.Open sSql, connm
if tbprodcatalogo.eof then response.redirect "articolonontrovato.asp"
sSql="select * from prodotti where codice_od='" & Trim(Request("cod")) & "' limit 1"
tbprodcatalogogen.Open sSql, conn
if tbprodcatalogogen.eof then
    datitecnici=tbprodcatalogo("descrizione1")
   else
    datitecnici=tbprodcatalogogen("descrizione1")
end if
%>
<!DOCTYPE html>
<html lang="en">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>


<!--#include file="top.inc" -->

 <br>

    <section class="bf-content-page">
      <div class="bf-container">
        <div class="bf-product-detail-grid">
          <div class="bf-product-gallery">
            <div class="bf-product-gallery-main">
              <div
                class="swiper swiper-product">
                <div class="swiper-wrapper">
                    <figure class="swiper-slide">
                     <img src='foto.asp?cat=catalogoisp&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0>

                    </figure>
                    <figure class="swiper-slide">
                      <img src='foto.asp?cat=catalogoisp/piccole&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0>
                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                </div>
                <div class="button-prev">
                  <i class="fa-solid fa-chevron-left"></i>
                </div>
                <div class="button-next">
                  <i class="fa-solid fa-chevron-right"></i>
                </div>
              </div>
            </div>
            <div class="bf-product-gallery-thumbs">
              <div class="swiper swiper-thumbs">
                <div class="swiper-wrapper">
                    <figure class="swiper-slide">
                      <img src='foto.asp?cat=catalogoisp/piccole&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0>
                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                    <figure class="swiper-slide">

                    </figure>
                </div>
              </div>
            </div>
          </div>

          <div class="bf-product-detail-info">
            <div class="bf-product-detail-stock">
              <span>In Stock</span>
            </div>
            <h1>
              <b>codice : <%=tbprodcatalogo("codice_od")%></b><br>cod. produttore : <%=tbprodcatalogo("partnumber")%><br><br><%=tbprodcatalogo("Descrizione")%>
            </h1>
            <div class="bf-product-detail-price">
              <span class="bf-price-current"
					<!--#include file="ricercacatalogoparametriod.inc" -->


								<%
								'sconto%
								v1=formatnumber(Mprezzo1,2)
								v2=formatnumber(Mprezzo2,2)
								percsconto="35"
								if v1-v2<>0 then percsconto=cstr(formatnumber(((v1-v2)*100)/v1,2)) & "%<br>"
								%>
								<ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><font size=+1 color=#072466><%=magazinesconto%></font>

								<%if Session("Chisono")<>"" then%>
								<del>&#8364;.<%=formatnumber(Mprezzo1,2)%></del>
								<%end if%>
              </span>

              <span class="bf-price-discount-badge">
                -<%=percsconto%>% off
              </span>
			  <hr>
								<font size="-1" color="#FF0000">aliq.iva <%=cstr(tbprodcatalogo("aliq_iva"))%>%</font>
            </div>
            <div class="bf-product-description">
              <p>
               <%=replace(lcase(replace(replace(replace(replace(replace(replace(datitecnici,"à","a`"),"è","e`"),"é","e`"),"ù","u`"),"ò","o`"),"€","&#x20AC;")),".",".<br>")%>
              </p><p><img src='https://img.schede.eu/immagini/antiplagio.png' width='90px;' border='0' ></p>


								<hr><br>
								quantita' minima acquistabile pz.<%=tbprodcatalogo("AA_Qta_Conf")%>
												<table><tr><td>
								disponibilita' pezzi  <%=tbprodcatalogo("giacenza")%>
								<%if cdbl(tbprodcatalogo("giacenza"))>0 then%>
								<img width="250px;" src="images/pmag1.png">
								<%else%>
								<img width="250px;" src="images/pmag2.png">
								<%end if%></td></tr></table>
            </div>



              <div class="bf-product-sheets">
                <span>scheda tecnica produttore:</span>
                <ul>
                  <li>
                     <%
							'if mobile<>"ok" then
								Set objxmlhttppdf = Server.CreateObject("Microsoft.XMLHTTP")
								' Apro e lancio la richiesta HTTP
								linkpdf="https://img.schede.eu/cataloghi/pdf/" & replace(tbprodcatalogo("codice_od"),"OD","") & ".pdf"
								objxmlhttppdf.Open "GET", linkpdf, false
								objxmlhttppdf.Send
								' Se l'immagine esiste la mostro
								if CInt(objxmlhttppdf.Status) = 200 then
									'ok
									Response.write("<a class='yBox yBox_iframe' href='" & linkpdf & "'><img width='120px' src='https://img.schede.eu/immagini/scarica-scheda-tecnica.png' border='0' ></a>")
								end if
								objxmlhttppdf.close
							'end if
							%>
                  </li>
                  <li>
                    						<%
							'if mobile<>"ok" then
								Set objxmlhttppdf = Server.CreateObject("Microsoft.XMLHTTP")
								' Apro e lancio la richiesta HTTP
								linkpdf="https://img.schede.eu/cataloghi/pdf/" & replace(tbprodcatalogo("codice_od"),"OD","") & "_2.pdf"
								objxmlhttppdf.Open "GET", linkpdf, false
								objxmlhttppdf.Send
								' Se l'immagine esiste la mostro
								if CInt(objxmlhttppdf.Status) = 200 then
									'ok
									Response.write("<a class='yBox yBox_iframe' href='" & linkpdf & "'><img   src='https://img.schede.eu/immagini/1sc.png' border='0' ></a>")
								end if
								objxmlhttppdf.close
							'end if
							%>
                  </li>
                  <li>
						<%
							'if mobile<>"ok" then
								Set objxmlhttppdf = Server.CreateObject("Microsoft.XMLHTTP")
								' Apro e lancio la richiesta HTTP
								linkpdf="https://img.schede.eu/cataloghi/pdf/" & replace(tbprodcatalogo("codice_od"),"OD","") & "_3.pdf"
								objxmlhttppdf.Open "GET", linkpdf, false
								objxmlhttppdf.Send
								' Se l'immagine esiste la mostro
								if CInt(objxmlhttppdf.Status) = 200 then
									'ok
									Response.write("<a class='yBox yBox_iframe' href='" & linkpdf & "'><img   src='https://img.schede.eu/immagini/2sc.png' border='0' ></a>")
								end if
								objxmlhttppdf.close
							'end if
							%>
                  </li>
                  <li>
                   						<%
							'if mobile<>"ok" then
								Set objxmlhttppdf = Server.CreateObject("Microsoft.XMLHTTP")
								' Apro e lancio la richiesta HTTP
								linkpdf="https://img.schede.eu/cataloghi/pdf/" & replace(tbprodcatalogo("codice_od"),"OD","") & "_4.pdf"
								objxmlhttppdf.Open "GET", linkpdf, false
								objxmlhttppdf.Send
								' Se l'immagine esiste la mostro
								if CInt(objxmlhttppdf.Status) = 200 then
									'ok
									Response.write("<a class='yBox yBox_iframe' href='" & linkpdf & "'><img   src='https://img.schede.eu/immagini/3sc.png' border='0' ></a>")
								end if
								objxmlhttppdf.close
							'end if
							%>
                  </li>
                </ul>
              </div>




              <div class="bf-quantity-row">
                <span>Quantity:</span>
                <div>

                  <div class="bf-quantity-input">

					<%response.Write "<form name=formb" & counterfrm & " >" %>
							  <div class="quantity buttons_added" style="justify-content:center;align:center;">
										<center>&nbsp;
												&nbsp;&nbsp;&nbsp;<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" style="width:15px;background: none repeat scroll 0 0 #1A4B87;color:#ffffff;" value="-" >
												<input type="number" class="rounded" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" style="width:90px;text-align:center;border-color:#1A4B87;font-size:11px;" title="Qty" value="<%=tbprodcatalogo("AA_Qta_Conf")%>" min="1" step="1">
												<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" style="width:15px;background: none repeat scroll 0 0 #1A4B87;color:#ffffff;" >
										</center>

										</div>


                  </div>

                  <button  onClick="carrellood('<%=tbprodcatalogo("codice_od")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)"
                    class="bf-btn-cart"
                    type="button">
                    <i class="fa-solid fa-cart-shopping"></i>
                    Acquista Subito
                  </button>

				   </form>
                </div>
              </div>


			            <div class="bf-btn-wishlist">
				<a class='yBox yBox_iframe' href="listinovisua.asp?For=od&Op=Ins&Cod_Lis=<%=tbprodcatalogo("codice_od")%>" style="color:#1A4B87;font-size:14px;width=100%;">

            <button
              class="btn-wishlist">
              <i class="fa-regular fa-heart"></i>
              <span>aggiungi ai preferiti</span>
            </button>
			 </a>
          </div>

          <div class="bf-product-detail-meta">
            <div>
              <span>Available:</span>
              <span>20 items in Stock</span>
            </div>
            <div>
              <span>Category:</span>
              <a href="#">
                <%=tbprodcatalogo("categoria")%>
              </a>
            </div>
            <div>
              <span>Tags:</span>
              <a href="#">
                 <%=tbprodcatalogo("sottocategoria")%>
              </a>
            </div>
          </div>
          <div class="bf-product-share">
            <span>Share:</span>
            <div>
              <a href="#">
                <i class="fa-brands fa-facebook"></i>
              </a>
              <a href="#">
                <i class="fa-brands fa-x-twitter"></i>
              </a>
              <a href="#">
                <i class="fa-brands fa-whatsapp"></i>
              </a>
              <a href="#">
                <i class="fa-solid fa-link"></i>
              </a>
            </div>
          </div>
        </div>
        </div>
      </div>
    </section>

    <section class="bf-content-page">
      <div class="bf-container">
        <div class="bf-product-tabs">
          <ul class="bf-product-tabs-nav">
            <li class="active">
              Descrizione
            </li>
            <li>

            </li>
          </ul>
          <div class="bf-product-tabs-content">
            <div class="tab-content-item active">
              <div class="expandable-container">
                <div class="expandable-content">
                  <div class="expandable-subcontent">
                    <p>
   <%=replace(lcase(replace(replace(replace(replace(replace(replace(datitecnici,"à","a`"),"è","e`"),"é","e`"),"ù","u`"),"ò","o`"),"€","&#x20AC;")),".",".<br>")%>
   <%=lcase(tbprodcatalogo("Descrizione"))%>

                    </p>
                  </div>
                </div>
                <button
                  class="expandable-toggle"
                  type="button">
                  <i class="fa-solid fa-chevron-down"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="bf-similar-section">
      <div class="bf-container">
        <div class="swiper swiper-cards">
          <h2 class="bf-section-title">
            Prodotti simili
          </h2>
          <div class="bf-products-grid">


						<%
						'LOG PRODOTTI
						if Session("Chisono")<>"" then
						loggaVisSchede "od",tbprodcatalogo("codice_od"),tbprodcatalogo("Categoria"),tbprodcatalogo("SottoCategoria"),Session("nomeutente"),Session("Chisono")
						end if
						'chiusura tabelle

						'Query Simili
						querysimili="Select * From prodotti where SottoCategoria='" & tbprodcatalogo("sottocategoria") & "' and Categoria='" & tbprodcatalogo("categoria") & "' and fornitore like '%od%' limit 20"
						tbprodcatalogo.close
						'Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
						tbprodcatalogo.Open querysimili,connm
						'controllo
						'response.Write("----" & querysimili)
						'response.end
						i=0
						counterfrm=3000
						Do While not (tbprodcatalogo.eof)
						counterfrm=counterfrm+1
						 i=i+1
						'Nuovo_Prodotto=Ucase(Trim(tbprodcatalogo("Nuovoprodotto")))
						%>
						<!--#include file="single_product.inc" -->
						<%

						tbprodcatalogo.movenext
						Loop
						tbprodcatalogo.close



						%>
          </div>
        </div>
      </div>
    </section>


    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->