    <%
	if linkurl="odlista.asp" or linkurl="odlistaprod.asp" or linkurl="odcartuccelista.asp" or linkurl="oddettagli.asp" or linkurl="odmarchio.asp" or linkurl="odfiltro.asp" then
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

					<%if txt_fornitore="od" then %>
					<form action="odfiltro.asp?" method="get" id="filtro" name="filtro">
					<%else%>
					<form action="catbuffettifiltro.asp?" method="get" id="filtro" name="filtro">
					<%end if%>

					<input type="hidden" id="fornitore" name="fornitore" value="<%=txt_fornitore%>">
					<input type="hidden" id="cat" name="cat" value="<%=Trim(Replace(Request("cat"),"%20"," "))%>">

					<!-- Subcategories Filter -->
					<div class="bf-sidebar-section">
						<h3 class="bf-sidebar-title">Sottocategorie</h3>
						<ul class="bf-filter-list">
							<%
							i=0
							queryd2="Select distinct sottocategoria,categoria From PRODOTTI where categoria='" & Trim(Replace(Request("cat"),"%20"," ")) &"' and fornitore like '%" & txt_fornitore & "%' order by sottocategoria asc"
							Set tbmenusxcat = Server.CreateObject("ADODB.RecordSet")
							tbmenusxcat.Open queryd2,connm

							Do While not tbmenusxcat.eof
							i=i+1%>
							<li>
								<label>
									<input type="checkbox"
										value="<%=lcase(tbmenusxcat("sottocategoria")) %>"
										name="sotto<%=i%>">
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

					<!-- Colors Filter -->
					<div class="bf-sidebar-section">
						<h3 class="bf-sidebar-title">Colori</h3>
						<ul class="bf-filter-list">
							<li><label><input type="radio" name="radio-colors" value="0"> Nero</label></li>
							<li><label><input type="radio" name="radio-colors" value="1"> Bianco</label></li>
							<li><label><input type="radio" name="radio-colors" value="2"> Rosso</label></li>
							<li><label><input type="radio" name="radio-colors" value="3"> Arancione</label></li>
							<li><label><input type="radio" name="radio-colors" value="4"> Blu</label></li>
							<li><label><input type="radio" name="radio-colors" value="5"> Verde</label></li>
						</ul>
					</div>

					<!-- Price Filter -->
					<div class="bf-sidebar-section">
						<h3 class="bf-sidebar-title">Prezzo</h3>
						<div class="slider-handles my-2"></div>
						<div style="display:flex;justify-content:space-between;font-size:12px;color:#718096;">
							<input class="min-price" type="hidden" name="minprezzo" readonly />
							<input class="max-price" type="hidden" name="maxprezzo" readonly />
							<span class="span-min-price"></span>
							<span class="span-max-price"></span>
						</div>
					</div>

					<!-- Brands Filter -->
					<div class="bf-sidebar-section">
						<h3 class="bf-sidebar-title">Marchi</h3>
						<ul class="bf-filter-list">
							<%
							i=0
							querylistcat="Select marchio,sottocategoria,categoria From prodotti where categoria='" & Trim(Replace(Request("cat"),"%20"," ")) & "' and fornitore like '%" & txt_fornitore & "%' group by marchio order by marchio"
							Set tblistcat = Server.CreateObject("ADODB.RecordSet")
							tblistcat.Open querylistcat,connm
							Do While not (tblistcat.eof)
							i=i+1
							%>
							<li>
								<label>
									<input type="checkbox"
										value="<%=lcase(tblistcat("marchio"))%>"
										name="marchio<%=i%>">
									<%if tblistcat.eof or tblistcat("marchio")="" then%>
									buffetti
									<%else%>
									<a href='odmarchio.asp?cat=<%=lcase(tblistcat("categoria")) %>&sotto=<%=lcase(tblistcat("sottocategoria")) %>&marchio=<%=lcase(tblistcat("marchio"))%>'>
										<%=lcase(tblistcat("marchio"))%>
									</a>
									<%end if%>
								</label>
							</li>
							<%tblistcat.movenext
							Loop
							tblistcat.close
							%>
						</ul>
					</div>

					<!-- Filter Submit -->
					<button type="submit" class="bf-filter-btn">
						<i class="fa-solid fa-filter"></i> Filtra Prodotti
					</button>

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
