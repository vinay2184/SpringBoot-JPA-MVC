<!DOCTYPE html>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<html lang="en">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sidebar.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/sidebar-style.css" rel="stylesheet">
</head>
<body>
<div class="page-wrapper chiller-theme toggled">
  <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
      <div class="sidebar-brand">
        <a href="#">Student Portal</a>
        <div id="close-sidebar">
          <i class="fas fa-times"></i>
        </div>
      </div>
      <div class="sidebar-menu">
        <ul>
          <li>
            <a href="/RedRiver-Students-Demo/home">              
              <span>Home</span>              
            </a>            
          </li>          
          <li>
            <a href="/RedRiver-Students-Demo/students">              
              <span>Students</span>              
            </a>            
          </li>                  
        </ul>
      </div>
      <!-- sidebar-menu  -->
    </div>
    
  </nav>
  <!-- sidebar-wrapper  -->
  <main class="page-content">
    <div class="container-fluid">
      <h2><p class="text-center">Students</p></h2>  
      
      <form class="text-center" action="students" method="get">
      	  Filter:
		  <input type="text" name="keyword" value="${keyword}" required/>
		  &nbsp;
		  <input type="submit" value="Search" />
		  &nbsp;
		  <input type="button" value="Clear" onclick="clearFilter()" />
	  </form>
      <br/><br/>
      <c:choose>
      	<c:when test="${mode == 'STUDENT_VIEW' }">
	      	<table class="table table-hover">
			  <thead>
			    <tr>
			      <th scope="col">Id</th>
			      <th scope="col">First Name</th>
			      <th scope="col">Last Name</th>
			      <th scope="col">Age</th>
			      <th scope="col">Edit</th>
			    </tr>
			  </thead>
			  <tbody>
			    <c:forEach var="student" items="${students}">
			    	<tr>
			    		<td>${student.id}</td>
			    		<td>${student.firstName}</td>
			    		<td>${student.lastName}</td>
			    		<td>${student.age}</td>
			    		<td><a href="updateStudent?id=${student.id}"><i class="far fa-edit"></i></a></td>
			    	</tr>
			    </c:forEach>
			  </tbody>
			</table>  
			Total Items: ${totalItems}
			&nbsp;
			<c:choose>
				<c:when test="${currentPage > 1 }">
					<a href="page?num=1&keyword=${keyword}">First</a>
				</c:when>
				<c:otherwise>
					<span>First</span>
				</c:otherwise>
			</c:choose>
			&nbsp;
			<c:choose>
				<c:when test="${currentPage > 1 }">
					<a href="page?num=${currentPage-1}&keyword=${keyword}">Previous</a>
				</c:when>
				<c:otherwise>
					<span>Previous</span>
				</c:otherwise>
			</c:choose>
			&nbsp;
			<c:forEach begin="1" end="${totalPages}" var="i">				
				<c:choose>
                    <c:when test="${currentPage eq i}">
                        <span>${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="page?num=${i}&keyword=${keyword}">${i}</a>
                    </c:otherwise>
                </c:choose>
			</c:forEach> 
			&nbsp;
			<c:choose>
				<c:when test="${currentPage < totalPages }">
					<a href="page?num=${currentPage+1}&keyword=${keyword}">Next</a>
				</c:when>
				<c:otherwise>
					<span>Next</span>
				</c:otherwise>
			</c:choose>
			&nbsp;
			<c:choose>
				<c:when test="${currentPage < totalPages }">
					<a href="page?num=${totalPages}&keyword=${keyword}">Last</a>
				</c:when>
				<c:otherwise>
					<span>Last</span>
				</c:otherwise>
			</c:choose> 	
      	</c:when>
      	<c:when test="${mode == 'STUDENT_EDIT' }">
      		<form action="save" method="POST">
      		  <input type="hidden" class="form-control" value="${student.id}" name="id" id="id">
			  <div class="form-group">
			    <label for="firstName">First Name</label>
			    <input type="text" class="form-control" value="${student.firstName}" name="firstName" id="firstName">
			  </div>
			  <div class="form-group">
			    <label for="lastName">Last Name</label>
			    <input type="text" class="form-control" value="${student.lastName}" name="lastName" id="lastName">
			  </div>
			  <div class="form-group">
			    <label for="age">Age</label>
			    <input type="text" class="form-control" value="${student.age}" name="age" id="age">
			  </div>
			  <button type="submit" class="btn btn-default">Submit</button>
			</form>
      	</c:when>
      </c:choose>
    </div>
  </main>
  <!-- page-content" -->
</div>    
</body>

</html>