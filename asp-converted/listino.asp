<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%
session("vis")="1"

'Variabili
Dim Tipocatalogo
Dim text_prezzo
Dim text_prezzog
Dim text_fornitore
'Variabili Connessione Db
Dim dbc3
Dim dbc4
Dim Mprezzo

Function fotoshopman(Byval Cod)
	Set tbfoto = Server.CreateObject("ADODB.RecordSet")
	sSql="SELECT cimageurl FROM shop_products where ccode='" & lcase(Trim(Cod)) & "' limit 1"
	tbfoto.Open sSql, connm
	Nome_foto=""
	Tipocatalogo=""
	if tbfoto.eof then
	    fotoshopman=" "
	else
		fotoshopman=Trim(tbfoto("cimageurl"))
	end if
	tbfoto.Close
End function

'x cancellare
If Request("del")="yes"  then
	'del listino codice spicers
	Set Tbdel = Server.CreateObject("ADODB.RecordSet")
	sSQLdel = "Delete From Listino where codice_isp='" & trim(Request("Cod")) & "'"
	Tbdel.Open sSQLdel,connm
End if

'Pagine
Divpagine=20
'Pagine gestione
paginasp=request("Pagsp")
if paginasp="" then
	paginasp=0
else
	paginasp=cint(paginasp)*Divpagine
end if
if Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))<>"" then
	vordine=Trim(cstr(Replace(Request("Ricerca"),"%20"," ")))
else
	vordine=" SottoCategoria,Prezzo asc "
end if

'utente normale o navigante
If Trim(Session("Chisono"))="" then
	txtcodcliente="NN"
	text_sessionid=Trim(Session.SessionID)

	'Query
	querydcount="Select count(*) as Tot from listino where codcliente='NN' and password1='" & text_sessionid & "' order by id desc"
	Set tbcount = Server.CreateObject("ADODB.RecordSet")
	tbcount.Open querydcount,connm

	npaginecat=Formatnumber(Cint(tbcount("Tot")) / 20,0)
	npaginemax=Cint(tbcount("Tot"))
	tbcount.close

	sqlvis="Select * from listino where codcliente='NN' and password1='" & text_sessionid & "' group by codice_isp  order by id desc" ' LIMIT " & paginasp & " , " & Divpagine

else
	txtcodcliente="REG"
	text_sessionid=cstr(Session("Chisono"))

	'Query
	querydcount="Select count(*) as Tot from listino where codcliente='REG' and password1='" & text_sessionid & "' order by id desc "
	Set tbcount = Server.CreateObject("ADODB.RecordSet")
	tbcount.Open querydcount,connm

	npaginecat=Formatnumber(Cint(tbcount("Tot")) / 20,0)
	npaginemax=Cint(tbcount("Tot"))
	tbcount.close

	sqlvis="Select * from listino where codcliente='REG' and password1='" & text_sessionid & "' group by codice_isp order by id desc limit 70" 'LIMIT " & paginasp & " , " & Divpagine

End if

Set tblistino = Server.CreateObject("ADODB.RecordSet")
tblistino.Open sqlvis, connm


%>
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
          <h2>I TUOI PREFERITI</h2>
        </div>

        <a style="position:relative;top:-80px;" name="topage"></a>

				<%if Trim(Session("Chisono"))<>"" and trim(request("blocco"))="" then %>
				<!-- --------------POPUP-------------- -->
				<!-- --------------POPUP-------------- -->
				<script>
				$(document).ready(function () {
				  $('#basic').popup({
					autoopen: true, /* per non far aprire al caricamento impostare su false */
					transition: 'all 0.3s',
					scrolllock: true
				  });
				});
				</script>
				<script>
				$(document).ready(function () {
				  $('#active_bg').popup({
					backgroundactive:true
				  });
				});
				</script>
				<!-- --------------POPUP-------------- -->
				<!-- --------------POPUP-------------- -->
				<div id="basic"  style="background:#ffffff;width:350px;height:300px;border-radius: 10px 10px 10px 10px;top:0;">
					<center><br><br>
						<form action="storico.asp#topage" method=post id=formceck name=formceck>
						<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
						<input type="submit" style="width:330px;height:45px;background:#FF0000;color:#ffffff;" value="ORDINI PRECEDENTI STORICO" name="proceed" class="checkout-button button alt wc-forward">
						</form><br>
						<form action="listino.asp?blocco=no#topage" method=post id=formceck name=formceck>
						<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
						<input type="submit" style="width:330px;height:45px;background:#FF0000;color:#ffffff;" value="I TUOI PREFERITI" name="proceed" class="checkout-button button alt wc-forward">
						</form><br>
						<form action="listinovisuaultimi.asp#topage" method=post id=formceck name=formceck>
						<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
						<input type="submit" style="width:330px;height:45px;background:#FF0000;color:#ffffff;" value="ULTIMI PRODOTTI VISIONATI" name="proceed" class="checkout-button button alt wc-forward">
						</form><br>
					<a href=""><img type="img" align="right"  style="width:40px;righ:30px;" class="basic_close btn btn-default" src="images/close-icon.jpg"></a>
					</center>
				</div>
				<!-- --------------POPUP-------------- -->
				<!-- --------------POPUP-------------- -->

		<%end if%>

        <div class="bf-products-grid">
			<%
			iod=1
			ibuffetti=1
			iecommerce=1
			i=0
			Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
			Do While not (tblistino.eof) and i<>180
				counterfrm=counterfrm+1
				i=i+1
				sSQLisp1=""
				if lcase(trim(tblistino("fornitore")))="od" and iod=<60 then
					iod=iod+1
					sSQLisp1 = "select * from prodotti where codice_od='" & Trim(tblistino("codice_isp")) & "' limit 1"
					tbprodcatalogo.Open sSQLisp1, connm
					if not tbprodcatalogo.eof then %>
						<!--#include file="single_product.inc" -->
			<%  end if
					tbprodcatalogo.close
				end if
				'buffetti controllo errori
				if lcase(trim(tblistino("fornitore")))="buffetti" and ibuffetti=<60  then
					ibuffetti=ibuffetti+1
					sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(tblistino("codice_isp")) & "' limit 1"
					tbprodcatalogo.Open sSQLisp1, connm
					if not tbprodcatalogo.eof then%>
						 <!--#include file="single_product_buffetti.inc" -->
			<%   end if
				   tbprodcatalogo.close
				end if
				'response.write(lcase(trim(tblistino("fornitore"))))
				if lcase(trim(tblistino("fornitore")))="ecommerce" and iecommerce=<60 then
					iecommerce=iecommerce+1
					sql="SELECT shop_products.*, shop_products.catalogID, shop_products.catalogID AS shownID from shop_products WHERE shop_products.ccode='" & Trim(tblistino("codice_isp")) & "' limit 1 "
					tbprodcatalogo.open Sql,connm
					if not tbprodcatalogo.eof then
					%>

					<%
					end if
					tbprodcatalogo.close
				end if
				tblistino.movenext
			Loop
			tblistino.close%>
        </div>

      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->
