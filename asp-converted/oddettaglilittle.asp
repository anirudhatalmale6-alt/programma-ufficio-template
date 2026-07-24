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
    datitecnici=""
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

    <div class="bf-popup">
      <div class="bf-popup-inner">
        <div class="bf-product-detail-grid">
          <div class="bf-product-gallery">
            <div class="bf-product-gallery-main">
              <div class="swiper swiper-product">
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
            </div>

              <div class="bf-product-sheets">
                <span>scheda tecnica produttore:</span>
                <ul>
                  <li>
                     <%
								'if mobile<>"ok" then
									Set objxmlhttppdf = Server.CreateObject("Microsoft.XMLHTTP")
									' Apro e lancio la richiesta HTTP
									linkpdf="https://img.schede.eu/cataloghi/pdf/" & tbprodcatalogo("codice_od") & ".pdf"
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
									linkpdf="https://img.schede.eu/cataloghi/pdf/" & tbprodcatalogo("codice_od") & "_2.pdf"
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
									linkpdf="https://img.schede.eu/cataloghi/pdf/" & tbprodcatalogo("codice_od") & "_3.pdf"
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
									linkpdf="https://img.schede.eu/cataloghi/pdf/" & tbprodcatalogo("codice_od") & "_4.pdf"
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

              <!---div class="my-4">
                <span class="font-bold text-default-600">Quantity:</span>
                <div class="mt-2 flex gap-3">

                  <div style="width:200px;" class="counter flex w-28 rounded border bg-white">

					<%response.Write "<form name=formb" & counterfrm & " >" %>
							 <div class="quantity buttons_added">
												<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" style="width:25px;background: none repeat scroll 0 0 #1A4B87;color:#ffffff;" value="-" >
												<input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" style="width:80px;text-align:center;border-color:#1A4B87;" title="Qty" value="<%=tbprodcatalogo("AA_Qta_Conf")%>" min="1" step="1">
												<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" style="width:25px;background: none repeat scroll 0 0 #1A4B87;color:#ffffff;" >
										</div>


                  </div>

                  <button  onClick="carrellood('<%=tbprodcatalogo("codice_od")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)"
                    class="flex items-center gap-2 rounded-lg bg-primary-500 px-5 font-semibold uppercase text-white transition-all duration-300 hover:bg-primary-600"
                    type="submit">
                    <svg
                      class="h-4 w-4"
                      stroke="currentColor"
                      fill="currentColor"
                      stroke-width="0"
                      viewBox="0 0 576 512"
                      height="200px"
                      width="200px"
                      xmlns="http://www.w3.org/2000/svg">
                      <path
                        d="M0 24C0 10.7 10.7 0 24 0H69.5c22 0 41.5 12.8 50.6 32h411c26.3 0 45.5 25 38.6 50.4l-41 152.3c-8.5 31.4-37 53.3-69.5 53.3H170.7l5.4 28.5c2.2 11.3 12.1 19.5 23.6 19.5H488c13.3 0 24 10.7 24 24s-10.7 24-24 24H199.7c-34.6 0-64.3-24.6-70.7-58.5L77.4 54.5c-.7-3.8-4-6.5-7.9-6.5H24C10.7 48 0 37.3 0 24zM128 464a48 48 0 1 1 96 0 48 48 0 1 1 -96 0zm336-48a48 48 0 1 1 0 96 48 48 0 1 1 0-96z"></path>
                    </svg>
                    Add to cart
                  </button>

				   </form>
                </div>
              </div--->

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
              <span>disponibilita' pezzi  <%=tbprodcatalogo("giacenza")%></span>
            </div>
            <div>
              <span>Category:</span>
              <a href="#">
                <%=tbprodcatalogo("Categoria")%>#<%=tbprodcatalogo("SottoCategoria")%>
              </a>
            </div>
            <div>
              <span>Tags:</span>
              <a href="#">
                <%=tbprodcatalogo("Categoria")%>#<%=tbprodcatalogo("SottoCategoria")%>
              </a>
            </div>
          </div>

          </div>
        </div>
      </div>
    </div>


<script src="./lib/rater-js/rater-js.js"></script>
<script src="./lib/nouiSlider/nouislider.min.js"></script>
<script src="./lib/swiper/swiper-bundle.min.js"></script>
<script src="./lib/metisMenu/metismenujs.min.js"></script>
<script src="./js/main.js"></script>


<%tbprodcatalogo.close%>

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->