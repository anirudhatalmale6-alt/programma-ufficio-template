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

<%if mobile<>"ok" then %>
    <div>
<!--#include file="slide_immagini.inc"-->
    </div>
<%end if%>

<!-- Benefits Bar -->
<section class="bf-benefits">
    <div class="bf-container">
        <div class="bf-benefit">
            <i class="fa-solid fa-truck-fast"></i>
            <div>
                <strong>Spedizione veloce</strong>
                <span>Consegna in 24/48 ore</span>
            </div>
        </div>
        <div class="bf-benefit">
            <i class="fa-solid fa-store"></i>
            <div>
                <strong>Ritiro in negozio</strong>
                <span>Disponibile a Este (PD)</span>
            </div>
        </div>
        <div class="bf-benefit">
            <i class="fa-solid fa-rotate-left"></i>
            <div>
                <strong>Reso facile</strong>
                <span>Entro 14 giorni</span>
            </div>
        </div>
        <div class="bf-benefit">
            <i class="fa-solid fa-lock"></i>
            <div>
                <strong>Pagamenti sicuri</strong>
                <span>Carte, PayPal, Bonifico</span>
            </div>
        </div>
    </div>
</section>

<!-- About Section -->
<section style="padding:40px 0;">
    <div class="bf-container">
        <h2 class="bf-section-title">PROGRAMMA UFFICIO BUFFETTI ESTE PADOVA</h2>
        <div class="bf-home-cards">
            <div class="bf-home-card">
                <div class="bf-home-card-img">
                    <a href="azienda.asp">
                        <img src="./img/blogs/blog1.jpg" alt="Negozio">
                    </a>
                    <span class="bf-home-card-badge">NEGOZIO ORIENTATO AL FUTURO</span>
                </div>
                <div class="bf-home-card-body">
                    <h3><a href="azienda.asp">Il negozio PROGRAMMA UFFICIO e' rivenditore Buffetti.</a></h3>
                    <p>Ai prodotti tradizionali come modulistica, editoria, archivio e cancelleria, nel corso degli anni ha aggiunto altre categorie di prodotto come arredamento per ufficio, stampanti e cartucce, borse, zaini e molto altro.</p>
                    <a href="azienda.asp" class="bf-read-more">continua... <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="bf-home-card">
                <div class="bf-home-card-img">
                    <a href="#">
                        <img src="./img/blogs/blog2.jpeg" alt="SPID">
                    </a>
                    <span class="bf-home-card-badge">SPID BUFFETTI</span>
                </div>
                <div class="bf-home-card-body">
                    <h3>SPID FACILE E RAPIDO CON BUFFETTI</h3>
                    <p>La richiesta dello SPID con Buffetti e' semplicissima. Bastera' compilare il modulo per la richiesta di informazioni e verrai contattato per venire personalmente nello store Buffetti piu' vicino a te.</p>
                </div>
            </div>
            <div class="bf-home-card">
                <div class="bf-home-card-img">
                    <a href="shop.asp">
                        <img src="./img/blogs/blog3.jpg" alt="Scuola">
                    </a>
                    <span class="bf-home-card-badge">BUFFETTI SCUOLA</span>
                </div>
                <div class="bf-home-card-body">
                    <h3><a href="shop.asp">BUFFETTI OGNI 3 MESI RINNOVA LE OFFERTE CON SCONTO SINO AL 70%</a></h3>
                    <p>Il volantino buffetti esce ogni 3 mesi e si possono trovare offerte sino al 70% con i prodotti di alta gamma per la scuola.</p>
                    <a href="shop.asp" class="bf-read-more">vai alla sezione... <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="bf-home-card">
                <div class="bf-home-card-img">
                    <a href="odcartuccemarche.asp">
                        <img src="./img/blogs/blog4.jpg" alt="Cartucce">
                    </a>
                    <span class="bf-home-card-badge">CARTUCCE BUFFETTI</span>
                </div>
                <div class="bf-home-card-body">
                    <h3><a href="odcartuccemarche.asp">LE COMPATIBILI PIU' SICURE ED ECONOMICHE</a></h3>
                    <p>Cartucce compatibili per marca: HP, Canon, Epson, Brother, Samsung, Lexmark, Kyocera, Ricoh, OKI e molte altre.</p>
                    <a href="odcartuccemarche.asp" class="bf-read-more">vai alla sezione... <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Offerte Volantino -->
<section style="padding:20px 0;background:var(--bg);">
    <div class="bf-container">
        <div class="swiper swiper-gridcard relative overflow-hidden">
            <div class="bf-swiper-header">
                <h2 class="bf-section-title" style="margin-bottom:0;">Offerte Volantino</h2>
                <div class="bf-swiper-nav">
                    <button class="button-prev">&#10094;</button>
                    <button class="button-next">&#10095;</button>
                </div>
            </div>
            <div class="swiper-wrapper">
                <%
                i=0
                Set tbmag = Server.CreateObject("ADODB.RecordSet")
                querymag="SELECT codice,descrizione,prezzo,prezzoofferta,qta FROM magazinebuffetti order by rand() limit 35"
                tbmag.Open querymag,conn
                i=0
                do while i<>6
                i=i+1
                codice=tbmag("codice")
                %>
                <div class="swiper-slide" style="height:260px;">
                    <div style="display:flex;gap:16px;background:#fff;border-radius:10px;padding:16px;border:1px solid var(--border);">
                        <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>">
                            <div style="width:130px;min-width:130px;height:130px;display:flex;align-items:center;justify-content:center;">
                                <img src="foto.asp?cat=catalogobuffetti2016_big&img=<%=tbmag("codice")%>.jpg" style="max-height:120px;max-width:120px;" alt="<%=ucase(left(tbmag("descrizione"),50))%>">
                            </div>
                        </a>
                        <div style="flex:1;position:relative;padding-left:16px;border-left:2px solid var(--border);">
                            <div class="rater" data-rater="4"></div>
                            <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>" style="color:var(--text);font-size:13px;font-weight:500;">
                                <%=tbmag("codice")%><br><%=ucase(left(tbmag("descrizione"),50))%>
                            </a>
                            <div style="margin-top:8px;">
                                <%
                                v1=formatnumber(tbmag("prezzo"),2)
                                v2=formatnumber(tbmag("prezzoofferta"),2)
                                percsconto=formatnumber(((v1-v2)*100)/v1,2)
                                %>
                                <span style="font-size:18px;font-weight:700;color:var(--primary);">&#8364; <%=formatnumber(tbmag("prezzoofferta"),2)%></span><br>
                                <span style="font-size:12px;color:var(--accent);font-weight:600;">sconto magazine del <%=percsconto%>%</span><br>
                                <span style="font-size:13px;color:var(--text-muted);text-decoration:line-through;">&#8364; <%=formatnumber(tbmag("prezzo"),2)%></span>
                            </div>
                            <% if tbmag("qta")<>1 then %>
                            <div style="margin-top:4px;font-size:12px;color:var(--accent);">min. acquistabile: <%=tbmag("qta")%> pz.</div>
                            <%end if%>
                            <span class="bf-product-badge" style="position:absolute;top:0;left:16px;">-<%=percsconto%>%</span>
                        </div>
                    </div>
                </div>
                <%
                tbmag.movenext
                loop
                tbmag.movefirst
                %>
            </div>
        </div>
    </div>
</section>

<!-- Fuori Tutto -->
<section style="padding:20px 0;">
    <div class="bf-container">
        <div class="swiper swiper-gridcard relative overflow-hidden">
            <div class="bf-swiper-header">
                <h2 class="bf-section-title" style="margin-bottom:0;">Fuori Tutto</h2>
                <div class="bf-swiper-nav">
                    <button class="button-prev">&#10094;</button>
                    <button class="button-next">&#10095;</button>
                </div>
            </div>
            <div class="swiper-wrapper">
                <%
                i=0
                do while i<>6
                i=i+1
                codice=tbmag("codice")
                %>
                <div class="swiper-slide" style="height:260px;">
                    <div style="display:flex;gap:16px;background:#fff;border-radius:10px;padding:16px;border:1px solid var(--border);">
                        <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>">
                            <div style="width:130px;min-width:130px;height:130px;display:flex;align-items:center;justify-content:center;">
                                <img src="foto.asp?cat=catalogobuffetti2016_big&img=<%=tbmag("codice")%>.jpg" style="max-height:120px;max-width:120px;" alt="<%=ucase(left(tbmag("descrizione"),50))%>">
                            </div>
                        </a>
                        <div style="flex:1;position:relative;padding-left:16px;border-left:2px solid var(--border);">
                            <div class="rater" data-rater="5"></div>
                            <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>" style="color:var(--text);font-size:13px;font-weight:500;">
                                <%=tbmag("codice")%><br><%=ucase(left(tbmag("descrizione"),50))%>
                            </a>
                            <div style="margin-top:8px;">
                                <%
                                v1=formatnumber(tbmag("prezzo"),2)
                                v2=formatnumber(tbmag("prezzoofferta"),2)
                                percsconto=formatnumber(((v1-v2)*100)/v1,2)
                                %>
                                <span style="font-size:18px;font-weight:700;color:var(--primary);">&#8364; <%=formatnumber(tbmag("prezzoofferta"),2)%></span><br>
                                <span style="font-size:12px;color:var(--accent);font-weight:600;">sconto magazine del <%=percsconto%>%</span><br>
                                <span style="font-size:13px;color:var(--text-muted);text-decoration:line-through;">&#8364; <%=formatnumber(tbmag("prezzo"),2)%></span>
                            </div>
                            <% if tbmag("qta")<>1 then %>
                            <div style="margin-top:4px;font-size:12px;color:var(--accent);">min. acquistabile: <%=tbmag("qta")%> pz.</div>
                            <%end if%>
                            <span class="bf-product-badge last-pieces" style="position:absolute;top:0;left:16px;">Ultimi Pezzi</span>
                        </div>
                    </div>
                </div>
                <%
                tbmag.movenext
                loop
                tbmag.movefirst
                %>
            </div>
        </div>
    </div>
</section>

<!-- Brands -->
<section class="bf-brands-section">
    <div class="bf-container">
        <h2 class="bf-section-title">I Nostri Brand</h2>
        <div class="bf-brands-grid">
            <a href="#"><img src="logo/CampoMarzio-logo.png" alt="Campo Marzio"></a>
            <a href="#"><img src="logo/full-time.jpg" alt="Full Time"></a>
            <a href="#"><img src="logo/legami-logo.png" alt="Legami"></a>
            <a href="#"><img src="logo/logo-doing.jpg" alt="Doing"></a>
            <a href="#"><img src="logo/logo-look-e-plan.jpg" alt="Look e Plan"></a>
            <a href="#"><img src="logo/time-work.jpg" alt="Time Work"></a>
            <a href="#"><img src="img/brands/hp-logo.png" alt="HP"></a>
            <a href="#"><img src="img/brands/philips-logo.png" alt="Philips"></a>
            <a href="#"><img src="img/brands/redragon-logo.png" alt="Redragon"></a>
            <a href="#"><img src="img/brands/samsung-logo.png" alt="Samsung"></a>
        </div>
    </div>
</section>

<!-- Novita -->
<section style="padding:20px 0;background:var(--bg);">
    <div class="bf-container">
        <div class="swiper swiper-gridcard relative overflow-hidden">
            <div class="bf-swiper-header">
                <h2 class="bf-section-title" style="margin-bottom:0;">Novita'</h2>
                <div class="bf-swiper-nav">
                    <button class="button-prev">&#10094;</button>
                    <button class="button-next">&#10095;</button>
                </div>
            </div>
            <div class="swiper-wrapper">
                <%
                i=0
                do while i<>6
                i=i+1
                codice=tbmag("codice")
                %>
                <div class="swiper-slide" style="height:260px;">
                    <div style="display:flex;gap:16px;background:#fff;border-radius:10px;padding:16px;border:1px solid var(--border);">
                        <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>">
                            <div style="width:130px;min-width:130px;height:130px;display:flex;align-items:center;justify-content:center;">
                                <img src="foto.asp?cat=catalogobuffetti2016_big&img=<%=tbmag("codice")%>.jpg" style="max-height:120px;max-width:120px;" alt="<%=ucase(left(tbmag("descrizione"),50))%>">
                            </div>
                        </a>
                        <div style="flex:1;position:relative;padding-left:16px;border-left:2px solid var(--border);">
                            <div class="rater" data-rater="5"></div>
                            <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>" style="color:var(--text);font-size:13px;font-weight:500;">
                                <%=tbmag("codice")%><br><%=ucase(left(tbmag("descrizione"),50))%>
                            </a>
                            <div style="margin-top:8px;">
                                <%
                                v1=formatnumber(tbmag("prezzo"),2)
                                v2=formatnumber(tbmag("prezzoofferta"),2)
                                percsconto=formatnumber(((v1-v2)*100)/v1,2)
                                %>
                                <span style="font-size:18px;font-weight:700;color:var(--primary);">&#8364; <%=formatnumber(tbmag("prezzoofferta"),2)%></span><br>
                                <span style="font-size:12px;color:var(--accent);font-weight:600;">sconto magazine del <%=percsconto%>%</span><br>
                                <span style="font-size:13px;color:var(--text-muted);text-decoration:line-through;">&#8364; <%=formatnumber(tbmag("prezzo"),2)%></span>
                            </div>
                            <% if tbmag("qta")<>1 then %>
                            <div style="margin-top:4px;font-size:12px;color:var(--accent);">min. acquistabile: <%=tbmag("qta")%> pz.</div>
                            <%end if%>
                            <span class="bf-product-badge new" style="position:absolute;top:0;left:16px;">New</span>
                        </div>
                    </div>
                </div>
                <%
                tbmag.movenext
                loop
                tbmag.movefirst
                %>
            </div>
        </div>
    </div>
</section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->
