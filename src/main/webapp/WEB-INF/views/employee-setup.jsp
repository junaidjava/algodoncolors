<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Employee Setup - Algodon</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="Admin Dashboard" name="description" />
    <meta content="ThemeDesign" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="${contextPath}/resources/assets/images/favicon.png">
    <link href="${contextPath}/resources/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
    <link href="${contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/assets/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
    <div id="wrapper">
        <div class="topbar">
            <div class="topbar-left">
                <div class="text-center"> <a href="${contextPath}/welcome" class="logo">Algodon</a> <a href="${contextPath}/welcome" class="logo-sm"><span>A</span></a></div>
            </div>
            <div class="navbar navbar-default" role="navigation">
                <div class="container">
                    <div class="">
                        <div class="pull-left">
                            <button type="button" class="button-menu-mobile open-left waves-effect waves-light"> <i class="ion-navicon"></i> </button> <span class="clearfix"></span></div>
                        <ul class="nav navbar-nav navbar-right pull-right">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true"> <img src="${contextPath}/resources/assets/images/users/avatar-1.jpg" alt="user-img" class="img-circle"> <span class="profile-username"> Kenny Rigdon </span> </a>
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
                        <li> <a href="${contextPath}/employee-setup" class="waves-effect"><span> Employee Setup </span></a></li>
                        <li> <a href="${contextPath}/buyer-setup" class="waves-effect"><span> Buyer Setup </span></a></li>
                        <li> <a href="${contextPath}/supplier-setup" class="waves-effect"><span> Supplier Setup </span></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="content-page">
            <div class="content">
                <div class="">
                    <div class="page-header-title">
                        <h4 class="page-title">Employee Setup</h4></div>
                </div>
                <div class="page-content-wrapper ">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel-primary panel">
                                    <div class="panel-body">
                                    	<form action="#" class="horizontal-form">
											<div class="form-body">
												<div class="row">
													<div class="col-md-10">
														<div class="row">
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">ID</label>
																	<input class="form-control" placeholder="ID Number" type="text">
																</div>
															</div>
															<!--/span-->
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">Card#</label>
																	<input class="form-control" placeholder="" type="text">
																</div>
															</div>
															<!--/span-->
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">Gender</label>
																	<input class="form-control" placeholder="" type="text">
																</div>
															</div>
															<!--/span-->
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">Nationality</label>
																	<input class="form-control" placeholder="" type="text">
																</div>
															</div>
															<!--/span-->
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">Name</label>
																	<input class="form-control" placeholder="Full Name" type="text">
																</div>
															</div>
															<!--/span-->
															<div class="col-md-6">
																<div class="form-group">
																	<label class="control-label">Date of Birth</label>
																	<div class="input-group">
		                                                           		<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker"> 
		                                                           		<span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar"></i></span>
		                                                           	</div>
																</div>
															</div>
															<!--/span-->
														</div>
													</div>
													<div class="col-md-2 text-right">
														<img src="${contextPath}/resources/assets/images/users/avatar-1.jpg" width="160" />
													</div>
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label class="control-label">S / D / W</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<!--/span-->
													<div class="col-md-7">
														<div class="form-group">
															<label class="control-label">Address</label>
															<textarea id="textarea" class="form-control" maxlength="225" rows="3" placeholder="This textarea has a limit of 225 chars."></textarea>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">Email</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">CNIC#</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<!--/span-->
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">Marital Status</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<!--/span-->
												</div>
												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">Qualification</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<!--/span-->
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">Reference</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<!--/span-->
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">Religion</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">Department</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label class="control-label">Joining Date</label>
															<input class="form-control" type="text">
														</div>
													</div>
												</div>
												<!--/row-->
											</div>
											<div class="form-actions">
												<div class="row">
													<div class="col-md-12 text-right">
														<button type="submit" class="btn btn-primary">Save</button>
														<button type="button" class="btn btn-default">Find</button>
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
            <footer class="footer"> &copy; 2017 Algodon - All Rights Reserved. </footer>
        </div>
    </div>
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
    <script src="${contextPath}/resources/assets/plugins/timepicker/bootstrap-timepicker.js"></script>
    <script src="${contextPath}/resources/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
    <script src="${contextPath}/resources/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <script src="${contextPath}/resources/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/assets/plugins/bootstrap-touchspin/js/jquery.bootstrap-touchspin.min.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/assets/pages/form-advanced.js"></script>
    <script src="${contextPath}/resources/assets/js/app.js"></script>
</body>

</html>