<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript">
	 var sizeColumns = [];
	 var categoryRows = [];
	 
	 function updateTable() {
		 var table = $('#sizeinput');
		 var tableRows = $('#sizeinput tr');

		 var tableColumnRow = $('#sizeinput tr:first');
		 var tableRows = $('#sizeinput tr');
		 var tableColumns = $(tableColumnRow).find('td');
		 var selectedSizes = $('#size').val();
		 var selectedCategories = $('#category').val();

		 sizeColumns.forEach(function(sizeColumn) {
		 	 var index = selectedSizes.indexOf(sizeColumn);
			 if(index < 0) {
				$('.'+sizeColumn).remove();
				sizeColumns.splice(index, 1);
			 }
		 });

		 if(selectedSizes) {
			 selectedSizes.forEach(function(selectedSize) {
				 if(sizeColumns.indexOf(selectedSize) < 0) {
				 	tableColumnRow.append('<td class='+selectedSize+'>'+selectedSize+'</td>');
				 	sizeColumns.push(selectedSize);				 	
				 	tableRows.each(function(index) {
				 		if(index > 0) {
				 			var tds = $(this).find('td');
				 			$(this).append('<td class="'+selectedSize+' '+$(tds[0]).text()+'"><input type="text" class="'+selectedSize+'_'+$(tds[0]).text()+'"/></td>');
				 		}
				 	});
				 }
			 });
		 }
		 
		 categoryRows.forEach(function(categoryRow) {
		 	 var index = selectedCategories.indexOf(categoryRow);
			 if(index < 0) {
				$('.'+categoryRow).remove();
				categoryRows.splice(index, 1);
			 }
		 });

		 if(selectedCategories) {
			 selectedCategories.forEach(function(selectedCategory) {
				 if(categoryRows.indexOf(selectedCategory) < 0) {
					table.append('<tr class='+selectedCategory+'><td>'+selectedCategory+'</td></tr>');
					categoryRows.push(selectedCategory);
					var row = $('.'+selectedCategory)
					tableColumns.each(function(index) {
				 		if(index > 0) {
				 			row.append('<td class="'+selectedCategory+' '+$(this).text()+'"><input type="text" class="'+$(this).text()+'_'+selectedCategory+'"/></td>');
				 		}
				 	});
				 }
			 });		 
		 }
	 }
	</script>
    <title>Order Entry - Algodon</title>
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
            <div class="content">
                <div class="">
                    <div class="page-header-title">
                        <h4 class="page-title">Order Entry</h4></div>
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
                                    	<form:form action="${contextPath}/order-entry" class="horizontal-form">
											<div class="form-body">
												<div class="row">
													<div class="col-md-6">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">Size</label>
															<select id="size" multiple onchange="updateTable();">
															  	<option>Small</option>
															  	<option>Medium</option>
															  	<option>Large</option>
															</select>
														</div>
													</div>
													<!--/span-->
													<div class="col-md-6">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<label class="control-label">Category</label>
															<select id="category" multiple onchange="updateTable();">
															  	<option>Sleeves</option>
															  	<option>Chest</option>
															  	<option>Collar</option>
															</select>
														</div>
													</div>
													<!--/span-->
												</div>
												<!--/row-->
												<div class="row">
													<div class="col-sm-12">
												  		<table id="sizeinput" class="table table-striped table-bordered dataTable no-footer">
												  		<tr><td/></tr>
												  		</table>
										  			</div>
										  		</div>
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