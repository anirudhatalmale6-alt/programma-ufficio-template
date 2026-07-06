<%
if tbprodcatalogo.Eof then response.end
' Ricerca Catalogo
if not tbprodcatalogo.Eof then
    %>


		<!--#include file="ricercacatalogoparametriod.inc" -->

		<%
		'if i=1 then response.write("<hr>")
		if session("vis")="1" or session("vis")="" or mobile="ok" then %>

   <div class="bf-product-card">
       <div class="bf-product-badge">-<%=percsconto%>%</div>

       <div class="bf-product-image">
           <a HREF="oddettagli.asp?cod=<%=tbprodcatalogo("codice_od")%>#odposizione"><img src='foto.asp?cat=catalogoisp/piccole&img=<%=tbprodcatalogo("codice_od")%>.jpg' border=0></a>
       </div>

       <%
       Set objxmlhttppdf = Server.CreateObject("Microsoft.XMLHTTP")
       ' Apro e lancio la richiesta HTTP
       linkpdf="https://img.schede.eu/cataloghi/pdf/" & replace(tbprodcatalogo("codice_od"),"OD","") & ".pdf"
       objxmlhttppdf.Open "GET", linkpdf, false
       objxmlhttppdf.Send
       ' Se l'immagine esiste la mostro
       if CInt(objxmlhttppdf.Status) = 200 then
           'ok
           Response.write("<div class=""bf-product-pdf""><a class='yBox yBox_iframe' href='" & linkpdf & "'><img width='100px;' src='img/icopdf.jpg' border='0' ></a></div>")
       else
           Response.write("<div class=""bf-product-pdf""><a href='#'><img src='img/icopdfwhite.jpg' width='100px;' border='0' ></a></div>")
       end if
       objxmlhttppdf.close
       %>

       <div class="bf-product-actions">
           <a class='yBox yBox_iframe' href="listinovisua.asp?For=od&Op=Ins&Cod_Lis=<%=tbprodcatalogo("codice_od")%>">
               <button class="bf-btn-wishlist" type="button">
                   <i class="fa-regular fa-heart"></i>
               </button>
           </a>
           <a class='yBox yBox_iframe' href="oddettaglilittle.asp?cod=<%=tbprodcatalogo("codice_od")%>#odposizione">
               <button class="bf-btn-quickview" type="button">
                   <i class="fa-solid fa-eye"></i>
               </button>
           </a>
       </div>

       <div class="bf-product-info">
           <div class="bf-product-code">
               <a href="oddettagli.asp?cod=<%=tbprodcatalogo("codice_od")%>#odposizione"><b><%=ucase(tbprodcatalogo("codice_od"))%></b></a>
           </div>
           <div class="bf-product-name">
               <a href="oddettagli.asp?cod=<%=tbprodcatalogo("codice_od")%>#odposizione"><%=mid(ucase(tbprodcatalogo("descrizione")),1,30)%></a>
           </div>
           <div class="bf-product-price">
               <%
               'sconto%
               v1=formatnumber(Mprezzo1,2)
               v2=formatnumber(Mprezzo2,2)
               percsconto="35"
               if v1-v2<>0 then percsconto=cstr(formatnumber(((v1-v2)*100)/v1,0)) & "%<br>"
               %>
               <span class="bf-price-current">&#8364;.<%=formatnumber(Mprezzo2,2)%></span>
               <%if Session("Chisono")<>"" then%>
                   <span class="bf-price-old"><del>&#8364;.<%=formatnumber(Mprezzo1,2)%></del></span>
               <%end if%>
               <b><%=magazinesconto%></b>
           </div>
       </div>

       <div class="bf-product-meta">
           quantita' minima acquistabile pz.<%=tbprodcatalogo("AA_Qta_Conf")%><br>
           disponibilita' pezzi  <%=tbprodcatalogo("giacenza")%>
           <%if cdbl(tbprodcatalogo("giacenza"))>0 then%>
               <img width="250px;" src="images/pmag1.png">
           <%else%>
               <img width="250px;" src="images/pmag2.png">
           <%end if%>
       </div>

       <div class="bf-product-footer">
           <%response.Write "<form name=formb" & counterfrm & " >" %>
           <div class="bf-quantity-row">
               <div class="bf-quantity-input">
                   <input type="button" onClick="dimqta('qta<%=counterfrm%>')" class="minus" value="-">
                   <input type="number" id='qta<%=counterfrm%>' name='qta<%=counterfrm%>' size="5" title="Qty" value="<%=tbprodcatalogo("AA_Qta_Conf")%>" min="1" step="1">
                   <input type="button" onClick="aggqta('qta<%=counterfrm%>')" class="plus" value="+">
               </div>
               <button onClick="carrellood('<%=tbprodcatalogo("codice_od")%>', document.formb<%=counterfrm%>.qta<%=counterfrm%>.value)" class="bf-btn-cart" type="button">
                   <i class="fa-solid fa-cart-shopping"></i> Acquista Subito
               </button>
           </div>
           </form>

           <div class="bf-wishlist-footer">
               <a class='yBox yBox_iframe' href="listinovisua.asp?For=od&Op=Ins&Cod_Lis=<%=tbprodcatalogo("codice_od")%>"><i class="fa-regular fa-heart"></i> Preferiti</a>
           </div>
       </div>
   </div>
 <%
end if
end if%>