
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="UTF-8" />

    <title><%=Session("titolopagina")%></title>
	<link rel="icon" href="<%=Session("sitourl")%>/img/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon" />

	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<!-- Font Awesome 6 -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
	<!-- Font Awesome 4 (legacy compatibility) -->
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<!-- Buffetti Template CSS -->
	<link rel="stylesheet" href="css/buffetti.css">

	<!-- Legacy site CSS -->
    <link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="css/yBox.min.css">
    <link rel="stylesheet" href="./css/styles.css" />
    <link rel="stylesheet" href="./lib/rater-js/rater-js.css" />
    <link rel="stylesheet" href="./lib/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="./lib/nouiSlider/nouislider.min.css" />
    <link rel="stylesheet" href="./lib/metisMenu/metismenujs.min.css" />

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

	<!-- Cart JS -->
	<script type="text/javascript" src="carrello.js"></script>

	<!-- Zoom plugin -->
	<script type="text/javascript" src="zoom/lib/blowup.min.js"></script>
	<script type="text/javascript" src="zoom/demo/scripts/index.js"></script>

	<!-- Popup Overlay -->
	<script src="jquery.popupoverlay.js"></script>

	<!-- SweetAlert -->
	<script src="sweetalert.min.js"></script>

	<!-- yBox lightbox -->
	<script src="js/yBox.min.js"></script>

	<script language="JavaScript">
	function opensn(url) {
		popupWin = window.open(url, 'new_page', 'width=720,height=620,scrollbars=yes,resizable=yes');
	}
	function aggqta(qta){
	var x = document.getElementById(qta).value;
	document.getElementById(qta).value=parseInt(x) + 1;
	}
	function dimqta(qta){
	var x = document.getElementById(qta).value;
	var y=Math.abs(parseInt(x) - 1);
	if (y==0) {
	    swal('0 acquisto non possibile');
	    y=1}
	document.getElementById(qta).value=y;
	}
	function ZoomIn(nomeimg,fornitore)
	{
	var controlla = fornitore;
	if (controlla.indexOf("od") != (-1)) {
	swal("", "", "foto.asp?cat=catalogoisp&img="+nomeimg);
	};
	if (controlla.indexOf("buffetti") != (-1)) {
	swal("", "", "foto.asp?cat=catalogobuffetti2016_big&img="+nomeimg);
	};
	if (controlla.indexOf("ecommerce") != (-1)) {
	swal("", "", "admin/articoli/"+nomeimg);
	};
	}
	function gotoPage(idValue, returnUrl)
{
    var frm = document.createElement("form");
    frm.action = returnUrl;
    frm.method = "POST";

    var id = document.createElement("input");
    id.type = "hidden";
    id.name = "id";
    id.value = idValue;
    frm.appendChild(id);

    document.body.appendChild(frm);
    frm.submit();
}
	</script>

