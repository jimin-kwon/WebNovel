<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<body>
	<form role="form" name="boardNewForm" method="post" action="${contextPath}/board/boardList" enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<fieldset>
		<h1>작품 정보 수정<hr></h1>					
		<table>
		<div>
			<tr>
				<td>작품제목 <input type="text" name="title"  value='<c:out value="${boardMap.title }"/>'  maxlength="20" required="required" readonly ></td>
			</tr>
		</div>
		<div>
			<tr>
				<td>장르
				<select>
					<option> 로맨스 </option>
					<option> 판타지 </option>
					<option> 무협 </option>
					<option> 스릴러 </option>
				</select>
				</td>
		</div>
		<div>	
				<td>연재 주기 </td>
				<td><input type="checkbox"> 자유연재</td>
				<td><lable><input type="checkbox"> 요일연재 
				월<input type="checkbox">					
				화<input type="checkbox">					
				수<input type="checkbox">					
				목<input type="checkbox">					
				금<input type="checkbox">					
				토<input type="checkbox">					
				일<input type="checkbox">					
				</lable></td>
			</tr>
		</div>
		<div>		
			<tr>
			<td>표지 이미지</td>
			<td>
			 <div class="form-group uploadDiv">
				<input type="file" name='uploadFile' multiple  value='<c:out value="${map.uploadFile }"/>' >
			</td>	
			</div>
			<td>
			<div class='uploadResult'></div>
			</td>
			</tr>
		</div>	
			<div>
			<tr>
				<td>작품 소개 
				<textarea value="" rows="10" cols="50" name="content"required="required"><c:out value="${map.uploadFile }"/></textarea>
				</td>
			</tr>
			</div>
			<tr>
				<td>필명
					<input type="text" name="id" value="${id}" readonly>
				</td>
			</tr>
			<td colspan = "3">
			<button type="submit" data-oper='modify' class="btn btn-default" >Modify</button>	
			<button type="submit" data-oper='remove' class="btn btn-danger">Delete </button>
			<button type="submit" data-oper='list'   class="btn btn-list" >List</button>	 
			</td>
		</table>
	</fieldset>		
	</form>
	
<script>
	$(document).ready(funtion(){
		var formObj = $('form');
		$('button').on("click", funtion(e)){
		e.preventDefault();
		var operation = $(this).data("oper");
		console.log(operation)l
		
		if(operation === 'remove'){
		formObj.attr("action", "boardList")
		}else if (operation === 'list'){
		self.location="boardList";
		return;
		}
		formObj.submit();
	  });
	});	
</script>
</body>
</html>