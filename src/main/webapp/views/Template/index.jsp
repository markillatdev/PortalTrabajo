<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<!-- index-437:50-->
<head>
    <!-- Basic Page Needs==================================================-->
    <title>PostulaYa</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <!-- CSS==================================================-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/Template/assets/plugins/css/plugins.css">
    <link href="${pageContext.request.contextPath}/views/Template/assets/css/style.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" id="jssDefault" href="${pageContext.request.contextPath}/views/Template/assets/css/colors/green-style.css">
</head>

<body>
<div class="Loader"></div>
<div class="wrapper">
    <nav class="navbar navbar-default navbar-fixed navbar-transparent white bootsnav">
        <div class="container">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-menu"><i
                    class="fa fa-bars"></i></button>
            <div class="navbar-header"><a class="navbar-brand" href="${pageContext.request.contextPath}/puestos-trabajo"><img src="${pageContext.request.contextPath}/views/Template/assets/img/logo-white.png"
                                                                                        class="logo logo-display"
                                                                                        alt=""><img
                    src="${pageContext.request.contextPath}/views/Template/assets/img/logo-white.png" class="logo logo-scrolled" alt=""></a></div>
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
    <div class="clearfix"></div>
    <section class="slide-banner scroll-con-sec hero-section" data-scrollax-parent="true" id="sec1">
        <div class="slideshow-container">
            <div class="slideshow-item">
                <div class="bg" data-bg="${pageContext.request.contextPath}/views/Template/assets/img/banner-3.jpg"></div>
            </div>
            <div class="slideshow-item">
                <div class="bg" data-bg="${pageContext.request.contextPath}/views/Template/assets/img/banner-6.jpg"></div>
            </div>
            <div class="slideshow-item">
                <div class="bg" data-bg="${pageContext.request.contextPath}/views/Template/assets/img/banner-5.jpg"></div>
            </div>
            <div class="slideshow-item">
                <div class="bg" data-bg="${pageContext.request.contextPath}/views/Template/assets/img/banner-2.jpg"></div>
            </div>
        </div>
        <div class="overlay"></div>
        <div class="hero-section-wrap fl-wrap">
            <div class="container">
                <div class="intro-item fl-wrap">
                    <div class="caption text-center cl-white">
                        <h2>Descubra más de 1000 trabajos aquí</h2>

                        <p>Explora los mejores trabajos del Perú</p>
                    </div>
                    <form class="form-horizontal" action="${pageContext.request.contextPath}/puestos-trabajo" method="post">
                        <div class="col-md-10 no-padd">
                            <div class="input-group">
                            <input type="text" class="form-control br-1" id="joblist" name="joblist" placeholder="Buscar Trabajo"></div>
                        </div>  
                 
                        <div class="col-md-2 no-padd">
                            <div class="input-group">
                                <button type="submit" class="btn btn-success full-width">Buscar Trabajo</button>
                            </div>
                        </div>	
                    </form>
                </div>
            </div>
        </div>
    </section>
    <div class="clearfix"></div>
   
    <section class="gray-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="main-heading">
                        <p>Encuentra tu trabajo y postula</p>

                        <h2>Lista<span>Trabajos</span></h2>
                    </div>
                </div>
            </div>
           
            <div class="row">
                <div class="col-md-12">
                   <c:forEach var="job" items="${puestosTrabajo}">
                 	<div class="item-click">
                 	   <article>
   							<div class="brows-job-list">
                                <div class="col-md-1 col-sm-2 small-padding">
                                    <div class="brows-job-company-img"><a href="${pageContext.request.contextPath}/detalle-trabajo?trabajoId=${job.id}">
                                    <img src="${pageContext.request.contextPath}/views/Template/assets/img/com-${job.id}.jpg" class="img-responsive" alt=""/></a></div>
                                </div>
                                <div class="col-md-6 col-sm-5">
                                    <div class="brows-job-position">
                                        <a href="${pageContext.request.contextPath}/detalle-trabajo?trabajoId=${job.id}">
                                            <h3>${ job.nombrePuesto }</h3>
                                        </a>
                                        <p><span>${ job.nombrePuesto }</span><span class="brows-job-sallery">
                                        <i class="fa fa-money"></i>${job.salario}</span>
                                        <span class="job-type cl-success bg-trans-success">${job.tipoTrabajo}</span></p>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3">
                                    <div class="brows-job-location">
                                        <p><i class="fa fa-map-marker"></i>${job.empresa.direccion}</p>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <div class="brows-job-link">
                                    	<a href="${pageContext.request.contextPath}/detalle-trabajo?trabajoId=${job.id}" class="btn btn-default">
                                    		Aplicar Trabajo
                                      	</a>
                                     </div>
                                </div>
                            </div>
                 	   </article>
                 	</div>
                 	</c:forEach>
                </div>
            </div>
           
        </div>
    </section>
    
    <div class="clearfix"></div>
    <footer class="footer">
        <div class="row lg-menu">
            <div class="container">
                <div class="col-md-4 col-sm-4"><img src="${pageContext.request.contextPath}/views/Template/assets/img/footer-logo.png" class="img-responsive" alt=""/>
                </div>
            </div>
        </div>
    </footer>
    <div class="clearfix"></div>
    
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
			
    <button class="w3-button w3-teal w3-xlarge w3-right" onclick="openRightMenu()"><i class="spin fa fa-cog"
                                                                                      aria-hidden="true"></i></button>
    <div class="w3-sidebar w3-bar-block w3-card-2 w3-animate-right" style="display:none;right:0;" id="rightMenu">
        <button onclick="closeRightMenu()" class="w3-bar-item w3-button w3-large">Close &times;</button>
        <ul id="styleOptions" title="switch styling">
            <li><a href="javascript: void(0)" class="cl-box blue" data-theme="colors/blue-style"></a></li>
            <li><a href="javascript: void(0)" class="cl-box red" data-theme="colors/red-style"></a></li>
            <li><a href="javascript: void(0)" class="cl-box purple" data-theme="colors/purple-style"></a></li>
            <li><a href="javascript: void(0)" class="cl-box green" data-theme="colors/green-style"></a></li>
            <li><a href="javascript: void(0)" class="cl-box dark-red" data-theme="colors/dark-red-style"></a></li>
            <li><a href="javascript: void(0)" class="cl-box orange" data-theme="colors/orange-style"></a></li>
            <li><a href="javascript: void(0)" class="cl-box sea-blue" data-theme="colors/sea-blue-style "></a></li>
            <li><a href="javascript: void(0)" class="cl-box pink" data-theme="colors/pink-style"></a></li>
        </ul>
    </div>
    <!-- Scripts==================================================-->
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
    <script src="${pageContext.request.contextPath}/views/Template/assets/js/custom.js"></script>
    <script src="${pageContext.request.contextPath}/views/Template/assets/js/jQuery.style.switcher.js"></script>
    <script type="text/javascript">$(document).ready(function () {
        $('#styleOptions').styleSwitcher();
    });</script>
    <script>function openRightMenu() {
        document.getElementById("rightMenu").style.display = "block";
    }
    function closeRightMenu() {
        document.getElementById("rightMenu").style.display = "none";
    }</script>
</div>
</body>
<!-- index-440:42-->
</html>