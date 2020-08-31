<!DOCTYPE html>
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
      <h2><p class="text-center">Welcome to Student Portal</p></h2>
      <hr>
    </div>
  </main>
  <!-- page-content" -->
</div>    
</body>
</html>