<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%  session("vis")="1"

	session.lcid=1040
	'Tabelle Utilita
    Set tbst = Server.CreateObject("ADODB.Recordset")
    Set tbst1 = Server.CreateObject("ADODB.Recordset")
	Sql="Select * from ordine where password1='" & Trim(Session("Chisono")) & "'  and tempo='" &  Trim(request("tempo")) & "' and data='" &  year((request("data"))) & "-" &  month((request("data"))) & "-" &  day((request("data")))  & "' order by data desc"
	tbst.Open Sql,connm

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
          <h2>STORICO ORDINE</h2>
        </div>

        <H4>
		  LISTA ARTICOLI ORDINATI IL <%=request("data")%>  -  <%=request("tempo")%>
		</H4>

        <a style="position:relative;top:-80px;" name="topage"></a>

        <div class="bf-products-grid">
			<%
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
						<!--#include file="single_product.inc" -->
			<%  end if
					tbprodcatalogo.close
				end if
				'buffetti controllo errori
				if lcase(trim(tbst("fornitore")))="buffetti" and ibuffetti=<60  then
					ibuffetti=ibuffetti+1
					sSQLisp1 = "select * From prodotti where codice_buf='" & Trim(tbst("codice_isp")) & "' limit 1"
					tbprodcatalogo.Open sSQLisp1, connm
					if not tbprodcatalogo.eof then%>
				 <!--#include file="single_product_buffetti.inc" -->
			<%   end if
				   tbprodcatalogo.close
				end if
				'response.write(lcase(trim(tbst("fornitore"))))
				if lcase(trim(tbst("fornitore")))="ecommerce" and iecommerce=<60 then
					iecommerce=iecommerce+1
					sql="SELECT * from shop_products WHERE shop_products.ccode='" & Trim(tbst("codice_isp")) & "' limit 1 "
					tbprodcatalogo.open Sql,connm
					if not tbprodcatalogo.eof then
					%>

					<%
					end if
					tbprodcatalogo.close
				end if
				tbst.movenext
			Loop
			tbst.close%>
        </div>

      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->
