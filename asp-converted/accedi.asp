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
        <h2 class="bf-page-title">Accedi</h2>

        <div class="bf-login-card bf-form-card">
            <a name="topage"></a>
            <form action="clienti.asp?ut=psw" method="post" id="form1" name="form1">
                <div class="bf-form-group">
                    <label class="bf-login-label">UTENTE</label>
                    <input type="text" name="utente" class="bf-form-input" maxlength="60">
                </div>
                <div class="bf-form-group">
                    <label class="bf-login-label">PASSWORD</label>
                    <input type="password" name="password" class="bf-form-input" maxlength="60">
                </div>
                <div class="bf-form-group">
                    <button type="submit" class="bf-btn-submit" value="ACCEDI">ACCEDI</button>
                </div>
            </form>

            <div class="bf-login-actions">
                <h3>REGISTRATI / RECUPERA PASSWORD</h3>
                <button class="bf-btn-red" onClick="top.location.href='registrati.asp'">REGISTRATI</button>
                <button class="bf-btn-red" onClick="top.location.href='registrazionepersa.asp'">PASSWORD DIMENTICATA</button>
            </div>
        </div>
      </div>
    </section>

    <!--#include file="footer.inc" -->

  </body>
</html>
<!--#include file="sqlchiudi.inc"-->