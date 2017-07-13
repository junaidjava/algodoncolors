<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>User List - Algodon</title>
    
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
                        <h4 class="page-title">User List</h4></div>
                </div>
                <div class="page-content-wrapper ">
					<div class="container">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel-primary panel">
									<div class="panel-body">
										<div class="row">
											<div class="col-sm-6">
												<a href="${contextPath}/employee-setup" class="btn btn-success">Add User</a>
											</div>
											<div class="col-sm-6">
												<input type="text" id="searchStr" onkeyup="searchEngine()" placeholder="Search for usernames" class="form-control">
											</div>
										</div>
										
										<div class="row">
											<div class="col-sm-12">
										  		<table id="datatable" class="table table-striped table-bordered dataTable no-footer">
										    		<thead>
										      			<tr>
										        			<th>Username</th>
										        			<th>FirstName</th>
										        			<th>LastName</th>
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
		<script src="assets/pages/datatables.init.js"></script>

<script>
function searchEngine() {
  // Declare variables 
  var input, filter, table, tr, td, i,colInd;
  input = document.getElementById("searchStr");
  filter = input.value.toUpperCase();
  table = document.getElementById("userTable");
  tr = table.getElementsByTagName("tr");
  colInd=0;

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[colInd];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
