<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Employees List - Algodon</title>
    
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
                        <li> <a href="#" class="waves-effect"><span> Employee Setup </span></a></li>
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
                        <h4 class="page-title">Employees List</h4></div>
                </div>
                <div class="page-content-wrapper ">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel-primary panel">
									<div class="panel-body">
										<div class="row m-b-15">
											<div class="col-sm-12 text-right">
												<a href="${contextPath}/employee-setup" class="btn btn-success">Add Employee</a>
											</div>
										</div>
										
										<div class="row">
											<div class="col-sm-12">
										  		<table id="datatable" class="table table-striped table-bordered dataTable no-footer">
										    		<thead>
										      			<tr>
										        			<th>Username</th>
										        			<th>First Name</th>
										        			<th>Last Name</th>
										        			<th>Email</th>
										        			<th>Status</th>
										     			 </tr>
										    		</thead>
										    		<tbody>
										    		<c:forEach items="${userList}" var="user">
										      			<tr>
										        			<td><a href="${contextPath}/edit-user?uid=${user.id}">${user.username}</a></td>
										        			<td>${user.firstName}</td>
										        			<td>${user.lastName}</td>
										        			<td>${user.email}</td>
										        			<td>${user.active}</td>
										      			</tr>
										      		</c:forEach>
										    		</tbody>
										  		</table>
								  			</div>
								  		</div>
									</div>
								</div>
							</div>
						</div>
					</div>
                </div>
            </div>
		<%@ include file = "footer.jsp" %>
		<script src="${contextPath}/resources/assets/pages/datatables.init.js"></script>
