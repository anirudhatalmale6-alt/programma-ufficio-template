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
<!--#include file="menusxsenza.inc" -->



          <div class="bf-main-content">
            <div class="bf-toolbar">
              <div class="bf-toolbar-info">
                <p><%=lcase(request("sotto"))%></p>
              </div>
              <div class="bf-toolbar-sort">
                <span>Order by:</span>
						<form name="form" method="post" action='odcartuccelista.asp?pagsp=1&cat=<%=Trim(Replace(Request("cat")," ","%20"))%>&sotto=<%=Trim(Replace(Request("sotto")," ","%20"))%>' ID="Form1">
						<select	class="bf-form-select">
						<option value="p1 asc" >ordina per prezzo minore</option>
						<option value="p1 desc">ordina per prezzo maggiore</option>
						<option value="marchio asc">ordina per nome della marca </option>
						</select>
						</form>
              </div>
            </div>
            <div class="bf-products-grid">

										<%

										Dim Mprezzo
										counterfrm=1000
										'Set Recordset
										Set tbprodcatalogo = Server.CreateObject("ADODB.RecordSet")
										Set Tbmod = Server.CreateObject("ADODB.RecordSet")
										sSQL = "select Modello.*,modello_disp_add.* FROM Modello INNER JOIN modello_disp_add ON Modello.id = modello_disp_add.idmodello where modello_disp_add.idmodello=" & clng(Request("modelloId"))
										Tbmod.Open sSQL, conn

										 i=0
										Do While not Tbmod.eof
											'queryd2="Select * from prodotti where codice_od='" & Tbmod("Codice_isp")  & "' or (codice_buf like '%" & left(right(Tbmod("Codice_isp"),7),5)  & "%' and descrizione like '%comp %') order by fornitore desc"
											'response.write(queryd2)
                                        queryd2="Select * from prodotti where codice_od='" & Tbmod("Codice_isp")  & "' order by codice_od asc"
											tbprodcatalogo.Open queryd2,connm
											Do While not (tbprodcatalogo.eof)
												counterfrm=counterfrm+1
												 i=i+1
												 %>
												<!--#include file="single_product.inc" -->
												<%
												tbprodcatalogo.movenext
											Loop
											tbprodcatalogo.close
										Tbmod.MoveNext
										Loop
										Tbmod.close

										%>

            </div>
          </div><!-- bf-main-content -->
        </div><!-- bf-page-grid -->
      </div><!-- bf-container -->
    </div><!-- bf-page -->


 <!--#include file="footer.inc" -->
<%tbprodcatalogo.close%>
  </body>
</html>
<!--#include file="sqlchiudi.inc"-->