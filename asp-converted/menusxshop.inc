    <%
	if linkurl="odlista.asp" or linkurl="odlistaprod.asp" or linkurl="oddettagli.asp" then
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
				<!-- Sidebar -->
				<div class="bf-sidebar">

					<form>

					<!-- Subcategories -->
					<div class="bf-sidebar-section">
						<h3 class="bf-sidebar-title">Sottocategorie</h3>
						<ul class="bf-filter-list">
							<%
							queryd2="Select distinct sottocategoria,categoria From PRODOTTI where categoria='" & Trim(Replace(Request("cat"),"%20"," ")) &"' and fornitore like '%" & txt_fornitore & "%' order by sottocategoria asc"
							Set tbmenusxcat = Server.CreateObject("ADODB.RecordSet")
							tbmenusxcat.Open queryd2,connm

							Do While not tbmenusxcat.eof
							i=i+1%>
							<li>
								<label>
									<input type="checkbox">
									<%if txt_fornitore="od" then%>
									<a href='odlista.asp?sotto=<%=lcase(tbmenusxcat("sottocategoria")) %>&cat=<%=lcase(tbmenusxcat("categoria"))%>'>
										<%=lcase(tbmenusxcat("sottocategoria")) %>
									</a>
									<%else%>
									<a href='catbuffettilista.asp?id=<%=lcase(tbmenusxcat("sottocategoria")) %>&cat=<%=lcase(tbmenusxcat("categoria"))%>'>
										<%=lcase(tbmenusxcat("sottocategoria")) %>
									</a>
									<%end if%>
								</label>
							</li>
							<%	tbmenusxcat.movenext
							Loop
							tbmenusxcat.close%>
						</ul>
					</div>

					</form>

					<!-- Magazine Promo -->
					<div class="bf-sidebar-promo">
						<a class='yBox yBox_iframe' href="https://img.schede.eu/volantino/volantino.pdf">
							<img src="https://img.schede.eu/volantino/magazine.jpg" alt="Volantino">
							<p><i class="fa-solid fa-book-open"></i> Sfoglia il volantino</p>
						</a>
					</div>

				</div>

				<!-- Main Content Area -->
				<div class="bf-main-content">
