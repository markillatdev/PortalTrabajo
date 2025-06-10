<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">

<!-- manage-candidate41:40-->
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
	
	<style>
	
		.manage-cndt {
		  position: relative;
		}
		
		.cndt-status-select {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		}
		
		.cndt-status {
		  display: inline-block;
		  padding: 6px 12px;
		  margin: 0;
		  font-size: 14px;
		  font-weight: 600;
		  line-height: 1;
		  text-align: center;
		  white-space: nowrap;
		  vertical-align: baseline;
		  border-radius: 3px;
		  text-transform: uppercase;
		}
		
		.cndt-status.pending {
		  color: #ffffff;
		  background-color: #f0ad4e;
		}
		
		.cndt-status.rejected {
		  color: #ffffff;
		  background-color: #d9534f;
		}
		
		.cndt-status.approved {
		  color: #ffffff;
		  background-color: #5cb85c;
		}
		
		.finalied {
		  color: #ffffff;
		  background-color: #1ca39e;
		}
		
		.mensaje-container {
		  position: relative;
		}
		
		.mensaje {
		  font-size: 16px;
		  line-height: 1.2;
		  overflow: hidden;
		  max-height: 60px;
		}
		
		.leer-mas {
		  position: absolute;
		  bottom: 0;
		  right: 0;
		  background-color: transparent;
		  border: none;
		  cursor: pointer;
		  font-size: 14px;
		}
		
		.mensaje {
		  display: -webkit-box;
		  -webkit-box-orient: vertical;
		  -webkit-line-clamp: 3;
		  overflow: hidden;
		  text-overflow: ellipsis;
		}
		
		 .expandir {
		 	-webkit-line-clamp: unset;
		 	overflow: visible;
		}
	</style>

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
					<h1>Panel Candidatos</h1>
				</div>
			</section>
			<div class="clearfix"></div>
			<!-- Title Header End -->
			
			<!-- Member list start -->
			<section class="member-card gray">
				<div class="container">
				
					<!-- search filter -->
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="search-filter">
							
							<div class="col-md-4 col-sm-5">
								  <form class="form-horizontal" action="${pageContext.request.contextPath}/lista-candidatos" method="get">
									<div class="filter-form">
										<div class="input-group">
											<input type="text" class="form-control" name="value" placeholder="Buscar">
											<span class="input-group-btn">
												<button type="submit" class="btn btn-default">Ir</button>
											</span>
										</div>
									</div>
								</form>
							</div>
								
							</div>
						</div>
					</div>
					<!-- search filter End -->
					
					<div class="row">
				    <c:forEach var="candidato" items="${postulantes}">
				    <div class="col-md-4 col-sm-6">
				    	<div class="paid-candidate-container">
						<div class="paid-candidate-box">
        				<c:set var="nombrePuesto" value="${candidato != null ? candidato.puestoTrabajo.nombrePuesto : ''}" />
       					<c:set var="nombreUsuario" value="${candidato != null ? candidato.nombreUsuario.nombre : ''}" />
					    <c:set var="estado" value="${candidato != null ? candidato.estado.nombre : ''}" />
					    <c:set var="colorEstado">
						 	<c:choose>
				                <c:when test="${estado == 'pendiente'}">
				                    pending
				                </c:when>
				                <c:when test="${estado == 'enviado'}">
				                    available
				                </c:when>
				                <c:when test="${estado == 'rechazado'}">
				                    rejected
				                </c:when>
				                <c:when test="${estado == 'finalista'}">
				                    finalied
				                </c:when>
				                <c:otherwise>
				                    rejected
				                </c:otherwise>
				            </c:choose>
				        </c:set>
				        
				        <div class="dropdown">
							<div class="btn-group fl-right">
								<button type="button" class="btn-trans" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<i class="fa fa-gear"></i>
								</button>
								<div class="dropdown-menu pull-right animated flipInX">
									<a href="${pageContext.request.contextPath}/PostulanteServlet?id=${candidato.id}">ver Perfil</a>
								</div>
							</div>
						</div>
				      	
				      	<c:set var="id" value="${candidato.id}" />
				      	<c:set var="mensaje" value="${candidato.mensaje}" />
				        <c:set var="mensajeCorto" value="${fn:length(mensaje) > 25 ? fn:substring(mensaje, 0, 25) : mensaje}" />
				      	
						      <div class="col-md-12 col-sm-4">
					            <form method="POST" action="${pageContext.request.contextPath}/lista-candidatos">
					                <div class="manage-cndt">
					                    <div class="cndt-status ${colorEstado}">${estado}</div>
					                    <div class="cndt-caption">
					                        <div class="cndt-pic">
					                            <img src="${pageContext.request.contextPath}/views/Template/assets/img/client-${id}.jpg" class="img-responsive" alt="" />
					                        </div>
					                        <h4>${nombreUsuario}</h4>
					                        <span>${nombrePuesto}</span>
					                        <div class="mensaje-container">
                            					<p class="mensaje" id="mensaje-candidato-${id}">${mensajeCorto}</p>
					                            <button type="button" class="leer-mas" data-id="${id}" onclick="expandirMensaje(this)"></button>
					                        </div>
					                        <span><i class="fa fa-money"></i> ${candidato.salarioPropuesto}</span>
					                    </div>
					                    
					                    <input type="hidden" name="id" value="${id}">
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
					        </div>
					        </div>
					        </div>
					        </div>
					 	</c:forEach>
					</div>
				</div>
			</section>
			<!-- Member List End -->
			
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
			
			<script>
				function expandirMensaje(btn) {
				  var id = btn.getAttribute("data-id");
				  var mensaje = document.getElementById("mensaje-candidato-" + id);
				  mensaje.classList.toggle("expandir");
				}
			</script>
		</div>
	</body>

<!-- manage-candidate41:40-->
</html>