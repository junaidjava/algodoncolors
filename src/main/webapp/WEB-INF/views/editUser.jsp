<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Edit User - Algodon</title>
    
    <div id="wrapper">
		<%@ include file = "header.jsp" %>
        <div class="left side-menu">
            <div class="sidebar-inner slimscrollleft">
                <div class="user-details">
                    <div class="text-center"> <img src="${contextPath}/resources/assets/images/users/${pageContext.request.userPrincipal.name}.jpg" alt="" class="img-circle"></div>
                    <div class="user-info">
                        <div class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">${pageContext.request.userPrincipal.name}</a>
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
                        <h4 class="page-title">Edit User</h4></div>
                </div>
                <div class="page-content-wrapper ">
                    <div class="container">
                        <div class="row">
                        	<div class="col-sm-12">
						        <form id="logoutForm" method="POST" action="${contextPath}/logout">
						            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						        </form>
                            </div>
                        
                            <div class="col-lg-12">
                                <div class="panel-primary panel">
                                    <div class="panel-body">
                                    	<form:form action="${contextPath}/edit-user"  modelAttribute="userForm" class="form-horizontal" method="post">
											<div class="form-body">
												<h3 class="form-section">User Info</h3>
												<div class="row m-b-15">
													<div class="col-md-10">
														<div class="col-md-6">
															<div class="form-group">
																<label class="control-label">First Name</label>
													            <form:input type="text" path="firstName" class="form-control" maxlength="255"></form:input>
															</div>
														</div>
														<!--/span-->
														<div class="col-md-6">
															<div class="form-group">
																<label class="control-label">Last Name</label>
																<form:input type="text" path="lastName" class="form-control" maxlength="255"></form:input>
															</div>
														</div>
														<!--/span-->
														<div class="col-md-6">
															<div class="form-group">
																<form:checkbox path="active" value="${active}" label="Active"></form:checkbox>
															</div>
														</div>
														<!--/span-->
													</div>
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
												        <spring:bind path="username">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">User Name</label>
															<form:input type="text" path="username" class="form-control" readonly="true" maxlength="32"></form:input>
												            <form:errors path="username"></form:errors>
														</div>
				        								</spring:bind>
													</div>
													<div class="col-md-6">
												        <spring:bind path="email">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">Email</label>
															<form:input type="text" path="email" class="form-control" placeholder="myname@algodon.com" maxlength="255"></form:input>
												            <form:errors path="email"></form:errors>
														</div>
				        								</spring:bind>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
												        <spring:bind path="password">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">Password</label>
															<form:input type="password" path="password" class="form-control" readonly="true" maxlength="60"></form:input>
												            <form:errors path="password"></form:errors>
														</div>
				        								</spring:bind>
													</div>
													<div class="col-md-6">
												        <spring:bind path="passwordConfirm">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">Confirm Password</label>
															<form:input type="password" path="passwordConfirm" class="form-control" readonly="true" maxlength="60"></form:input>
												            <form:errors path="passwordConfirm"></form:errors>
														</div>
				        								</spring:bind>
													</div>
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
										</form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

	<%@ include file = "footer.jsp" %>