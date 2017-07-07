<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="Admin Dashboard" name="description" />
    <meta content="ThemeDesign" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title>Welcome</title>
    
    <link href="${contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/assets/css/style.css" rel="stylesheet" type="text/css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
	    <div id="wrapper">
	        <div class="topbar">
	            <div class="topbar-left">
	                <div class="text-center"> <a href="index.html" class="logo">Algodon</a> <a href="index.html" class="logo-sm"><span>A</span></a></div>
	            </div>
	            <div class="navbar navbar-default" role="navigation">
	                <div class="container">
	                    <div class="">
	                        <div class="pull-left">
	                            <button type="button" class="button-menu-mobile open-left waves-effect waves-light"> <i class="ion-navicon"></i> </button> <span class="clearfix"></span></div>
	                        <ul class="nav navbar-nav navbar-right pull-right">
	                            <li class="dropdown">
	                                <a href="#" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true"> <img src="${contextPath}/resources/assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> <span class="profile-username"> Kenny Rigdon <br/> <small>Developer</small> </span> </a>
	                                <ul class="dropdown-menu">
	                                    <li><a href="javascript:void(0)"> Profile</a></li>
	                                    <li><a href="javascript:void(0)"><span class="badge badge-success pull-right">5</span> Settings </a></li>
	                                    <li class="divider"></li>
	                                    <li><a onclick="document.forms['logoutForm'].submit()">Logout</a></li>
	                                </ul>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div class="left side-menu">
	            <div class="sidebar-inner slimscrollleft">
	                <div class="user-details">
	                    <div class="text-center"> <img src="${contextPath}/resources/assets/images/users/avatar-1.jpg" alt="" class="img-circle"></div>
	                    <div class="user-info">
	                        <div class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Kenny Rigdon</a>
	                            <ul class="dropdown-menu">
	                                <li><a href="javascript:void(0)"> Profile</a></li>
	                                <li><a href="javascript:void(0)"> Settings</a></li>
	                                <li class="divider"></li>
	                                <li><a onclick="document.forms['logoutForm'].submit()">Logout</a></li>
	                            </ul>
	                        </div>
	                        <p class="text-muted m-0"><i class="fa fa-dot-circle-o text-success"></i> Online</p>
	                    </div>
	                </div>
	                <div id="sidebar-menu">
	                    <ul>
                        <li> <a href="employee-setup.html" class="waves-effect"><span> Employee Setup </span></a></li>
                        <li> <a href="employee-setup.html" class="waves-effect"><span> Buyer/Supplier Setup </span></a></li>
	                    </ul>
	                </div>
	                <div class="clearfix"></div>
	            </div>
	        </div>
	        <div class="content-page">
	            <div class="content">
	                <div class="">
	                    <div class="page-header-title">
	                        <h4 class="page-title">Welcome ${pageContext.request.userPrincipal.name}</h4></div>
	                </div>
	                <div class="page-content-wrapper ">
	                    <div class="container">
	                        <div class="row">
	                            <div class="col-sm-12">
							        <form id="logoutForm" method="POST" action="${contextPath}/logout">
							            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							        </form>
	                                <div class="panel panel-primary">
	                                    <div class="panel-body">
	                                        <h4 class="m-t-0"><h2>Welcome ${pageContext.request.userPrincipal.name}</h2></h4>
	                                        <div style="height: 300px"></div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <footer class="footer"> &copy; 2017 algodon - All Rights Reserved. </footer>
	        </div>
	    </div>
    </c:if>
	<script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
    <script src="${contextPath}/resources/assets/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/assets/js/modernizr.min.js"></script>
    <script src="${contextPath}/resources/assets/js/detect.js"></script>
    <script src="${contextPath}/resources/assets/js/fastclick.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.slimscroll.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.blockUI.js"></script>
    <script src="${contextPath}/resources/assets/js/waves.js"></script>
    <script src="${contextPath}/resources/assets/js/wow.min.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.nicescroll.js"></script>
    <script src="${contextPath}/resources/assets/js/jquery.scrollTo.min.js"></script>
    <script src="${contextPath}/resources/assets/js/app.js"></script>
</body>
</html>
