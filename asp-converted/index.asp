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
<section class="bf-content-page">
    <div class="bf-container">
        <h2 class="bf-section-title">PROGRAMMA UFFICIO BUFFETTI ESTE PADOVA</h2>
        <div class="bf-home-cards">
            <div class="bf-home-card">
                <div class="bf-home-card-img">
                    <a href="azienda.asp">
                        <img src="./img/blogs/blog1.jpg" alt="Negozio">
                    </a>
                    <span class="bf-home-card-badge"><i class="fa-solid fa-calendar-days"></i> NEGOZIO ORIENTATO AL FUTURO</span>
                </div>
                <div class="bf-home-card-body">
                    <h3><a href="azienda.asp">Il negozio PROGRAMMA UFFICIO e' rivenditore Buffetti.</a></h3>
                    <p>Ai prodotti tradizionali come modulistica, editoria, archivio e cancelleria, nel corso degli anni ha aggiunto altre categorie di prodotto come arredamento per ufficio, stampanti e cartucce, borse, zaini e molto altro.
Un servizio di fornitura a 360 gradi per ogni esigenza, dal piccolo negozio o ufficio agli studi professionali, dalle grandi aziende alla Pubblica Amministrazione.
 PROGRAMMA UFFICIO e' sempre al passo con i tempi e anticipa le vostre esigenze per darvi sempre la soluzione piu'adatta alle vostre esigenze.
Come per lo scontrino telematico... da  PROGRAMMA UFFICIO Affiliato Buffetti sono gia' disponibili i nuovi registratori di cassa telematici! Vieni a vederli e a provarli con calma, non aspettare l'ultimo momento!
A questi si affiancano anche i privati che si rivolgono a  PROGRAMMA UFFICIO per i loro acquisti personali per casa e per ottime idee regalo.
Ma non solo, troverete anche un vasto assortimento di prodotti dedicati alla scuola.</p>
                    <a href="azienda.asp" class="bf-read-more">continua... <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
            <div class="bf-home-card">
                <div class="bf-home-card-img">
                    <a href="#">
                        <img src="./img/blogs/blog2.jpeg" alt="SPID">
                    </a>
                    <span class="bf-home-card-badge"><i class="fa-solid fa-calendar-days"></i> SPID BUFFETTI</span>
                </div>
                <div class="bf-home-card-body">
                    <h3>SPID FACILE E RAPIDO CON BUFFETTI</h3>
                    <p>La richiesta dello SPID con Buffetti e' semplicissima. Bastera' compilare il modulo per la richiesta di informazioni e verrai contattato per venire personalmente nello store Buffetti piu' vicino a te.
La creazione dello SPID verra' effettuata dai nostri operatori e ti restituiranno le credenziali necessarie per l'accesso.
Con Buffetti hai la possibilita' di accedere a prodotti digitali di qualita' come lo SPID, ma anche come la</p>
                </div>
            </div>
            <div class="bf-home-card">
                <div class="bf-home-card-img">
                    <a href="shop.asp">
                        <img src="./img/blogs/blog3.jpg" alt="Scuola">
                    </a>
                    <span class="bf-home-card-badge"><i class="fa-solid fa-calendar-days"></i> BUFFETTI SCUOLA</span>
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
                    <span class="bf-home-card-badge"><i class="fa-solid fa-calendar-days"></i> CARTUCCE BUFFETTI</span>
                </div>
                <div class="bf-home-card-body">
                    <h3><a href="odcartuccemarche.asp">LE COMPATIBILI PIU' SICURE ED ECONOMICHE</a></h3>
                    <p>Cartucce compatibili per marca: Apple, Brother, Bull, Canon, Compuprint, Epson, Facit, Fujitsu, HP, IBM, Konica Minolta, Kyocera Mita, Lanier, Lexmark, Naschua, NEC, OKI, Olivetti, Olympia, Panasonic, Philips, Ricoh, Samsung.</p>
                    <a href="odcartuccemarche.asp" class="bf-read-more">vai alla sezione... <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Offerte Volantino -->
<section class="bf-swiper-section">
    <div class="bf-container">
        <div class="swiper swiper-gridcard">
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
                <div class="swiper-slide">
                    <div class="bf-product-list-item">
                        <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>">
                            <figure class="bf-product-image">
                                <img src="foto.asp?cat=catalogobuffetti2016_big&img=<%=tbmag("codice")%>.jpg" alt="<%=ucase(left(tbmag("descrizione"),50))%>">
                            </figure>
                        </a>
                        <div class="bf-product-info">
                            <div class="rater" data-rater="4"></div>
                            <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>" class="bf-product-name">
                                <%=tbmag("codice")%><br><%=ucase(left(tbmag("descrizione"),50))%>
                            </a>
                            <div class="bf-product-pricing">
                                <%
                                'sconto%
                                v1=formatnumber(tbmag("prezzo"),2)
                                v2=formatnumber(tbmag("prezzoofferta"),2)
                                percsconto=formatnumber(((v1-v2)*100)/v1,2)
                                %>
                                <span class="bf-price-current">&#8364; <%=formatnumber(tbmag("prezzoofferta"),2)%></span>
                                <span class="bf-price-discount">sconto magazine del <%=percsconto%>%</span>
                                <span class="bf-price-old">&#8364; <%=formatnumber(tbmag("prezzo"),2)%></span>
                            </div>
                            <% if tbmag("qta")<>1 then %>
                            <div class="bf-product-qty-note">min. acquistabile: <%=tbmag("qta")%> pz.</div>
                            <%end if%>
                            <span class="bf-product-badge">-<%=percsconto%>%</span>
                        </div>
                    </div>
                </div>
                <%
                'response.end
                tbmag.movenext
                loop
                tbmag.movefirst
                %>
            </div>
        </div>
    </div>
</section>

<!-- Fuori Tutto -->
<section class="bf-swiper-section">
    <div class="bf-container">
        <div class="swiper swiper-gridcard">
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
                <div class="swiper-slide">
                    <div class="bf-product-list-item">
                        <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>">
                            <figure class="bf-product-image">
                                <img src="foto.asp?cat=catalogobuffetti2016_big&img=<%=tbmag("codice")%>.jpg" alt="<%=ucase(left(tbmag("descrizione"),50))%>">
                            </figure>
                        </a>
                        <div class="bf-product-info">
                            <div class="rater" data-rater="5"></div>
                            <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>" class="bf-product-name">
                                <%=tbmag("codice")%><br><%=ucase(left(tbmag("descrizione"),50))%>
                            </a>
                            <div class="bf-product-pricing">
                                <%
                                'sconto%
                                v1=formatnumber(tbmag("prezzo"),2)
                                v2=formatnumber(tbmag("prezzoofferta"),2)
                                percsconto=formatnumber(((v1-v2)*100)/v1,2)
                                %>
                                <span class="bf-price-current">&#8364; <%=formatnumber(tbmag("prezzoofferta"),2)%></span>
                                <span class="bf-price-discount">sconto magazine del <%=percsconto%>%</span>
                                <span class="bf-price-old">&#8364; <%=formatnumber(tbmag("prezzo"),2)%></span>
                            </div>
                            <% if tbmag("qta")<>1 then %>
                            <div class="bf-product-qty-note">min. acquistabile: <%=tbmag("qta")%> pz.</div>
                            <%end if%>
                            <span class="bf-product-badge last-pieces">Ultimi Pezzi</span>
                        </div>
                    </div>
                </div>
                <%
                'response.end
                tbmag.movenext
                loop
                tbmag.movefirst
                %>
            </div>
        </div>
    </div>
</section>

<!-- I Nostri Brand -->
<section class="bf-brands-section">
    <div class="bf-container">
        <h2 class="bf-section-title">I Nostri Brand</h2>
        <div class="swiper swiper-brands">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <a href="#"><img src="logo/CampoMarzio-logo.png" alt="Campo Marzio"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="logo/full-time.jpg" alt="Full Time"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="logo/legami-logo.png" alt="Legami"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="logo/logo-doing.jpg" alt="Doing"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="logo/logo-look-e-plan.jpg" alt="Look e Plan"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="logo/time-work.jpg" alt="Time Work"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="img/brands/hp-logo.png" alt="HP"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="img/brands/philips-logo.png" alt="Philips"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="img/brands/redragon-logo.png" alt="Redragon"></a>
                </div>
                <div class="swiper-slide">
                    <a href="#"><img src="img/brands/samsung-logo.png" alt="Samsung"></a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Novita -->
<section class="bf-swiper-section">
    <div class="bf-container">
        <div class="swiper swiper-gridcard">
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
                <div class="swiper-slide">
                    <div class="bf-product-list-item">
                        <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>">
                            <figure class="bf-product-image">
                                <img src="foto.asp?cat=catalogobuffetti2016_big&img=<%=tbmag("codice")%>.jpg" alt="<%=ucase(left(tbmag("descrizione"),50))%>">
                            </figure>
                        </a>
                        <div class="bf-product-info">
                            <div class="rater" data-rater="5"></div>
                            <a href="dettaglibuffettishop.asp?cod=<%=tbmag("codice")%>" class="bf-product-name">
                                <%=tbmag("codice")%><br><%=ucase(left(tbmag("descrizione"),50))%>
                            </a>
                            <div class="bf-product-pricing">
                                <%
                                'sconto%
                                v1=formatnumber(tbmag("prezzo"),2)
                                v2=formatnumber(tbmag("prezzoofferta"),2)
                                percsconto=formatnumber(((v1-v2)*100)/v1,2)
                                %>
                                <span class="bf-price-current">&#8364; <%=formatnumber(tbmag("prezzoofferta"),2)%></span>
                                <span class="bf-price-discount">sconto magazine del <%=percsconto%>%</span>
                                <span class="bf-price-old">&#8364; <%=formatnumber(tbmag("prezzo"),2)%></span>
                            </div>
                            <% if tbmag("qta")<>1 then %>
                            <div class="bf-product-qty-note">min. acquistabile: <%=tbmag("qta")%> pz.</div>
                            <%end if%>
                            <span class="bf-product-badge new">New</span>
                        </div>
                    </div>
                </div>
                <%
                'response.end
                tbmag.movenext
                loop
                tbmag.close

                'reset controllo plagio .... attne
                'reset controllo plagio .... attne
                'reset controllo plagio .... attne

                CONNM.EXECUTE("delete FROM prodotti where (categoria='informatica' or categoria like '%macchine%' or categoria like '%sistemi%') and marchio='hp'")
                CONNM.EXECUTE("delete FROM prodotti where categoria like '%marketi%'")
                CONNM.EXECUTE("update FROM prodotti set AA_Qta_Conf=1 where categoria='consumabili'")

                'reset controllo plagio .... attne
                'reset controllo plagio .... attne
                'reset controllo plagio .... attne

                %>
            </div>
        </div>
    </div>
</section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->
