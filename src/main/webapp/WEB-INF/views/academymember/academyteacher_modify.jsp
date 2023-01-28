<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:url var='root' value='/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><div>
	<form:form action="${root}academymember/academyteacher_modifyPro" modelAttribute="teacherModifyBean" method="post" enctype="multipart/form-data">
		<form:hidden path="a_memberNo"/>
		<div>
			<form:label path="t_name">강사명</form:label>
			<form:input path="t_name" readonly="true"/>
		</div>
		<div>
			<form:label path="t_subject">과목</form:label>
			<form:input path="t_subject"/>
		</div>
		<div>
			<form:label path="t_contents">소개</form:label>
			<form:textarea path="t_contents"/>
		</div>
		<div>
			<form:label path="t_file">강사이미지</form:label>
			<c:if test="${teacherModifyBean.t_file =! null}">
				<img src="${root}upload/${teacherModifyBean.t_file}">
			</c:if>
			<form:input type="file" path="upload_file" accept="image/*"/>
		</div>
		<div>
			<form:button>강사정보수정</form:button>
		</div>
	</form:form>
	</div>
</body>
</html>