    <%
	if linkurl="odlista.asp" or linkurl="odlistaprod.asp" or linkurl="odcartuccelista.asp" or linkurl="oddettagli.asp" then
	 txt_fornitore="od"
	 else
	 txt_fornitore="buffetti"
	 end if%>

	<!-- Breadcrumb -->
	<div class="bf-breadcrumb">
		<div class="bf-container">
			<a href="homepage.asp"><i class="fa-solid fa-house"></i> Home</a>
			<i class="fa-solid fa-chevron-right"></i>
			<span><%=Trim(Replace(Request("cat"),"%20"," "))%></span>
		</div>
	</div>

	<!-- Page Layout -->
	<div class="bf-page">
		<div class="bf-container">
			<div class="bf-page-grid">
				<!-- Sidebar (minimal) -->
				<div class="bf-sidebar">

					<!-- Magazine Promo -->
					<div class="bf-sidebar-promo">
						<a class='yBox yBox_iframe' href="https://img.schede.eu/volantino/volantino.pdf">
							<img src="https://img.schede.eu/volantino/magazine.jpg" alt="Volantino">
							<p><i class="fa-solid fa-book-open"></i> Sfoglia il volantino</p>
						</a>
					</div>

					<!-- Facebook Widget -->
					<div style="margin-top:16px;text-align:center;">
						<script>(function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id)) return;
						js = d.createElement(s); js.id = id;
						js.src = "//connect.facebook.net/it_IT/sdk.js#xfbml=1&version=v2.0";
						fjs.parentNode.insertBefore(js, fjs);
						}(document, 'script', 'facebook-jssdk'));
						</script>
						<div data-service="facebook" data-category="marketing" class="cmplz-placeholder-element fb-page"
							data-href="<%=Session("facebook")%>"
							data-width="220"
							data-hide-cover="false"></div>
					</div>

				</div>

				<!-- Main Content Area -->
				<div class="bf-main-content">
