<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%

if request("tipoID")<>"" then
    'perfetto
    sqlfind="select * from carrello where id='" & request("tipoID") & "' limit 1"
	set tbfind= server.CreateObject("ADODB.Recordset")
	tbfind.open sqlfind,connm
	if tbfind.eof then
	  cod_trovato=""
	else
      cod_trovato=tbfind("codice_isp")
    end if
	sqldel="delete from carrello where (codice_isp='" & cod_trovato & "' or codice_isp='" & trim(request("cod")) & "') and Sessionid='" &  Session.SessionID & "'"
	connm.execute(sqldel)
	tbfind.close
	response.Redirect("carrellovisua.asp#topage")
end if

if request.querystring("ritiro")<>""  then
    session("txt_ritiro")=request.querystring("ritiro")
	session("txt_checked")=""
end if
if session("txt_ritiro")="ritirosede" then session("txt_checked")="checked"

if session("txt_ritiro")="no" then
    session("txt_checked")=""
    session("txt_ritiro")=""
end if
%>
<!DOCTYPE html>
<html lang="en">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>
  <!--#include file="top.inc" -->

<section class="bf-content-page">
  <div class="bf-container">
    <div class="bf-page-title">
      <h2>Carrello</h2>
    </div>

    <h2><%=request("info")%></h2>

    <!-- Top action buttons -->
    <div class="bf-cart-actions-top">
      <form action="carrellostampa.asp" method=post id=formceck name=formceck>
        <button type="submit" value="Stampa Carrello" name="proceed" class="bf-btn-red">Stampa Carrello</button>
      </form>
      <form action=carrellosvuota.asp method=post id=formceck name=formceck>
        <button type="submit" value="Svuota Carrello " name="proceed" class="bf-btn-red">Svuota Carrello</button>
      </form>
    </div>

    <!-- Cart product table -->
    <table class="bf-cart-table">
      <thead>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>prodotto</td>
          <td>p.unita'</td>
          <td>q.ta</td>
          <td>iva</td>
          <td>totale</td>
          <td>tot+iva</td>
          <td>&nbsp;</td>
        </tr>
      </thead>
      <tbody>

        <%

        session.lcid=1040
        'DOPPI BUFFETTI
        Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
        'DOPPI BUFFETTI
        Set tbcardoppi = Server.CreateObject("ADODB.Recordset")
        Sqldoppi="SELECT carrello.codice_isp,carrello.descrizione,carrello.blocco,carrello.fornitore,carrello.iva,sum(quantita) as num,prodotti.p1,prodotti.p2,prodotti.p3,prodotti.p4,prodotti.p5,prodotti.qta1,prodotti.qta2,prodotti.qta3,prodotti.qta4,prodotti.qta5,prodotti.aliq_iva  FROM carrello inner join prodotti ON carrello.codice_isp = prodotti.codice_buf where (Sessionid='" &  Session.SessionID & "' and (carrello.fornitore='Buffetti' or carrello.fornitore='Magazine' )) GROUP BY carrello.codice_isp  HAVING num >= 1  ORDER BY num desc;"
        tbcardoppi.Open Sqldoppi,connm
        'response.write(sqldoppi)
        'response.end
        txt_fornitore="Buffetti"
        t_data=date()
        Do While Not tbcardoppi.EOF
        	if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta1")) then
        		Mprezzo2=FormatNumber(tbcardoppi("p1"),2)
        		text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
        	end if
        	if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta2")) and cdbl(tbcardoppi("qta2"))<>1 then
        		Mprezzo2=FormatNumber(tbcardoppi("p2"),2)
        		text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
        	end if
        	if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta3")) and cdbl(tbcardoppi("qta3"))<>1 then
        		Mprezzo2=FormatNumber(tbcardoppi("p3"),2)
        		text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
        	end if
        	if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta4")) and cdbl(tbcardoppi("qta4"))<>1 then
        		Mprezzo2=FormatNumber(tbcardoppi("p4"),2)
        		text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
        		'response.write(tbcardoppi("qta4"))
        	end if
        	if  cdbl(tbcardoppi("num"))=>cdbl(tbcardoppi("qta5")) and cdbl(tbcardoppi("qta5"))<>1 then
        		Mprezzo2=FormatNumber(tbcardoppi("p5"),2)
        		text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
        		'response.write(tbcardoppi("qta5"))
        	end if

        	'::::::::::::::::::::::::: PREZZO MAGAZINE :::::::::::::::::::::::::
        	'::::::::::::::::::::::::: PREZZO MAGAZINE :::::::::::::::::::::::::
        		boolmagazine="false"
        		magqta=1
        		magazinesconto="<br>"
        		Set tbmagazine = Server.CreateObject("ADODB.RecordSet")
        		sSQLmag = "select * From magazinebuffetti  where codice='" & Trim(tbcardoppi("codice_isp")) & "' limit 1"
        		tbmagazine.Open sSQLmag, conn
        		if not tbmagazine.eof  then
        		 Mprezzo1=tbmagazine("Prezzo")
        		 Mprezzo2=tbmagazine("Prezzoofferta")
        		 text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
        		 boolmagazine="true"
        		else
        		 magazinesconto=""
        		end if
        	'::::::::::::::::::::::::: PREZZO MAGAZINE :::::::::::::::::::::::::
        	'::::::::::::::::::::::::: PREZZO MAGAZINE :::::::::::::::::::::::::


        	'::::::::::::::::::::::::: PREZZO PROFILO (inizio) :::::::::::::::::::::::::
        	'::::::::::::::::::::::::: PREZZO PROFILO (inizio) :::::::::::::::::::::::::
        	if Trim(Session("Chisono"))<>"" then
        		querypro="Select * From PROFILO where (codice_isp='" & Trim(tbcardoppi("codice_isp")) & "') AND password1='" & Trim(Session("Chisono")) & "'"
        		'response.write(querypro)
        		'response.end
        		Set Tbpro = Server.CreateObject("ADODB.RecordSet")
        		Tbpro.Open querypro, connm
        		if not Tbpro.eof then
        			Mprezzo2=formatnumber(Tbpro("prezzo"),2)
        			text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
        		end if
        		Tbpro.close
        	end if
        	'::::::::::::::::::::::::: PREZZO PROFILO (fine) :::::::::::::::::::::::::
        	'::::::::::::::::::::::::: PREZZO PROFILO (fine) :::::::::::::::::::::::::
        	'elimina record doppi
        	Sqldeldoppi="delete from carrello where codice_isp='" &  tbcardoppi("codice_isp") & "' and Sessionid='" &  Session.SessionID & "'"
        	connm.Execute(Sqldeldoppi)
        	sqlinsertdoppi="insert into carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Prezzou,Blocco,Fornitore,Iva,aliqiva) values ('" & Session.SessionID & "','" & tbcardoppi("codice_isp") & "','" & tbcardoppi("descrizione") & "','" & tbcardoppi("num") & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & Replace(Replace(Mprezzo2,".",""),",",".") & "','" & tbcardoppi("Blocco") & "','" & txt_fornitore & "','" & tbcardoppi("iva") & "'," & Replace(Replace(tbcardoppi("aliq_iva"),".",""),",",".") & ")"
        	connm.Execute(sqlinsertdoppi)
        	tbcardoppi.MoveNext
        loop
        tbcardoppi.close
        'DOPPI BUFFETTI
        'DOPPI BUFFETTI






        'DOPPI OD
        'DOPPI OD
        Sqldoppi="SELECT carrello.id,carrello.codice_isp,carrello.descrizione,carrello.blocco,carrello.fornitore,carrello.iva,sum(quantita) as num,prodotti.aliq_iva  FROM carrello inner join prodotti ON carrello.codice_isp = prodotti.codice_od where (Sessionid='" &  Session.SessionID & "' and carrello.fornitore='od') GROUP BY carrello.codice_isp  HAVING num >= 1  ORDER BY id desc;"
        tbcardoppi.Open Sqldoppi,connm
        'response.write(sqldoppi)
        'response.end
        txt_fornitore="od"
        t_data=date()
        Do While Not tbcardoppi.EOF
        	'::::::::::::::::::::::::: PREZZO OD :::::::::::::::::::::::::
        	'::::::::::::::::::::::::: PREZZO OD :::::::::::::::::::::::::
        	sSQLdelprod = "select * From prodotti where codice_od='" & Trim(tbcardoppi("codice_isp"))  & "' or codice_prodotto='" & Trim(tbcardoppi("codice_isp"))  & "' limit 1 "
        	tbprodcatalogo.Open sSQLdelprod, connm
        	%>
        	<!--#include file="ricercacatalogoparametriod.inc" -->
        	<%
        	text_prezzoo=FormatNumber(Mprezzo2*cdbl(tbcardoppi("num")),2)
        	tbprodcatalogo.close
        	'elimina record doppi
        	Sqldeldoppi="delete from carrello where codice_isp='" &  tbcardoppi("codice_isp") & "' and Sessionid='" &  Session.SessionID & "'"
        	connm.Execute(Sqldeldoppi)
        	sqlinsertdoppi="insert into carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Prezzou,Blocco,Fornitore,Iva,aliqiva) values ('" & Session.SessionID & "','" & tbcardoppi("codice_isp") & "','" & tbcardoppi("descrizione") & "','" & tbcardoppi("num") & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & Replace(Replace(Mprezzo2,".",""),",",".") & "','" & tbcardoppi("Blocco") & "','" & txt_fornitore & "','" & tbcardoppi("iva") & "'," & Replace(Replace(tbcardoppi("aliq_iva"),".",""),",",".") & ")"
        	connm.Execute(sqlinsertdoppi)
        	'response.write(sqlinsertdoppi)
        	'response.end
        	'::::::::::::::::::::::::: PREZZO OD :::::::::::::::::::::::::
        	'::::::::::::::::::::::::: PREZZO OD :::::::::::::::::::::::::
        tbcardoppi.MoveNext
        loop
        tbcardoppi.close
        'DOPPI OD
        'DOPPI OD


        'DOPPI ECOMMERCE
        'DOPPI ECOMMERCE
        Sqldoppi="SELECT carrello.codice_isp,carrello.descrizione,carrello.prezzou,carrello.blocco,carrello.fornitore,carrello.urlfoto,carrello.iva,sum(quantita) as num,shop_products.aliqiva  FROM carrello inner join shop_products  ON carrello.codice_isp = shop_products.ccode  where (Sessionid='" &  Session.SessionID & "' and carrello.fornitore='ecommerce') GROUP BY carrello.codice_isp  HAVING num >= 1  ORDER BY num desc;"
        tbcardoppi.Open Sqldoppi,connm
        'response.write(sqldoppi)
        'response.end
        txt_fornitore="ecommerce"
        t_data=date()
        Do While Not tbcardoppi.EOF
            text_quantita=cdbl(tbcardoppi("num"))
        	if text_quantita>1 then
        		'::::::::::::::::::::::::: PREZZO ecommerce :::::::::::::::::::::::::
        		'::::::::::::::::::::::::: PREZZO ecommerce :::::::::::::::::::::::::
        		'profilo cliente
        		set tb4 = server.createobject("adodb.recordset")
        		ssql4 = "select prezzo from profilo where codice_isp='" & tbcardoppi("codice_isp") & "' and password1='" & trim(session("chisono")) & "'"
        		tb4.open ssql4,connm
        		if not tb4.eof then
        		mprezzo2=formatnumber(tb4("prezzo"),2)
        		else
        		mprezzo2=formatnumber(tbcardoppi("prezzou"),2)
        		end if
        		tb4.close
        		'controlli vari
        		text_prezzo=cdbl(mprezzo2)
        		'cerco prodotto su archivio
        		set tbprodottoman = server.createobject("adodb.recordset")
        		ssqlprodman = "select * from shop_products where ccode='" & tbcardoppi("codice_isp") & "'"
        		tbprodottoman.open ssqlprodman,connm
        		'response.write(ssqlprodman)
        		'iva
        		if tbprodottoman("iva")="si" then
        		   scrittaiva=tbprodottoman("aliqiva") & "% aliq iva"
        		   text_aliqiva=cdbl(tbprodottoman("aliqiva"))
        		 else
        		   scrittaiva="esente iva"
        		   text_aliqiva=0
        		end if
        		if text_quantita>=tbprodottoman("qta1") and tbprodottoman("qta1")>0 then text_prezzo=tbprodottoman("cprice1")
        		if text_quantita>=tbprodottoman("qta2") and tbprodottoman("qta2")>0 then text_prezzo=tbprodottoman("cprice2")
        		if text_quantita>=tbprodottoman("qta3") and tbprodottoman("qta3")>0 then text_prezzo=tbprodottoman("cprice3")
        		'response.write("-----------------" & text_prezzo)
        		tbprodottoman.close
        		text_prezzoo=FormatNumber((text_prezzo*text_quantita),2)
        		'elimina record doppi
        		Sqldeldoppi="delete from carrello where codice_isp='" &  tbcardoppi("codice_isp") & "' and Sessionid='" &  Session.SessionID & "'"
        		connm.Execute(Sqldeldoppi)
        		t_data=date()
        		sqlinsertdoppi="insert into carrello (sessionid,Codice_Isp,Descrizione,Quantita,Prezzo,Prezzou,Blocco,Fornitore,Urlfoto,Iva,aliqiva) values ('" & Session.SessionID & "','" & tbcardoppi("codice_isp") & "','" & tbcardoppi("descrizione") & "','" & tbcardoppi("num") & "','" & Replace(Replace(text_prezzoo,".",""),",",".") & "','" & Replace(Replace(text_prezzo,".",""),",",".") & "','" & tbcardoppi("blocco") & "','" & txt_fornitore & "','" & tbcardoppi("urlfoto") & "','" & tbcardoppi("iva") & "'," & Replace(Replace(tbcardoppi("aliqiva"),".",""),",",".") & ")"
        		connm.Execute(sqlinsertdoppi)
        		'response.write(Sqldeldoppi)
        		'response.write(sqlinsertdoppi)
        		'response.end
        		'::::::::::::::::::::::::: PREZZO ecommerce :::::::::::::::::::::::::
        		'::::::::::::::::::::::::: PREZZO ecommerce :::::::::::::::::::::::::
        	end if
        tbcardoppi.MoveNext
        loop
        tbcardoppi.close
        'DOPPI ECOMMERCE
        'DOPPI ECOMMERCE


        Set tbcarstd = Server.CreateObject("ADODB.Recordset")
        Sql="select id,sessionid,codice_isp,descrizione,sum(quantita) as quantita,sum(prezzo) as prezzo,data,prezzou,blocco,fornitore,urlfoto,iva,aliqiva from Carrello where Sessionid='" &  Session.SessionID & "' GROUP BY codice_isp Order by ID Desc"
        tbcarstd.Open Sql,connm
        'response.write(sql)
        'Totali
        tot1=0
        tot=0
        totesc=0
        cont_art=0

        Do While Not tbcarstd.EOF
        cont_art=cont_art+cdbl(tbcarstd("quantita"))
        'Dic. iva
        dicituraiva=""
        if Trim(tbcarstd("iva"))="si" then
        	Tot=Tot+(tbcarstd("prezzo")*(tbcarstd("aliqiva")/100)+tbcarstd("prezzo"))
        else
        	if tbcarstd("fornitore")="ecommerce" then
        	   dicituraiva="<br>inclusa&nbsp;iva"
        	   else
        	   dicituraiva="<br>esente&nbsp;iva"
        	end if
        	Totesc=Totesc+tbcarstd("prezzo")
        end if
        'response.write(tot & "<br>")
        'response.write(totesc)
        'response.end
        %>
        <form action="carrelloupdate.asp?codid=<%=tbcarstd("codice_isp")%>&id=<%=tbcarstd("id")%>" method=post id="formupd<%=tbcarstd("id")%>" name="formupd<%=tbcarstd("id")%>">
        <tr>
            <td>
                <a title="elimina il prodotto dal carrello"  href="carrellovisua.asp?tipoID=<%=tbcarstd("ID")%>&cod=<%=tbcarstd("codice_isp")%>">
                <img style="width:30px;" src="images/delete.png">
                </a>
            </td>

            <td>
                 <a href="ricercagenerica.asp?terms=<%=tbcarstd("codice_isp")%>" >
                <%
                if lcase(tbcarstd("fornitore"))="od" then%>
                <img src='foto.asp?cat=catalogoisp\piccole&img=<%=tbcarstd("codice_isp")%>.jpg' style="width:50px;"   border="0">
                <%end if
                if lcase(tbcarstd("fornitore"))="buffetti" or lcase(tbcarstd("fornitore"))="magazine" then%>
                <img src='foto.asp?cat=catalogobuffetti2016_small&img=<%=tbcarstd("codice_isp")%>.jpg' style="width:50px;" border="0">
                <%end if
                if lcase(tbcarstd("fornitore"))="ecommerce"   then%>
                <img style="width:50px;" src='admin/articoli/<%=replace(tbcarstd("urlfoto")," ","%20")%>'>
                <%end if%>
                </a>
            </td>

            <td>
                <b><%=tbcarstd("codice_isp")%></b><br><%=replace(Tagliatesto(tbcarstd("descrizione"),40),"€","&#8364;")%>
            </td>

            <td style="text-align:right;width:100px;">
                <span class="amount">&#8364;.<%=Formatnumber(tbcarstd("prezzou"),2)%><%=dicituraiva%></span>
            </td>

            <td class="product-quantity">
                <div class="bf-quantity-input">
                    <input type="button" onClick="dimqta('qta<%=tbcarstd("id")%>')"; class="minus" value="-" >
                    <input type="number" size="6" style="width:57px;text-align:center;" id="qta<%=tbcarstd("id")%>" name="qta<%=tbcarstd("id")%>" value="<%=tbcarstd("quantita")%>" min="1" step="1">
                    <input type="button" onClick="aggqta('qta<%=tbcarstd("id")%>')";  class="plus" value="+" >
                </div>
            </td>

            <td>
                <span class="amount"><%=dicituraiva%><%if trim(dicituraiva)="" then response.write(Formatnumber(tbcarstd("aliqiva"),2) & "%")%></span>
            </td>

            <td style="text-align:right;" align="right">
                <span class="amount">&#8364;.<%=Formatnumber(tbcarstd("prezzo"),2)%><%=dicituraiva%></span>
            </td>

            <td style="text-align:right;" align="right">
                <span class="amount">&#8364;.<%=Formatnumber(tbcarstd("prezzo")*(tbcarstd("aliqiva")/100)+tbcarstd("prezzo"),2)%><%=dicituraiva%></span>
            </td>

            <td style="text-align:right;" align="right">
                <input type="submit" style="width:80px;font-size:12px;" value="aggiorna" name="aggiorna" class="bf-btn-red">
            </td>
        </tr>
        </form>
        <%

        if tbcarstd.eof then
        %>
        <tr class="cart_item">
        	<td class="product-remove">
        		<a title="Remove this item" class="remove" href="#">&times;</a>
        	</td>

        	<td class="product-thumbnail">
        	   </td>

        	<td style="color:#ffffff;">


        	</td>

        	<td class="product-price">
        		<span class="amount">&#8364;.0,00</span>
        	</td>

        	<td class="product-quantity">
        		<div class="bf-quantity-input">
        			<input type="button" class="minus" value="-">
        			<input type="number" size="4" class="input-text qty text" title="Qty" value="1" min="0" step="1">
        			<input type="button" class="plus" value="+">
        		</div>
        	</td>

        	<td class="product-subtotal">
        		<span class="amount">&#8364;.0,00</span>
        	</td>
        </tr>
        <%
        'response.end
        end if
        	tbcarstd.MoveNext
        Loop
        tbcarstd.close
        session("sommaitem")=cont_art
        %>

      </tbody>
    </table>

    <!-- Save / Restore cart buttons -->
    <div class="bf-cart-actions-top" style="margin-top:16px;">
      <form action="preventivosalva.asp" method=post id=formceck name=formceck>
        <button type="submit" value="Salva Carrello / Preventivo" name="apply_coupon" class="bf-btn-red">Salva Carrello / Preventivo</button>
      </form>
      <form action="preventivocarica.asp" method=post id=formceck name=formceck>
        <button type="submit" value="Ripristina Carrello / Preventivo " name="apply_coupon" class="bf-btn-red">Ripristina Carrello / Preventivo</button>
      </form>
    </div>

    <!-- Coupon section -->
    <%if session("coupon")="" then  %>
    <div class="bf-coupon-section">
      <label for="coupon_code">Coupon:</label>
      <form action=coupon.asp method=post id=formcoupon name=formcoupon>
        <div class="bf-coupon-row">
          <input type="text" placeholder="Coupon code" value="" id="coupon_code" name="coupon_code">
          <button type="submit" value="Applica il Coupon" name="apply_coupon" class="bf-btn-red">Applica il Coupon</button>
        </div>
      </form>
    </div>
    <%end if%>

    <!-- Checkout area -->
    <div class="bf-cart-checkout">
      <form action=cartadicreditoinvio.asp method=post id=formceck name=formceck>
        <input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
        <input type="image" name="submit" style="width:350px;" src="images/paypalf.png" border="0" alt="Submit" >
      </form>

      <!---form action=satipayinvio.asp method=post id=formceck name=formceck>
        <input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
        <input type="image" name="submit" style="width:350px; border-radius: 10px 10px 10px 10px;" src="images/satipay.jpg" border="0" alt="Submit" >
      </form><br--->

      <form action=bonificoinvio.asp method=post id=formceck name=formceck>
        <input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
        <button type="submit"  alt="clicca qui per confermare l'ordine" value="  ### CONFERMA &#10; ### D'ORDINE   " name="proceed" class="bf-btn-red" style="width:350px;height:100px;font-size:18px;">clicca qui per confermare l'ordine</button>
      </form>
    </div>

    <!---div class="coupon">
      <form action=paganegozioinvio.asp method=post id=formceck name=formceck>
        <input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
        <input type="submit" style="background: #F86605;" value="Checkout - RITIRA & PAGA IN NEGOZIO (0 spese di spedizione) ### INVIA ORDINE ###" name="proceed" class="checkout-button button alt wc-forward">
      </form><br>
    </div--->

    <script>
    function formSubmit2(val) 		{
    swal({
      title: "tipo di consegna ?",
      text: "inserire se si vuole ritirare in NEGOZIO ,spedire nella propria sede o in altra sede",
      icon: "warning",
      buttons: true,
    buttons: {
    defeat: "spedizione in altra sede",
    spedsede: "spedizione nella mia sede",
    sped3: "RITIRO in negozio ",
    cancel: "esci...",
    },
    })
    .then((value) => {
    switch (value) {

    case "sped3":
    // document.myform.submit();
    var im = document.getElementById("consegna");
    //if (im.checked == true){
    document.getElementById("consegna").checked = true;
    location.href = 'carrellovisua.asp?ritiro='+val;
    //} else {
    //document.getElementById("consegna").checked = false;
    //}
    //alert('marco3');
    //var im=document.getElementById('consegna').checked;
    //var checked = $(document.getElementById('consegna')).is(':checked');
    //alert(im);
    //alert(checked);
    //location.href = 'adappuntamentiKO.asp?appuntamento=yes&id='+id;
    return true;

    case "defeat":
    //swal("inserire il NUOVO indirizzo di consegna",content: "input");
    swal("inserire  indirizzo di spedizione:", {
      content: "input",
    })
    .then((value) => {
      location.href = 'carrellovisua.asp?ritiro='+`${value}`;
    });
    return false;

    case "spedsede":
    document.getElementById("consegna").checked = false;
    location.href = 'carrellovisua.asp?ritiro=no';
    return true;

    default:
    //document.getElementById("consegna").checked = false;
    return false;

    }
    });
    }
    </script>

    <hr>
    <input class='quantity buttons_added' type="checkbox" <%=session("txt_checked")%>  onclick="formSubmit2('ritirosede');" id="consegna" name="consegna" value="negozio">
    <a id="consegna" name="consegna"  class="tx12 azzurro lnk" href="javascript:formSubmit2('ritirosede');">&nbsp;CONSEGNA IN NEGOZIO</a><br>
    <%=ucase(session("txt_ritiro"))%><br>
    <%=session("txt_sederitiro")%>
    <hr>


    <!---div class="coupon">
      <form action=preventivosalva.asp method=post id=formceck name=formceck>
        <input type="submit" value="Salva Preventivo / Carrello " name="proceed" class="checkout-button button alt wc-forward">
      </form><br>
    </div>
    <div class="coupon">
      <form action=preventivocarica.asp method=post id=formceck name=formceck>
        <input type="submit" value="Lista Preventivi / Carrello SALVATI " name="proceed" class="checkout-button button alt wc-forward">
      </form><br>
    </div--->

    <a style="position:relative;top:-80px;" name="topageagg"></a>
    <div>
      <%if Trim(request("articolo"))="Aggiungi" then%>
        <!--#include file="carrellovisuaagg.inc" -->
      <%else %>
        <a  href="carrellovisua.asp?articolo=Aggiungi#topageagg"><div><font size="+1" color="#ff0000"><input type='button' class='plus' value='+' >&nbsp;AGGIUNGI ARTICOLO / NOTE DI SPEDIZIONE</font></div></a><br><br>
      <%end if %>
    </div>

    <!-- Cart Summary / Totals -->
    <div class="bf-cart-summary">
      <h2>Totale</h2>

      <table cellspacing="0" cellpadding="0" width="100%" border="1">
        <tr>
          <td><b>Subtotale ordine</b><br></td>
          <td align="right"><b>&#8364;.&nbsp;<%=FormatNUMBER(Tot+Totesc,2)%></b></td>
        </tr>
        <%
          'totale senza spese di spedizione
          if session("coupon")="" then
          	Session("tot")=Tot+Totesc
          	txt_coupon="tot."
          else
            'if session("tipocoupon")="percentuale" then
          		Session("tot")=(Tot+Totesc)-(((Tot+Totesc)/100)*session("coupon"))
          		Tot=(Tot)-(((Tot)/100)*session("coupon"))
          		Totesc=(Totesc)-(((Totesc)/100)*session("coupon"))
          		txt_coupon="COUPON ATTIVO SCONTO del " & session("coupon") & "% "
          	'else
          	'	Tot=(Tot)-(session("coupon")/2)
          	'	Totesc=(Totesc)-(session("coupon")/2)
          	'	Session("tot")=Tot+Totesc-session("coupon")
          	'	txt_coupon="COUPON ATTIVO SCONTO di Euro " & session("coupon") & " fisso "
          	'end if
          end if
          %>
        <tr><td colspan="2" height="10px"></td></tr>
        <tr>
          <td><b><b><%response.write(txt_coupon)%></b></b><br></td>
          <td align="right"><b>&#8364;.&nbsp;<%=FormatNUMBER(Tot+Totesc,2)%></b></td>
        </tr>
        <tr>
          <td><b>Spese di Spedizione</b></td>
          <td align="right" style="font-size:14px;" >
            <b>
            <!--#include file="spese.asp" -->  </b>
          </td>
        </tr>
        <tr>
          <td style="font-size:22px;"><b>Totale</b><br></td>
          <td align="right" style="font-size:22px;"><b>&#8364;.&nbsp;<%=Formatnumber(((Tot+Totesc)+Session("CostoSpese")),2)%></b></td>
          <%'response.write(Session("CostoSpese"))
          %>
        </tr>
        <tr><td colspan="2" height="10px"><hr></td></tr>
        <%totcarta=Formatnumber(((Tot+Totesc)+Session("CostoSpese")),2)%>
        <% session("totcarta")=totcarta%>
      </table>
      <br><br>
      <!--#include file="spesegrafica.asp" -->
      <br><br>
      <!--#include file="datibonifico.asp" -->
    </div>

  </div>
</section>

<!--#include file="footer.inc" -->
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->