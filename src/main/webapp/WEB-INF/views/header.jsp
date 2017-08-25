
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta content="Admin Dashboard" name="description" />
    <meta content="ThemeDesign" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="${contextPath}/resources/assets/images/favicon.png">
    
    <link href="${contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/assets/css/icons.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/resources/assets/css/style.css" rel="stylesheet" type="text/css">
    
    <link href="${contextPath}/resources/assets/plugins/timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
    <link href="${contextPath}/resources/assets/plugins/bootstrap-touchspin/css/jquery.bootstrap-touchspin.min.css" rel="stylesheet" />
    <link href="${contextPath}/resources/assets/plugins/bootstrap-tagsinput/css/bootstrap-tagsinput.css" rel="stylesheet" />
    
    <link href="${contextPath}/resources/assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/resources/assets/plugins/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/resources/assets/plugins/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/resources/assets/plugins/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="${contextPath}/resources/assets/plugins/datatables/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
	                                <a href="#" class="dropdown-toggle profile waves-effect waves-light" data-toggle="dropdown" aria-expanded="true"> <img src="${contextPath}/resources/assets/images/users/${pageContext.request.userPrincipal.name}.jpg" alt="user-img" class="img-circle"> <span class="profile-username"> ${pageContext.request.userPrincipal.name}</span> </a>
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