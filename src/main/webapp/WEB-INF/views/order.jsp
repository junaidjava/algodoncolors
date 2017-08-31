<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
		var selectedSizes = [];
		if($('#measurementSize').val().length > 0) {
			selectedSizes = $('#measurementSize').val().split(',');
		}
		var selectedCategories = [];
		if($('#measurementCategory').val().length > 0) {
			selectedCategories = $('#measurementCategory').val().split(',');
		}

		sizeColumns.forEach(function(sizeColumn) {
			var index = selectedSizes.indexOf(sizeColumn);
			if (index < 0) {
				$('.' + sizeColumn).remove();
				sizeColumns.splice(index, 1);
			}
		});

		if (selectedSizes) {
			selectedSizes.forEach(function(selectedSize) {
				if (sizeColumns.indexOf(selectedSize) < 0) {
					tableColumnRow.append('<td class='+selectedSize+'>'
							+ selectedSize + '</td>');
					sizeColumns.push(selectedSize);
					tableRows.each(function(index) {
						if (index > 0) {
							var tds = $(this).find('td');
							$(this).append(
									'<td class="' + selectedSize + ' '
											+ $(tds[0]).text()
											+ '"><input type="text" class="'
											+ selectedSize + '_'
											+ $(tds[0]).text() + '"/></td>');
						}
					});
				}
			});
		}

		categoryRows.forEach(function(categoryRow) {
			var index = selectedCategories.indexOf(categoryRow);
			if (index < 0) {
				$('.' + categoryRow).remove();
				categoryRows.splice(index, 1);
			}
		});

		if (selectedCategories) {
			selectedCategories.forEach(function(selectedCategory) {
				if (categoryRows.indexOf(selectedCategory) < 0) {
					table.append('<tr class='+selectedCategory+'><td>'
							+ selectedCategory + '</td></tr>');
					categoryRows.push(selectedCategory);
					var row = $('.' + selectedCategory)
					tableColumns.each(function(index) {
						if (index > 0) {
							row.append('<td class="' + selectedCategory + ' '
									+ $(this).text()
									+ '"><input type="text" id="'
									+ $(this).text() + '_' + selectedCategory
									+ '"/></td>');
						}
					});
				}
			});
		}
	}
	
	function submitForm() {
		var sizeData = {};
		sizeData.data = {};
		
		var selectedSizes = [];
		if($('#measurementSize').val().length > 0) {
			selectedSizes = $('#measurementSize').val().split(',');
			sizeData.measurementSize =selectedSizes; 
		}
		var selectedCategories = [];
		if($('#measurementCategory').val().length > 0) {
			selectedCategories = $('#measurementCategory').val().split(',');
			sizeData.measurementCategory =selectedCategories; 
		}

		selectedSizes.forEach(function(selectedSize) {
			selectedCategories.forEach(function(selectedCategory) {
				var inputElement = $('#'+selectedSize+'_'+selectedCategory);
				sizeData.data[selectedSize+'_'+selectedCategory] = inputElement.val();
			});
		});
		
		$('#size').val(escape(JSON.stringify(sizeData)));
		$('#orderForm').submit();	
	}
</script>
<title>Order Entry - Algodon</title>
<%@ include file="header.jsp"%>

<div class="left side-menu">
	<div class="sidebar-inner slimscrollleft">
		<div class="user-details">
			<div class="text-center">
				<img
					src="${contextPath}/resources/assets/images/users/${pageContext.request.userPrincipal.name}.jpg"
					alt="" class="img-circle">
			</div>
			<div class="user-info">
				<div class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false">${pageContext.request.userPrincipal.name}</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:void(0)"> Profile</a></li>
						<li><a href="javascript:void(0)"> Settings</a></li>
						<li class="divider"></li>
						<li><a onclick="document.forms['logoutForm'].submit()">Logout</a></li>
					</ul>
				</div>
				<p class="text-muted m-0">
					<i class="fa fa-dot-circle-o text-success"></i> Online
				</p>
			</div>
		</div>
		<div id="sidebar-menu">
			<ul>
				<li><a href="${contextPath}/employee-list" class="waves-effect"><span>
							Employee Setup </span></a></li>
				<li><a href="${contextPath}/buyer-list" class="waves-effect"><span>
							Buyer Setup </span></a></li>
				<li><a href="${contextPath}/supplier-list" class="waves-effect"><span>
							Supplier Setup </span></a></li>
				<li><a href="${contextPath}/order-list" class="waves-effect"><span>
							Orders </span></a></li>
			</ul>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
<div class="content-page">
	<div class="content">
		<div class="">
			<div class="page-header-title">
				<h4 class="page-title">Order Entry</h4>
			</div>
		</div>
		<div class="page-content-wrapper ">
			<div class="container">
				<div class="row">
					<div class="col-sm-12">
						<form id="logoutForm" method="POST" action="${contextPath}/logout">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>

					<div class="col-lg-12">
						<div class="panel-primary panel">
							<div class="panel-body">
								<form:form id="orderForm" action="${contextPath}/order-entry"
									modelAttribute="order" class="horizontal-form" method="post">
									<form:input path="id" type="hidden"></form:input>
									<div class="form-body">
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="ancNo">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">ANC #</label>
														<form:input type="text" path="ancNo" class="form-control"
															placeholder="ANC #" maxlength="255"></form:input>
														<form:errors path="ancNo"></form:errors>
													</div>
												</spring:bind>
											</div>
											<!--/span-->
											<div class="col-md-6">
												<spring:bind path="orderNo">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Order #</label>
														<form:input type="text" path="orderNo"
															class="form-control" placeholder="Order #"
															maxlength="255"></form:input>
														<form:errors path="orderNo"></form:errors>
													</div>
												</spring:bind>
											</div>
											<!--/span-->
										</div>
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="category">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Category</label>
														<form:select path="category" class="form-control">
															<option <c:if test="${order.category == 'Trouser'}">selected="selected"</c:if>>Trouser</option>
															<option <c:if test="${order.category == 'Formal Shirt'}">selected="selected"</c:if>>Formal Shirt</option>
															<option <c:if test="${order.category == 'Casual Shirt'}">selected="selected"</c:if>>Casual Shirt</option>
														</form:select>
														<form:errors path="category"></form:errors>
													</div>
												</spring:bind>
											</div>
											<!--/span-->
											<div class="col-md-6">
												<spring:bind path="tackPack">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Tack Pack</label>
														<form:input id="input-1" path="tackPack" type="file"
															class="file filestyle" />
														<form:errors path="tackPack"></form:errors>
													</div>
												</spring:bind>
											</div>
											<!--/span-->
										</div>
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="buyer.id">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Buyer</label>
														<form:select path="buyer.id" class="form-control">
										    				<form:options items="${buyers}" itemValue="id" itemLabel="name"/>
														</form:select>
														<form:errors path="buyer.id"></form:errors>
													</div>
												</spring:bind>
											</div>
											<!--/span-->
											<div class="col-md-6">
												<spring:bind path="styleNo">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Style #</label>
														<form:input type="text" path="styleNo"
															class="form-control" placeholder="Style #"
															maxlength="255"></form:input>
														<form:errors path="styleNo"></form:errors>
													</div>
												</spring:bind>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-check1 m-t-10 m-b-10">
													<label class="form-check-label">
											            <form:checkbox path="swatch" class="form-check-input" value="${swatch}" label="Swatch"></form:checkbox>
											        </label>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-check1 m-t-10 m-b-10">
													<label class="form-check-label">
											            <form:checkbox path="washStandard" class="form-check-input" value="${washStandard}" label="Wash Standard"></form:checkbox>
											        </label>
												</div>
											</div>
											<!--/span-->
										</div>
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="fabricDesc">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Fabric Description</label>
														<form:input type="text" path="fabricDesc"
															class="form-control" placeholder="Fabric Description"
															maxlength="1000"></form:input>
														<form:errors path="fabricDesc"></form:errors>
													</div>
												</spring:bind>
											</div>
											<div class="col-md-6">
												<spring:bind path="itemDesc">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Item Description</label>
														<form:input type="text" path="itemDesc"
															class="form-control" placeholder="Item Description"
															maxlength="1000"></form:input>
														<form:errors path="itemDesc"></form:errors>
													</div>
												</spring:bind>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="collection">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Collection</label>
														<form:input type="text" path="collection"
															class="form-control" placeholder="Collection"
															maxlength="255"></form:input>
														<form:errors path="collection"></form:errors>
													</div>
												</spring:bind>
											</div>
											<div class="col-md-6">
												<spring:bind path="remarks">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Remarks</label>
														<form:input type="text" path="remarks"
															class="form-control" placeholder="Remarks"
															maxlength="255"></form:input>
														<form:errors path="remarks"></form:errors>
													</div>
												</spring:bind>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="itemGroup.id">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Item Group</label>
														<form:select path="itemGroup.id" class="form-control">
										    				<form:options items="${itemGroups}"  itemValue="id" itemLabel="name"/>
														</form:select>
														<form:errors path="itemGroup.id"></form:errors>
													</div>
												</spring:bind>
											</div>
											<div class="col-md-6">
												<spring:bind path="productLabel">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Product Label</label>
														<form:input type="text" path="productLabel"
															class="form-control" placeholder="Product Label"
															maxlength="255"></form:input>
														<form:errors path="productLabel"></form:errors>
													</div>
												</spring:bind>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Size</label>
													<input id="measurementSize" type="text" class="form-control" data-role="tagsinput" onchange="updateTable();"/>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Category</label> 
													<input id="measurementCategory" type="text" class="form-control" data-role="tagsinput" onchange="updateTable();"/>
												</div>
											</div>
										</div>
										<!--/row-->
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group ${status.error ? 'has-error' : ''}">
													<form:input path="size" type="hidden"></form:input>
													<form:errors path="size"></form:errors>
													<table id="sizeinput"
														class="table table-striped table-bordered dataTable no-footer">
														<tr>
															<td />
														</tr>
													</table>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="sampleType">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Sample Type</label>
														<form:input type="text" path="sampleType"
															class="form-control" placeholder="Sample Type"
															maxlength="255"></form:input>
														<form:errors path="sampleType"></form:errors>
													</div>
												</spring:bind>
											</div>
											<div class="col-md-6">
												<spring:bind path="weight">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Weight</label>
														<form:input type="text" path="weight"
															class="form-control" placeholder="Weight"
															maxlength="255"></form:input>
														<form:errors path="weight"></form:errors>
													</div>
												</spring:bind>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="packing">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Packing</label>
														<form:input type="text" path="packing"
															class="form-control" placeholder="Packing"
															maxlength="255"></form:input>
														<form:errors path="packing"></form:errors>
													</div>
												</spring:bind>
											</div>
											<div class="col-md-6">
												<spring:bind path="shipmentDate">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Shipment Date</label>
														<div class="input-group">
															<fmt:formatDate value="${order.shipmentDate}" pattern="MM/dd/yyyy" var="shipmentDateStr"/>
															<form:input type="text" class="form-control" path="shipmentDate" value="${shipmentDateStr}" readonly="true"></form:input>
															<span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar"></i></span>
															<form:errors path="shipmentDate"></form:errors>
														</div>
	                                          		</div>
	                                          	</spring:bind>
                                       		</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="shipmentMode">
													<div class="form-group ${status.error ? 'has-error' : ''}">
														<label class="control-label">Shipment Mode</label>
														<form:select path="shipmentMode" class="form-control">
															<option <c:if test="${order.shipmentMode == 'By Sea'}">selected="selected"</c:if>>By Sea</option>
															<option <c:if test="${order.shipmentMode == 'By Air'}">selected="selected"</c:if>>By Air</option>
														</form:select>
														<form:errors path="shipmentMode"></form:errors>
													</div>
												</spring:bind>
											</div>
										</div>
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12 text-right">
												<input type="button" class="btn btn-primary" onclick="submitForm();" value="Save"/>
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
	<%@ include file="footer.jsp"%>
	<script src="${contextPath}/resources/assets/pages/form-advanced.js"></script>
	<script>	
		$('#shipmentDate').datepicker();
	
		var size = unescape('<c:out value="${order.size}"/>');
		var sizeData = JSON.parse(size);
		
		if(sizeData.measurementSize && sizeData.measurementSize.length > 0) {
			$('#measurementSize').val(sizeData.measurementSize.join(','));
			$('#measurementSize').change();
		}

		if(sizeData.measurementCategory && sizeData.measurementCategory.length > 0) {
			$('#measurementCategory').val(sizeData.measurementCategory.join(','));
			$('#measurementCategory').change();
		}

		if(sizeData.measurementCategory && sizeData.measurementSize) {
			sizeData.measurementSize.forEach(function(selectedSize) {
				sizeData.measurementCategory.forEach(function(selectedCategory) {
					$('#'+selectedSize+'_'+selectedCategory).val(sizeData.data[selectedSize+'_'+selectedCategory]);
				});
			});		
		}			
	</script>
