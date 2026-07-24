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

	<!-- Content Page -->
	<div class="bf-content-page">
		<div class="bf-container">

			<h1 class="bf-page-title">Condizione di Vendita</h1>

			<div class="bf-content-card">

				<h2 style="font-size:20px;font-weight:700;margin-bottom:24px;">Condizioni di Vendita</h2>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 1) Ordini e informazioni.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
E' possibile inviare ordini solo in forma elettronica. Nell'inviare un ordine l'acquirente accetta incondizionatamente tutte le condizioni generali di vendita di <%=Session("ragionesocialetesto")%>  in vigore al momento. Tali condizioni saranno anche quelle di riferimento in caso di contestazione.<br>Nel caso di ordine trasmesso in forma elettronica o telematica le parti rinunciano espressamente al diritto di contestare la validita' del contratto, adducendo come unico motivo il fatto che esso sia stato stipulato mediante trasmissione telematica. L'ordine intervenuto mediante trasmissione telematica si considera concluso alla data in cui il messaggio raggiunge il sistema dell'offerente e nel luogo in cui quest'ultimo ha la sua sede operativa, conformemente al DLgs. N. 70/2003.<br>Qualsiasi richiesta di aggiunta di prodotti ad un ordine gia' inviato e' considerata come un nuovo ordine. <%=Session("ragionesocialetesto")%>  si riserva il diritto di rifiutare ordini che a suo insindacabile giudizio non siano compatibili con la propria politica commerciale. <%=Session("ragionesocialetesto")%>  e' tenuta ad eseguire esclusivamente le prestazioni specificate nell'ordine approvato e accettato.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 2) Imballo.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
L'imballo della merce e' gratuito, ad esclusione di eventuali imballi speciali.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 3) Prezzi.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
Tutti i prezzi sono soggetti a fluttuazioni di mercato e possono variare in qualsiasi momento senza obbligo di preavviso da parte di <%=Session("ragionesocialetesto")%>  .<br>I prezzi applicati sono quelli in vigore al momento del ricevimento da parte di <%=Session("ragionesocialetesto")%>  dell'ordine. Tutti i prezzi pubblicati su supporto cartaceo e/o elettronico s'intendono al netto di IVA.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 4) Condizioni e termini di pagamento.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
Il pagamento deve essere eseguito con i mezzi e nei termini previsti e concordati tra le parti. L'acquirente e' tenuto al pagamento dell'importo espresso in fattura, IVA inclusa, senza sconti e/o arrotondamenti non espressamente previsti.<br>Qualsiasi variazione delle condizioni e dei termini di pagamento sara' da ritenersi valida solo se confermata ed autorizzata per iscritto dalla Direzione Amministrazione.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 5) Termini e modalita' di consegna.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
La consegna della merce avviene generalmente entro due giorni lavorativi (esclusi sabato e giorni festivi) salvo diversa indicazione.<br>Qualsiasi data fornita per la consegna della merce ordinata e' puramente indicativa e <%=Session("ragionesocialetesto")%>  non e' responsabile per eventuali ritardi nella consegna ne'per qualsiasi danno che il ritardo possa causare all'acquirente.<br>In caso di temporanea mancanza di uno o più prodotti presenti nell'ordine dell'acquirente (Saldi d'ordine) <%=Session("ragionesocialetesto")%>  si riserva il diritto di consegnare innanzitutto i prodotti disponibili e di spedire in seguito in “Porto Franco” i prodotti esclusi dalla prima consegna. <br>Alcuni articoli particolarmente delicati detti “sensibili” prevedono tempi di consegna diversi a seconda della destinazione.<br>La consegna della merce avviene solo al piano terreno o al piano reception.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 6) Trasporto.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
La merce viaggia generalmente in “Porto Franco” come al punto precedente, ed e' trasportata da corrieri / vettori selezionati e scelti da <%=Session("ragionesocialetesto")%>   .<br><%=Session("ragionesocialetesto")%>  si riserva la possibilita' di chiedere un contributo spese di trasporto a fronte di spedizioni particolarmente voluminose o in aree geografiche disagiate.<br>I vettori sono responsabili di compiere il trasporto utilizzando mezzi appropriati e adeguati allo scopo e rispondono di danni, smarrimenti o furti verificatisi dal momento del ritiro della merce fino alla consegna al destinatario. <br>Il destinatario deve manifestare il diritto - dovere del controllo al ricevimento della merce e notificare in calce al DDT o al documento del trasportatore eventuali problemi emersi (riserva di controllo specifica) inviando quindi una copia del documento a <%=Session("ragionesocialetesto")%>  .
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 7) Reclami, Merce danneggiata o difettosa.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
Eventuali anomalie concernenti lo stato della merce ricevuta (integrita' dei colli, mancanza di prodotto e/o di colli, errato prodotto, prodotto danneggiato, ecc.) devono essere comunicate sempre per entro 8 giorni lavorativi dalla data di ricevimento della merce stessa, allegando copia del DDT riportante la riserva fatta al corriere e la dettagliata descrizione del problema insorto al momento del ricevimento.<br>Nel caso di apparecchiature difettose e di cui si richiede l'assistenza tecnica il Rivenditore o l'Utente finale devono fare riferimento a quanto riportato nella documentazione Garanzia o Manuale d'uso che accompagnano il prodotto contattando il Servizio Assistenza Clienti del produttore. In tutti i casi <%=Session("ragionesocialetesto")%>   non accetta resi di apparecchiature che presentano difetti di fabbricazione o di funzionamento.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 8) Restituzione merce.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
Qualsiasi richiesta di reso di merce deve essere comunicata a <%=Session("ragionesocialetesto")%>  entro 8 giorni lavorativi dalla data di ricevimento della merce stessa. <br>Tutte le richieste di reso devono essere accompagnate dalla documentazione necessaria per consentire una veloce ed immediata valutazione: <br>1. Copia del DDT di ricevimento merce <br>La restituzione della merce dovra' essere effettuata previa autorizzazione da parte <%=Session("ragionesocialetesto")%>  . La merce deve essere imballata nella sua confezione originale comprensiva di tutte le protezioni e di eventuali accessori, evitando l'applicazione di etichette o di scritte manuali e protetta da un ulteriore imballo in modo da essere rivendibile.<br>La spedizione del reso autorizzato deve avvenire entro 8 giorni dalla data di emissione autorizzazione. Superato tale periodo l'autorizzazione al reso viene annullata.<br>La merce resa deve essere accompagnata dalla seguente documentazione: <br>1. DDT dei prodotti resi <br>2. Copia dell'autorizzazione al reso ricevuta da <%=Session("ragionesocialetesto")%>  <br>Tutti i resi che non rispetteranno i criteri sopra indicati verranno tassativamente respinti.<br>Per tutti i resi segnalati entro 8 giorni lavorativi dalla data di ricevimento merce e che rispettano la procedura sopra indicata verra' riconosciuto e accreditato l'intero valore dei prodotti.<br>Per tutti i resi generati da un errore da parte del cliente, verra' addebitato un importo di 35 &euro; per spese di gestione reso. La merce dovra' comunque essere confezionata in un ulteriore imballo a protezione durante il trasporto di rientro al magazzino.<br><%=Session("ragionesocialetesto")%>  si riserva in ogni modo il diritto di respingere al mittente qualsiasi reso che comprenda prodotti il cui imballo e confezione siano rovinati o inadeguati e prodotti non conformi o corrispondenti a quanto ordinato o autorizzato per il reso, addebitando inoltre le spese di trasporto relative al reso ed alla riconsegna.<br>Qualora il problema sia originato da <%=Session("ragionesocialetesto")%>  il reso sara' senza spese.<br>Eventuali richieste di reso dal 9 al 30 giorno verranno verificate e valutate caso per caso e comunque, in caso di autorizzazione, verra' accreditato il 90% del valore della merce resa. Tutte le richieste di reso oltre il 30 giorno dal ricevimento merce verranno rifiutate.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 9) Responsabilita'.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
In nessun caso <%=Session("ragionesocialetesto")%>  sara' ritenuta responsabile per difetti o danni ai prodotti o alle persone derivanti da uso improprio, modificazione delle caratteristiche originali, negligenza nell'uso dei prodotti, non conformita' alle istruzioni d'uso e di sicurezza (scritte o verbali) fornite dal produttore.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 10) Riparazione e Garanzia.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
Tutti i prodotti, incluse le apparecchiature elettriche, elettroniche e meccaniche sono coperte dalla garanzia fornita dai produttori.<br>Nel caso di richiesta di Assistenza Tecnica si fa riferimento a quanto indicato nella documentazione che accompagna il prodotto.<br>La garanzia decade in presenza di danni provocati da uso improprio, manomissione, caduta, tentativi di riparazione, non conformita' alle istruzioni di uso e manutenzione.
</p>

<h3 style="font-size:16px;font-weight:600;margin:20px 0 8px;color:#d10000;">Art. 11) Trattamento dati personali.</h3>
<p style="line-height:1.7;margin-bottom:16px;">
<%=Session("ragionesocialetesto")%>  si impegna a trattare con riservatezza i dati trasmessi non rivelandoli a persone non autorizzate, ne'usandoli per scopi diversi da quelli convenuti.<br>Quando e' autorizzata, l'ulteriore trasmissione di tali informazioni riservate e' sottoposta allo stesso grado di riservatezza, conformemente a quanto stabilito dalla Legge 31/12/1996 n.675 e successive integrazioni e modificazioni e dal DLgs. 9/4/03 n.70.
</p>

			</div><!-- bf-content-card -->

		</div><!-- bf-container -->
	</div><!-- bf-content-page -->

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->