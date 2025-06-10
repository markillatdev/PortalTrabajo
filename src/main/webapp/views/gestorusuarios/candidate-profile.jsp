<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<!-- candidate-profile41:26-->
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
			<section class="inner-header-title" style="background-image:url(assets/img/banner-10.jpg);">
				<div class="container">
					<h1>Perfil</h1>
				</div>
			</section>
			<div class="clearfix"></div>
			<!-- Title Header End -->
		
		<!-- Candidate Profile Start -->
        <section class="detail-desc advance-detail-pr gray-bg">
            <div class="container white-shadow">
			
                <div class="row">
                    <div class="detail-pic"><img src="assets/img/can-1.png" class="img" alt="" /><a href="#" class="detail-edit" title="edit"><i class="fa fa-pencil"></i></a></div>
                    <div class="detail-status"><span>Active Now</span></div>
                </div>
				
                <div class="row bottom-mrg">
                    <div class="col-md-12 col-sm-12">
                        <div class="advance-detail detail-desc-caption">
                            <h4>${ usuario.nombre }</h4>
                        </div>
                    </div>
                </div>
				
                <div class="row no-padd">
                    <div class="detail pannel-footer">
                        <div class="col-md-5 col-sm-5">
                            <ul class="detail-footer-social">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            </ul>
                        </div>
                  
                    </div>
                </div>
				
            </div>
        </section>
		
        <section class="full-detail-description full-detail gray-bg">
            <div class="container">
                <div class="col-md-12 col-sm-12">
                    <div class="full-card">
                      <div class="deatil-tab-employ tool-tab">
							<ul class="nav simple nav-tabs" id="simple-design-tab">
								 <c:choose>
								    <c:when test="${registro}">
								      <li class="${!registro ? 'active' : ''}"><a href="#about">Acerca de mí</a></li>
								      <li class="${!registro ? 'active' : ''}"><a href="#address">Datos Personales</a></li>
								      <li class="${registro ? 'active' : ''}"><a href="#settings">Editar Perfil</a></li>
								    </c:when>
								    <c:when test="${perfil}">
								      <li class="${perfil ? 'active' : ''}"><a href="#about">Acerca de mí</a></li>
								      <li class="${!perfil ? 'active' : ''}"><a href="#address">Datos Personales</a></li>
								      <li class="${!perfil ? 'active' : ''}"><a href="#settings">Editar Perfil</a></li>
								    </c:when>
								  </c:choose>
							</ul>
							
							<!-- Start All Sec -->
							<div class="tab-content">
								<div id="about" class="tab-pane fade ${ perfil ? 'in active' : '' }">
									<h3>Acerca de mí</h3>
									<p>${ usuario.acercaMi }</p>
									<br>
									<br>
									<h3>Experiencia Laboral</h3>
									<p>${ usuario.experienciaLaboral }</p>
								</div>
								<!-- End About Sec -->
								
								<!-- Start Address Sec -->
								<div id="address" class="tab-pane fade">
									<ul class="job-detail-des">
										<li><span>Dirección:</span>${ usuario.direccion }</li>
										<li><span>Ciudad:</span>${ usuario.ciudad }</li>										
										<li><span>País:</span>${ usuario.pais }</li>
										<li><span>Telefono:</span>${ usuario.telefono }</li>
										<li><span>Email:</span>${ usuario.correoElectronico }</li>
									</ul>
								</div>
								<!-- End Address Sec -->
								
								<!-- Start Settings -->
								<div id="settings" class="tab-pane fade ${ registro ? 'in active' : '' }">
									<div class="row no-mrg">
										<form action="${pageContext.request.contextPath}/ProfileServlet" method="POST">
										
										<input type="text" name="userId" value="${ usuario.id }" hidden>
										
										<div class="edit-pro">
											<div class="col-md-4 col-sm-6">
												<label>Nombre Completo</label>
												<input type="text" name="nombreCompleto" class="form-control" value="${ usuario.nombre }">
											</div>
											<div class="col-md-4 col-sm-6">
												<label>Apellido Completo</label>
												<input type="text" name="apellidoCompleto" class="form-control"value="${ usuario.apellido }">
											</div>
											
											<div class="col-md-4 col-sm-6">
												<label>Email</label>
												<input type="email" name="email" class="form-control"value="${ usuario.correoElectronico }">
											</div>
											<div class="col-md-4 col-sm-6">
												<label>Telefono</label>
												<input type="text" name="telefono" class="form-control"  value="${ usuario.telefono }">
											</div>
											
											<div class="col-md-4 col-sm-6">
												<label>Dirección</label>
												<input type="text" name="direccion" class="form-control" value="${ usuario.direccion }">
											</div>
											
											<div class="col-md-4 col-sm-6">
												<label>Ciudad</label>
												<input type="text" name="ciudad" class="form-control" value="${ usuario.ciudad }">
											</div>
											
											<div class="col-md-4 col-sm-6">
												<label>País</label>
												<input type="text" name="pais" class="form-control" value="${ usuario.pais }">
											</div>
											<div class="col-md-4 col-sm-6">
												<label>Contraseña</label>
												<input type="password" name="password" class="form-control" placeholder="*********">
											</div>
											
											<div class="col-md-4 col-sm-6">
												<label>Años de experiencia</label>
												<input type="text" name="anioExp" class="form-control" value="${ usuario.aniosExperiencia }">
											</div>
										
											<div class="col-md-4 col-sm-6">
												<label>Acerca de mí</label>
												<textarea class="form-control" name="acercaMi"></textarea>
											</div>
											
											
											<div class="col-md-4 col-sm-6">
												<label>Experiencia laboral</label>
												<textarea class="form-control" name="experienciaLaboral"></textarea>
											</div>
											
											<div class="col-md-4 col-sm-6">
											  <label>Habilidades</label>
											  <select class="form-control" name="habilidades" multiple>
											    <option value="PHP">PHP</option>
											    <option value="Java">Java</option>
											    <option value="NodeJs">NodeJs</option>
												<option value="Python">Python</option>
											  </select>
											</div>
											
											
											<!--  <div class="col-md-4 col-sm-6">
												<label>Subir foto de Perfil</label>
												<form action="http://codeminifier.com/upload-target" class="dropzone dz-clickable profile-pic">
													<div class="dz-default dz-message">
														<i class="fa fa-cloud-upload"></i>
														<span>Arrastra los archivos aquí para subirlos</span>
													</div>
												</form>
											</div>
											<div class="col-md-4 col-sm-6">
												<label>Subir CV</label>
												<form action="http://codeminifier.com/upload-target" class="dropzone dz-clickable profile-cover">
													<div class="dz-default dz-message">
														<i class="fa fa-cloud-upload"></i>
														<span>Arrastra los archivos aquí para subirlos</span>
													</div>
												</form>
											</div>-->
											<div class="col-sm-12">
												<button type="submit" class="update-btn">Actualizar Ahora</button>
											</div>
										</div>
										</form>
									</div>
								</div>
								<!-- End Settings -->
							</div>
							<!-- Start All Sec -->
						</div>  
                    </div>
                </div>
            </div>
        </section>
		<!-- Candidate Profile End -->
		
		
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
			
		<!-- Sign Up Window Code -->
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

<!-- candidate-profile41:39-->
</html>