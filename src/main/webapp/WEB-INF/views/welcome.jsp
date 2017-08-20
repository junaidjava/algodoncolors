<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Welcome to Algodon</title>
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
                        <li> <a href="${contextPath}/order-entry" class="waves-effect"><span> Order Entry </span></a></li>
	                    </ul>
	                </div>
	                <div class="clearfix"></div>
	            </div>
	        </div>
	        
    		<div class="content-page">
	    		<c:if test="${pageContext.request.userPrincipal.name != null}">
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
	    		</c:if>
<%@ include file = "footer.jsp" %>