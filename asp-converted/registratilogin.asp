<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
 <%if Trim(Session("Chisono"))="" then response.redirect "accedi.asp#primaindietro" %>
<!DOCTYPE html>
<html lang="en">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>


  				<%

								if Trim(Session("Chisono"))<>"" and trim(request("blocco"))="" then %>
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
										<!-- --------------POPUP-------------- -->
										<!-- --------------POPUP-------------- -->
										<div id="basic" class="bf-popup-card">
											<center><br><br>
												<form action="storico.asp#topage" method=post id=formceck name=formceck>
												<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
												<input type="submit" class="bf-btn-red" value="ORDINI PRECEDENTI STORICO" name="proceed">
												</form><br>
												<form action="listino.asp?blocco=no#topage" method=post id=formceck name=formceck>
												<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
												<input type="submit" class="bf-btn-red" value="I TUOI PREFERITI" name="proceed">
												</form><br>
												<form action="listinovisuaultimi.asp#topage" method=post id=formceck name=formceck>
												<input type="hidden" id="nuovoindirizzo" name="nuovoindirizzo" value="<%=session("txt_ritiro")%>">
												<input type="submit" class="bf-btn-red" value="ULTIMI PRODOTTI VISIONATI" name="proceed">
												</form><br>
											<a href=""><img type="img" align="right" style="width:40px;righ:30px;" class="basic_close btn btn-default" src="images/close-icon.jpg"></a>
											</center>
										</div>
										<!-- --------------POPUP-------------- -->
										<!-- --------------POPUP-------------- -->
										<!-- --------------POPUP-------------- -->
										<!-- --------------POPUP-------------- -->

								<%end if
								%>


  <!--#include file="top.inc" -->
 <br>
    </div>

    <section class="bf-content-page">
      <div class="bf-container">
        <h2 class="bf-page-title">LOGIN AL SITO AVVENUTA CON SUCCESSO!</h2>

        <div class="bf-form-card">



																						<div align=center>




													 <center>
													 <!--#include file="benvenuto.inc"-->
															<button class="bf-btn-red" onClick="top.location.href='listino.asp'">PRODOTTI PREFERITI</button>
															 <br><br>
															<button class="bf-btn-red" onClick="top.location.href='registratiupdate.asp'">DATI PERSONALI</button>

													</center>




												<div class="col-md-8">
												<div class="product-content-right">
													<a style="position:relative;top:-80px;" name="buffposizione"></a>
													<a style="position:relative;top:-80px;" name="odposizione"></a>
													<a style="position:relative;top:-80px;" name="topage"></a>
													 	<%

													sSQLtot="Select * From PROFILO where password1='" & Trim(Session("Chisono")) & "'"
													Set tbst = Server.CreateObject("ADODB.RecordSet")
													tbst.open sSQLtot,connm
													'response.write(sSQLtot)



													%>
													<br><br><br>
													<%if not tbst.eof then %>
													<h3 class="bf-section-title">PRODOTTI IN MAXI SCONTO </h3>
													<%end if%>
														<%Response.Buffer = True%>
														<div id="loadingimg"><img width="200px" src="images/loading.gif"></div>
														<%
														Response.Flush
														%>
														<p>

												<%
												if mobile<>"ok" then
												  response.write("<div class='col-md-12' style='width:1030px;'><div class='product-content-right'><div class='col-md-12'>")
												else
												  response.write("<div class='col-md-12'><div class='product-content-right'><div class='col-md-12'>")
												end if



														iod=1
														ibuffetti=1
														iecommerce=1
														i=0
														Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
														Do While not (tbst.eof) and i<>180
															counterfrm=counterfrm+1
															i=i+1
															sSQLisp1=""
															if lcase(trim(tbst("fornitore")))="od" and iod=<60 then
																iod=iod+1
																sSQLisp1 = "select * from prodotti where codice_od='" & Trim(tbst("codice_isp")) & "' limit 1"
																tbprodcatalogo.Open sSQLisp1, connm
																if not tbprodcatalogo.eof then %>

															<%  end if
																tbprodcatalogo.close
															end if
															'buffetti controllo errori
															if lcase(trim(tbst("fornitore")))="gruppo buffetti s.p.a." and ibuffetti=<60  then
																ibuffetti=ibuffetti+1
																sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(tbst("codice_isp")) & "' limit 1"
																tbprodcatalogo.Open sSQLisp1, connm
																if not tbprodcatalogo.eof then%>

															<%   end if
															   tbprodcatalogo.close
															end if
															'response.write(lcase(trim(tbst("fornitore"))))
															if lcase(trim(tbst("fornitore")))="ecommerce" and iecommerce=<60 then
																iecommerce=iecommerce+1
																sql="SELECT shop_products.*, shop_products.catalogID, shop_products.catalogID AS shownID from shop_products WHERE shop_products.ccode='" & Trim(tbst("codice_isp")) & "' limit 1 "
																tbprodcatalogo.open Sql,connm
																if not tbprodcatalogo.eof then




																end if
																tbprodcatalogo.close
															end if
															tbst.movenext
														Loop
														tbst.close%>


															</div>
															</div>
															</div>
															<br>

													</p>

													<%

													Response.Flush
													%>
													<script language="javascript">
													<!--
													document.getElementById("loadingimg").style.display="none";
													//-->
														</script>

							</div>
															</div>















														</div>
														<br>
									</div>

        </div>
      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->