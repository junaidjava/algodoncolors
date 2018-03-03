<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<title>Orders List - Algodon</title>

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
				<h4 class="page-title">Orders List</h4>
			</div>
		</div>
		<div class="page-content-wrapper ">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="panel-primary panel">
							<div class="panel-body">
								<div class="row m-b-15">
									<div class="col-sm-12 text-right">
										<a href="#uploadModal" class="btn btn-success" data-toggle="modal">Upload</a>
										<a href="${contextPath}/order-entry" class="btn btn-success">Create Order</a>
									</div>
								</div>

								<div class="row">
									<div class="col-sm-12">
										<table id="datatable"
											class="table table-striped table-bordered dataTable no-footer">
											<thead>
												<tr>
													<th>ANC #</th>
													<th>Order #</th>
													<th>Buyer</th>
													<th>Item</th>
													<th>Collection</th>
													<th>Created On</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${orderList}" var="order">
													<tr>
														<td><a href="${contextPath}/edit-order?id=${order.id}">${order.ancNo}</a></td>
														<td>${order.orderNo}</td>
														<td>${order.buyer.name}</td>
														<td>${order.itemDesc}</td>
														<td>${order.collection}</td>
														<td><fmt:formatDate pattern="MM-dd-yyyy"
																value="${order.createdOn}" /></td>
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

            
    <!--  Upload Modal -->
    <div id="uploadModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		        <h5 class="modal-title" id="exampleModalLabel">Upload</h5>
		      </div>
		      <div class="modal-body">
		        <!-- COMPONENT START -->              
		        <div class="form-group">
		            <div class="input-group input-file">
		                <select class="form-control" name="wcl-employees1" id="wcl-employees1">
		                    <option value="select">Select Name</option>
		                    <option value="Front">Front</option>
		                    <option value="Back">Back</option>
		                    <option value="Left">Left</option>
		                    <option value="Right">Right</option>
		                </select>
		                <span class="input-group-btn">
		                    <div class="fileinput fileinput-new input-group" data-provides="fileinput">
		                      <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
		                      <span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
		                      <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
		                    </div>
		                </span>
		            </div>
		        </div>
		        <!-- COMPONENT END -->
		          
		        <!-- COMPONENT  START -->
		        <div class="form-group">
		            <div class="input-group input-file">
		                <select class="form-control" name="wcl-employees2" id="wcl-employees2">
		                    <option value="select">Select Name</option>
		                    <option value="Front">Front</option>
		                    <option value="Back">Back</option>
		                    <option value="Left">Left</option>
		                    <option value="Right">Right</option>
		                </select>
		                <span class="input-group-btn">
		                    <div class="fileinput fileinput-new input-group" data-provides="fileinput">
		                      <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
		                      <span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
		                      <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
		                    </div>
		                </span>
		            </div>
		        </div>
		        <!-- COMPONENT END -->
		          
		        <!-- COMPONENT  START -->
		        <div class="form-group">
		            <div class="input-group input-file">
		                <select class="form-control" name="wcl-employees3" id="wcl-employees3">
		                    <option value="select">Select Name</option>
		                    <option value="Front">Front</option>
		                    <option value="Back">Back</option>
		                    <option value="Left">Left</option>
		                    <option value="Right">Right</option>
		                </select>
		                <span class="input-group-btn">
		                    <div class="fileinput fileinput-new input-group" data-provides="fileinput">
		                      <div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i> <span class="fileinput-filename"></span></div>
		                      <span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span>
		                      <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
		                    </div>
		                </span>
		            </div>
		        </div>
		        <div class="addMore-container"></div>
		          
		        <button class="btn btn-primary" id="addMore">Add More</button>
		        <!-- COMPONENT END -->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
      </div>
      <!-- /Upload Modal -->
	<%@ include file="footer.jsp"%>
	
	<script>
        $("#uploadModal").on('show.bs.modal', function () {
            var $select = $("select");
            $select.on("change", function() {
                var selected = [];  
                $.each($select, function(index, select) {           
                    if (select.value !== "") { selected.push(select.value); }
                });         
               $("option").prop("disabled", false);         
               for (var index in selected) { $('option[value="'+selected[index]+'"]').prop("disabled", true); }
            });
        });
        
        $("#addMore").on("click", function(){
            var moreField =  
                '<div class="form-group"><div class="input-group input-file">'+
                    '<input type="text" class="form-control" placeholder="Enter Name" />'+
                    '<span class="input-group-btn">'+
                        '<div class="fileinput fileinput-new input-group" data-provides="fileinput">'+
                          '<div class="form-control" data-trigger="fileinput"><i class="glyphicon glyphicon-file fileinput-exists"></i><span class="fileinput-filename"></span></div>'+
                          '<span class="input-group-addon btn btn-default btn-file"><span class="fileinput-new">Select file</span><span class="fileinput-exists">Change</span><input type="file" name="..."></span><a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a></div>'+
                    '</span></div></div>';
            $(".addMore-container").append(moreField);
        });
	</script>
	<script src="${contextPath}/resources/assets/pages/datatables.init.js"></script>