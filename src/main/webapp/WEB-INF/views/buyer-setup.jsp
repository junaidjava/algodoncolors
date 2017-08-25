<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>Add Buyer - Algodon</title>
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
						<li><a href="${contextPath}/order-list" class="waves-effect"><span> Orders </span></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="content-page">
            <div class="content">
                <div class="">
                    <div class="page-header-title">
                        <h4 class="page-title">Add Buyer</h4></div>
                </div>
                <div class="page-content-wrapper ">
                    <div class="container">
                        <div class="row">
                        <div class="row">
                        	<div class="col-sm-12">
						        <form id="logoutForm" method="POST" action="${contextPath}/logout">
						            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						        </form>
                            </div>
                        
                            <div class="col-lg-12">
                                <div class="panel-primary panel">
                                    <div class="panel-body">
                                    	<form:form action="${contextPath}/buyer-setup" modelAttribute="buyerForm" class="horizontal-form" method="post">
											<form:input path="id" type="hidden" ></form:input>
											<div class="form-body">
												<div class="row">
													<div class="col-md-6">
												        <spring:bind path="name">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">Buyer Name</label>
											                <form:input type="text" path="name" class="form-control" placeholder="Full Name" maxlength="255"></form:input>
											                <form:errors path="name"></form:errors>
														</div>
				        								</spring:bind>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Start Date<span class="required" aria-required="true"> * </span></label>
															<div class="input-group">
																<form:input path="createdOn" class="form-control" placeholder="mm/dd/yyyy" type="date" ></form:input>
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
															<form:input path="city" class="form-control" maxlength="255" placeholder="Karachi, Pakistan" type="text"></form:input>
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Office Address</label>
															<form:input path="address" class="form-control" maxlength="512" rows="3" placeholder="This textarea has a limit of 512 chars." type="textarea"></form:input>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
												        <spring:bind path="email">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">Email</label>
											                <form:input type="text" path="email" class="form-control" placeholder="myname@algodon.com" maxlength="255"></form:input>
											                <form:errors path="email"></form:errors>
														</div>
				        								</spring:bind>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Phone#</label>
											                <form:input type="text" path="phone" class="form-control" placeholder="+922134966532" maxlength="20"></form:input>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-md-6">
												        <spring:bind path="contactPerson">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">Contact Person</label>
											                <form:input type="text" path="contactPerson" class="form-control" placeholder="Representative" maxlength="255"></form:input>
											                <form:errors path="contactPerson"></form:errors>
														</div>
				        								</spring:bind>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-check">
															<label class="form-check-label">
													            <form:checkbox path="active" class="form-check-input" value="${active}" label="Active"></form:checkbox>
													        </label>
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
										</form:form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
		<%@ include file = "footer.jsp" %>
    	<script src="${contextPath}/resources/assets/pages/form-advanced.js"></script>
    	<script>
    	$("#createdOn").datepicker();
    	</script>