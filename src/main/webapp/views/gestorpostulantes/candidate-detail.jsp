<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<!-- premium-candidate-detail41:50-->
<head>
	<!-- Basic Page Needs
	================================================== -->
	<title>Job Stock - Responsive Job Portal Bootstrap Template</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
	================================================== -->
	<link rel="stylesheet" href="assets/plugins/css/plugins.css">
    
    <!-- Custom style -->
    <link href="assets/css/style.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" id="jssDefault" href="assets/css/colors/green-style.css">
    
	</head>
	<body>
		<div class="Loader"></div>
		<div class="wrapper">  
			
			<!-- Start Navigation -->
			<nav class="navbar navbar-default navbar-fixed navbar-light white bootsnav">

				<div class="container">            
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu">
						<i class="fa fa-bars"></i>
					</button>
					<!-- Start Header Navigation -->
					<div class="navbar-header">
						<a class="navbar-brand" href="index-2.html">
							<img src="assets/img/logo.png" class="logo logo-scrolled" alt="">
						</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="navbar-menu">
	                  <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
				        <c:choose>
				            <c:when test="${empty sessionScope.nombreUsuario}">
				                <li class="left-br">
				                    <a href="javascript:void(0)" data-toggle="modal" data-target="#signup" class="signin">Registrate Ahora</a>
				                </li>
				            </c:when>
				            <c:otherwise>
				                <li>
				                    <a href="#" class="signin">Bienvenido, ${sessionScope.nombreUsuario}</a>
				                </li>
				                <li>
				                    <a href="${pageContext.request.contextPath}/LogoutServlet" class="signout">
					                    <i class="fa fa-power-off" style="color: red; font-size: 18px;"></i>
					                </a>
					             </li>
				            </c:otherwise>
				        </c:choose>
				    </ul>
	                <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
	                <li><a href="${pageContext.request.contextPath}/puestos-trabajo">Inicio</a></li> 
	                  <c:choose>
	                 	<c:when test="${sessionScope.role == 1}">
			                <!-- Rutas para el rol 1 -->
			                <li><a href="${pageContext.request.contextPath}/completar-registro">Perfil</a></li>
			            </c:when>
			            <c:when test="${sessionScope.role == 2}">
			                <!-- Rutas para el rol 2 -->
			                <li><a href="${pageContext.request.contextPath}/crear-trabajo">Crear Trabajo</a></li>
							<li><a href="${pageContext.request.contextPath}/lista-candidatos">Candidatos</a></li>		                
					    </c:when>
	               		</c:choose>   
	                </ul>
	            </div>
					
				</div>   
			</nav>
			<!-- End Navigation -->
			<div class="clearfix"></div>
			
			<!-- Title Header Start -->
			<section class="inner-header-page">
				<div class="container">
					
					<div class="col-md-8">
						<div class="left-side-container">
							<div class="freelance-image"><a href="company-detail.html">
							<img src="${pageContext.request.contextPath}/views/Template/assets/img/client-${postulante.id}.jpg" class="img-responsive img-circle" alt=""></a></div>
							<div class="header-details">
								<h4>${ postulante.nombreUsuario.nombre } ${ postulante.nombreUsuario.apellido } <span class="pull-right">${postulante.salarioPropuesto}</span></h4>
								<c:set var="nombrePuesto" value="${postulante != null ? postulante.puestoTrabajo.nombrePuesto : ''}" />
								<p>${nombrePuesto}</p>
								<ul>
									<li><a href="#"><i class="fa fa-building"></i> Descargar CV</a></li>
									<li>
										<div class="star-rating" data-rating="4.2">
											<span class="fa fa-star fill"></span>
											<span class="fa fa-star fill"></span>
											<span class="fa fa-star fill"></span>
											<span class="fa fa-star fill"></span>
											<span class="fa fa-star-half fill"></span>
										</div>
									</li>
									<li><img class="flag" src="assets/img/gb.svg" alt=""> ${ postulante.nombreUsuario.pais }</li>
									<li><div class="verified-action">Verificado</div></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="col-md-4 bl-1 br-gary">
						<div class="right-side-detail">
							<ul>
								<li><span class="detail-info">Disponibilidad</span>${ postulante.puestoTrabajo.tipoTrabajo }<span class="available-status">Disponible</span></li>
								<li><span class="detail-info">Ubicación</span> ${ postulante.nombreUsuario.ciudad }</li>
								<li><span class="detail-info">Experiencia</span>${ postulante.nombreUsuario.getAniosExperiencia() } años</li>
							</ul>
							<ul class="social-info">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-instagram"></i></a></li>
								<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
					</div>
					
				</div>
			</section>
			<div class="clearfix"></div>
			<!-- Title Header End -->
			
			<!-- Freelancer Detail Start -->
			<section>
				<div class="container">
					
					<div class="col-md-8 col-sm-8">
						<div class="container-detail-box">
						
							<div class="apply-job-header">
								<h4>Acerca de mí</h4>
								<a href="#" class="cl-success"><span><i class="fa fa-building"></i>Mi CV</span></a>
								<span><i class="fa fa-map-marker"></i>${ postulante.nombreUsuario.pais }</span>
							</div>
							
							<div class="apply-job-detail">
								<p>${ postulante.nombreUsuario.getAcercaMi() }</p>
							</div>

							<div class="apply-job-detail">
								<h5>Habilidades</h5>
								<ul class="skills">
								  <c:forEach var="skill" items="${ postulante.habilidades }">
            						<li>${skill}</li>
						          </c:forEach>
								</ul>
							</div>
							
							<div class="apply-job-detail">
								<h5>Idiomas</h5>
								<ul class="language">
									<li><img class="flag" src="assets/img/gb.svg" alt="">Ingles</li>
									<li><img class="flag" src="assets/img/gb.svg" alt="">Español</li>
								</ul>
							</div>
							
							<a href="javascript:void(0)" data-toggle="modal" data-target="#apply" class="btn btn-success">Enviar Mensaje</a>
						</div>
						
						<!-- Similar Jobs -->
						<div class="container-detail-box">
						
							<div class="row">
								<div class="col-md-12">
									<h4>Experiencia Laboral</h4>
								</div>
							</div>
							
							<br>
							<div class="row">
								
								<!-- Single Review -->
								<div class="review-list">
								<div class="review-thumb">
										<img src="assets/img/com-2.jpg" class="img-responsive img-circle" alt="" />
									</div>
									<div class="review-detail">
										<h4><span>${ postulante.nombreUsuario.getAniosExperiencia() } años</span></h4>
										<span class="re-designation">${nombrePuesto}</span>
										<p>${ postulante.nombreUsuario.getExperienciaLaboral() }</p>
									</div>
								</div>
								
							</div>
							
						</div>
					</div>
					
					<!-- Sidebar Start-->
					<div class="col-md-4 col-sm-4">
						
						<!-- Make An Offer -->
					<form method="POST" action="${pageContext.request.contextPath}/lista-candidatos">					
						<div class="sidebar-container">
							<div class="sidebar-box">
								<div class="sidebar-inner-box">
									<h4>Mensaje de Postulación</h4>
									<br>
									<span class="desination">${ postulante.mensaje }</span>
									<br>
								</div>
							</div>
							  <input type="hidden" name="id" value="${ postulante.id}">
							   <c:set var="estado" value="${postulante != null ? postulante.estado.nombre : ''}" />
			                    <div class="col col-lg-6">
			                        <select name="estado" id="estado" class="form-control">
			                            <option value="pendiente" ${estado == 'pendiente' ? 'selected' : ''}>Pendiente</option>
			                            <option value="rechazado" ${estado == 'rechazado' ? 'selected' : ''}>Rechazado</option>
			                            <option value="enviado" ${estado == 'enviado' ? 'selected' : ''}>Enviado</option>
			                            <option value="finalista" ${estado == 'finalista' ? 'selected' : ''}>Finalista</option>
			                        </select>
			                    </div>
			                    <div class="col col-lg-6">
			                        <button type="submit" class="btn btn-primary">Cambiar estado</button>
			                    </div>
							
						</div>
						</form>
						
						<!-- Website & Portfolio -->
						<div class="sidebar-wrapper">
							<div class="sidebar-box-header bb-1">
								<h4>Website & Portfolio</h4>
							</div>
						
							<ul class="block-list">
								<li><i class="fa fa-globe cl-success"></i>www.mysite.com</li>
								<li><i class="fa fa-briefcase cl-success"></i>Portfolio</li>
								<li><i class="fa fa-pencil cl-success"></i>My Blog</li>
							</ul>
						</div>
						
										
					</div>
					<!-- End Sidebar -->
					
					<!-- Footer Modal -->
					<div class="modal fade" id="apply" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-body">
									<div class="tab" role="tabpanel">
									<!-- Nav tabs -->
									
									<!-- Tab panes -->
									<div class="tab-content" id="myModalLabel3">
										<div role="tabpanel" class="tab-pane fade in active" id="postula">
										<img src="${pageContext.request.contextPath}/views/Template/assets/img/logo.png" class="img-responsive" alt="" />
											<form class="form-inline" action="${pageContext.request.contextPath}/lista-candidatos" method="get">
												<div class="col-sm-12">
													<div class="form-group">
													  	<input type="hidden" name="postulante" value="${ postulante.getId() }">
														
														<textarea class="form-control" name="mensaje" placeholder="Mensaje" required=""></textarea>
														
														<div class="center">
															<button type="submit" id="subscribe" class="submit-btn">Enviar </button>
														</div>
													</div>
												</div>
											</form>
										</div>
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>   
							
				</div>
			</section>
			<!-- Freelancer Detail End -->
			
			<!-- Footer Section Start -->
			<footer class="footer">
				<div class="row lg-menu">
					<div class="container">
						<div class="col-md-4 col-sm-4">
							<img src="${pageContext.request.contextPath}/views/Template/assets/img/footer-logo.png" class="img-responsive" alt="" /> 
						</div>
				
					</div>
				</div>
				
			</footer>
			<div class="clearfix"></div>
			<!-- Footer Section End -->
			
			<div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<div class="tab" role="tabpanel">
							<!-- Nav tabs -->
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#login" role="tab" data-toggle="tab">Iniciar Sesion</a></li>
								<li role="presentation"><a href="#register" role="tab" data-toggle="tab">Registrate</a></li>
							</ul>
							<!-- Tab panes -->
							<div class="tab-content" id="myModalLabel2">
								<div role="tabpanel" class="tab-pane fade in active" id="login">
									<img src="${pageContext.request.contextPath}/views/Template/assets/img/logo.png" class="img-responsive" alt="" />
									<div class="subscribe wow fadeInUp">
										<form class="form-inline" action="${pageContext.request.contextPath}/LoginServlet" method="post">
											<div class="col-sm-12">
												<div class="form-group">
													<input type="email"  name="correo" class="form-control" placeholder="Correo" required="">
													<input type="password" name="password" class="form-control"  placeholder="Contraseña" required="">
													<div class="center">
													<button type="submit" id="login-btn" class="submit-btn"> Login </button>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>

								<div role="tabpanel" class="tab-pane fade" id="register">
								<img src="${pageContext.request.contextPath}/views/Template/assets/img/logo.png" class="img-responsive" alt="" />
									<form class="form-inline" action="${pageContext.request.contextPath}/DisplayUsers" method="post">
											<div class="col-sm-12">
												<div class="form-group">
													<input type="text"  name="nombre" class="form-control" placeholder="Nombre" required="">
													<input type="email" name="email" class="form-control" placeholder="Correo Electronico" required="">
													<input type="text"  name="telefono" class="form-control" placeholder="Telefono" required="">
													<input type="text"  name="direccion" class="form-control" placeholder="Direccion" required="">
													<input type="password" name="password" class="form-control"  placeholder="Contraseña" required="">
													<div class="center">
													<button type="submit" id="subscribe" class="submit-btn"> Crear Cuenta </button>
													</div>
												</div>
											</div>
										</form>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>   
			<!-- End Sign Up Window -->
			<button class="w3-button w3-teal w3-xlarge w3-right" onclick="openRightMenu()"><i class="spin fa fa-cog" aria-hidden="true"></i></button>
			<div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-right" style="display:none;right:0;" id="rightMenu">
				<button onclick="closeRightMenu()" class="w3-bar-item w3-button w3-large">Close &times;</button>
				<ul id="styleOptions" title="switch styling">
					<li>
						<a href="javascript: void(0)" class="cl-box blue" data-theme="colors/blue-style"></a>
					</li>
					<li>
						<a href="javascript: void(0)" class="cl-box red" data-theme="colors/red-style"></a>
					</li>
					<li>
						<a href="javascript: void(0)" class="cl-box purple" data-theme="colors/purple-style"></a>
					</li>
					<li>
						<a href="javascript: void(0)" class="cl-box green" data-theme="colors/green-style"></a>
					</li>
					<li>
						<a href="javascript: void(0)" class="cl-box dark-red" data-theme="colors/dark-red-style"></a>
					</li>
					<li>
						<a href="javascript: void(0)" class="cl-box orange" data-theme="colors/orange-style"></a>
					</li>
					<li>
						<a href="javascript: void(0)" class="cl-box sea-blue" data-theme="colors/sea-blue-style "></a>
					</li>
					<li>
						<a href="javascript: void(0)" class="cl-box pink" data-theme="colors/pink-style"></a>
					</li>
				</ul>
			</div>
			
			<!-- Scripts
			================================================== -->
			<script type="text/javascript" src="assets/plugins/js/jquery.min.js"></script>
			<script type="text/javascript" src="assets/plugins/js/viewportchecker.js"></script>
			<script type="text/javascript" src="assets/plugins/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="assets/plugins/js/bootsnav.js"></script>
			<script type="text/javascript" src="assets/plugins/js/select2.min.js"></script>
			<script type="text/javascript" src="assets/plugins/js/wysihtml5-0.3.0.js"></script>
			<script type="text/javascript" src="assets/plugins/js/bootstrap-wysihtml5.js"></script>
			<script type="text/javascript" src="assets/plugins/js/datedropper.min.js"></script>
			<script type="text/javascript" src="assets/plugins/js/dropzone.js"></script>
			<script type="text/javascript" src="assets/plugins/js/loader.js"></script>
			<script type="text/javascript" src="assets/plugins/js/owl.carousel.min.js"></script>
			<script type="text/javascript" src="assets/plugins/js/slick.min.js"></script>
			<script type="text/javascript" src="assets/plugins/js/gmap3.min.js"></script>
			<script type="text/javascript" src="assets/plugins/js/jquery.easy-autocomplete.min.js"></script>
			
			<!-- Custom Js -->
			<script src="assets/js/custom.js"></script>
			<script src="assets/js/jQuery.style.switcher.js"></script>
			<script type="text/javascript">
				$(document).ready(function() {
					$('#styleOptions').styleSwitcher();
				});
			</script>
			<script>
				function openRightMenu() {
					document.getElementById("rightMenu").style.display = "block";
				}

				function closeRightMenu() {
					document.getElementById("rightMenu").style.display = "none";
				}
			</script>
		</div>
	</body>

<!-- premium-candidate-detail41:52-->
</html>