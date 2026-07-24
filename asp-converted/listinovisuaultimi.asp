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
          <h2>ULTIMI VISIONATI</h2>
        </div>

        <div class="bf-products-grid">
			<%
					text_sessionid=cstr(Session("Chisono"))
					sqlvis="Select * from statschede  where  password='" & text_sessionid & "' and codice<>'' group by codice order by id desc LIMIT 60"
					Set tbschedeult = Server.CreateObject("ADODB.RecordSet")

					tbschedeult.Open sqlvis, connm

					iod=1
					ibuffetti=1
					iecommerce=1
					i=0
					Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
					Do While not (tbschedeult.eof) and i<>180
						counterfrm=counterfrm+1
						i=i+1
						sSQLisp1=""
						if lcase(trim(tbschedeult("fornitore")))="od" and iod=<60 then
							iod=iod+1
							sSQLisp1 = "select * from prodotti where codice_od='" & Trim(tbschedeult("codice")) & "' limit 1"
							tbprodcatalogo.Open sSQLisp1, connm
							if not tbprodcatalogo.eof then %>
								<!--#include file="single_product.inc" -->
						<%  end if
							tbprodcatalogo.close
						end if
						'buffetti controllo errori
						if lcase(trim(tbschedeult("fornitore")))="buffetti" and ibuffetti=<60  then
							ibuffetti=ibuffetti+1
							sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(tbschedeult("codice")) & "' limit 1"
							tbprodcatalogo.Open sSQLisp1, connm
							if not tbprodcatalogo.eof then%>
								<!--#include file="single_product_buffetti.inc" -->
						<%   end if
						   tbprodcatalogo.close
						end if
						'response.write(lcase(trim(tbschedeult("fornitore"))))
						if lcase(trim(tbschedeult("fornitore")))="ecommerce" and iecommerce=<60 then
							iecommerce=iecommerce+1
							sql="SELECT shop_products.*, shop_products.catalogID, shop_products.catalogID AS shownID from shop_products WHERE shop_products.ccode='" & Trim(tbschedeult("codice")) & "' limit 1 "
							tbprodcatalogo.open Sql,connm
							if not tbprodcatalogo.eof then
							%>

							<%
							end if
							tbprodcatalogo.close
						end if
						tbschedeult.movenext
					Loop
					tbschedeult.close%>
        </div>

      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->
