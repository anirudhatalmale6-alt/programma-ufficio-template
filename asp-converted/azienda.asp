<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<!DOCTYPE html>
<html lang="en">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>
  <!--#include file="top.inc" -->
  <br>
    </div>

    <section class="bf-content-page">
      <div class="bf-container">
        <div class="bf-page-title">
          <h2>Chi Siamo / Dove ci trovi</h2>
        </div>

        <div class="bf-content-card">
			 <table>
			 <tr><td>

			 <h2><span ><font color="#ff0000"><%=ucase(Session("ragionesocialetesto"))%></font></span></h2>
                    <p><%=Session("titolofinepagina")%></p>
					<p><a href=mailto:<%=Session("spedizionemail")%> ><font color="#ff0000"><%=Session("spedizionemail")%></a></p>
					<p><a href=mailto:<%=Session("stampemail")%> ><%=Session("stampemail")%></a></p>
					<p><a href=mailto:<%=Session("pecmail")%> ><%=Session("pecmail")%></font></a></p>
                    <div class="footer-social">
                        <a href="<%=Session("facebook")%>" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="" target="_blank"><i class="fa fa-instagram"></i></a>
                    </div>



<br>
NEGOZIO BUFFETTI
<br><br>
    Indirizzo: Via Zuccherificio, 4 <br>
    CAP: 35042<br>
    Localita': ESTE PADOVA<br>
    Telefono:  0429 3864<br><br>

    Giorni d'apertura: Lun Mar Mer Gio Ven Sab <br>
    Orario di Apertura: mattina 08:30 - 12:40 | pomeriggio 15:30-19:00<br>
	Sabato Mattina 09:00 - 13:30<br>
    Chiusura Settimanale: SABATO POMERIGGIO & DOMENICA<br><br>

    Il punto vendita aderisce al programma fedelta' BUFFETTI CLUB<br>
    Si effettuano consegne a domicilio<br>
    Disponibile modulistica fiscale<br><br>

Si accettano pagamenti tramite:<br><br>

    Bancomat<br>
    Carta di Credito Visa<br>
    Carta di Credito MasterCard<br>
    Altra carta di credito<br>
    Assegni<br><br>

Ampia gamma prodotti di:<br><br>

    ARCHIVIO (registratori, cartelle, scatole, ...)<br>
    ARREDO (sedute, scrivanie, mobili per ufficio, ...)<br>
    CANCELLERIA (scrittura, carta, cucitrici, calcolatrici, ...)<br>
    CONSUMABILI COMPATIBILI (cartucce, toner)<br>
    EDITORIA PROFESSIONALE (Buffetti/Sole24Ore)<br>
    HARDWARE (pc, tablet, stampanti, distruggi documenti, prova banconote, ...)<br>
    MODULISTICA (fatture, registri, ricevute, contratti, ...)<br>
    PELLETTERIA E REGALISTICA (agende, porta documenti, borse, portafogli, ...)<br><br>

Si offrono servizi di:<br><br>

    Fotocopie<br>
    Fax<br>
    Timbri e targhe<br>
    Plastificazione e rilegatura<br>
    Buffetti express (ricezione e spedizione pacchi)<br>
    Firma Digitale<br>
    Modulistica personalizzata (carta intestata,biglietti visita,depliant,ecc)<br><br>

								<%=Session("googlemap")%><br><br>
				<%
				'=Session("googlestr")
				%><br><br>
				<iframe src="https://www.google.com/maps/embed?pb=!4v1738346307317!6m8!1m7!1sCJe7XILfVN6iSjq6TYjpuw!2m2!1d45.21998306655494!2d11.67407135388844!3f282.06344736719745!4f-2.0472500542647367!5f1.883304396830615" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

			 </td></tr></table>
        </div>

      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->
