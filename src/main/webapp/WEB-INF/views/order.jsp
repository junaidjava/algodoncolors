<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var firstRowData = [];
var firstColData = [];
var firstColumnColorData = [];

function updateTable() {
	var table = $('#matrix');
	var firstRow = $('#matrix tr:first');
	var tableRows = $('#matrix tr');
	var firstColumn = $(firstRow).find('td');
	var inputForFirstRow = [];
	if($('#measurementSize').val().length > 0) {
		inputForFirstRow = $('#measurementSize').val().split(',');
	}

	// if user wanna DELETE a column
	firstRowData.forEach(function(cell_0xC_data) {
		var colIndex = inputForFirstRow.indexOf(cell_0xC_data);
		if (colIndex < 0) {
			//remove this column from UI
			$('.' + cell_0xC_data).remove();
			//also remove this column from firstRowData array
			firstRowData.splice(colIndex, 1);
		}
	});

	// if user wanna ADD a column
	if (inputForFirstRow) {
		inputForFirstRow.forEach(function(selectedSize) {
			if (firstRowData.indexOf(selectedSize) < 0) {
				firstRow.append('<td class='+selectedSize+'>'
						+ selectedSize + '</td>');
				firstRowData.push(selectedSize);
				tableRows.each(function(rowIndex) {
					if (rowIndex > 0) {
						var tds = $(this).find('td');
						$(this).append(
								'<td class="' + selectedSize + ' '
										+ $(tds[0]).text()
										+ '"><input type="text" id="'
										+ selectedSize + '_'
										+ $(tds[0]).text() + '"/></td>');
					}
				});
			}
		});
	}

	var inputForFirstCol = [];
	if($('#measurementCategory').val().length > 0) {
		inputForFirstCol = $('#measurementCategory').val().split(',');
	}

	
	// if user wanna DELETE a row
	firstColData.forEach(function(cell_Rx0_data) {
		var rowIndex = inputForFirstCol.indexOf(cell_Rx0_data);
		if (rowIndex < 0) {
			$('.' + cell_Rx0_data).remove();
			firstColData.splice(rowIndex, 1);
		}
	});
	// if user wanna ADD a row
	if (inputForFirstCol) {
		inputForFirstCol.forEach(function(selectedCategory) {
			if (firstColData.indexOf(selectedCategory) < 0) {
				table.append('<tr class='+selectedCategory+'><td>'
						+ selectedCategory + '</td></tr>');
				firstColData.push(selectedCategory);
				var row = $('.' + selectedCategory)
				firstColumn.each(function(index) {
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

function updateColorTable() {
	var table = $('#colors');
	var firstRow = $('#colors tr:first');
	var firstColumn = $('#matrix tr:first').find('td');
	var inputForFirstColumnColor = [];

	// Adding colour input into list
	if($('#styleColor').val().length > 0) {
		firstRow.find('td').remove();
		firstRow.append('<td align="center" valign="middle"><b>Colors</b></td>');
		inputForFirstColumnColor=$('#styleColor').val().split(',');
	}
	// if user wanna DELETE a row
	firstColumnColorData.forEach(function(colorData) {
		var rowIndex = inputForFirstColumnColor.indexOf(colorData);
		if (rowIndex < 0) {
			$('.' + colorData).remove();
			firstColumnColorData.splice(rowIndex, 1);
		}
	});
	// if user wanna ADD a row
	if (inputForFirstColumnColor) {
		inputForFirstColumnColor.forEach(function(selectedColor) {
			if (firstColumnColorData.indexOf(selectedColor) < 0) {
				table.append('<tr class='+selectedColor+'><td>'
						+ selectedColor + '</td></tr>');
				firstColumnColorData.push(selectedColor);
				var row = $('.' + selectedColor)
				firstColumn.each(function(index) {
					if (index > 0) {
						row.append('<td class="' + selectedColor + ' '
								+ $(this).text()
								+ '"><input type="text" id="'
								+ $(this).text() + '_' + selectedColor
								+ '"/></td>');
					}
				});
			}
		});
	}
}

function submitForm() {
	var jsonMatrix = {};
	jsonMatrix.data = {};
	
	var inputForFirstRow = [];
	if($('#measurementSize').val().length > 0) {
		inputForFirstRow = $('#measurementSize').val().split(',');
		jsonMatrix.measurementSize =inputForFirstRow; 
	}
	var inputForFirstCol = [];
	if($('#measurementCategory').val().length > 0) {
		inputForFirstCol = $('#measurementCategory').val().split(',');
	}
	// adding colors data
	if($('#styleColor').val().length > 0) {
		inputForFirstCol=inputForFirstCol.concat($('#styleColor').val().split(','));
	}
	
	jsonMatrix.measurementCategory =inputForFirstCol; 
	
	inputForFirstRow.forEach(function(selectedSize) {
		inputForFirstCol.forEach(function(selectedCategory) {
			var inputElement = $('#'+selectedSize+'_'+selectedCategory);
			jsonMatrix.data[selectedSize+'_'+selectedCategory] = inputElement.val();
		});
	});
	$('#color').val($('#styleColor').val());
	$('#size').val(escape(JSON.stringify(jsonMatrix)));
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
		<%@ include file = "sidebarMenu.jsp" %>
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
									modelAttribute="order" class="horizontal-form" method="post" enctype="multipart/form-data">
									<form:input path="id" type="hidden"></form:input>
									<div class="form-body">
										<div class="row">
											<div class="col-md-6">
												<spring:bind path="ancNo">
													<div class="required form-group ${status.error ? 'has-error' : ''}">
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
													<div class="required form-group ${status.error ? 'has-error' : ''}">
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
												<spring:bind path="buyer.id">
													<div class="required form-group ${status.error ? 'has-error' : ''}">
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
												<div class="form-group">
													<label class="control-label">Tech Pack</label>
													<input id="techPackFile" name="techPackFile" type="file" class="file filestyle"/>
													<form:input path="techPack" type="hidden"></form:input>
													<div id="techPackFileDisplay">
														<a href="order/techpack/${order.id}" >${order.techPack}</a>
														<button type="button" class="close" aria-label="Close" onclick="showTechPackFileControl();">
														  <span aria-hidden="true">&times;</span>
														</button>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Tech Pack2</label>
													<input id="techPackFile2" name="techPackFile2" type="file" class="file filestyle"/>
													<form:input path="techPack2" type="hidden"></form:input>
													<div id="techPackFileDisplay2">
														<a href="order/techpack2/${order.id}" >${order.techPack2}</a>
														<button type="button" class="close" aria-label="Close" onclick="showTechPackFileControl2();">
														  <span aria-hidden="true">&times;</span>
														</button>
													</div>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label class="control-label">Tech Pack3</label>
													<input id="techPackFile3" name="techPackFile3" type="file" class="file filestyle"/>
													<form:input path="techPack3" type="hidden"></form:input>
													<div id="techPackFileDisplay3">
														<a href="order/techpack3/${order.id}" >${order.techPack3}</a>
														<button type="button" class="close" aria-label="Close" onclick="showTechPackFileControl3();">
														  <span aria-hidden="true">&times;</span>
														</button>
													</div>
												</div>
											</div>
										</div>
										
										<br>
									  	<fieldset>
											<legend>Style</legend>
												<div class="row">
													<div class="col-md-6">
														<spring:bind path="styleNo">
															<div class="required form-group ${status.error ? 'has-error' : ''}">
																<label class="control-label">Style #</label>
																<form:input type="text" path="styleNo"
																	class="form-control" placeholder="Style #"
																	maxlength="255"></form:input>
																<form:errors path="styleNo"></form:errors>
															</div>
														</spring:bind>
													</div>
													<div class="col-md-6">
														<spring:bind path="itemGroup.id">
															<div class="required form-group ${status.error ? 'has-error' : ''}">
																<label class="control-label">Item Group</label>
																<form:select path="itemGroup.id" class="form-control">
												    				<form:options items="${itemGroups}"  itemValue="id" itemLabel="name"/>
																</form:select>
																<form:errors path="itemGroup.id"></form:errors>
															</div>
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<div class="form-check1 m-t-10 m-b-10">
															<label class="form-check-label">
													            <form:checkbox path="washStandard" class="form-check-input" value="${washStandard}" label="Wash Standard"></form:checkbox>
													        </label>
														</div>
													</div>
													<div class="col-md-6">
														<spring:bind path="fabricDesc">
															<div class="required form-group ${status.error ? 'has-error' : ''}">
																<label class="control-label">Fabric Description </label>
																<form:input type="text" path="fabricDesc"
																	class="form-control" placeholder="Fabric Description"
																	maxlength="1000"></form:input>
																<form:errors path="fabricDesc"></form:errors>
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
															<div class="required form-group ${status.error ? 'has-error' : ''}">
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
														<div class="form-group">
															<label class="control-label">Size</label>
															<input id="measurementSize" type="text" class="form-control" data-role="tagsinput" onchange="updateTable();"/>
														</div>
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
															<label class="control-label">Measurement</label> 
															<input id="measurementCategory" type="text" class="form-control" data-role="tagsinput" onchange="updateTable();"/>
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label class="control-label">Color</label> 
															<input id="styleColor" type="text" class="form-control" data-role="tagsinput" onchange="updateColorTable();"/>
														</div>

													</div>
													<div class="col-sm-12">
														<div class="form-group ${status.error ? 'has-error' : ''}">
															<form:input path="size" type="hidden"></form:input>
															<form:errors path="size"></form:errors>
															<form:input path="color" type="hidden"></form:input>
															<form:errors path="color"></form:errors>
															<table id="matrix"
																class="table table-striped table-bordered dataTable no-footer">
																<tr>
																	<td />
																</tr>
															</table>
															<table id="colors"
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
														<div class="form-check1 m-t-10 m-b-10">
															<label class="form-check-label">
													            <form:checkbox path="sample" class="form-check-input" value="${sample}" label="Sample"></form:checkbox>
													        </label>
														</div>
													</div>
												</div>
											</fieldset>
											<br>
										  	<fieldset>
												<legend>Shipment</legend>
												<div class="row">
													<div class="col-md-6">
														<spring:bind path="shipmentDate">
															<div class="required form-group ${status.error ? 'has-error' : ''}">
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
													<div class="col-md-6">
														<spring:bind path="shipmentMode">
															<div class="required form-group ${status.error ? 'has-error' : ''}">
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
												<div class="row">
													<div class="col-md-6">
														<spring:bind path="shipmentDate2">
															<div>
																<label class="control-label">Shipment Date2</label>
																<div class="input-group">
																	<fmt:formatDate value="${order.shipmentDate2}" pattern="MM/dd/yyyy" var="shipmentDateStr2"/>
																	<form:input type="text" class="form-control" path="shipmentDate2" value="${shipmentDateStr2}" readonly="true"></form:input>
																	<span class="input-group-addon bg-custom b-0 btn" onclick="clearShipmentDate2();"><span aria-hidden="true">&times;</span></i></span>
																	<span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar"></i></span>
																	<form:errors path="shipmentDate2"></form:errors>
																</div>
			                                          		</div>
			                                          	</spring:bind>
		                                       		</div>
													<div class="col-md-6">
														<spring:bind path="shipmentMode2">
															<div>
																<label class="control-label">Shipment Mode2</label>
																<form:select path="shipmentMode2" class="form-control">
																	<option value=""></option> 
																	<option <c:if test="${order.shipmentMode2 == 'By Sea'}">selected="selected"</c:if>>By Sea</option>
																	<option <c:if test="${order.shipmentMode2 == 'By Air'}">selected="selected"</c:if>>By Air</option>
																</form:select>
																<form:errors path="shipmentMode2"></form:errors>
															</div>
														</spring:bind>
													</div>
												</div>
												<div class="row">
													<div class="col-md-6">
														<spring:bind path="shipmentDate3">
															<div>
																<label class="control-label">Shipment Date3</label>
																<div class="input-group">
																	<fmt:formatDate value="${order.shipmentDate3}" pattern="MM/dd/yyyy" var="shipmentDateStr3"/>
																	<form:input type="text" class="form-control" path="shipmentDate3" value="${shipmentDateStr3}" readonly="true"></form:input>
																	<span class="input-group-addon bg-custom b-0 btn" onclick="clearShipmentDate3();"><span aria-hidden="true">&times;</span></i></span>
																	<span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar"></i></span>
																	<form:errors path="shipmentDate3"></form:errors>
																</div>
			                                          		</div>
			                                          	</spring:bind>
		                                       		</div>
													<div class="col-md-6">
														<spring:bind path="shipmentMode3">
															<div>
																<label class="control-label">Shipment Mode3</label>
																<form:select path="shipmentMode3" class="form-control">
																	<option value=""></option> 																	
																	<option <c:if test="${order.shipmentMode3 == 'By Sea'}">selected="selected"</c:if>>By Sea</option>
																	<option <c:if test="${order.shipmentMode3 == 'By Air'}">selected="selected"</c:if>>By Air</option>
																</form:select>
																<form:errors path="shipmentMode3"></form:errors>
															</div>
														</spring:bind>
													</div>
												</div>
											</fieldset>
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
	var techPack = '<c:out value="${order.techPack}"/>';
	if(techPack.length > 0) {
		hideTechPackFileControl();
	}else {
		showTechPackFileControl();
	}
	
	function showTechPackFileControl() {
		$('#techPack').val(null);
		$('#techPackFile').filestyle();		
		$('#techPackFileDisplay').hide();			
		$('#techPackFile').show();			
	}

	function hideTechPackFileControl() {
		$('#techPackFile').removeClass('filestyle');			
		$('#techPackFileDisplay').show();			
		$('#techPackFile').hide();			
	}

	var techPack2 = '<c:out value="${order.techPack2}"/>';
	if(techPack2.length > 0) {
		hideTechPackFileControl2();
	}else {
		showTechPackFileControl2();
	}
	
	function showTechPackFileControl2() {
		$('#techPack2').val(null);
		$('#techPackFile2').filestyle();		
		$('#techPackFileDisplay2').hide();			
		$('#techPackFile2').show();			
	}

	function hideTechPackFileControl2() {
		$('#techPackFile2').removeClass('filestyle');			
		$('#techPackFileDisplay2').show();			
		$('#techPackFile2').hide();			
	}

	function clearShipmentDate3() {
		$('#shipmentDate3').val(null);		
	}
	
	function clearShipmentDate2() {
		$('#shipmentDate2').val(null);		
	}
	
	var techPack3 = '<c:out value="${order.techPack3}"/>';
	if(techPack3.length > 0) {
		hideTechPackFileControl3();
	}else {
		showTechPackFileControl3();
	}
	
	function showTechPackFileControl3() {
		$('#techPack3').val(null);
		$('#techPackFile3').filestyle();		
		$('#techPackFileDisplay3').hide();			
		$('#techPackFile3').show();			
	}

	function hideTechPackFileControl3() {
		$('#techPackFile3').removeClass('filestyle');			
		$('#techPackFileDisplay3').show();			
		$('#techPackFile3').hide();			
	}

	$('#shipmentDate').datepicker();
	$('#shipmentDate2').datepicker();
	$('#shipmentDate3').datepicker();

	var colrs='<c:out value="${order.color}"/>';
	var jsonMatrix = JSON.parse(unescape('<c:out value="${order.size}"/>'));
	if(jsonMatrix.measurementSize && jsonMatrix.measurementSize.length > 0) {
		$('#measurementSize').val(jsonMatrix.measurementSize.join(','));
		$('#measurementSize').change();
	}

	if(jsonMatrix.measurementCategory && jsonMatrix.measurementCategory.length > 0) {
		var filteredVal="";
		var currRow=1;
		jsonMatrix.measurementCategory.forEach(function(selectedCategory) {
			if (colrs.indexOf(selectedCategory) < 0) {
				if(currRow > 1){
					filteredVal+=",";
				}
				filteredVal+=selectedCategory;
				currRow++;
			}
			
		});
		$('#measurementCategory').val(filteredVal);
		$('#measurementCategory').change();
		$('#styleColor').val(colrs);
		$('#styleColor').change();
	}
	
	if(jsonMatrix.measurementCategory && jsonMatrix.measurementSize) {
		jsonMatrix.measurementSize.forEach(function(selectedSize) {
			jsonMatrix.measurementCategory.forEach(function(selectedCategory) {
				$('#'+selectedSize+'_'+selectedCategory).val(jsonMatrix.data[selectedSize+'_'+selectedCategory]);
			});
		});		
	}			

	</script>
