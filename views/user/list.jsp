<%@ page language ="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  
<head>
<!-- Custom fonts for this template -->
  <link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="/resources/css/sb-admin-2.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<form id='actionForm' action="/user/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
	<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
</form>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">User Tables</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">User List Page</div>
			<div class='row'>
				<div class="col-lg-12">
					<form id='searchForm' action="/user/list" method='get'>
						<select name='type'>
							<option value="INR">ALL</option>
							<c:out value="${pageMaker.cri.type eq 'INR'?'selected':''}"/>>ALL</option>
							<option value="I"
							<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>ID</option>
							<option value="N">NAME</option>
							<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>NAME</option>
							<option value="R">RRN</option>
							<c:out value="${pageMaker.cri.type eq 'R'?'selected':''}"/>>RRN</option>
						</select>
						<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'/>
						<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
						<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>'/>
						<button class='btn btn-warning'>Search</button>
					</form>
				</div>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>#번호</th>
						<th>ID</th>
						<th>PASSWORD</th>
						<th>NAME</th>
						<th>RRN</th>
						<th>PHONE</th>
						<th>EMAIL</th>
						<th>ADDRESS</th>
						<th>SEX</th>
						<th>REGDATE</th>
						<th>UPDATEDATE</th>
						<th>UPDATE</th>
				</thead>
				<c:forEach items="${list}" var="user">
					<tr>
						<td><c:out value="${user.seq}"/></td>
						<td><c:out value="${user.id}"/></td>
						<td><c:out value="${user.password}"/></td>
						<td><c:out value="${user.name}"/></td>
						<td><c:out value="${user.rrn}"/></td>
						<td><c:out value="${user.phone}"/></td>
						<td><c:out value="${user.email}"/></td>
						<td><c:out value="${user.address}"/></td>
						<td><c:out value="${user.sex}"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.regdate}"/></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${user.updatedate}"/></td>
				<%-- <td><button data-oper='modify' class="btn btn-danger" onclick="location.href='/user/modify?seq=<c:out value="${user.seq}"/>'">Modify</button></td> --%> 
				<td><button data-oper='modify' class="btn btn-danger" onclick="location.href='/user/modify?seq=<c:out value="${user.seq}"/>&pageNum=<c:out value="${pageMaker.cri.pageNum}"/>&amount=<c:out value="${pageMaker.cri.amount}"/>'">Modify</button></td> 
					</tr>
				</c:forEach>
			</table>
			
			<div class='pull-right'>
				<ul class="pagination">
				
					<c:if test="${pageMaker.prev}">
						<li class="page-link">
						<a href="${pageMaker.startPage -1}">previous</a>
						</li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<%-- <li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"> --%>
						<li class="page-link ${pageMaker.cri.pageNum == num ? "active":""}">
						<a href="${num}">${num}</a>
					</li>
					</c:forEach>
					<c:if test="${pageMaker.next}">
						<li class="page-link">
						<a href="${pageMaker.endPage +1}">Next</a>
						</li>
					</c:if>
					
				</ul>
			</div>
			<!-- end Pagination -->
		</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function(){
		
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		function checkModal(result) {
			
			if(result === '' || history.state) {
				return;
			}
			if(parseInt(result) > 0) {
				$(".modal-body").html("게시글" + parseInt(result) + "번이 등록되었습니다.");
			}
			
			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function() {
			
			self.location = "/user/register";
		});
		
		var actionForm = $("#actionForm");
		
		$(".page-link a").on("click", function(e) {
			e.preventDefault();
			
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on("click", function(e){
			if(!searchForm.find("option:selected").val()){
				alert("검색종류를 선택하세요.");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
	});
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal Title</h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
	</div>
</div>


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
