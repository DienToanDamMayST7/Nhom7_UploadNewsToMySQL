<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Nhom 7 Sang thu 7</title>
    
    <link href="lib/css/bootstrap.min.css" rel="stylesheet">
     <link href="lib/css/style.css" rel="stylesheet">
    
 
</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Bootsample</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">New Task</a></li>
					<li><a href="all-tasks">All Tasks</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Welcome to Task Manager Nhom 7</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>My Task</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>Id</th>
								<th>Title</th>
								<th>Content</th>
								<th>Link</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<td>${task.id}</td>
									<td>${task.title}</td>
									<td>${task.content}</td>
									<td>${task.url}</td>
									<td><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Manage Task</h3>
				<hr>
				<form class="form-horizontal" enctype="multipart/form-data" method="POST" action="save-task">
					<input type="hidden" name="id" value="${task.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Title</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="title" value="${task.title}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Content</label>
						<div class="col-md-7">
							<textarea class="form-control" id="content" name="content" >${task.content}</textarea>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">File to upload:</label>
						<div class="col-md-7">
							<input id="file" type="file" name="file">
						</div>				
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>		
	</c:choose>
	
<script src="<c:url value="ckeditor/ckeditor.js" />"></script>
<script type="text/javascript" language="javascript">
   CKEDITOR.replace('content', {width: '800px',height: '300px'});
</script>
	<script src="lib/js/jquery-1.11.1.min.js"></script>    
    <script src="lib/js/bootstrap.min.js"></script>
</body>
</html>