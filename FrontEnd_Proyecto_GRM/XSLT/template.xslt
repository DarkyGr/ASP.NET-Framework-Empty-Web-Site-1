<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>

	<xsl:param name="TipoMenu" select="TipoMenu">
	</xsl:param>

	<!-- TEMPLATE HEADER Y FOOTER -->
	<xsl:template match="Curso">
		<html lang="en">
			<head>
				<meta charset="utf-8"/>
				<title>iCURSOS</title>
				<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
				<meta content="" name="keywords"/>
				<meta content="" name="description"/>

				<!-- Favicon -->
				<link href="img/favicon.ico" rel="icon"/>

				<!-- Google Web Fonts -->
				<link rel="preconnect" href="https://fonts.googleapis.com"/>
				<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
				<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600=Nunito:wght@600;700;800=swap" rel="stylesheet"/>

				<!-- Icon Font Stylesheet -->
				<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet"/>
				<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet"/>

				<!-- Libraries Stylesheet -->
				<link href="lib/animate/animate.min.css" rel="stylesheet"/>
				<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet"/>

				<!-- Customized Bootstrap Stylesheet -->
				<link href="css/bootstrap.min.css" rel="stylesheet"/>

				<!-- Template Stylesheet -->
				<link href="css/style.css" rel="stylesheet"/>

				<!-- Template Stylesheet -->
				<link href="css/templatemo-style.css" rel="stylesheet"/>
			</head>

			<body>
				<!-- Spinner Start -->
				<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
					<div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
						<span class="sr-only">Cargando...</span>
					</div>
				</div>
				<!-- Spinner End -->

				<!-- Navbar Start -->
				<nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
					<a href="index.html" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
						<h2 class="m-0 text-primary">
							<i class="fa fa-book me-3"></i>iCURSOS
						</h2>
					</a>
					<button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarCollapse">
						<div class="navbar-nav ms-auto p-4 p-lg-0">
							<!--<a href="index.html" class="nav-item nav-link active">Inicio</a>-->
							<xsl:for-each select="Opciones/Opcion">
								<li>
									<xsl:choose>
										<xsl:when test="$TipoMenu=@Id">
											<a href="{@Url}" class="nav-item nav-link active">
												<xsl:value-of select="@Texto"/>
											</a>
										</xsl:when>
										<xsl:otherwise>
											<a href="{@Url}" class="nav-item nav-link">
												<xsl:value-of select="@Texto"/>
											</a>
										</xsl:otherwise>
									</xsl:choose>
								</li>
							</xsl:for-each>
						</div>
					</div>
				</nav>
				<!-- Navbar End -->

				<!-- For para obtener los bodys de cada pagina con base al Navbar -->
				<xsl:choose>
					<xsl:when test="$TipoMenu=0">
						<xsl:call-template name="Inicio">
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu=1">
						<xsl:call-template name="Cursos">
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu=2">
						<xsl:call-template name="Sobre">
						</xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoMenu=3">
						<xsl:call-template name="Contacto">
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="Inicio">
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>

				<!-- Footer Start -->
				<div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
					<div class="container py-5">
						<div class="row g-5">
							<div class="col-lg-4 col-md-6">
								<h4 class="text-white mb-3">Accesos rápidos</h4>

								<!-- FOR EACH OPCIONES -->
								<xsl:for-each select="Opciones/Opcion">
									<xsl:choose>
										<xsl:when test="$TipoMenu=@Id">
											<a href="{@Url}" class="btn btn-link active">
												<xsl:value-of select="@Texto"/>
											</a>
										</xsl:when>
										<xsl:otherwise>
											<a href="{@Url}" class="btn btn-link">
												<xsl:value-of select="@Texto"/>
											</a>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:for-each>

							</div>

							<div class="col-lg-4 col-md-6">
								<h4 class="text-white mb-3">Contacto</h4>
								<p class="mb-2">
									<i class="fa fa-map-marker-alt me-3"></i>
									<xsl:value-of select="Datos/Direccion"/>
								</p>
								<p class="mb-2">
									<i class="fa fa-phone-alt me-3"></i>
									<xsl:value-of select="Datos/Telefono"/>
								</p>
								<p class="mb-2">
									<i class="fa fa-envelope me-3"></i>
									<xsl:value-of select="Datos/Email"/>
								</p>
								<div class="d-flex pt-2">
									<a class="btn btn-outline-light btn-social" href="">
										<i class="fab fa-twitter"></i>
									</a>
									<a class="btn btn-outline-light btn-social" href="">
										<i class="fab fa-facebook-f"></i>
									</a>
									<a class="btn btn-outline-light btn-social" href="">
										<i class="fab fa-youtube"></i>
									</a>
									<a class="btn btn-outline-light btn-social" href="">
										<i class="fab fa-linkedin-in"></i>
									</a>
								</div>
							</div>

							<div class="col-lg-4 col-md-6">
								<h4 class="text-white mb-3">Galería</h4>
								<div class="row g-2 pt-2">
									<xsl:for-each select="Galeria/Foto">
										<div class="col-4 contGalery">
											<div draggable="true" class="box">
												<img class="img-fluid bg-light p-1" src="{Imagen}" alt=""/>
											</div>
										</div>
									</xsl:for-each>
								</div>
							</div>
						</div>
					</div>
					<div class="container">
						<div class="copyright">
							<div class="row">
								<div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
									<a class="border-bottom" href="#">Desconocido</a>, Todos los derechos reservados.
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Footer End -->

				<!-- Back to Top -->
				<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top">
					<i class="bi bi-arrow-up"></i>
				</a>


				<!-- JavaScript Libraries -->
				<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
				<script src="lib/wow/wow.min.js"></script>
				<script src="lib/easing/easing.min.js"></script>
				<script src="lib/waypoints/waypoints.min.js"></script>
				<script src="lib/owlcarousel/owl.carousel.min.js"></script>

				<!-- Template Javascript -->
				<script src="js/main.js"></script>
			</body>
		</html>
	</xsl:template>

	<!-- TEMPLATE INICIO -->
	<xsl:template name="Inicio">
		<script type="text/javascript" src="js/draganddrop.js"></script>

		<!-- Carousel Start -->
		<div class="container-fluid p-0 mb-5">
			<div class="owl-carousel header-carousel position-relative">
				<div class="owl-carousel-item position-relative">
					<img class="img-fluid" src="img/carousel-1.jpg" alt=""/>
					<div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
						<div class="container">
							<!-- FOR EACH PARA CURSOS-->
							<!--<xsl:for-each select="Categorias/Categoria[@Nombre = 'Desarrollo Web']/Curso">-->
							<div class="row justify-content-start">
								<div class="col-sm-10 col-lg-8">
									<h1 class="display-3 text-white animated slideInDown">
										<xsl:value-of select="Categorias/Categoria/Curso[@Orden = 1]/@Nombre"/>
									</h1>
									<p class="fs-5 text-white mb-4 pb-2">
										<xsl:value-of select="Categorias/Categoria/Curso[@Orden = 1]/Descripcion"/>
									</p>
									<a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Leer más...</a>
								</div>
							</div>
							<!--</xsl:for-each>-->
						</div>
					</div>
				</div>
				<div class="owl-carousel-item position-relative">
					<img class="img-fluid" src="img/carousel-2.jpg" alt=""/>
					<div class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center" style="background: rgba(24, 29, 56, .7);">
						<div class="container">
							<div class="row justify-content-start">
								<div class="col-sm-10 col-lg-8">
									<h1 class="display-3 text-white animated slideInDown">
										<xsl:value-of select="Categorias/Categoria/Curso[@Orden = 2]/@Nombre"/>
									</h1>
									<p class="fs-5 text-white mb-4 pb-2">
										<xsl:value-of select="Categorias/Categoria/Curso[@Orden = 2]/Descripcion"/>
									</p>
									<a href="" class="btn btn-primary py-md-3 px-md-5 me-3 animated slideInLeft">Leer más...</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Carousel End -->

		<!-- About Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="row g-5">
					<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
						<div class="position-relative h-100">
							<img class="img-fluid position-absolute w-100 h-100" src="img/about.jpg" alt="" style="object-fit: cover;"/>
						</div>
					</div>
					<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
						<h6 class="section-title bg-white text-start text-primary pe-3"></h6>
						<h1 class="mb-4">
							Bienvenido a
							<xsl:value-of select="Datos/Nombre"/>
						</h1>
						<p class="mb-4">
							<xsl:value-of select="Datos/Descripcion"/>
						</p>
						<div class="row gy-2 gx-4 mb-4">

							<!-- FOR EACH DATOS/HABILIDADES-->
							<xsl:for-each select="Datos/Habilidades/Habilidad">
								<div class="col-sm-6">
									<p class="mb-0">
										<i class="fa fa-arrow-right text-primary me-2"></i>
										<xsl:value-of select="@Nombre"/>
									</p>
								</div>
							</xsl:for-each>

						</div>
						<a class="btn btn-primary py-3 px-5 mt-2" href="">Leer más...</a>
					</div>
				</div>
			</div>
		</div>
		<!-- About End -->

		<!-- Categories Start -->
		<div class="container-xxl py-5 category">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="section-title bg-white text-center text-primary px-3">Categorías</h6>
					<h1 class="mb-5">Categorías de los cursos</h1>
				</div>
				<div class="row g-3">
					<div class="col-lg-7 col-md-6">
						<div class="row g-3">

							<!-- FOR EACH CONDICIONAL-->
							<xsl:for-each select="Categorias/Categoria[@Nombre = 'Desarrollo Web']">
								<div class="col-lg-12 col-md-12 wow zoomIn" data-wow-delay="0.1s">
									<a class="position-relative d-block overflow-hidden" href="">
										<img class="img-fluid" src="{Imagen}" alt=""/>
										<div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
											<h5 class="m-0">
												<xsl:value-of select="@Nombre"/>
											</h5>
											<small class="text-primary">
												<xsl:value-of select="TotalCursos"/>
												Cursos
											</small>
										</div>
									</a>
								</div>
							</xsl:for-each>

							<!-- FOR EACH Y CONDICIONAL Y CON AND-->
							<xsl:for-each select="Categorias/Categoria[@Nombre != 'Desarrollo Web' and @Nombre != 'Diseño Gráfico']">
								<div class="col-lg-6 col-md-12 wow zoomIn" data-wow-delay="0.3s">
									<a class="position-relative d-block overflow-hidden" href="{Opciones/Opcion[@Id = 1]/@Url}">
										<img class="img-fluid" src="{Imagen}" alt=""/>
										<div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin: 1px;">
											<h5 class="m-0">
												<xsl:value-of select="@Nombre"/>
											</h5>
											<small class="text-primary">
												<xsl:value-of select="TotalCursos"/>
												Cursos
											</small>
										</div>
									</a>
								</div>
							</xsl:for-each>

						</div>
					</div>

					<!-- VALUE OF SELECT CONDICIONAL -->
					<div class="col-lg-5 col-md-6 wow zoomIn" data-wow-delay="0.7s" style="min-height: 350px;">
						<a class="position-relative d-block h-100 overflow-hidden" href="">
							<img class="img-fluid position-absolute w-100 h-100" src="{Categorias/Categoria[@Nombre = 'Diseño Gráfico']/Imagen}" alt="" style="object-fit: cover;"/>
							<div class="bg-white text-center position-absolute bottom-0 end-0 py-2 px-3" style="margin:  1px;">
								<h5 class="m-0">
									<xsl:value-of select="Categorias/Categoria[@Nombre = 'Diseño Gráfico']/@Nombre"/>
								</h5>
								<small class="text-primary">
									<xsl:value-of select="Categorias/Categoria[@Nombre = 'Diseño Gráfico']/TotalCursos"/>
									Cursos
								</small>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Categories Start -->

		<!-- Testimonial Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="text-center">
					<h6 class="section-title bg-white text-center text-primary px-3">Temas</h6>
					<h1 class="mb-5">Temas que te gustan</h1>
				</div>

				<div class="row text-center">
					<div class="col-lg-3">
						<h5>
							Temas
						</h5>
						<div id="cuadro1" ondragenter="return enter(event)" ondragover="return over(event)"
							ondragleave="return leave(event)" ondrop="return drop(event)">
							<xsl:for-each select="Temas/Tema">
								<img id="{@Id}" draggable="true"
								 ondragstart="return start(event)" ondragend="return end(event)"
								 class="cuadrito" src="{Imagen}"></img>
							</xsl:for-each>
						</div>
					</div>
					<div class="col-lg-3">
						<h5>
							Me gusta
						</h5>
						<div id="cuadro2" ondragenter="return enter(event)" ondragover="return over(event)"
						ondragleave="return leave(event)" ondrop="return drop(event)"></div>
					</div>
					<div class="col-lg-3">
						<h5>
							No me gusta
						</h5>
						<div id="cuadro3" ondragenter="return enter(event)" ondragover="return over(event)"
						ondragleave="return leave(event)" ondrop="return drop(event)"></div>
					</div>
					<div class="col-lg-3">
						<h5>
							Basura
						</h5>
						<div id="papelera" ondragenter="return enter(event)" ondragover="return over(event)"
						ondragleave="return leave(event)" ondrop="return eliminar(event)"></div>
					</div>

				</div>
			</div>
		</div>
		<!-- Testimonial End -->
	</xsl:template>

	<!-- TEMPLATE CURSOS -->
	<xsl:template name="Cursos">
		<!-- Template Javascript -->
		<!--<script src="js/ready.js"></script>-->

		<!-- Header Start -->
		<div class="container-fluid bg-primary py-5 mb-5 page-header">
			<div class="container py-5">
				<div class="row justify-content-center">
					<div class="col-lg-10 text-center">
						<h1 class="display-3 text-white animated slideInDown">Cursos</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item">
									<a class="text-white" href="{Opciones/Opcion[@Id = 0]/@Url}">
										<xsl:value-of select="Opciones/Opcion[@Id = 0]/@Texto"/>
									</a>
								</li>
								<li class="breadcrumb-item text-white active" aria-current="page">
									<xsl:value-of select="Opciones/Opcion[@Id = 1]/@Texto"/>
								</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->

		<!-- Categories Start -->
		<div class="">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="section-title bg-white text-center text-primary px-3">Categorías</h6>
					<h1 class="mb-5">Cursos</h1>
				</div>

				<div class="row">
					<div class="col-md-3 menuopciones">

						<xsl:for-each select="Categorias/Categoria">
							<li>
								<a class="tipomenu" style="cursor:pointer;" id="l{@Orden}" data-identificadores="{@Orden}">
									<xsl:value-of select="@Nombre"/>
								</a>
							</li>
						</xsl:for-each>

					</div>

					<div class="col-md-9">
						<xsl:for-each select="Categorias/Categoria">
							<div class="tm-menu-product-content col-lg-12 col-md-12 contenedores" id="{@Orden}">

								<!--Contenido del menu-->
								<xsl:for-each select="Curso">
									<div class="tm-product">
										<img src="{Imagen}" style="width: 250px;" alt="Product" class="imagenPlatillo"></img>
										<div class="tm-product-text">
											<h3 class="tm-product-title">
												<xsl:value-of select="@Nombre"/>
											</h3>
											<p class="tm-product-description">
												<xsl:value-of select="Descripcion"/>
											</p>
										</div>

										<div class="tm-product-price">
											<xsl:value-of select="substring(Precio,1,1)"/>
											<xsl:value-of select="substring(Precio,2,string-length(Precio))"/>
										</div>

									</div>
								</xsl:for-each>
							</div>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>
		<!-- Categories Start -->

		<!-- Courses Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="section-title bg-white text-center text-primary px-3">Cursos</h6>
					<h1 class="mb-5">Cursos Populares</h1>
				</div>
				<div class="row g-4 justify-content-center">

					<!-- FOR EACH POPULARES -->
					<xsl:for-each select="Categorias/Categoria[@Nombre != 'Desarrollo Web']/Curso[@Orden = 4]">
						<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
							<div class="course-item bg-light">
								<div class="position-relative overflow-hidden">
									<img class="img-fluid" src="{Imagen}" alt=""/>
								</div>
								<div class="text-center p-4 pb-0">
									<h3 class="mb-0">
										<xsl:value-of select="substring(Precio, 1, string-length(Precio))"/>
									</h3>
									<div class="mb-3">
										<small class="fa fa-star text-primary"></small>
										<small class="fa fa-star text-primary"></small>
										<small class="fa fa-star text-primary"></small>
										<small class="fa fa-star text-primary"></small>
										<small class="fa fa-star text-primary"></small>
										<small>
											<xsl:value-of select="Rating"/>
										</small>
									</div>
									<h5 class="mb-4">
										<xsl:value-of select="@Nombre"/>
									</h5>
								</div>
								<div class="d-flex border-top">
									<small class="flex-fill text-center border-end py-2">
										<i class="fa fa-user-tie text-primary me-2"></i>
										<xsl:value-of select="Maestro"/>
									</small>
									<small class="flex-fill text-center border-end py-2">
										<i class="fa fa-clock text-primary me-2"></i>
										<xsl:value-of select="Tiempo"/> Hrs
									</small>
									<small class="flex-fill text-center py-2">
										<i class="fa fa-user text-primary me-2"></i>
										<xsl:value-of select="MaximoEstudiantes"/> Estudiantes
									</small>
								</div>
							</div>
						</div>
					</xsl:for-each>

				</div>
			</div>
		</div>
		<!-- Courses End -->

		<!-- Testimonial Start -->
		<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
			<div class="container">
				<div class="text-center">
					<h6 class="section-title bg-white text-center text-primary px-3">Testimonios</h6>
					<h1 class="mb-5">Nuestros estudiantes dicen...</h1>
				</div>
				<div class="owl-carousel testimonial-carousel position-relative">

					<!-- FOR EACH NORMAL -->
					<xsl:for-each select="Estudiantes/Estudiante">
						<div class="testimonial-item text-center">
							<img class="border rounded-circle p-2 mx-auto mb-3" src="{Imagen}" style="width: 80px; height: 80px;"/>
							<h5 class="mb-0">
								<xsl:value-of select="@Nombre"/>
							</h5>
							<p>
								<xsl:value-of select="Carrera"/>
							</p>
							<div class="testimonial-text bg-light text-center p-4">
								<p class="mb-0">
									<xsl:value-of select="Comentario"/>
								</p>
							</div>
						</div>
					</xsl:for-each>

				</div>
			</div>
		</div>
		<!-- Testimonial End -->
	</xsl:template>

	<!-- TEMPLATE SOBRE NOSOTROS -->
	<xsl:template name="Sobre">
		<!-- Header Start -->
		<div class="container-fluid bg-primary py-5 mb-5 page-header">
			<div class="container py-5">
				<div class="row justify-content-center">
					<div class="col-lg-10 text-center">
						<h1 class="display-3 text-white animated slideInDown">Sobre Nosotros</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item">
									<a class="text-white" href="{Opciones/Opcion[@Id = 0]/@Url}">
										<xsl:value-of select="Opciones/Opcion[@Id = 0]/@Texto"/>
									</a>
								</li>
								<li class="breadcrumb-item text-white active" aria-current="page">Sobre Nosotros</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->

		<!-- Service Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="row g-4">

					<!-- FOR EACH -->
					<xsl:for-each select="Servicios/Servicio[@Activo = 'Si']">
						<div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
							<div class="service-item text-center pt-3">
								<div class="p-4">
									<!--<i class="fa fa-3x fa-graduation-cap text-primary mb-4"></i>-->
									<h5 class="mb-3">
										<xsl:value-of select="@Nombre"/>
									</h5>
									<p>
										<xsl:value-of select="Descripcion"/>
									</p>
								</div>
							</div>
						</div>
					</xsl:for-each>

				</div>
			</div>
		</div>
		<!-- Service End -->

		<!-- About Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="row g-5">
					<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" style="min-height: 400px;">
						<div class="position-relative h-100">
							<video class="img-fluid position-absolute w-100 h-100" width="45%" controls="true" poster="/img/about.jpg" style="object-fit: cover;">
								<source src="multimedia/video.mp4">
								</source>
							</video>
						</div>
					</div>
					<div class="col-lg-6 wow fadeInUp" data-wow-delay="0.3s">
						<h6 class="section-title bg-white text-start text-primary pe-3"></h6>
						<h1 class="mb-4">
							Bienvenido a
							<xsl:value-of select="Datos/Nombre"/>
						</h1>
						<p class="mb-4">
							<xsl:value-of select="Datos/Descripcion"/>
						</p>
						<div class="row gy-2 gx-4 mb-4">

							<!-- FOR EACH DATOS/HABILIDADES-->
							<xsl:for-each select="Datos/Habilidades/Habilidad">
								<div class="col-sm-6">
									<p class="mb-0">
										<i class="fa fa-arrow-right text-primary me-2"></i>
										<xsl:value-of select="@Nombre"/>
									</p>
								</div>
							</xsl:for-each>

						</div>
						<a class="btn btn-primary py-3 px-5 mt-2" href="">Leer más...</a>
					</div>
				</div>
			</div>
		</div>
		<!-- About End -->

		<!-- Team Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="section-title bg-white text-center text-primary px-3">Profesores</h6>
					<h1 class="mb-5">Profesores Expertos</h1>
				</div>
				<div class="row g-4">

					<!--FOR EACH -->
					<xsl:for-each select="Profesores/Profesor">
						<div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
							<div class="team-item bg-light">
								<div class="overflow-hidden">
									<img class="img-fluid" src="{Imagen}" alt=""/>
								</div>
								<div class="position-relative d-flex justify-content-center" style="margin-top: -23px;">
									<div class="bg-light d-flex justify-content-center pt-2 px-1">
										<a class="btn btn-sm-square btn-primary mx-1" href="">
											<i class="fab fa-facebook-f"></i>
										</a>
										<a class="btn btn-sm-square btn-primary mx-1" href="">
											<i class="fab fa-twitter"></i>
										</a>
										<a class="btn btn-sm-square btn-primary mx-1" href="">
											<i class="fab fa-instagram"></i>
										</a>
									</div>
								</div>
								<div class="text-center p-4">
									<h5 class="mb-0">
										<xsl:value-of select="@Nombre"/>
									</h5>
									<small>
										<xsl:value-of select="Cargo"/>
									</small>
								</div>
							</div>
						</div>

					</xsl:for-each>
				</div>
			</div>
		</div>
		<!-- Team End -->
	</xsl:template>

	<!-- TEMPLATE CONTACTO -->
	<xsl:template name="Contacto">
		<script type="text/javascript" src="js/geolocalizacion.js"></script>
		<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"
				defer="">
		</script>

		<!-- Header Start -->
		<div class="container-fluid bg-primary py-5 mb-5 page-header">
			<div class="container py-5">
				<div class="row justify-content-center">
					<div class="col-lg-10 text-center">
						<h1 class="display-3 text-white animated slideInDown">Contacto</h1>
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb justify-content-center">
								<li class="breadcrumb-item">
									<a class="text-white" href="{Opciones/Opcion[@Id = 0]/@Url}">
										<xsl:value-of select="Opciones/Opcion[@Id = 0]/@Texto"/>
									</a>
								</li>
								<li class="breadcrumb-item text-white active" aria-current="page">Contacto</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->

		<!-- Audio Start -->
		<div class="container-xxl py-5" style="display: flex; justify-content: center; align-items: center;">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<div id="ContenedorAudio" class="md-12">
						<div id="fotoAudio" style="width:100%;">
							<audio controls="true" style="width:45%" autoplay="true">
								<source src="multimedia/audio.mp3">
								</source>
							</audio>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Audio End -->

		<!-- Contact Start -->
		<div class="container-xxl py-5">
			<div class="container">
				<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
					<h6 class="section-title bg-white text-center text-primary px-3">Dirección</h6>
					<p class="section-title bg-white text-center text-primary px-3" id="direccion">Esto es una etiqueta</p>
					<h1 class="mb-5">
						Márcanos al
						<xsl:value-of select="concat(' Tel: ', Datos/Telefono)"/>
					</h1>
				</div>

				<div class="row g-4">

					<div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
						<div id="mapa" style="min-height: 300px; border:0;"
						class="position-relative rounded w-100 h-100"></div>

						<!--<iframe class="position-relative rounded w-100 h-100"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3001156.4288297426!2d-78.01371936852176!3d42.72876761954724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4ccc4bf0f123a5a9%3A0xddcfc6c1de189567!2sNew%20York%2C%20USA!5e0!3m2!1sen!2sbd!4v1603794290143!5m2!1sen!2sbd"
                        frameborder="0" style="min-height: 300px; border:0;" allowfullscreen="" aria-hidden="false"
                        tabindex="0"></iframe>-->
					</div>

					<div class="col-lg-6 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
						<form>
							<div class="row g-3">
								<div class="col-md-6">
									<div class="form-floating">
										<input type="text" class="form-control" id="name" placeholder="" required="true"/>
										<label for="name">Nombre</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating">
										<input type="email" class="form-control" id="email" placeholder="" required="true"/>
										<label for="email">Correo electrónico</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="subject" placeholder="Asunto" required="true"/>
										<label for="subject">Asunto</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<textarea class="form-control" placeholder="Mensaje" id="message" style="height: 150px" required="true"></textarea>
										<label for="message">Mensaje</label>
									</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100 py-3" type="submit">Enviar Mensaje	</button>
								</div>
							</div>
						</form>
					</div>

					<div id="street"></div>
					<div class="col-lg-12 col-md-6 wow fadeInUp" data-wow-delay="0.3s">

					</div>
				</div>
			</div>
		</div>
		<!-- Contact End -->

		<!-- Preguntas Start -->

		<!-- Preguntas End -->
	</xsl:template>

</xsl:stylesheet>
