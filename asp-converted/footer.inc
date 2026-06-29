<!-- Newsletter Section -->
<section class="bf-newsletter">
    <div class="bf-container">
        <h2>Iscriviti alla nostra newsletter</h2>
        <p>Riceverai offerte speciali, sconti e coupon periodici</p>
        <form action="regmail2.asp" method="post" class="bf-newsletter-form">
            <input type="text" id="your-email" name="email" placeholder="La tua email...">
            <button type="submit"><i class="fa-solid fa-paper-plane"></i> Iscriviti</button>
        </form>
    </div>
</section>

<!-- Footer -->
<footer class="bf-footer">
    <div class="bf-container">
        <div class="bf-footer-grid">
            <!-- About Column -->
            <div class="bf-footer-col bf-footer-about">
                <h4>Programma Ufficio</h4>
                <div class="bf-footer-logo">
                    <img src="images/logobuffettihome.png" alt="Programma Ufficio">
                </div>
                <div class="bf-footer-badges">
                    <img src="img/convenienza.png" alt="Convenienza">
                    <img src="img/qualita.png" alt="Qualita">
                </div>
                <p class="bf-footer-company"><%=Session("ragionesocialetestofooter")%></p>
                <p class="bf-footer-desc"><%=Session("titolofinepagina")%></p>
                <p class="bf-footer-contact">
                    <i class="fa-solid fa-envelope"></i>
                    <a href="mailto:<%=Session("defaultMailfrom")%>"><%=Session("defaultMailfrom")%></a>
                </p>
                <p class="bf-footer-contact">
                    <i class="fa-solid fa-phone"></i>
                    <a href="tel:0039<%=Session("mobile")%>">(+39) <%=Session("mobile")%></a> anche su WhatsApp
                </p>
            </div>

            <!-- Quick Links Column -->
            <div class="bf-footer-col">
                <h4>Link Rapidi</h4>
                <ul>
                    <li><a href="azienda.asp">Chi siamo</a></li>
                    <li><a href="azienda.asp">Dove ci trovi</a></li>
                    <li><a href="accedi.asp">Accedi</a></li>
                    <li><a href="listino.asp">Preferiti</a></li>
                    <li><a href="contattaci.asp">Contatti</a></li>
                    <li><a href="condizionidivendita.asp">Condizioni di Vendita</a></li>
                    <li><a href="ingresso.asp">Area riservata</a></li>
                </ul>
            </div>

            <!-- Categories Column -->
            <div class="bf-footer-col">
                <h4>Categorie</h4>
                <ul>
                    <li><a href="catbuffetti.asp">Catalogo Buffetti</a></li>
                    <li><a href="odcat.asp">Catalogo Programma</a></li>
                    <li><a href="odcartuccemarche.asp">Cartucce e Toner</a></li>
                    <li><a href="shop.asp">Volantino Offerte</a></li>
                    <li><a href="registrati.asp">Registrati</a></li>
                    <li><a href="privacy.asp">Privacy Policy</a></li>
                    <li><a href="cookies.asp">Cookie Policy</a></li>
                </ul>
            </div>

            <!-- Contact Column -->
            <div class="bf-footer-col">
                <h4>Contatti</h4>
                <p class="bf-footer-contact">
                    <i class="fa-solid fa-location-dot"></i>
                    <span>Via Zuccherificio, 4 - 35042 ESTE (PD)</span>
                </p>
                <p class="bf-footer-contact">
                    <i class="fa-solid fa-envelope"></i>
                    <a href="mailto:ordini@programmaufficio.eu">ordini@programmaufficio.eu</a>
                </p>
                <p class="bf-footer-contact">
                    <i class="fa-solid fa-phone"></i>
                    <span><%=Session("mobile")%></span>
                </p>
                <div class="bf-footer-social">
                    <a href="<%=Session("facebook")%>" title="Facebook" target="_blank">
                        <i class="fa-brands fa-facebook-f"></i>
                    </a>
                    <a href="https://wa.me/39<%=Session("mobile")%>?text=ti%20scrivo%20da%20<%=Session("sitourl")%>" title="WhatsApp" target="_blank">
                        <i class="fa-brands fa-whatsapp"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="bf-footer-bottom">
        <div class="bf-container">
            <p>Copyright &copy; 2025 Developer Marco Genovese &middot;
                <a href="privacy.asp">Privacy Policy</a> &middot;
                <a href="condizionidivendita.asp">Condizioni di Vendita</a>
            </p>
            <div class="bf-payment-icons">
                <i class="fa-brands fa-cc-visa"></i>
                <i class="fa-brands fa-cc-mastercard"></i>
                <i class="fa-brands fa-cc-paypal"></i>
            </div>
        </div>
    </div>
</footer>

<!-- Floating Buttons -->
<div class="bf-floating-btns">
    <a class="bf-floating-btn whatsapp"
       href="https://wa.me/39<%=Session("mobile")%>?text=ti%20scrivo%20da%20<%=Session("sitourl")%>"
       title="Messaggia su WhatsApp" target="_blank">
        <i class="fa-brands fa-whatsapp"></i>
    </a>
    <a class="bf-floating-btn facebook"
       href="<%=Session("facebook")%>" title="Facebook" target="_blank">
        <i class="fa-brands fa-facebook-f"></i>
    </a>
</div>

<!-- Scroll to top -->
<button class="bf-scroll-top" id="bfScrollTop">
    <i class="fa-solid fa-chevron-up"></i>
</button>

<!-- Cookie Policy -->
<script type="text/javascript">var cookie_policy_url = 'https://nibirumail.com/cookies/policy/?url=<%=Session("sitourl")%>';</script>
<script type="text/javascript" src="https://nibirumail.com/docs/scripts/nibirumail.cookie.min.js"></script>

<!-- Bootstrap JS -->
<script src="js/bootstrap.min.js"></script>

<!-- jQuery plugins -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.easing.1.3.min.js"></script>

<!-- Site JS -->
<script src="js/main.js"></script>

<!-- Slider -->
<script src="js/bxslider.min.js"></script>
<script src="js/script.slider.js"></script>

<!-- Libs -->
<script src="./lib/rater-js/rater-js.js"></script>
<script src="./lib/nouiSlider/nouislider.min.js"></script>
<script src="./lib/swiper/swiper-bundle.min.js"></script>
<script src="./lib/metisMenu/metismenujs.min.js"></script>
<script src="./js/main.js"></script>

<!-- Buffetti Template JS -->
<script src="js/buffetti.js"></script>
