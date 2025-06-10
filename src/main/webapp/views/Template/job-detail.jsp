<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<!-- job-detail41:26-->
<head>
	<!-- Basic Page Needs
	================================================== -->
	<title>PostulaYa</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
	================================================== -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/views/Template/assets/plugins/css/plugins.css">
    
    <!-- Custom style -->
    <link href="${pageContext.request.contextPath}/views/Template/assets/css/style.css" rel="stylesheet">
	<link type="text/css" rel="stylesheet" id="jssDefault" href="${pageContext.request.contextPath}/views/Template/assets/css/colors/green-style.css">
    
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
						<a class="navbar-brand" href="${pageContext.request.contextPath}/puestos-trabajo">
							<img src="${pageContext.request.contextPath}/views/Template/assets/img/logo.png" class="logo logo-scrolled" alt="">
						</a>
					</div>

						
					<div class="collapse navbar-collapse" id="navbar-menu">
						<ul class="nav navbar-nav navbar-left" data-in="fadeInDown" data-out="fadeOutUp">							
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
						<ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
	               		  <c:choose>
				            <c:when test="${empty sessionScope.nombreUsuario}">
								<li class="left-br"><a href="javascript:void(0)" data-toggle="modal" data-target="#signup" class="signin">Registrate ahora</a></li>
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
	            </div>
				</div>   
			</nav>
			<!-- End Navigation -->
			<div class="clearfix"></div>
			
			<!-- Title Header Start -->
			<section class="inner-header-title" style="background-image:url(${pageContext.request.contextPath}/views/Template/assets/img/banner-10.jpg);">
				<div class="container">
					<h1>Detalles del Trabajo</h1>
				</div>
			</section>
			<div class="clearfix"></div>
			<!-- Title Header End -->
			
			<!-- Job Detail Start -->
			<section class="detail-desc">
				<div class="container white-shadow">
				
					<div class="row">
					
						<div class="detail-pic">
							<img src="${pageContext.request.contextPath}/views/Template/assets/img/com-${ detalleTrabajo.getId() }.jpg" class="img" alt="" />
							<a href="#" class="detail-edit" title="edit" ><i class="fa fa-pencil"></i></a>
						</div>
						
						<div class="detail-status">
							<span>Hace 2 días</span>
						</div>
						
					</div>
					
					<div class="row bottom-mrg">
						<div class="col-md-8 col-sm-8">
							<div class="detail-desc-caption">
								<h4>${ empresa.getNombreEmpresa() }</h4>
								<span class="designation">${ detalleTrabajo.getNombrePuesto() }</span>
								<p>${ detalleTrabajo.getDescripcion() }</p>
								<ul>
									<li><i class="fa fa-briefcase"></i><span>${ detalleTrabajo.getTipoTrabajo()}</span></li>
									<li><i class="fa fa-flask"></i><span>3 Year Experience</span></li>
								</ul>
							</div>
						</div>
						
						<div class="col-md-4 col-sm-4">
							<div class="get-touch">
								<h4>Ponerse en contacto</h4>
								<ul>
									<li><i class="fa fa-map-marker"></i><span>${empresa.getNombreEmpresa() }</span></li>
									<li><i class="fa fa-envelope"></i><span>${ empresa.getCorreoElectronico() }</span></li>
									<li><i class="fa fa-phone"></i><span>${ empresa.getTelefono() }</span></li>
									<li><i class="fa fa-money"></i><span>${ detalleTrabajo.getSalario() } /Mensual</span></li>
								</ul>
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
							
							<div class="col-md-7 col-sm-7">
								<div class="detail-pannel-footer-btn pull-right">
									<a href="javascript:void(0)" data-toggle="modal" data-target="#apply" class="footer-btn grn-btn apply"> Aplicar Trabajo</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Job Detail End -->

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
									<form class="form-inline" action="${pageContext.request.contextPath}/PostulanteServlet" method="post">
										<div class="col-sm-12">
											<div class="form-group">
											  	<input type="hidden" name="puestoTrabajoId" value="${ detalleTrabajo.getId() }">
												
												<input type="text" name="salario" class="form-control" placeholder="Salario" required="">
												<textarea class="form-control" name="mensaje" placeholder="Mensaje" required=""></textarea>
												
												<div class="center">
													<button type="submit" id="subscribe" class="submit-btn">Postular </button>
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
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/jquery.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/viewportchecker.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/bootsnav.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/select2.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/wysihtml5-0.3.0.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/bootstrap-wysihtml5.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/datedropper.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/dropzone.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/loader.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/owl.carousel.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/slick.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/gmap3.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/views/Template/assets/plugins/js/jquery.easy-autocomplete.min.js"></script>
			
			<!-- Custom Js -->
			<script src="${pageContext.request.contextPath}/views/Template/assets/js/custom.js"></script>
			<script src="${pageContext.request.contextPath}/views/Template/assets/js/jQuery.style.switcher.js"></script>
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

<!-- job-detail41:26-->
</html>