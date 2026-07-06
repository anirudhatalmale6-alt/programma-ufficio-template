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




              <div class="bf-quantity-row">
                <span>Quantity:</span>
                <div>

                  <div class="bf-quantity-input">

					<%response.Write "<form name=formb" & counterfrm & " >" %>
							  <div class="quantity buttons_added" style="justify-content:center;align:center;">
										<center>&nbsp;
												&nbsp;&nbsp;&nbsp;<input type="button" onClick="dimqta('qta<%=counterfrm%>')"  class="minus" style="width:15px;background: none repeat scroll 0 0 #1A4B87;color:#ffffff;" value="-" >
												<input type="number" class="rounded" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" style="width:90px;text-align:center;border-color:#1A4B87;font-size:11px;" title="Qty" value="<%=magqta%>" min="1" step="1">
												<input type="button" onClick="aggqta('qta<%=counterfrm%>')"  class="plus" value="+" style="width:15px;background: none repeat scroll 0 0 #1A4B87;color:#ffffff;" >
										</center>

										</div>


                  </div>

                  <button  onClick="carrellobuffetti('<%=tbprodcatalogo("codice_buf")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)"
                    class="bf-btn-cart"
                    type="button">
                    <i class="fa-solid fa-cart-shopping"></i>
                    Acquista Subito
                  </button>

				   </form>
                </div>
              </div>

			            <div class="bf-btn-wishlist">
				<a class='yBox yBox_iframe' href="listinovisua.asp?For=buffetti&Op=Ins&Cod_Lis=<%=tbprodcatalogo("Codice_buf")%>" style="color:#1A4B87;font-size:14px;width=100%;">

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
  <p><font style="color:#000000;font-weight:normal;font-size:16px;"><br>
												 <%=replace(replace(replace(replace(replace(replace(lcase(tbprodcatalogo("descrizione1")),"-","/"),"p","e"),"cod non found shoe.buffetti",""),"class","id"),".",".<br>"),"div","p")%>
												<br><br><br><br></font></p>

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
						loggaVisSchede "buffetti",tbprodcatalogo("codice_buf"),tbprodcatalogo("Categoria"),tbprodcatalogo("SottoCategoria"),Session("nomeutente"),Session("Chisono")
						end if
						'chiusura tabelle



						'Query Simili
						querysimili="select * From prodotti where codice_buf<>'' and codice_buf like '" & mid(Trim(Request("Cod")),1,4) & "%' order by codice_buf asc limit 20"
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
							<!--#include file="single_product_buffetti.inc" -->
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