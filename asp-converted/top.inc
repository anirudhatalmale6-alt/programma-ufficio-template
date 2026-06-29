<!-- Top Bar -->
<div class="bf-topbar">
    <div class="bf-container">
        <div class="bf-topbar-left">
            <a href="azienda.asp">Chi siamo</a>
            <a href="contattaci.asp">Contattaci</a>
            <a href="condizionidivendita.asp">Condizioni di vendita</a>
        </div>
        <div class="bf-topbar-right">
            <%if Session("Chisono")<>"" then%>
                <span class="bf-topbar-user">
                    <i class="fa fa-user"></i>
                    <%if Session("sRagione")<>"" then
                        response.Write(Session("sRagione"))
                    else
                        response.Write(Session("nomeutente"))
                    end if%>
                </span>
                <div class="bf-topbar-links">
                    <a href="logout.asp"><i class="fa fa-sign-out"></i> Logout</a>
                    <%if mobile<>"ok" then %>
                    <a href="listino.asp"><i class="fa fa-heart"></i> Preferiti</a>
                    <a href="storico.asp"><i class="fa fa-history"></i> Storico</a>
                    <a href="listinovisuaultimi.asp"><i class="fa fa-eye"></i> Ultimi visti</a>
                    <%end if%>
                </div>
            <%else%>
                <a href="accedi.asp" class="bf-topbar-user"><i class="fa fa-user"></i> Accedi</a>
                <a href="registrati.asp"><i class="fa fa-user-plus"></i> Registrati</a>
            <%end if%>
            <a href="https://wa.me/39<%=Session("mobile")%>"><i class="fa-brands fa-whatsapp"></i> (+39) <%=Session("mobile")%></a>
        </div>
    </div>
</div>

<!-- Header -->
<header class="bf-header">
    <div class="bf-container">
        <div class="bf-header-left">
            <button class="bf-mobile-menu-btn" id="bfMobileMenuBtn">
                <i class="fa-solid fa-bars"></i>
            </button>
            <a href="homepage.asp" class="bf-logo">
                <img src="images/logobuffettihome.png" alt="Programma Ufficio - Buffetti">
            </a>
        </div>

        <%if mobile<>"ok" then %>
        <div class="bf-header-center">
            <form action="ricercagenerica.asp" method="get" id="formricerca" name="formricerca">
                <div class="bf-search-bar">
                    <link type="text/css" rel="stylesheet" href="css/stylesajax.css" />
                    <script src="js/search.js" type="text/javascript"></script>
                    <script src="js/pagination.js" type="text/javascript"></script>
                    <script type="text/javascript">
                    function mostraLoad() {
                        search.className="ajax_loader";
                        return false;
                    }
                    function nomostraLoad() {
                        search.className="ajax_loader.clear";
                        return false;
                    }
                    </script>
                    <input type="search" id="search" name="search"
                        placeholder="Cerca per codice, descrizione, marca..."
                        onkeypress="mostraLoad();"
                        onkeydown="nomostraLoad();"
                        onkeyup="getScriptPage('show_results','search','1');"
                        onblur="nomostraLoad();if(this.value=='')this.value=this.defaultValue"
                        onfocus="if(this.value==this.defaultValue)this.value=''">
                    <button class="bf-search-btn" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                    <div id="show_results" class="bf-search-results"></div>
                </div>
            </form>
        </div>
        <%end if%>

        <div class="bf-header-right">
            <%if Session("Chisono")<>"" then%>
                <a href="clienti.asp" class="bf-header-icon" title="Il mio account">
                    <i class="fa-regular fa-user"></i>
                    <span><%if Session("sRagione")<>"" then
                        response.Write(left(Session("sRagione"),10))
                    else
                        response.Write(left(Session("nomeutente"),10))
                    end if%></span>
                </a>
            <%else%>
                <a href="accedi.asp" class="bf-header-icon" title="Accedi">
                    <i class="fa-regular fa-user"></i>
                    <span>Accedi</span>
                </a>
            <%end if%>
            <a href="listino.asp" class="bf-header-icon" title="Preferiti">
                <i class="fa-regular fa-heart"></i>
                <span>Preferiti</span>
            </a>
            <div class="bf-header-icon" id="bfCartBtn" onmouseover="Visualizza_carrello();" title="Carrello">
                <i class="fa-solid fa-cart-shopping"></i>
                <span>Carrello</span>
                <span class="bf-cart-badge" id="risultato"></span>
            </div>
        </div>
    </div>
</header>

<!-- Navigation -->
<nav class="bf-nav" id="bfMainNav">
    <div class="bf-container">
        <ul class="bf-nav-list">
            <li class="bf-nav-item bf-nav-catalog">
                <a href="#"><i class="fa-solid fa-bars"></i> Catalogo</a>
                <div class="bf-mega-menu">
                    <ul class="bf-mega-list">
                        <li class="bf-mega-category">
                            <a href="catbuffetti.asp">
                                <span>CATALOGO BUFFETTI</span>
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                        </li>
                        <%
                        menusxArray=""
                        menusxArray(0)=""
                        memcat=""
                        i=0
                        incarray=0
                        queryd1="select distinct categoria From PRODOTTI where categoria<>'' and categoria not like '%MARKET%' and fornitore='od' order by categoria asc"
                        Set tbmenucat = Server.CreateObject("ADODB.RecordSet")
                        tbmenucat.Open queryd1,connm

                        Do While not tbmenucat.eof
                            i=i+1
                        %>
                        <li class="bf-mega-category">
                            <a href="odlista.asp?cat=<%=Replace(tbmenucat("categoria")," ","%20")%>">
                                <span><%=lcase(tbmenucat("Categoria")) %></span>
                                <i class="fa-solid fa-chevron-right"></i>
                            </a>
                            <div class="bf-mega-subcats">
                                <h4><%=ucase(tbmenucat("Categoria")) %></h4>
                                <ul>
                                    <%
                                    queryd2="Select distinct sottocategoria From PRODOTTI where categoria='" & tbmenucat("Categoria") &"' and fornitore='od' order by sottocategoria asc"
                                    Set tbmenuscat = Server.CreateObject("ADODB.RecordSet")
                                    tbmenuscat.Open queryd2,connm

                                    Do While not tbmenuscat.eof
                                    %>
                                    <li>
                                        <a href='odlista.asp?sotto=<%=Replace(tbmenuscat("sottocategoria")," ","%20")%>&cat=<%=Replace(tbmenucat("categoria")," ","%20")%>'>
                                            <%=lcase(tbmenuscat("sottocategoria")) %>
                                        </a>
                                    </li>
                                    <%  tbmenuscat.movenext
                                    Loop
                                    tbmenuscat.close%>
                                </ul>
                            </div>
                        </li>
                        <%  tbmenucat.movenext
                        Loop
                        tbmenucat.close%>
                    </ul>
                </div>
            </li>
            <li class="bf-nav-item">
                <a href="homepage.asp"><i class="fa-solid fa-house"></i> Home</a>
            </li>
            <li class="bf-nav-item">
                <a href="catbuffetti.asp"><i class="fa-solid fa-book"></i> Catalogo Buffetti</a>
            </li>
            <li class="bf-nav-item">
                <a href="odcat.asp"><i class="fa-solid fa-folder-open"></i> Catalogo Programma</a>
            </li>
            <li class="bf-nav-item">
                <a href="odcartuccemarche.asp"><i class="fa-solid fa-print"></i> Cartucce Toner</a>
            </li>
            <li class="bf-nav-item">
                <a href="contattaci.asp"><i class="fa-solid fa-envelope"></i> Contatti</a>
            </li>
            <li class="bf-nav-item">
                <a href="shop.asp"><i class="fa-solid fa-newspaper"></i> Volantino</a>
            </li>
            <li class="bf-nav-item bf-nav-highlight">
                <a href="registrati.asp"><i class="fa-solid fa-user-plus"></i> Iscriviti</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Mobile Search Bar -->
<%if mobile="ok" then %>
<div class="bf-mobile-search">
    <form action="ricercagenerica.asp" method="get" id="formricercamobile" name="formricercamobile">
        <div class="bf-search-bar">
            <link type="text/css" rel="stylesheet" href="css/stylesajax.css" />
            <script src="js/search.js" type="text/javascript"></script>
            <script src="js/pagination.js" type="text/javascript"></script>
            <script type="text/javascript">
            function mostraLoad() {
                search.className="ajax_loader";
                return false;
            }
            function nomostraLoad() {
                search.className="ajax_loader.clear";
                return false;
            }
            </script>
            <input type="search" id="search" name="search"
                placeholder="Cerca codice, descrizione, marca..."
                onkeypress="mostraLoad();"
                onkeydown="nomostraLoad();"
                onkeyup="getScriptPage('show_results','search','1');"
                onblur="nomostraLoad();if(this.value=='')this.value=this.defaultValue"
                onfocus="if(this.value==this.defaultValue)this.value=''">
            <button class="bf-search-btn" type="submit">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
            <div id="show_results" class="bf-search-results"></div>
        </div>
    </form>
</div>
<%end if%>

<!-- Mobile Nav Overlay -->
<div class="bf-mobile-overlay" id="bfMobileOverlay"></div>
<div class="bf-mobile-nav" id="bfMobileNav">
    <div class="bf-mobile-nav-header">
        <span>Menu</span>
        <button class="bf-mobile-nav-close" id="bfMobileNavClose"><i class="fa-solid fa-xmark"></i></button>
    </div>
    <div class="bf-mobile-nav-logo">
        <a href="homepage.asp"><img src="images/logobuffettihome.png" alt="logo"></a>
    </div>
    <ul class="bf-mobile-nav-list">
        <li><a href="homepage.asp"><i class="fa-solid fa-house"></i> Home</a></li>
        <li><a href="catbuffetti.asp"><i class="fa-solid fa-book"></i> Catalogo Buffetti</a></li>
        <li><a href="odcat.asp"><i class="fa-solid fa-folder-open"></i> Catalogo Programma</a></li>
        <li><a href="odcartuccemarche.asp"><i class="fa-solid fa-print"></i> Cartucce Toner</a></li>
        <li><a href="shop.asp"><i class="fa-solid fa-newspaper"></i> Volantino</a></li>
        <li><a href="listino.asp"><i class="fa-regular fa-heart"></i> Preferiti</a></li>
        <li><a href="carrellovisua.asp"><i class="fa-solid fa-cart-shopping"></i> Carrello / Checkout</a></li>
        <li><a href="contattaci.asp"><i class="fa-solid fa-envelope"></i> Contatti</a></li>
    </ul>
    <div class="bf-mobile-nav-actions">
        <%if Session("Chisono")="" then%>
        <a href="accedi.asp"><i class="fa-solid fa-right-to-bracket"></i> Accedi al sito</a>
        <a href="registrati.asp"><i class="fa-solid fa-user-plus"></i> Registrati</a>
        <%else%>
        <a href="clienti.asp"><i class="fa-solid fa-user"></i> Il mio account</a>
        <a href="logout.asp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
        <%end if%>
    </div>
</div>

<!-- Cart Modal -->
<div class="bf-cart-modal" id="bfCartModal">
    <div class="bf-cart-modal-overlay" id="bfCartModalOverlay"></div>
    <div class="bf-cart-modal-content">
        <div class="bf-cart-modal-header">
            <h3><i class="fa-solid fa-cart-shopping"></i> Carrello</h3>
            <button class="bf-cart-modal-close" id="bfCartModalClose"><i class="fa-solid fa-xmark"></i></button>
        </div>
        <div class="bf-cart-modal-body" id="divcarrello"></div>
        <div class="bf-cart-modal-footer">
            <a href="carrellovisua.asp" class="bf-btn bf-btn-primary bf-btn-block">
                <i class="fa-solid fa-credit-card"></i> Vai al Checkout
            </a>
            <button class="bf-btn bf-btn-outline bf-btn-block" id="bfCartContinue">
                <i class="fa-solid fa-arrow-left"></i> Continua lo shopping
            </button>
        </div>
    </div>
</div>
