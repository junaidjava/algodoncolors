<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Suppliers List - Algodon</title>
    
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
				<%@ include file = "sidebarMenu.jsp" %>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="content-page">
            <div class="content">
                <div class="">
                    <div class="page-header-title">
                        <h4 class="page-title">Suppliers List</h4></div>
                </div>
                <div class="page-content-wrapper ">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel-primary panel">
									<div class="panel-body">
										<div class="row m-b-15">
											<div class="col-sm-12 text-right">
												<a href="${contextPath}/supplier-setup" class="btn btn-success">Add Supplier</a>
											</div>
										</div>
										
										<div class="row">
											<div class="col-sm-12">
										  		<table id="datatable" class="table table-striped table-bordered dataTable no-footer">
										    		<thead>
										      			<tr>
										        			<th>Supplier Name</th>
										        			<th>Contact Person</th>
										        			<th>Create dOn</th>
										        			<th>Email</th>
										        			<th>Phone</th>
										        			<th>Status</th>
										     			 </tr>
										    		</thead>
										    		<tbody>
										    		<c:forEach items="${supplierList}" var="supplier">
										      			<tr>
										        			<td><a href="${contextPath}/edit-supplier?uid=${supplier.id}">${supplier.name}</a></td>
										        			<td>${supplier.contactPerson}</td>
										        			<td><fmt:formatDate pattern = "MM-dd-yyyy" value = "${supplier.createdOn}" /></td>
										        			<td>${supplier.email}</td>
										        			<td>${supplier.phone}</td>
										        			<td>${supplier.active}</td>
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
