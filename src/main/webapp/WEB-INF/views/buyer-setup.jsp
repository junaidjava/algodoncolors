<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Add Buyer - Algodon</title>
<%@ include file = "header.jsp" %>

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
                        <li> <a href="${contextPath}/employee-list" class="waves-effect"><span> Employee Setup </span></a></li>
                        <li> <a href="${contextPath}/buyer-list" class="waves-effect"><span> Buyer Setup </span></a></li>
                        <li> <a href="${contextPath}/supplier-list" class="waves-effect"><span> Supplier Setup </span></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="content-page">
            <div class="content">
                <div class="">
                    <div class="page-header-title">
                        <h4 class="page-title">Buyer Info</h4></div>
                </div>
                <div class="page-content-wrapper ">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel-primary panel">
                                    <div class="panel-body">
                                    	<form action="${contextPath}/buyer-setup" class="horizontal-form" method="post">
											<div class="form-body">
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Buyer Name</label>
															<input class="form-control" placeholder="Full Name" type="text">
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Start Date</label>
															<div class="input-group">
                                                           		<input type="text" class="form-control" placeholder="mm/dd/yyyy" id="datepicker"> 
                                                           		<span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar"></i></span>
                                                           	</div>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">City/Country</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Office Address</label>
															<textarea id="textarea" class="form-control" maxlength="512" rows="3" placeholder="This textarea has a limit of 512 chars."></textarea>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Email</label>
															<input class="form-control" placeholder="abcd@gmail.com" type="text">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Phone#</label>
															<input class="form-control" type="text">
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Contact Person</label>
															<input class="form-control" placeholder="Full Name" type="text">
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
											</div>
											<div class="form-actions">
												<div class="row">
													<div class="col-md-12 text-right">
														<button type="submit" class="btn btn-primary">Save</button>
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
		<%@ include file = "footer.jsp" %>