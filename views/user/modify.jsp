<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<head>
<!-- Custom fonts for this template -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<form id='operForm' action="/user/list" method="get">
	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
	<input type='hidden' id='seq' name='seq' value='<c:out value="${user.seq}"/>'>
</form>
      
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Modify</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading">Board Modify</div>
				<!-- /.panel-heading -->
				<div class="panel-body">


					<form role="form" action="/user/modify" method="post">
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
     				<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
						<div class="form-group">
							<label>SEQ</label> <input class="form-control" name='seq'
								value='<c:out value="${user.seq}"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label>ID</label> <input class="form-control" name='id'
								value='<c:out value="${user.id}"/>'>
						</div>
						<div class="form-group">
							<label>PASSWORD</label> <input class="form-control"
								name='password' value='<c:out value="${user.password}"/>'>
						</div>
						<div class="form-group">
							<label>NAME</label> <input class="form-control" name='name'
								value='<c:out value="${user.name}"/>'>
						</div>
						<div class="form-group">
							<label>RRN</label> <input class="form-control" name='rrn'
								value='<c:out value="${user.rrn}"/>'>
						</div>
						<div class="form-group">
							<label>PHONE</label> <input class="form-control" name='phone'
								value='<c:out value="${user.phone}"/>'>
						</div>
						<div class="form-group">
							<label>EMAIL</label> <input class="form-control" name='email'
								value='<c:out value="${user.email}"/>'>
						</div>
						<div class="form-group">
							<label>ADDRESS</label> <input class="form-control" name='address'
								value='<c:out value="${user.address}"/>'>
						</div>
						<div class="form-group">
							<label>SEX</label> <input class="form-control" name='sex'
								value='<c:out value="${user.sex}"/>'>
						</div>
	
						<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
						<button type="submit" data-oper='remove' class="btn btn-default">Remove</button>
						<button type="submit" data-oper='list' class="btn btn-default">List</button>
					</form>
				</div>
			</div>
		</div>
		
	</div>
	
	
<script type="text/javascript">
	$(document).ready(function(){

		var formObj = $("form");
		
		$('button').on("click", function(e){
			
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'remove') {
				
				formObj.attr("action", "/user/remove");
				
			} else if(operation === 'list') {
				
				self.location ="/user/list";
				return;
				
			} 
			formObj.submit();
		});
		
		var operForm = $("#operForm");
		
		$("button[data-oper='list']").on("click", function(e){
			
			operForm.find("#seq")
			operForm.attr("action", "/user/list")
			operForm.submit();
		});
	});
</script>



	<!-- Bootstrap core JavaScript-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/resources/js/demo/datatables-demo.js"></script>

</body>
</html>
