<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%
'dettagli buffetti
Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
sSql="select * from prodotti where Codice_buf='" & Trim(Request("Cod")) & "' limit 1"
tbprodcatalogo.Open sSql, connm
if tbprodcatalogo.eof then response.redirect "articolonontrovato.asp"
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
                     <a class='yBox' href='foto.asp?cat=catalogobuffetti2016_big&img=<%=tbprodcatalogo("codice_buf")%>.jpg'><img src='foto.asp?cat=catalogobuffetti2016_big&img=<%=tbprodcatalogo("codice_buf")%>.jpg' border=0></a>

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
                <div class="product-gallery">
                  <a class='yBox' href='foto.asp?cat=catalogobuffetti2016_big&img=<%=tbprodcatalogo("codice_buf")%>.jpg'><img  src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbprodcatalogo("Codice_buf")%>.jpg'  border=0></a> <br>
                  <a class='yBox' href='foto.asp?cat=catalogobuffetti2016_big&img=<%=tbprodcatalogo("codice_buf")%>_1.jpg'><img  src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbprodcatalogo("Codice_buf")%>_1.jpg'  border=0></a><br>
                  <a class='yBox' href='foto.asp?cat=catalogobuffetti2016_big&img=<%=tbprodcatalogo("codice_buf")%>_2.jpg'><img  src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbprodcatalogo("Codice_buf")%>_2.jpg'   border=0></a><br>
                  <a class='yBox' href='foto.asp?cat=catalogobuffetti2016_big&img=<%=tbprodcatalogo("codice_buf")%>_3.jpg'><img  src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbprodcatalogo("Codice_buf")%>_3.jpg' border=0>	</a>	<br>
                </div>
              </div>
            </div>
          </div>

          <div class="bf-product-detail-info">
            <div class="bf-product-detail-stock">
              <span>In Stock</span>
            </div>
            <h1>
              <b>codice : <%=tbprodcatalogo("codice_buf")%></b><br><%=tbprodcatalogo("Descrizione")%>
            </h1>
            <div class="bf-product-detail-price">
              <span class="bf-price-current"


									<!--#include file="ricercacatalogoparametribuffetti.inc" -->

											<ins>&#8364;.<%=formatnumber(Mprezzo2,2)%></ins><font size="+1" color="#000000">


											<%if cdbl(tbprodcatalogo("qta2"))>1 and boolmagazine="false" then
													response.write("<br>per n&#176;" & tbprodcatalogo("qta2") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p2"),2))
												end if
												if cdbl(tbprodcatalogo("qta3"))>1 and boolmagazine="false" then
													response.write("<br>per n&#176;" & tbprodcatalogo("qta3") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p3"),2))
												end if
												if cdbl(tbprodcatalogo("qta4"))>1 and boolmagazine="false" then
													response.write("<br>per n&#176;" & tbprodcatalogo("qta4") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p4"),2))
												end if
												if cdbl(tbprodcatalogo("qta5"))>1 and boolmagazine="false" then
													response.write("<br>per n&#176;" & tbprodcatalogo("qta5") & " pezzi &#8364;." & FormatNumber(tbprodcatalogo("p5"),2))
												end if

												%><br>

												<%if boolmagazine="false" then %>
												quantita' minima acquistabile pz.1<br>
												<%end if%>
												<br><font size="+1" color="#FF0000"><%=valore_iva(tbprodcatalogo("codice_buf"))%></font>

              </span>

              <span class="bf-price-discount-badge">
                -<%=percsconto%>% off
              </span>
			  <hr>
			  <font size="-1" color="#FF0000">aliq.iva <%=cstr(tbprodcatalogo("aliq_iva"))%>%</font>
            </div>

            <div class="bf-product-description">
              <p><font style="color:#000000;font-weight:normal;font-size:16px;"><br>
													 <%=replace(replace(replace(replace(replace(replace(lcase(tbprodcatalogo("descrizione1")),"-","/"),"p","e"),"cod non found shoe.buffetti",""),"class","id"),".",".<br>"),"div","p")%>
													</font></p>
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
    </div>

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->