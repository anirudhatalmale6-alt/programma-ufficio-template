<!--#include file="parametriasp.inc"-->
<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<link href="style.css" rel="stylesheet" type="text/css">
<style>
  body{background:#ffffff;color:#000000;font-family:Verdana,Arial,sans-serif;font-size:13px;margin:24px;}
  .bf-print-head{text-align:center;margin-bottom:28px;line-height:1.6;}
  .bf-print-head u{font-weight:700;}
  @media print{body{margin:0;}}
</style>
</head>
<body onload="window.print()" name="printform">

  <div class="bf-print-head">
    inviare ordine via fax al numero : <%=Session("faxnum")%>
    <br>
    Stampa del <%Response.Write Date%> , <%Response.Write Time%>
    <br>
    <u><%=titolopagina%></u>
  </div>

<!--#include file="ricaricacarrellovisua.asp" -->

</body>
</html>