<!--#include file="connessionesql.inc"-->
<!--#include file="parametriasp.inc"-->
<!--#include file="parametriasplettura.inc" -->

<!DOCTYPE html>
<html lang="en">
  <head>
<!--#include file="head.inc" -->
  </head>
  <body>
  <%

    sicurezza=True
    'Utente?
    if trim(request("ut"))="psw" then
			'Sicurezza
	     	if sicurezza=false then
			  Response.Redirect "errore.asp"
			end if
			session.lcid=1040
			utente=request("utente")
			password=request("password")
			query="Select * From Amministratore where utente='" & utente & "' and password='" & password & "'"
			SET Tbut=connm.EXECUTE(query)
			if Tbut.eof or sicurezza <> True then%>
					<script>
					h=screen.width;
					v=screen.height;
					statuswin = window.open('', 'Stato', 'scrollbars=no,resizable=no,width=200,height=80');
					po=(h/2)-100;
					pv=(v/2)-40;
					statuswin.moveTo(po,pv);
					statuswin.document.writeln('<html><head><title>Attendi...</title><link rel=stylesheet href=<%=sitourl%>/style.css></head><body bgcolor=<%=colorpopup%>>');
					statuswin.document.writeln('<table width=100% height=100% bgcolor=<%=colorpopup%>><tr><td><strong valign=middle align=center >');
					statuswin.document.writeln('<b><br>utente o password<br>errati!riprova</b>');
					statuswin.document.writeln('</strong></td></tr></table></body></html>');
					</script>
  <%
			else
			 Session("Utentetipo")=Tbut("Utentetipo")
			 Response.Redirect "admin/adgestionecategorieod.asp"
			 'Response.Redirect "admin/adutentipro.asp"
			end if

	  End if

       %>
  <!--#include file="top.inc" -->
 <br>
    </div>

    <section class="bf-content-page">
      <div class="bf-container">
        <h2 class="bf-page-title">AREA RISERVATA</h2>

        <div class="bf-login-card bf-form-card">
							<a style="position:relative;top:-80px;" name="topage"></a>

							<form action="ingresso.asp?ut=psw" method="post" id="form2" name="form2">
								<div class="bf-form-group">
									<label class="bf-login-label">UTENTE</label>
									<input type="text" name="utente" class="bf-form-input" maxlength="60">
								</div>
								<div class="bf-form-group">
									<label class="bf-login-label">PASSWORD</label>
									<input type="password" name="password" class="bf-form-input" maxlength="60">
								</div>
								<div class="bf-form-group">
									<input type="submit" class="bf-btn-red" value="ACCEDI AREA RISERVATA">
								</div>
							</form>
        </div>
      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->