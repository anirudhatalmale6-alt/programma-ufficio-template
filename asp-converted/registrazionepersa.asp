<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->
<%

Set rs = Server.CreateObject("ADODB.RecordSet")
'rs.Open sqlvis, connm

function isValidEmail(s)
	res=true
	if instr(s,"@") < 2 then res=false
	if instr(s,".") < 1 then res=false
	isValidEmail=res
end function



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
        <h2 class="bf-page-title">Password Dimenticata....</h2>

        <div class="bf-login-card bf-form-card">



									<a style="position:relative;top:-80px;" name="topage"></a>


								<%if not isValidEmail(request("email")) then%>
								<%if request.form("email")<>"" then%>
								<b><font color="red"><br>Inserire un indirizzo email valido<br></font></b>
								<%end if%>
									<p><br>
									Hai dimenticato la tua password? <br>
									Inserisci l'e-mail con la quale ti sei registrato al portale E-commerce <%=sitourl%>, ti sar&agrave;
									spedita direttamente nella tua casella di posta elettronica.<br><br> </p>
									<form method="post" action="registrazionepersa.asp" ID="Form1">
										<div class="bf-form-group">
											<label class="bf-login-label">Tua email:</label>
											<input type="text" class="bf-form-input" size="35" name="email" value="" >
										</div>
										<div class="bf-form-group">
											<button type="submit" class="bf-btn-submit" value="&nbsp;RICHIEDO&nbsp;PASSWORD">&nbsp;RICHIEDO&nbsp;PASSWORD</button>
										</div>
									</form>
								<%else
								email = trim(replace(request("email"),"'",""))

								rs.open "select utente1,password2 from registrazione  where email='" & email & "' union select utente1,password2 from registrazioneint where email='" & email & "'",connm
								if rs.eof then
								%>
								indirzzo email non trovato.
								<%
								else
								HTML = ""
								HTML = "<!DOCTYPE HTML PUBLIC -//IETF//DTD HTML//EN>"
								HTML = HTML   & "<html>"
								HTML = HTML   & "<head>"
								HTML = HTML   & "<meta http-equiv=Content-Type>"
								'HTML = HTML   & "<link rel=stylesheet href='" & sitourl & "/style.css'></head>"

								HTML = HTML   & "<body>"
								HTML = HTML   & "<img src='" & sitourllogo &"'><br>"
								HTML = HTML & "Ecco i tuoi dati di accesso al sito " & sitourl & "<br><br>"
								HTML = HTML & "Utente: "  & rs("utente1")   & "<br>"
								HTML = HTML & "Password : "  & rs("password2")   & " <br>"

								HTML = HTML & "</body>"
								HTML = HTML & "</html>"
								rt1=SendEmail(defaultMailfrom,email,"Recupero password",html)
								%>
								<div class="bf-message">
									<img src="img/ok.png" border="0"><br>
									<p><strong>Mail Inviata!</strong></p>
									<p>Abbiamo inviato un messaggio contenente i tuoi dati di accesso al tuo indirizzo email.</p>
								</div>

								<%
								rs.close
								end if

								end if%>

							<br>
        </div>
      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->