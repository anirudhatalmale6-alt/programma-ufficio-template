<%
if tbprodcatalogo.Eof then response.end
' Ricerca Catalogo
if not tbprodcatalogo.Eof then
    %>


		<!--#include file="ricercacatalogoparametribuffetti.inc" -->

		<%
		'if i=1 then response.write("<hr>")
		if session("vis")="1" or session("vis")="" or mobile="ok" then %>

   <div class="bf-product-card">
       <div class="bf-product-badge">-<%=percsconto%>%</div>

       <div class="bf-product-image">
           <a HREF="dettaglibuffettishop.asp?cod=<%=tbprodcatalogo("codice_buf")%>#buffposizione"><img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbprodcatalogo("codice_buf")%>.jpg' border=0></a>
       </div>

       <div class="bf-product-actions">
           <a class='yBox yBox_iframe' href="listinovisua.asp?For=buffetti&Op=Ins&Cod_Lis=<%=tbprodcatalogo("Codice_buf")%>">
               <button class="bf-btn-wishlist" type="button">
                   <i class="fa-regular fa-heart"></i>
               </button>
           </a>
           <a class='yBox yBox_iframe' href="dettaglibuffettishoplittle.asp?cod=<%=tbprodcatalogo("codice_buf")%>#odposizione">
               <button class="bf-btn-quickview" type="button">
                   <i class="fa-solid fa-eye"></i>
               </button>
           </a>
       </div>

       <div class="bf-product-info">
           <div class="bf-product-code">
               <a href="dettaglibuffettishop.asp?cod=<%=tbprodcatalogo("codice_buf")%>#odposizione"><b><%=ucase(tbprodcatalogo("codice_buf"))%></b></a>
           </div>
           <div class="bf-product-name">
               <a href="dettaglibuffettishop.asp?cod=<%=tbprodcatalogo("codice_buf")%>#odposizione"><%=mid(ucase(tbprodcatalogo("descrizione")),1,30)%></a>
           </div>
           <div class="bf-product-price">
               <span class="bf-price-current">&#8364;.<%=formatnumber(Mprezzo2,2)%></span>
               <%if trim(magazinesconto)<>"" then %>
                   <span class="bf-price-discount"><img src="images/promo.png"> <%=magazinesconto%></span>
                   <span class="bf-price-old"><del>&#8364;.<%=formatnumber(tbprodcatalogo("prezzo_vendita_buffetti"),2)%></del></span>
               <%end if%>
           </div>
       </div>

       <div class="bf-product-meta">
           <%if profilo=false then %>
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
           end if %>
           <br><span class="bf-iva-info"><%=valore_iva(tbprodcatalogo("codice_buf"))%></span>
           <%if magqta<>1 then%>
               min acquistabile pz.<%=magqta%>
           <% else%>
               min. acquistabile pz.1
           <% end if
           %>
       </div>

       <div class="bf-product-footer">
           <%response.Write "<form name=formb" & counterfrm & " >" %>
           <div class="bf-quantity-row">
               <div class="bf-quantity-input">
                   <input type="button" onClick="dimqta('qta<%=counterfrm%>')" class="minus" value="-">
                   <input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" title="Qty" value="<%=magqta%>" min="1" step="1">
                   <input type="button" onClick="aggqta('qta<%=counterfrm%>')" class="plus" value="+">
               </div>
               <button onClick="carrellobuffetti('<%=tbprodcatalogo("codice_buf")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)" class="bf-btn-cart" type="button">
                   <i class="fa-solid fa-cart-shopping"></i> Acquista Subito
               </button>
           </div>
           </form>

           <div class="bf-wishlist-footer">
               <a class='yBox yBox_iframe' href="listinovisua.asp?For=buffetti&Op=Ins&Cod_Lis=<%=tbprodcatalogo("Codice_buf")%>"><i class="fa-regular fa-heart"></i> Preferiti</a>
           </div>
       </div>
   </div>
 <%
end if
end if%>