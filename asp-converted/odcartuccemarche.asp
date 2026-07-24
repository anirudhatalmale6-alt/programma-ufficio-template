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
 <br>

    <section class="bf-content-page">
      <div class="bf-container">
        <h2 class="bf-page-title">Cartucce Marche</h2>

					   <a style="position:relative;top:-80px;" name="primaindietro"></a>
						<a style="position:relative;top:-80px;" name="odposizione"></a>
						<a style="position:relative;top:-80px;" name="topage"></a>
						<!--#include file="odcartucce.asp"-->
						<form action="odcartuccericerca.asp#primaindietro" method="get" id="formcartuccericerca" name="formcartuccericerca" >
						<table>
						<tr><td>
						<input type="text" class="bf-form-input" style="height:45px;width:250px;" id="termscartucce" name="termscartucce"  placeholder="modello stampante o cartuccia" >
						</td>
						<td>&nbsp;&nbsp;</td>
						<td>
						<input type="submit" class="bf-btn bf-btn-red" style="height:46px;width:150px;" value="Search">
						</td></tr></table>
						</form>
						<br><br>

        <div class="bf-category-list">

										<a style="position:relative;top:-80px;" name="topage"></a>
															<%



								 Set Tbc = Server.CreateObject("ADODB.RecordSet")
								 sSQL = "select * From MarcaUti where visibile='true' order by Marca asc"
									Tbc.Open sSQL,conn
									'response.write(sSQL)
									'response.end
									If not Tbc.EOF then
									    'response.write(sSQL)
										response.write("<BR><BR><TABLE border='1' valign='top' cellspacing='0' cellpadding='0' width='100%' align='left' ><tr><th width='180px'></th><th valign='top' height='15px' width='450px'  align='left' >")
										I=0
										Controlla="True"
										Do While not Tbc.eof
											'Controlla
											marca=trim(Tbc("id"))
											Response.Write " <a href='odcartuccesottomarche.asp?id=" & marca & "&Preisp=" & Tbc("Preisp") & "#primaindietro'>" & trim(ucase(Tbc("Marca")))  & "</a> <br>"
											Tbc.movenext
											I=I+1
											If I=16  then
											  Response.Write "</th><th height='15px' align=left>"
											  I=0
											End if

										loop
									else
										Controlla="False"
									end if
									Response.Write "</th></tr><tr><th height='20px'></th></tr></TABLE>"
									Tbc.close

								%>

        </div>

      </div>
    </section>


    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->