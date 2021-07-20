<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html>
<head>
</head>
<script>
	// security post방식 토큰
	var csrfHeaderName ="${_csrf.headerName}"; 
	var csrfTokenValue="${_csrf.token}";
	
	// 첨부파일
	$(document).ready(function(e){
		// 첨부파일 처리를 위에 기본동작 막음
		var formObj = $("form[role='form']");
		$("input[type='submit']").on("click", function(e){
			e.preventDefault();
			console.log("submit clicked");
			var str = "";
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				console.log("-------------------------");
				console.log(jobj.data("filename"));
				str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
			});
			console.log(str);
			formObj.append(str).submit();
		});
		
		// 첨부파일 확장자와 최대용량 제한
		var regex = new RegExp("(.*?)\.(jpg|jpeg|png|gif|bmp)$");
		var maxSize = 5242880; //5MB
		
		function checkExtension(fileName, fileSize){
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		// 첨부파일 업로드
		$("input[type='file']").change(function(e){
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			for(var i = 0; i < files.length; i++){
				if(!checkExtension(files[i].name, files[i].size) ){
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			$.ajax({
				beforeSend: function(xhr) {
	                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				url: '${contextPath}/board/uploadAjaxAction',
				processData: false, 
				contentType: false,
				data: formData,
				type: 'POST',
				dataType:'json',
				success: function(result){
					console.log(result); 
					showUploadResult(result); //업로드 결과 처리 함수 
				}
			}); //$.ajax
		});
		
		// 첨부파일 처리(이미지인경우 섬네일)
		function showUploadResult(uploadResultArr){
			if(!uploadResultArr || uploadResultArr.length == 0){ 
				return; 
			}
			var uploadUL = $(".uploadResult ul");
			var str ="";
			$(uploadResultArr).each(function(i, obj){
				if(obj.image){
					var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
					str += "<li data-path='"+obj.uploadPath+"'";
					str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
					str +" ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' "
					str += "data-type='image'><span> x </span></button><br>";
					str += "<img src='${contextPath}/board/display?fileName="+fileCallPath+"'>";
					str += "</div>";
					str +"</li>";
				}else{
					// 이미지 파일만 올라오기 때문에 필요 없지만 일단 놔둠
					var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
					var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
					str += "<li "
					str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
					str += "<span> "+ obj.fileName+"</span>";
					str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
					str += "class='btn btn-warning btn-circle'><span> x </span></button><br>";
					str += "<img src='${contextPath }/resources/image/board/attach.png'></a>";
					str += "</div>";
					str +"</li>";
				}
			});
			uploadUL.append(str);
		}
		
		// 첨부파일 삭제
		$(".uploadResult").on("click", "button", function(e){
			console.log("delete file");
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			$.ajax({
				beforeSend: function(xhr) {
	                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				url: '${contextPath}/board/deleteFile',
				data: {fileName: targetFile, type: type},
				dataType:'text',
				type: 'POST',
				success: function(result){
					alert(result);
					targetLi.remove();
				}
			}); //$.ajax
		});
	});
</script>
<body>
	<form role="form" name="boardNewForm" method="post" action="${contextPath}/board/writeboard" enctype="multipart/form-data">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<fieldset>
			<h1>새 작품 쓰기</h1>
			<table align="center">
				<tr>
					<td>작품제목
						<input size="50" maxlength="100" type="text" name="title" maxlength="20" required="required" style="border-left: none;" style="border-right: none;">
					</td>
				</tr>

				<tr>
					<td>장르
						<select name="genre">
							<option value="romance">로맨스</option>
							<option value="fantasy">판타지</option>
							<option value="martial">무협</option>
							<option value="thriller">스릴러</option>
						</select>
					</td>
					<td>공모전 출품 <input type="checkbox"></td>
					<td>연재 주기</td>
					<td><input type="checkbox" value="자유연재">자유연재</td>
					<td><input type="checkbox" value="요일연재">요일연재 
						<input type="checkbox"><lable for="day1" class="off">월</lable> 
						<input type="checkbox"><lable for="day2" class="off">화</lable> 
						<input type="checkbox"><lable for="day3" class="off">수</lable> 
						<input type="checkbox"><lable for="day4" class="off">목</lable> 
						<input type="checkbox"><lable for="day5" class="off">금</lable> 
						<input type="checkbox"><lable for="day6" class="off">토</lable> 
						<input type="checkbox"><lable for="day7" class="off">일</lable>
					</td>
				</tr>
				<tr>
					<td>표지 이미지</td>
					<td>
						<div class="form-group uploadDiv">
							<input type="file" name='uploadFile' multiple>
						</div>
						<div class='uploadResult'> 
							<ul>
							
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<td>작품 소개
						<textarea rows="10" cols="50" name="content" required="required" title="작품 소개"></textarea>
					</td>
				</tr>
				<tr>
					<td>필명
						<input type="text" name="id" value="${id}" readonly>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<input type="button" value="취소" onclick="location.href='boardList'">
						<input type="submit" value="저장">
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>